-- here we make sure the character is correctly set up when game starts (adding special equipment to inventory etc.)
--
--
-- by razab




local rasSharedData = require("RasProfessionsSharedData")

local Regs = RasProfessionsRegistries

   
-- add profession items to player inventory
local function makeInventory(player)
    local profession = player:getDescriptor():getCharacterProfession()
    local playerInv = player:getInventory()

    if rasSharedData.Equipment[profession] then
        for _,value in pairs(rasSharedData.Equipment[profession]) do
            local number = 1
            if profession == Regs.OldProfs.policeofficer then
                if value == "Base.Bullets45" then
                    number = 12 -- 12 bullets for police officer
                end
            end
            for i=0,number-1 do
                local item = instanceItem(value)
                if profession == Regs.OldProfs.policeofficer and value == "Base.Revolver" then
                    item:setCurrentAmmoCount(6) -- revolver for police officer is loaded when game starts
                    item:syncItemFields()
                end
                playerInv:addItem(item)
                sendAddItemToContainer(playerInv, item)
            end
        end
    end        
end


-- swap the custom traits from doRasTraits with their vanilla counterparts; also remove hidden traits
local function manageTraits(player)         
    local playerTraits = player:getCharacterTraits() 
    for _,traitPair in pairs(rasSharedData.TraitsToSwap) do 
        if player:hasTrait(traitPair.swap) then                                      
            if traitPair.swap ~= Regs.Traits.OutOfShape then -- outOfShape trait requires special treatment                                            
                playerTraits:remove(traitPair.swap)
                playerTraits:add(traitPair.with)
            end
        end
    end 

    if isServer() then -- in mp, we also remove the OutOfShape trait for retired profession (must be done manually cause vanilla game behaves strange for this trait)
        local profession = player:getDescriptor():getCharacterProfession() -- when not in mp, this is done elsewhere to ensure it is done on the first game tick
        if profession == Regs.NewProfs.rasRetired and player:hasTrait(Regs.Traits.OutOfShape) then
            player:getCharacterTraits():remove(Regs.Traits.OutOfShape)
        end
    end                       
end



local isPants = {}
isPants["Base.Trousers_Denim"] = true
isPants["Base.Skirt_Long"] = true

local isShoes = {}
isShoes["Base.Shoes_Random"] = true
isShoes["Base.Shoes_TrainerTINT"] = true

-- util function to properly add dirt to clothing for homeless profession
local function makeDirty(player, item)

    local itemType = item:getFullType()
    if isPants[itemType] then
        item:setDirt(BloodBodyPartType.LowerLeg_R, 1.0)
        syncItemFields(player, item)
        item:synchWithVisual()
        syncVisuals(player)
    end
end



local create = {}

-- create the player: add profession items to inventory, swap custom traits with vanilla and equip items; when in MP, this function is called by server
function create.createPlayer(player)
         
    makeInventory(player) -- add items to player inventory
    manageTraits(player)  -- swap traits

    -- some professions get special treatment regarding their starting equipment 
    local profession = player:getDescriptor():getCharacterProfession()                
    if profession == Regs.OldProfs.policeofficer or profession == Regs.OldProfs.securityguard then  -- they should start with their weapons attached; is done in client/Hotbar/RasProfessionsAttach.lua
        if not isServer() then
            rasSharedData.ShouldAttachWeapon = true
        end                
    elseif profession == Regs.NewProfs.rasStudent then -- put some random items in student's backpack
        local backpack = player:getWornItem(ItemBodyLocation.BACK)
        if not backpack then
            backpack = player:getWornItem(ItemBodyLocation.SATCHEL)
        end
        if backpack then 
            local backpackType = backpack:getFullType()
            if backpackType == "Base.Bag_Schoolbag" or backpackType == "Base.Bag_Satchel" or backpackType == "Base.Bag_Satchel_Leather" or backpackType == "Base.Bag_Schoolbag_Patches" then      
                local junk = { }
                junk[0] = "Base.Book"
                junk[1] = "Base.Eraser"  
                junk[2] = "Base.Pencil"
                junk[3] = "Base.Paperclip"
                junk[4] = "Base.Magazine"
                junk[5] = "Base.Apple"
                junk[6] = "Radio.CDplayer"
                junk[7] = "Base.Disc_Retail"
                junk[8] = "Base.Earbuds"

                local playerInv = player:getInventory()
                local bodyLocation = backpack:canBeEquipped()
                if bodyLocation then
                    player:setWornItem(bodyLocation, nil) -- apparently, it is not possible to add items to backpacks while they are equipped and/or in player inventory, so we unequip and remove
                    sendClothing(player, bodyLocation, nil)
                    playerInv:Remove(backpack)
                    sendRemoveItemFromContainer(playerInv, backpack)

                    local size = 9
                    local e = 2 + ZombRand(4) -- add between two and five random items
                    local backInv = backpack:getInventory()   
                    for i=1,e do
                        local index = ZombRand(size)
                        local item = instanceItem(junk[index])
                        
                        backInv:addItem(item)
                        sendAddItemToContainer(backInv, item)
                        
                        if index ~= size - 1 then
                            junk[index] = junk[size - 1]  -- write last item to current index so we can just remove the last entry of the table and have no issues with indices
                        end
                        table.remove(junk, size - 1)
                        size = size - 1
                    end
                    
                    playerInv:addItem(backpack) -- re-equip backpacks and put them back to inventory
                    sendAddItemToContainer(playerInv, backpack)
                    player:setWornItem(bodyLocation, backpack)
                    sendClothing(player, bodyLocation, backpack)
                end
            end                  
        end       
        
    elseif profession == Regs.NewProfs.rasHomeless then -- homeless starts with garbage bag equipped and low condition clothing
        local garbagebag = instanceItem("Base.Garbagebag") 

        local twine = instanceItem("Base.Twine")  -- random junk to be added to garbagebag
        local sneakers = instanceItem("Base.Shoes_TrainerTINT") 
        sneakers:setCondition(ZombRand(3) + 1 )
        local socks = instanceItem("Base.Socks_Ankle")
        socks:setCondition(5 + ZombRand(5))
        local matches = instanceItem("Base.Matches")
        local toiletpaper = instanceItem("Base.ToiletPaper")
        local newspaper =  instanceItem("Base.Newspaper")
        local toothbrush = instanceItem("Base.Toothbrush")
        local apple = instanceItem("Base.Apple")
        apple:setAge(5.5)

        local junk = { } 
        junk[0] = twine
        junk[1] = sneakers
        junk[2] = socks
        junk[3] = matches
        junk[4] = toiletpaper
        junk[5] = newspaper
        junk[6] = toothbrush
        junk[7] = apple

        local size = 8 
        local e = 2 + ZombRand(3) -- add between two and four  junk items
        local garbageInv = garbagebag:getInventory()
        for i=1,e do
            local index = ZombRand(size)
            junk[index]:syncItemFields()
            garbageInv:addItem(junk[index])
            sendAddItemToContainer(garbageInv, junk[index])
            if index ~= size - 1 then
                junk[index] = junk[size - 1] 
            end
            table.remove(junk, size - 1)
            size = size - 1
        end

        local playerInv = player:getInventory()
        playerInv:addItem(garbagebag)
        sendAddItemToContainer(playerInv, garbagebag)
        player:setSecondaryHandItem(garbagebag)
        
        local allLocations = BodyLocations.getGroup("Human"):getAllLocations() -- lower condition of worn clothes and make them dirty
        for i=0, allLocations:size()-1 do
            local bodyLocation = allLocations:get(i):getId()
            local item = player:getWornItem(bodyLocation)
            if item then
                makeDirty(player, item)
                local n = item:getCondition()
                item:setCondition(n - math.floor(n/2) + ZombRand(math.floor(n/2) + 1) )
                syncItemFields(player, item)
            end
        end

        if isServer() then
            sendServerCommand(player, "rasProfessions", "triggerClothingUpdate", {}) -- will update the player inventory with the equipped garbage bage
        end
        
    elseif profession == Regs.NewProfs.rasOfficeEmployee then -- office employee starts with briefcase equipped
        local briefcase = instanceItem("Base.Briefcase") 
        
        local junk = { } -- add some random junk to the briefcase
        junk[0] = "Base.Notebook"
        junk[1] = "Base.Pen"
        junk[2] = "Base.Newspaper"
        junk[3] = "Base.Money"
        junk[4] = "Base.PaperclipBox"
        junk[5] = "Base.Cube"
        junk[6] = "Base.Sandwich"
       
        local size = 7
        local e = 2 + ZombRand(3) -- add between two and four random items
        local briefcaseInv = briefcase:getInventory()
        for i=1,e do
            local index = ZombRand(size)
            local item = instanceItem(junk[index])
            briefcaseInv:addItem(item)
            sendAddItemToContainer(briefcaseInv, item)
            if index ~= size - 1 then
                junk[index] = junk[size - 1]
            end
            table.remove(junk, size - 1)
            size = size - 1
        end
        
        local playerInv = player:getInventory()
        playerInv:addItem(briefcase) -- put briefcase to inventory
        sendAddItemToContainer(playerInv, briefcase)
        player:setSecondaryHandItem(briefcase) -- equip briefcase

        if isServer() then
             sendServerCommand(player, "rasProfessions", "triggerClothingUpdate", {}) -- will update the player inventory with the equipped briefcase
        end
        
    elseif profession == Regs.NewProfs.rasMailCarrier then -- put some random junk in mail carrier's satchel
        local satchel = player:getWornItem(ItemBodyLocation.BACK)
        if not satchel then
            satchel = player:getWornItem(ItemBodyLocation.SATCHEL)
        end
        if satchel then
            local satchelType = satchel:getFullType()
            if satchelType == "Base.Bag_Satchel" or satchelType == "Base.Bag_Satchel_Mail" then      
                local junk = { }
                junk[0] = "Base.SheetPaper2"
                junk[1] = "Base.SheetPaper2"
                junk[2] = "Base.Pen"
                junk[3] = "Base.Paperclip"
                junk[4] = "Base.Paperclip"
                junk[5] = "Base.Magazine"
                junk[6] = "Base.FishingMag2"

                local playerInv = player:getInventory()
                local bodyLocation = satchel:canBeEquipped()
                if bodyLocation then
                    player:setWornItem(bodyLocation, nil) -- apparently, it is not possible to add items to backpacks while they are equipped and/or in player inventory, so we unequip and remove
                    sendClothing(player, bodyLocation, nil)
                    playerInv:Remove(satchel)
                    sendRemoveItemFromContainer(playerInv, satchel)

                    local size = 7
                    local e = 2 + ZombRand(2) -- add two or three random items
                    local satchelInv = satchel:getInventory()   
                    for i=1,e do
                        local index = ZombRand(size)
                        local item = instanceItem(junk[index])
                        satchelInv:addItem(item)
                        sendAddItemToContainer(satchelInv, item)
                        if index ~= size - 1 then
                            junk[index] = junk[size - 1]
                        end
                        table.remove(junk, size - 1)
                        size = size - 1
                    end
                    
                    playerInv:addItem(satchel) -- re-equip backpacks and put them back to inventory
                    sendAddItemToContainer(playerInv, satchel)
                    player:setWornItem(bodyLocation, satchel)
                    sendClothing(player, bodyLocation, satchel)
                end
            end                  
        end 
    end                 
end


local function onStart(player, square)

    if isClient() then -- in MP, we have to add new items on server
    
        local startTick = nil
        local function InitInMP(tick) -- we send the init command for several ticks to check when the server is responsive (may take several ticks)
            if not startTick then
                startTick = tick
            end            
            if tick >= startTick + 2 then
                sendClientCommand(player, "rasProfessions", "initPlayer", {})
            end
        end

        Events.OnTick.Add(InitInMP)

        local function onServerCommandStopRequest(mod, command, args)
            if mod == "rasProfessions" then
                if command == "stopRequestingAndCreatePlayer" then
                    Events.OnTick.Remove(InitInMP) -- when server responds, remove from events and stop sending init commands
                    Events.OnServerCommand.Remove(onServerCommandStopRequest)

                    sendClientCommand(player, "rasProfessions", "createPlayer", {}) -- this will finally create the player on server
                end
            end
        end

        Events.OnServerCommand.Add(onServerCommandStopRequest)    

    elseif not isServer() then -- in SP
        create.createPlayer(player)
    end
end


Events.OnNewGame.Add(onStart)


return create




