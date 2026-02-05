-- this build action is called by server in MP; we patch it and add extra durability for walls and doors when constructed by architect profession
--
--
-- by razab



local Regs = RasProfessionsRegistries


-- affected wall types:
local isWall = {}
isWall["BrickWallLvl1"] = true
isWall["BrickWallLvl2"] = true
isWall["StoneWall"] = true
isWall["LogWall"] = true
isWall["WoodenWallLvl1"] = true
isWall["WoodenWallLvl2"] = true
isWall["WoodenWallLvl3"] = true
isWall["MetalWallLvl1"] = true
isWall["MetalWallLvl2"] = true

-- affected door types
local isDoor = {}
isDoor["MetalDoorLvl1"] = true
isDoor["MetalDoorLvl2"] = true
isDoor["WoodenDoorLvl1"] = true
isDoor["WoodenDoorLvl2"] = true
isDoor["WoodenDoorLvl3"] = true


local vanilla_build = Actions.build
function Actions.build(character, args, ...)

    local isOldObject = {} -- store walls or doors which are already present so we don't accidently assign them the new hp
    local recipeName = nil
    local square = nil

    if isServer() and args and args.item and args.item.craftRecipe then
        
        recipeName = args.item.craftRecipe:getName()
        if character:getDescriptor():getCharacterProfession() == Regs.NewProfs.rasArchitect and (isWall[recipeName] or isDoor[recipeName]) then
            square = getSquare(args.x, args.y, args.z)
            if square then
                local oldObjects = square:getObjects()        
                for i=0, oldObjects:size() - 1 do
                    local object = oldObjects:get(i)
                    if object:getName() == recipeName then
                        isOldObject[object] = true -- store old walls or doors
                    end
                end
            end
        end       
    end
  
    vanilla_build(character, args, ...)  -- execute vanilla code

    if square then
        local newObjects = square:getObjects()
        local size = newObjects:size()
        for i=0, size - 1 do
            local object = newObjects:get(i)
            local name = object:getName()
            if name == recipeName and not isOldObject[object] then -- if it is the newly constructed object
                local newMaxHealth = math.floor(object:getMaxHealth() * 1.2)
                local newHealth = math.floor(object:getHealth() * 1.2)

                object:setMaxHealth(newMaxHealth) -- add extra hp                
                object:setHealth(newHealth) 
                object:sync()

                local index = object:getObjectIndex()
                local xPos = square:getX()
                local yPos = square:getY()
                local zPos = square:getZ()

                local playerList = getOnlinePlayers() -- the sync() command won't sync the maxHealth for the client's UI, so we send commands to them and sync manually
                for i=1,playerList:size() do
                    local player = playerList:get(i-1)
                    sendServerCommand(player, "rasProfessions", "syncObjectHealth", { coords = {x = xPos, y = yPos, z = zPos }, objectIndex = index, maxHealth = newMaxHealth, objectListSize = size, objectName = name })
                end
                break
            end
        end
    end
end






