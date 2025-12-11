-- modify the random dress-up of a character in the character customisation screen;
-- in some cases, a body location should only get clothing from a specific choice of clothing items for that location (for example: no fedora hats for lumberjacks but baseball cap is ok, 
-- player can still manually choose fedora if desired), this is done via the "Special" field in our clothing table; we also exclude some other weird clothing combinations and make it so that professions 
-- don't get inappropriate hair styles (player can still maunally choose those combinations or hair styles)
--
--
-- by razab


local rasSharedData = require("RasProfessionsSharedData")
local rasDefinitions = require("Definitions/RasProfessionsClothingDefinitions")


-- make sure character wears suitable clothing
local function manageClothing(desc, profession, gender, resetWornItems)
    
    -- dress according to our "Special" field in the clothing table
    if profession and not resetWornItems then -- in case resetWornItems = false, characters are dressed with profession specific clothing (according to vanilla code...)            
        local rasTable = rasDefinitions
        if rasTable[profession] and rasTable[profession]["Special"] then -- only if we defined "Special" in our table RasProfessionsClothingDefinitions 
            if rasTable[profession]["Special"]["Female"] then
                local currentTable = rasTable[profession]["Special"]["Female"] 
                local wearsDress = desc:getWornItem("Dress")
                for bodyLocation, value in pairs(currentTable) do
                    if not(bodyLocation == "Shirt" and wearsDress) then -- shirt and dress are mutually exclusive; so don't apply new shirts in this case
                        local items = value.items
                        local chance = value.chance -- note: value.chance should always be defined in the "Special" table
                        desc:setWornItem(bodyLocation, nil)
                        if chance and ZombRand(100) < chance then
                            local itemType = items[ZombRand(0, #items) + 1]
                            local clothingItem = InventoryItemFactory.CreateItem(itemType)
                            desc:setWornItem(bodyLocation, clothingItem)
                        end
                    end
                end
            end
            if gender == "Male" then
                if rasTable[profession]["Special"]["Male"] then -- in case men have special definitions (by default, it is the same as for women)
                    local currentTable = rasTable[profession]["Special"]["Male"] 
                    for bodyLocation, value in pairs(currentTable) do
                        local items = value.items
                        local chance = value.chance -- note: value.chance should always be defined in the "Special" table
                        desc:setWornItem(bodyLocation, nil)
                        if chance and ZombRand(100) < chance then
                            local itemType = items[ZombRand(0, #items) + 1]
                            local clothingItem = InventoryItemFactory.CreateItem(itemType)
                            desc:setWornItem(bodyLocation, clothingItem)
                        end
                    end
                end
            end
        end 
    end  

    -- exclude some weird clothing combination (exmple: no CropTop + TankTop; can still be worn manually if desired)
    if desc:getWornItem("Dress") then 
        desc:setWornItem("Tshirt", nil) 
        desc:setWornItem("Sweater", nil)
    end
    local tshirt = desc:getWornItem("Tshirt")
    if tshirt then
        local shirtType = tshirt:getFullType()
        if shirtType == "Base.Shirt_CropTopTINT" or shirtType == "Base.Shirt_CropTopNoArmTINT" or shirtType == "Base.BoobTube" or shirtType == "Base.BoobTubeSmall" then
            desc:setWornItem("TankTop", nil)
        end
    end
    if desc:getWornItem("UnderwearExtra1") then
        desc:setWornItem("Socks", nil)
    end 
end


-- make sure professions have correct hair
local function manageHair(desc, profession, gender)

    -- randomly assign a hair style from table RasProfessionsTables.AvailableHairStyles
    local hairTable = rasSharedData["AvailableHairStyles"][gender][profession] 
    if hairTable then              
        local hair = hairTable[ZombRand(0, #hairTable) + 1]
        desc:getHumanVisual():setHairModel(hair)
    end


    -- in case of student or gang member, don't assign grey hair to them
    if profession == "rasStudent" or profession == "rasGangMember" then
        local youngColors = rasSharedData.YoungColors
        local n = ZombRand(0, #youngColors) + 1
        local color = ImmutableColor.new(youngColors[n]["r"], youngColors[n]["g"], youngColors[n]["b"], 1)
        if color then
            desc:getHumanVisual():setHairColor(color)
            desc:getHumanVisual():setBeardColor(color)
            desc:getHumanVisual():setNaturalHairColor(color)
            desc:getHumanVisual():setNaturalBeardColor(color)
        end
       
        if profession == "rasStudent" and gender == "Male" then -- male students don't get full beards, goatee or mustache
            local beardTable = rasSharedData.YoungBeards
            local beard = beardTable[ZombRand(0, #beardTable) + 1]
            desc:getHumanVisual():setBeardModel(beard)  
        end          
    elseif profession == "rasRetired" then -- retired only gets grey hair colors
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


local vanilla_dressWithDefinitions = CharacterCreationHeader.dressWithDefinitions
function CharacterCreationHeader:dressWithDefinitions(definition, resetWornItems, ...)

    vanilla_dressWithDefinitions(self, definition, resetWornItems, ...) -- execute vanilla code

    local desc = MainScreen.instance.desc
    local profession = desc:getProfession()
    local gender = "Male"
    if desc:isFemale() then
        gender = "Female"
    end

    manageClothing(desc, profession, gender, resetWornItems) 
    manageHair(desc, profession, gender)

    self.avatarPanel:setSurvivorDesc(desc) -- update avatar       
end




