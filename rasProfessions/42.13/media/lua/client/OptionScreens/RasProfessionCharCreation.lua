-- we modify the random dress-up of a character in the character customisation screen;
--    - in some cases, a body location should only get clothing from a specific choice of clothing items for that location (for example: no fedora hats for lumberjacks but baseball cap is ok; 
--      player can still manually choose fedora if desired), this is done via the "Special" field in the mods clothing defintions file 
--    - exclude some other weird clothing combinations and make it so that professions don't get inappropriate hair styles (player can still choose maunally if desired)
--    - add correct prescription glasses
--    - make sure Tshirts only get their predefined decals
--    - add a button to select a shirt decal (vanilla has this button only in all-clothing-unlocked mode but we want to have it also in default mode cause profession clothing may have decals)
--
-- by razab


local rasSharedData = require("RasProfessionsSharedData")
local rasDefinitions = require("Definitions/RasProfessionsClothingDefinitions")



local BUTTON_HGT = getTextManager():getFontHeight(UIFont.Small) + 6
local UI_BORDER_SPACING = 10


local Regs = RasProfessionsRegistries

-- util function: check whether player has short sighted trait
local function isShortSighted()

       if CharacterCreationProfession.instance.listboxTraitSelected and CharacterCreationProfession.instance.listboxTraitSelected.items then 
             local traits = CharacterCreationProfession.instance.listboxTraitSelected.items
             local isShortSighted = false
             for _,v in pairs(traits) do
                   if v and v.item:getType() == CharacterTrait.SHORT_SIGHTED then
                       return true
                   end
             end
       end

       return false
end


-- make sure character wears suitable clothing
local function manageClothing(self, desc, profession, gender, resetWornItems)

    local shortSighted = isShortSighted()     

    profession = rasDefinitions.toTableID[profession] -- convert to string-key to access our table    

    -- apply clothing from the "Special" field
    if profession and not resetWornItems then -- only run this when in the           
        if rasDefinitions[profession] then
            if rasDefinitions[profession]["Special"] then -- in case resetWornItems = false, characters are dressed with profession specific clothing (according to vanilla code...) 
                if rasDefinitions[profession]["Special"]["Female"] then
                    local currentTable = rasDefinitions[profession]["Special"]["Female"]
                    local wearsDress = desc:getWornItem(ItemBodyLocation.DRESS)
                    for bodyLocation, value in pairs(currentTable) do
                        local loc = ItemBodyLocation.get(ResourceLocation.of(bodyLocation)) -- the actual bodyLocation we equip with clothing
                        if not (bodyLocation == "Shirt" and wearsDress) then -- shirt and dress are incomapible, so do not apply (note: chance for equipping always <100 here)
                            local items = value.items
                            local chance = value.chance -- note: value.chance must always be defined in our table!!
                            desc:setWornItem(loc, nil)
                            if chance and ZombRand(100) < chance then
                                local itemType = items[ZombRand(0, #items) + 1]
                                local clothingItem = instanceItem(itemType)
                                desc:setWornItem(loc, clothingItem)
                            end
                        end
                    end
                end
                if gender == "Male" then
                    if rasDefinitions[profession]["Special"]["Male"] then -- in case men get special treatment (by default, it is the same as for women)
                        local currentTable = rasDefinitions[profession]["Special"]["Male"] 
                        for bodyLocation, value in pairs(currentTable) do
                            local loc = ItemBodyLocation.get(ResourceLocation.of(bodyLocation)) -- the actual bodyLocation we equip with clothing
                            local items = value.items
                            local chance = value.chance -- note: value.chance should always be defined in our table                            
                            desc:setWornItem(loc, nil)
                            if chance and ZombRand(100) < chance then
                                local itemType = items[ZombRand(0, #items) + 1]
                                local clothingItem = instanceItem(itemType)
                                desc:setWornItem(loc, clothingItem)
                            end
                        end
                    end
                end
            end 

            if shortSighted and rasDefinitions[profession]["Prescription"] then -- in case we added special prescription glasses
                if rasDefinitions[profession]["Prescription"]["Female"] then -- "Female" should be always defined
                    local items = rasDefinitions[profession]["Prescription"]["Female"]
                    local glasses = items[ZombRand(0, #items) + 1]
                    local item = instanceItem(glasses)
                    desc:setWornItem(ItemBodyLocation.EYES, item)       
                end
                if gender == "Male" then
                    if rasDefinitions[profession]["Prescription"]["Male"] then
                        local items = rasDefinitions[profession]["Prescription"]["Male"]
                        local glasses = items[ZombRand(0, #items) + 1]
                        local item = instanceItem(glasses)
                        desc:setWornItem(ItemBodyLocation.EYES, item)
                    end
                end
            end

            if rasDefinitions[profession]["ShirtDecals"] then -- apply correct shirt decals
                local shirt = desc:getWornItem(ItemBodyLocation.TSHIRT)
                if shirt then
                    local shirtType = shirt:getFullType()
                    if rasDefinitions[profession]["ShirtDecals"][shirtType] then
                        local decals = rasDefinitions[profession]["ShirtDecals"][shirtType]
                        local decal = decals[ZombRand(0, #decals) + 1]
                        shirt:getVisual():setDecal(decal)

                        if self.clothingDebugCreated then -- have to manually update the decalBox in case of all-clothing-unlocked :(
                            local combo = self.clothingDecalCombo["Tshirt"]
                            combo:select(decal)
                        end
                    end
                end
            end
        end        
    end

    -- exclude weird clothing combinations (exmple: no CropTop + TankTop; can still be worn manually if desired)
    -- also make sure this is done after vanilla game finished the random dress up (there might still be dress-up due to the trait table though)
    local dressUpDone = (resetWornItems and not ClothingSelectionDefinitions[profession]) or (not resetWornItems)
    if dressUpDone then
        if desc:getWornItem(ItemBodyLocation.DRESS) then 
            desc:setWornItem(ItemBodyLocation.TSHIRT, nil)             
            desc:setWornItem(ItemBodyLocation.SWEATER, nil)
        end
        local tshirt = desc:getWornItem(ItemBodyLocation.TSHIRT)
        if tshirt then
            local shirtType = tshirt:getFullType()
            if shirtType == "Base.Shirt_CropTopTINT" or shirtType == "Base.Shirt_CropTopNoArmTINT" or shirtType == "Base.BoobTube" or shirtType == "Base.BoobTubeSmall" then
                desc:setWornItem(ItemBodyLocation.TANK_TOP, nil)
            end
        end
        if desc:getWornItem(ItemBodyLocation.UNDERWEAR_EXTRA1) then
            desc:setWornItem(ItemBodyLocation.SOCKS, nil)
        end
        if desc:getWornItem(ItemBodyLocation.EYES) then
            desc:setWornItem(ItemBodyLocation.LEFT_EYE, nil)
        end
    end
end


-- make sure professions have correct hair
local function manageHair(desc, profession, gender)

    -- randomly assign a hair style from table RasProfessionsTables.AvailableHairStyles
    local hairTable = rasSharedData["AvailableHairStyles"][gender][profession:toString()]
    if hairTable then                
        local hair = hairTable[ZombRand(0, #hairTable) + 1]
        desc:getHumanVisual():setHairModel(hair)
    end

    -- student and gang member don't have grey hair; students also only get beards suitable for younger people
    if profession == Regs.NewProfs.rasStudent or profession == Regs.NewProfs.rasGangMember then
        local youngColors = rasSharedData.YoungColors
        local n = ZombRand(0, #youngColors) + 1
        local color = ImmutableColor.new(youngColors[n]["r"], youngColors[n]["g"], youngColors[n]["b"], 1)
        if color then
            desc:getHumanVisual():setHairColor(color)
            desc:getHumanVisual():setBeardColor(color)
            desc:getHumanVisual():setNaturalHairColor(color)
            desc:getHumanVisual():setNaturalBeardColor(color)
        end
        if profession == Regs.NewProfs.rasStudent and gender == "Male" then -- students don't get full beards, goatee or mustache
            local beardTable = rasSharedData.YoungBeards
            local beard = beardTable[ZombRand(0, #beardTable) + 1]
            desc:getHumanVisual():setBeardModel(beard)
        end            
    elseif profession == Regs.NewProfs.rasRetired then -- retired gets only grey hair
        local oldColors = rasSharedData.OldColors
        local n = ZombRand(0, #oldColors) + 1
        local color = ImmutableColor.new(oldColors[n]["r"], oldColors[n]["g"], oldColors[n]["b"], 1)
        if color then
            desc:getHumanVisual():setHairColor(color)
            desc:getHumanVisual():setBeardColor(color)
            desc:getHumanVisual():setNaturalHairColor(color)
            desc:getHumanVisual():setNaturalBeardColor(color)
        end
    end
end



-- make sure that the professions have their correct appearance when "random" button is pressed
local vanilla_dressWithDefinitions = CharacterCreationMain.dressWithDefinitions
function CharacterCreationMain:dressWithDefinitions(definition, resetWornItems, ...)

    vanilla_dressWithDefinitions(self, definition, resetWornItems, ...) -- execute vanilla code
 
    local desc = MainScreen.instance.desc
    local profession = desc:getCharacterProfession()
    local gender = "Male"
    if desc:isFemale() then
        gender = "Female"
    end

    manageClothing(self, desc, profession, gender, resetWornItems)
    manageHair(desc, profession, gender)        

    self:updateSelectedClothingCombo() 
    self.avatarPanel:setSurvivorDesc(desc) -- update avatar   
end


-- util function: add prescription glasses to combo
local function addPrescGlasses(self, profession, desc)
      
    local combo = self.clothingCombo["Eyes"]      
    if combo then

        local gender = "Male"
        if desc:isFemale() then
            gender = "Female"
        end

        local items = rasDefinitions[profession]["Prescription"]
        if items[gender] then
            for _,v in pairs(items[gender]) do
                local item = ScriptManager.instance:FindItem(v)
                local displayName = item:getDisplayName()
                if not combo:contains(displayName) then
                    combo:addOptionWithData(displayName, v)
                end
            end
        else
            for _,v in pairs(items["Female"]) do -- "Female" is always defined
                local item = ScriptManager.instance:FindItem(v)
                local displayName = item:getDisplayName()
                if not combo:contains(displayName) then
                    combo:addOptionWithData(displayName, v)
                end
            end
        end
        self:updateSelectedClothingCombo()
    end
end


-- add our newly defined prescription glasses to combo options in case character is short sighted
local vanilla_initClothing = CharacterCreationMain.initClothing
function CharacterCreationMain:initClothing(...)

    vanilla_initClothing(self, ...) 
    
    if self.clothingPanel then
        local desc = MainScreen.instance.desc
        local profession = desc:getCharacterProfession()
        local profID = rasDefinitions.toTableID[profession]
        if isShortSighted() and rasDefinitions[profID] and rasDefinitions[profID]["Prescription"] then
            addPrescGlasses(self, profID, desc)
        end
    end
end


-- util function: set buttons behind clothing comboBox and make comboBox smaller if necessary
local function setButtons(self, combo, button1, button2)

    local y = combo:getY()

    if (not button1) and button2 then
        button2:setX(combo:getRight() + UI_BORDER_SPACING)
        button2:setY(y)
    elseif button1 and button2 then
        local width = button1:getWidth()
        combo:setWidth(self.comboWid - width - UI_BORDER_SPACING)
        button1:setX(combo:getRight() + UI_BORDER_SPACING)
        button1:setY(y)
        button2:setX(button1:getRight() + UI_BORDER_SPACING)
        button2:setY(y)    
    end
end


-- adjust positions of color, texture and decal button
local vanilla_arrangeClothingRightSideElements = CharacterCreationMain.arrangeClothingRightSideElements
function CharacterCreationMain:arrangeClothingRightSideElements(bodyLocation, ...)

    vanilla_arrangeClothingRightSideElements(self, bodyLocation, ...) -- execute vanilla code

    if not self.labelRight then return end

    if getActivatedMods():contains("\\rasBodyMod") then -- compatibility with my mod "ra's Body Mod"
        return 
    end

    if self.clothingPanel and self.clothingCombo and self.clothingCombo[bodyLocation] and not self.clothingDebugCreated then -- don't touch debug or all-clothing-unlocked mode

        local combo = self.clothingCombo[bodyLocation]
        local colorBtn = self.clothingColorBtn[bodyLocation]
        local textureBtn = self.clothingTextureCombo[bodyLocation]
        local decal = self.clothingDecalCombo

        local y = combo:getY()
 
        if decal and decal[bodyLocation] and decal[bodyLocation]:isVisible() then
            local decalBtn = self.clothingDecalCombo[bodyLocation]

            local rightSideElements = 0
            if colorBtn:isVisible() then
                rightSideElements = colorBtn:getWidth() + UI_BORDER_SPACING
            end
            if decalBtn:isVisible() then
                rightSideElements = rightSideElements + decalBtn:getWidth() + UI_BORDER_SPACING
            end

            combo:setWidth(math.min(300, self.nonComboWidth - rightSideElements))   

            if colorBtn and colorBtn:isVisible() and textureBtn and textureBtn:isVisible() then
                textureBtn:setVisible(false) -- only show decal and color button in this case (to safe space)
                setButtons(self, combo, colorBtn, decalBtn)
            elseif colorBtn and colorBtn:isVisible() then
                setButtons(self, combo, colorBtn, decalBtn)          
            elseif textureBtn and textureBtn:isVisible() then
                setButtons(self, combo, decalBtn, textureBtn)        
            else
                setButtons(self, combo, nil, decalBtn)
            end
        else
            if colorBtn and colorBtn:isVisible() and textureBtn and textureBtn:isVisible() then
                setButtons(self, combo, colorBtn, textureBtn)
            elseif colorBtn and colorBtn:isVisible() then
                setButtons(self, combo, nil, colorBtn)
            elseif textureBtn and textureBtn:isVisible() then
                setButtons(self, combo, nil, textureBtn)
            end
        end
    end
end


-- next function updates a decal button which we will introduce below
local function updateDecalCombo(self, bodyLocation, item)

	self.clothingDecalCombo[bodyLocation]:setVisible(false)

	if not item then return end

	local clothingItem = item:getClothingItem()
    if clothingItem and clothingItem:getDecalGroup() then
        local itemType = item:getFullType()	    
        local desc = MainScreen.instance.desc       
        local profession = desc:getCharacterProfession()
        local profID = rasDefinitions.toTableID[profession]
        if rasDefinitions[profID] and rasDefinitions[profID]["ShirtDecals"] and rasDefinitions[profID]["ShirtDecals"][itemType] then -- in case we have a custom list of decals
            local decalTable = rasDefinitions[profID]["ShirtDecals"][itemType]
            if #decalTable > 1 then
                local combo = self.clothingDecalCombo[bodyLocation]
	            combo:setVisible(true)
	            combo.options = {}
                local currentDecal = item:getVisual():getDecal(clothingItem)
                local i = 1
                for _,decalOption in pairs(decalTable) do
		            local text = getText("UI_rasProfessions_decal") .. " " .. i
		            combo:addOptionWithData(text, decalOption)
		            if currentDecal == decalOption then
			            combo.selected = i
		            end
                    i = i+1
	            end   
            end
        else
            local decalGroup = getAllDecalNamesForItem(item)
            if decalGroup and (decalGroup:size() >= 1) then
	            local combo = self.clothingDecalCombo[bodyLocation]
	            combo:setVisible(true)
	            combo.options = {}
                local currentDecal = item:getVisual():getDecal(clothingItem)
	            for i=1,decalGroup:size() do
		            local text = getText("UI_rasProfessions_decal") .. " " .. i
                    local decalOption = decalGroup:get(i-1)
		            combo:addOptionWithData(text, decalOption)
		            if currentDecal == decalOption then
			            combo.selected = i
		            end
	            end
            end
        end
    end
    self:arrangeClothingRightSideElements(bodyLocation)
end


-- we have to modify this vanilla function so that we can apply the decal updates properly
local vanilla_updateClothingCombo = CharacterCreationMain.updateSelectedClothingCombo
function CharacterCreationMain:updateSelectedClothingCombo(...)

    if self.clothingCombo and not self.clothingDebugCreated then -- do not apply in all-clothing-unlocked mode 
		for i,combo in pairs(self.clothingCombo) do
			self.clothingDecalCombo[combo.bodyLocation]:setVisible(false) -- hide decal button by default
        end
    end

    vanilla_updateClothingCombo(self, ...) -- execute vanilla function
     
	if self.clothingCombo and not self.clothingDebugCreated then -- update the decal buttons; not in all-clothing-unlocked mode
        local desc = MainScreen.instance.desc
		for i,combo in pairs(self.clothingCombo) do		
            local loc = ItemBodyLocation.get(ResourceLocation.of(combo.bodyLocation))	
			local currentItem = desc:getWornItem(loc)
			if currentItem then			
                updateDecalCombo(self, combo.bodyLocation, currentItem)
			else
                self:arrangeClothingRightSideElements(combo.bodyLocation)
            end
		end
	end
end


-- apply correct decals in case player chooses a t-shirt 
local vanilla_onClothingComboSelected = CharacterCreationMain.onClothingComboSelected
function CharacterCreationMain:onClothingComboSelected(combo, bodyLocation, ...)

    vanilla_onClothingComboSelected(self, combo, bodyLocation, ...) -- execute vanilla code
    
    if bodyLocation == "Tshirt" then -- we have decals definitions only for Tshirts 
        local desc = MainScreen.instance.desc       
        local profession = desc:getCharacterProfession() 
        local profID = rasDefinitions.toTableID[profession]
        if rasDefinitions[profID] and rasDefinitions[profID]["ShirtDecals"] then
            local shirtType = combo:getOptionData(combo.selected)
            if rasDefinitions[profID]["ShirtDecals"][shirtType] then
                local item = desc:getWornItem(ItemBodyLocation.TSHIRT)
                if item then
                    local decals = rasDefinitions[profID]["ShirtDecals"][shirtType]
                    local decal = decals[ZombRand(0, #decals) + 1]
                    item:getVisual():setDecal(decal)                    
                    self:updateSelectedClothingCombo()     
                    self.avatarPanel:setSurvivorDesc(desc)

                    if self.clothingDebugCreated then -- have to manually update the decalBox in case of all-clothing-unlocked
                        local combo = self.clothingDecalCombo["Tshirt"]
                        combo:select(decal)
                    end
                end
            end
        end
    end   
end


-- add comboBox for clothing decals when not in all-clothing-unlocked-mode; in the preview, only show correct decals in case a t-hsirt is selected 
local vanilla_createClothingCombo = CharacterCreationMain.createClothingCombo
function CharacterCreationMain:createClothingCombo(bodyLocation, ...)

    vanilla_createClothingCombo(self, bodyLocation, ...) -- execute vanilla function

    if self.clothingCombo and self.clothingCombo[bodyLocation] then       
        local combo = self.clothingCombo[bodyLocation]

        local vanilla_pointOnItem = combo.pointOnItem
        combo.pointOnItem = function(_self, _index)
            if _self.lastIndex ~= _index then
                vanilla_pointOnItem(_self, _index) -- execute vanilla preview function 
                if bodyLocation == "Tshirt" then         
                    local desc = MainScreen.instance.desc  
                    local profession = desc:getCharacterProfession()
                    local profID = rasDefinitions.toTableID[profession]
                    if rasDefinitions[profID] and rasDefinitions[profID]["ShirtDecals"] then                   
                        local item = desc:getWornItem(ItemBodyLocation.TSHIRT)
                        if item then
                            local itemType = item:getFullType()                         
                            if rasDefinitions[profID]["ShirtDecals"][itemType] then
                                local decals = rasDefinitions[profID]["ShirtDecals"][itemType]
                                local decal = decals[ZombRand(0, #decals) + 1]
                                item:getVisual():setDecal(decal)
                                self:updateSelectedClothingCombo()
                                _self.parent.parent.avatarPanel:setSurvivorDesc(desc)
                            end
                        end
                    end
                end
            end
        end

        -- add combo box for clothing decals
        local x = combo:getRight() + UI_BORDER_SPACING
        local y = combo:getY()
        local width = UI_BORDER_SPACING*4 + getTextManager():MeasureStringX(UIFont.Small, getText("UI_characreation_Type") .. " " .. (9))
        local comboDecal = ISComboBox:new(x, y, width, BUTTON_HGT, self, self.onClothingDecalComboSelected, bodyLocation)
        comboDecal:initialise()
        comboDecal.pointOnItem = function(_self, _index)
            if _self.lastIndex ~= _index then
                local decal = _self:getOptionData(_index)
                local bodyLocation = _self.onChangeArgs[1]
                local loc = ItemBodyLocation.get(ResourceLocation.of(bodyLocation)) -- the actual bodyLocation we equip with clothing
                local item = MainScreen.instance.desc:getWornItem(loc)
                if decal and item then
                    item:getVisual():setDecal(decal)
                end
                _self.parent.parent.avatarPanel:setSurvivorDesc(MainScreen.instance.desc)
                _self.lastIndex = _index
            end
        end
        self.clothingPanel:addChild(comboDecal)

        self.clothingDecalCombo = self.clothingDecalCombo or {}
        self.clothingDecalCombo[bodyLocation] = comboDecal

        self.clothingWidgets[#self.clothingWidgets - 1] = nil
        table.insert(self.clothingWidgets, { combo, self.clothingColorBtn[bodyLocation], comboDecal, self.clothingTextureCombo[bodyLocation] })
    end
end


-- make custom decal definitions also work in the preview mode when in all-clothing-unlocked mode
local vanilla_createClothingComboDebug = CharacterCreationMain.createClothingComboDebug
function CharacterCreationMain:createClothingComboDebug(bodyLocation, ...)

    vanilla_createClothingComboDebug(self, bodyLocation, ...) -- execute vanilla code

    if self.clothingCombo and self.clothingCombo[bodyLocation] then
        local combo = self.clothingCombo[bodyLocation]

        local vanilla_pointOnItem = combo.pointOnItem
        combo.pointOnItem = function(_self, _index)
            if _self.lastIndex ~= _index then
                vanilla_pointOnItem(_self, _index) -- execute vanilla preview function 
                if bodyLocation == "Tshirt" then         
                    local desc = MainScreen.instance.desc  
                    local profession = desc:getCharacterProfession()
                    local profID = rasDefinitions.toTableID[profession]
                    if rasDefinitions[profID] and rasDefinitions[profID]["ShirtDecals"] then                   
                        local item = desc:getWornItem(ItemBodyLocation.TSHIRT)
                        if item then
                            local itemType = item:getFullType()                         
                            if rasDefinitions[profID]["ShirtDecals"][itemType] then
                                local decals = rasDefinitions[profID]["ShirtDecals"][itemType]
                                local decal = decals[ZombRand(0, #decals) + 1]
                                item:getVisual():setDecal(decal)
                                _self.parent.parent.avatarPanel:setSurvivorDesc(desc)
                            end
                        end
                    end
                end
            end
        end  
    end
end








