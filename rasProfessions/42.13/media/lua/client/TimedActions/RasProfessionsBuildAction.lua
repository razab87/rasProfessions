-- patch the BuildAction so that isWall constructed by architect get more durability
--
--
-- by razab



local Regs = RasProfessionsRegistries


-- wall types:
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

-- door types
local isDoor = {}
isDoor["MetalDoorLvl1"] = true
isDoor["MetalDoorLvl2"] = true
isDoor["WoodenDoorLvl1"] = true
isDoor["WoodenDoorLvl2"] = true
isDoor["WoodenDoorLvl3"] = true



local vanilla_perform = ISBuildAction.perform
function ISBuildAction:perform(...)

        local increaseHP = false
        local isOldObject = {} -- store walls or doors which are already present so we don't accidently assign them the new hp
        local recipeName = nil

        if self.item and self.item.craftRecipe then
            recipeName = self.item.craftRecipe:getName()        
            if self.character:getDescriptor():getCharacterProfession() == Regs.NewProfs.rasArchitect and (isWall[recipeName] or isDoor[recipeName]) then
                increaseHP = true
                local oldObjects = self.square:getObjects()        
                for i=0, oldObjects:size() - 1 do
                     local object = oldObjects:get(i)
                     if object:getName() == recipeName then
                          isOldObject[object] = true -- store old isWall
                     end
                end 
            end
        end
 
        vanilla_perform(self, ...) -- execute vanilla code

        if increaseHP then
            local newObjects = self.square:getObjects()
            for i=0, newObjects:size() - 1 do
                 local object = newObjects:get(i)
                 if object:getName() == recipeName and not isOldObject[object] then -- if it is the newly constructed wall                      
                      local newMaxHealth = math.floor(object:getMaxHealth() * 1.2)
                      local newHealth = math.floor(object:getHealth() * 1.2)
                      object:setMaxHealth(newMaxHealth) -- extra hp 
                      object:setHealth(newHealth)
                      break;
                 end
            end
        end
end



