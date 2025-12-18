-- this code does the following things: 
--    - make player spawn on correct location (is done manually since it will later result in better multiplayer compatibility)
--    - remove zombies from spawn house, remove house alarm from spawn house (necessary since spawns are done manually)
--    - turn lights on in spawn house (better because of the new B42 lighting system, this will avoid pitch black starts)
--    - give keys for starter house
--    - remove OutOfShape profession trait from "retired" (do this manually since vanilla game has strange behavior for that specific trait)
--
--
-- by razab




local rasSharedData = require("RasProfessionsSharedData")


local startX  -- spawn location
local startY



-- give player starter house keys
local function giveHouseKeys(tick)

    local player = getPlayer()
    local square = player:getSquare()
    if square then        
        local keyring =  player:getInventory():getItemFromType("Base.KeyRing")
        if keyring then 
            keyring:getInventory():RemoveAll("Base.Key1")
            local building = square:getBuilding()
            if building then
                local buildingDef = building:getDef() 
                if buildingDef:isResidential() and not buildingDef:isShop() and player:getDescriptor():getProfession() ~= "rasHomeless" then
                    key = instanceItem("Base.Key1")
                    key:setKeyId(buildingDef:getKeyId())
		            ItemPickerJava.keyNamerBuilding(key, square)
                    keyring:getInventory():addItem(key)
                end
            end
        end
        Events.OnTick.Remove(giveHouseKeys) -- remove from events
    end
end


-- remove OutOfShape trait in case player has selected "retired" profession
local function fixOutOfShape(tick)

    local player = getPlayer()    
    if player:HasTrait("rasOutOfShapeProf") then
        player:getTraits():remove("rasOutOfShapeProf")
    end
    Events.OnTick.Remove(fixOutOfShape)
end


-- turn on lights in start room
local function turnLightsOn(tick)

    local player = getPlayer()
    local square = player:getSquare()
    if square then 
        local room = square:getRoom()
        if room then
            local lights = room:getLightSwitches()
            for i=0, lights:size() - 1 do
                lights:get(i):setActivated(true) -- turn lights on
                lights:get(i):switchLight(true)
            end                
        end 
        Events.OnTick.Remove(turnLightsOn) -- remove from events
    end
end


-- remove zombies from start area; have to do this for several ticks since not everything might be loaded
-- during the first ticks
local startDefaultRemoveTick = nil
local startBuildingDef = nil
local zombieHasBeenChecked = {}
local function removeZombies(tick)

    if not startDefaultRemoveTick then
        startDefaultRemoveTick = tick
    end

    if not startBuildingDef then
        local player = getPlayer()
        if player then        
            local startBuilding = player:getBuilding()
            if startBuilding then
                startBuildingDef = startBuilding:getDef()
            end
        end
    end

    local cell = getCell()
    if cell and startBuildingDef then
        local zombies = cell:getZombieList()
	    for i=zombies:size(),1,-1 do -- note: list gets smaller when removing zeds, therefore start with i=size
		    local zombie = zombies:get(i-1)
            if not zombieHasBeenChecked[zombie] then
                local sq = zombie:getSquare()
                if sq then
                    local building = sq:getBuilding()
                    if building then
                        local buildingDef = building:getDef()
                        if buildingDef == startBuildingDef then -- remove zeds from start building
		                    zombie:removeFromWorld()
		                    zombie:removeFromSquare()
                            --DebugLog.log("rasProfessions_Info: zombie in spawn house removed at level " .. sq:getZ())                          
                        end                         
                    elseif (math.abs(sq:getX() - startX) <= 23 and math.abs(sq:getY() - startY) <= 23) then -- remove zeds from a 46x46 area around the player
                            zombie:removeFromWorld()
		                    zombie:removeFromSquare()
                            --DebugLog.log("rasProfessions_Info: zombie in spawn location around player removed")
                    end  
                    zombieHasBeenChecked[zombie] = true
		        end
            end
	    end
    end

    if tick >= startDefaultRemoveTick + 40 then -- do this for the first 40 game ticks
        Events.OnTick.Remove(removeZombies) -- remove from events
        startDefaultRemoveTick = nil
        startBuildingDef = nil
        zombieHasBeenChecked = {}
    end
end




-- removing zombies from basement requires a special procedure since I don't know how to access the zombies
-- when the basement has not already been discovered by the player; check for basement discovery on every tick but
-- only do this for the first 3 in game hours (avoid doing this for the whole game to safe performance)
local discoverTick = nil
local function removeBasementZombies(tick)

    local square = getPlayer():getSquare()

    if square and square:getZ() < 0 and not discoverTick then 
        local xDiff = math.abs(startX - square:getX())
        local yDiff = math.abs(startY - square:getY())
        if xDiff < 22 and yDiff < 22 then
            discoverTick = tick
        end
    end

    if discoverTick and tick >= discoverTick + 2 then -- wait two ticks before removing
        local cell = getCell() -- remove zombies from basements
        if cell then
            local zombies = cell:getZombieList()
            for i=zombies:size(),1,-1 do -- note: list gets smaller when removing zeds, therefore start with i=size
                local zombie = zombies:get(i-1)
                local sq = zombie:getSquare()
                if sq:getZ() < 0 then --only remove basement zeds
                    zombie:removeFromWorld()
                    zombie:removeFromSquare()
                    --DebugLog.log("rasProfessions_Info: zombie in basement removed")
                end
            end
        end
        discoverTick = nil
        Events.OnTick.Remove(removeBasementZombies) -- remove from events
    end
end


-- we stop checking for basement zombie removal after 3 hours
local hour = 0
local function stopCheckingForBasements()

    if hour >= 3 then
        Events.OnTick.Remove(removeBasementZombies) -- remove from events
        discoverTick = nil
        Events.EveryHours.Remove(stopCheckingForBasements)    
    end
    hour = hour + 1
end


-- teleport to start location; remove house alarm from starter house; prepare the spawn point (zombie removal etc)
local function manageSpawn(player)

    local profession = player:getDescriptor():getProfession()

    local city = rasSharedData.StartingCity
    if city and rasSharedData["Spawns"][city] and rasSharedData["Spawns"][city][profession] then
        local spawns = rasSharedData["Spawns"][city][profession]
        local n = ZombRand(#spawns) + 1
        local point = spawns[n]
        local x = nil
        local y = nil
        local z = 0
        if point["posX"] and point["posY"] then
            if point["worldX"] then
                x = (point["worldX"]*300) + point["posX"] -- old coordinate format
                if point["worldY"] then
                    y = (point["worldY"]*300) + point["posY"]
                else
                     DebugLog.log("rasProfessions_WARN: Spawnpoint for " .. profession .. " in " .. city .. " not correctly defined!")
                end   
            else
               x = point["posX"]  
               y = point["posY"]
            end
            if point["posZ"] then
                z = point["posZ"]
            end
        else
             DebugLog.log("rasProfessions_WARN: Spawnpoint for " .. profession .. " in " .. city .. " not correctly defined!")
        end
 
        if x and y then
            startX = x
            startY = y
            local building = getWorld():getMetaGrid():getBuildingAt(startX, startY)
            if building then
                building:setAlarmed(false) -- no alarm in starter house
                building:setAllExplored(true) -- test: this might prevent a house from becoming randomized (burnt, barricaded...) but not 100% sure

                player:teleportTo(startX, startY, z) -- teleport player to spawn location
                
                Events.OnTick.Add(removeZombies) -- functions for removing zombies from start area
                Events.OnTick.Add(removeBasementZombies)
                Events.EveryHours.Add(stopCheckingForBasements)

                Events.OnTick.Add(giveHouseKeys) -- add house keys to player inventory
                Events.OnTick.Add(turnLightsOn) -- turn on lights in starter room (to avoid spawning in a black room; can still happen when power is shut off :( )
            end            
        end
    end
end


-- execute everything OnNewGame
local function mainFunction(player, square)

    Events.OnTick.Add(fixOutOfShape)

    if SandboxVars.RasProfessions.ModdedSpawnPoints then    
        manageSpawn(player)         
    end
end


Events.OnNewGame.Add(mainFunction)





 
