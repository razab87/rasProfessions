-- we apply some corrections to the user interface in the occupation and trait screen 
--
-- by razab



local rasMainData = require("NPCs/RasProfessionsMain")


-- remove "Perk = 0" stats from the overhauled vanilla professions in the xp boost window
local vanilla_checkXPBoost = CharacterCreationProfession.checkXPBoost
function CharacterCreationProfession:checkXPBoost(...)
         
         vanilla_checkXPBoost(self, ...)     -- execute vanilla function
         
         local profession = MainScreen.instance.desc:getProfession()        
         if profession == "policeofficer" then  -- correct the ui for the professions manually; need to do this for only 5 professions
                   self.listboxXpBoost:removeItem("Nimble")
         end              
         if profession == "parkranger" then
                   self.listboxXpBoost:removeItem("Axe")
                   self.listboxXpBoost:removeItem("Carpentry")
         end          
         if profession == "repairman" then
                   self.listboxXpBoost:removeItem("Short Blunt")
         end   
         if profession == "engineer" then
                   self.listboxXpBoost:removeItem("Carpentry")
         end                   
         if profession == "mechanics" then
                   self.listboxXpBoost:removeItem("Short Blunt")
         end      
end

-- hide the "hidden" traits from the window showing the selected traits
local vanilla_onSelectProf = CharacterCreationProfession.onSelectProf
function CharacterCreationProfession:onSelectProf(item, ...)
        
         vanilla_onSelectProf(self, item, ...) -- execute vanilla function
         
         local profession = MainScreen.instance.desc:getProfession() 
         local prof = ProfessionFactory.getProfession(profession)        
         local traitList = prof:getFreeTraits()
         for j=1,traitList:size() do
             local traitName = traitList:get(j-1)
             local trait = TraitFactory.getTrait(traitName)
             local traitLabel = trait:getLabel()
             if rasMainData.hiddenTraits[traitName] then -- don't show the hidden traits 
                 self.listboxTraitSelected:removeItem(traitLabel)
             end
         end
end
         
-- after players remove a trait, we must check whether they have a free trait; in that case, we must manually delete the excluded traits from the selection menu; otherwise, the excluded traits
-- could be displayed twice; this happens if the exluded trait is excluded by a free trait AND at the same time by a selected vanilla trait
local vanilla_removeTrait = CharacterCreationProfession.removeTrait
function CharacterCreationProfession:removeTrait(...) 
        
        vanilla_removeTrait(self, ...)  -- execute vanilla code

        local profession = MainScreen.instance.desc:getProfession() 
        local prof = ProfessionFactory.getProfession(profession)        
        local traitList = prof:getFreeTraits()
        for j=1, traitList:size() do
            local traitName = traitList:get(j-1)            
                 local trait = TraitFactory.getTrait(traitName)
                 for i = 0, trait:getMutuallyExclusiveTraits():size()-1 do                    
                     local exclusiveTraitName = trait:getMutuallyExclusiveTraits():get(0)
                     local exclusiveTrait = TraitFactory.getTrait(exclusiveTraitName)
                     if exclusiveTrait:getCost() > 0 then
                         self.listboxTrait:removeItem(exclusiveTrait:getLabel())
                     else
                         self.listboxBadTrait:removeItem(exclusiveTrait:getLabel())
                     end
                 end 
        end
        CharacterCreationMain.sort(self.listboxTrait.items);
        CharacterCreationMain.invertSort(self.listboxBadTrait.items);
end





