-- handle commands coming from server (only for attaching weapons in case of police officer and security guard when MP game starts)
--
--
-- by razab



local equipTool = require("Hotbar/RasProfessionsAttach")


local Regs = RasProfessionsRegistries


local function onServerCommand(mod, command, args)

    if mod == "rasProfessions" then
        if command == "attachWeapons" then -- attach weapons for police officers and security guards
            local hotbarInstance = equipTool.hotbarInstance
            local player = getPlayer()
            local profession = player:getDescriptor():getCharacterProfession() 
            if profession == Regs.OldProfs.policeofficer then -- police officer starts with revolver attached
                equipTool.attachGunToHolster(hotbarInstance)   
            elseif profession == Regs.OldProfs.securityguard then -- security guard starts with nightstick attached
                equipTool.attachNightstickToBelt(hotbarInstance)
            end	 
        elseif command == "syncObjectHealth" and args then -- sync maxHealth of walls and doors constructed by architect (we need to manually sync them for all players)
            local coords = args.coords
            local square = nil
            if coords then
                square = getSquare(coords.x, coords.y, coords.z)
            end
            if square then
                local objectIndex = args.objectIndex
                local objects = square:getObjects()
                local size = objects:size() 
                if objectIndex < size and args.objectListSize == size then
                    local object = objects:get(objectIndex) 
                    if object and object:getName() == args.objectName then
                        object:setMaxHealth(args.maxHealth)
                    end
                end
            end
        elseif command == "triggerClothingUpdate" then

            local player = getPlayer()

            local startTick = nil
            local function trigger(tick)
                if not startTick then
                    startTick = tick
                end
    
                if tick >= startTick + 20 then -- in mp on new game, we trigger clothing update with some delay to make sure equipped bags and briefcases are correctly shown in the player inventory
                    triggerEvent("OnClothingUpdated", player)
                    ISInventoryPage.renderDirty = true
                    Events.OnTick.Remove(trigger)
                end
            end

            Events.OnTick.Add(trigger)
        end
    end
end



Events.OnServerCommand.Add(onServerCommand)
