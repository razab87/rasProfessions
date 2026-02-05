-- B42 introduces clothing specific for traits; we make it so that they are never randomly equipped during character creation (to not mess up the mod's profession outfits); they can still be
-- selected manually; exception is short sigthed: prescription glasses will still be equipped with 100% and we add a new glasses typ
--
--
-- by razab



local function modTraitClothes()

   local definitions = TraitClothingSelectionDefinitions
   for trait,v in pairs(definitions) do
        for gender,w in pairs(v) do 
             for bodyLocation,_ in pairs(w) do
                   if trait ~= CharacterTrait.SHORT_SIGHTED then 
                       TraitClothingSelectionDefinitions[trait][gender][bodyLocation]["chance"] = -1 -- trait specific clothes will never be worn
                   else
                      table.insert(TraitClothingSelectionDefinitions[trait][gender][bodyLocation]["items"], "Base.Glasses_Round_Normal") -- add new glasses typ  
                   end
             end
        end
   end
end


Events.OnGameBoot.Add(modTraitClothes)
