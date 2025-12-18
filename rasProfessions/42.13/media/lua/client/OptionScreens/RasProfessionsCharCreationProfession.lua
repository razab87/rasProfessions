-- we apply some modifcations to the user interface in the occupation and trait screen: make sure only available professions are shown depending
-- on player's sandbox setting; make sure traits excluded for a specific profession are not shown 
--
--
-- by razab



local rasSharedData = require("RasProfessionsSharedData")

local Regs = RasProfessionsRegistries


local removedTraits = {}
local removedBadTraits = {}


-- vanilla api doesn't allow to convert CharacterTrait to CharacterTraitDefinition class, so we have to do it manually here :(
local toTraitDefinition = nil
local function toTraitDef()

    toTraitDefinition = {}

    local traits = CharacterTraitDefinition.getTraits()
    for i = 0, traits:size() - 1 do
        local trait = traits:get(i)
        toTraitDefinition[trait:getType()] = trait
    end
end



-- certain traits are not available for certain profession: remove them from the trait selection list 
local function updateTraitList(self)

    if not toTraitDefinition then
        toTraitDef()
    end

    if self.listboxTrait and self.listboxBadTrait then

        for _,trait in pairs(removedTraits) do --re-add excluded good traits
            local label = trait:getLabel()
            if not self.listboxTrait:contains(label) then
                self.listboxTrait:addItem(label, trait, trait:getDescription())
            end
        end

        for _,trait in pairs(removedBadTraits) do -- re-add excluded bad traits
            local label = trait:getLabel()
            if not self.listboxBadTrait:contains(label) then
                self.listboxBadTrait:addItem(label, trait, trait:getDescription())
            end
        end

        removedTraits = {} -- store which traits we removed
        removedBadTraits = {}

        if self.profession then   
            local prof = self.profession:getType() 
            local excludedTraitsForProf = rasSharedData.ExcludedTraits[self.profession:getType()] 
            if excludedTraitsForProf then -- remove exluded traits for current profession 
                for _,trait in pairs(excludedTraitsForProf) do
                    local traitDef = toTraitDefinition[trait]
                    local label = traitDef:getLabel()
                    if traitDef:getCost() > 0 then
                        self.listboxTrait:removeItem(label)
                        table.insert(removedTraits, traitDef)  
                    else
                        self.listboxBadTrait:removeItem(label)
                        table.insert(removedBadTraits, traitDef) 
                    end  
                    if self.listboxTraitSelected:contains(label) then
                        self.listboxTraitSelected:removeItem(label)
                        self.pointToSpend = self.pointToSpend + traitDef:getCost()
                    end
                end       
            end
        end

        CharacterCreationMain.sort(self.listboxTrait.items)
        CharacterCreationMain.invertSort(self.listboxBadTrait.items)
    end
end


-- we have to append updateTraitList() to several vanilla functions to make it work
local vanilla_populateTraitList = CharacterCreationProfession.populateTraitList
function CharacterCreationProfession:populateTraitList(list, ...)

    vanilla_populateTraitList(self, list, ...) -- execute vanilla code

    updateTraitList(self)
end


local vanilla_populateBadTraitList = CharacterCreationProfession.populateBadTraitList
function CharacterCreationProfession:populateBadTraitList(list, ...)

    vanilla_populateBadTraitList(self, list, ...) -- execute vanilla code

    updateTraitList(self)
end

local vanilla_onSelectProf = CharacterCreationProfession.onSelectProf
function CharacterCreationProfession:onSelectProf(characterProfessionDefinition, ...)

    vanilla_onSelectProf(self, characterProfessionDefinition, ...) -- execute vanilla code

    updateTraitList(self)
end




-- make sure only the correct professions are shown (always modded professions, vanilla or overhauled
-- vanilla professions depending on sandbox options)
local vanilla_populateProfessionList = CharacterCreationProfession.populateProfessionList
function CharacterCreationProfession:populateProfessionList(list, ...)

    vanilla_populateProfessionList(self, list, ...) --execute vanilla code

    list:clear()

    local excludedProfessions = rasSharedData.VanillaProfessions
    local unemployed = Regs.OldProfs.unemployed
    if not SandboxVars.RasProfessions.OverhaulVanillaProfs then
        excludedProfessions = rasSharedData.OverhauledVanillaProfessions
        unemployed = CharacterProfession.UNEMPLOYED
    end

    local professionList = CharacterProfessionDefinition.getProfessions();
    for i = 0, professionList:size() - 1 do
        local profession = professionList:get(i)
        if not excludedProfessions[profession:getType()] then
            list:addItem(profession:getUIName(), profession, profession:getDescription())
        end
    end
    list:sort(function(a,b)
        if a.item:getType() == unemployed then
            return true
        end
        if b.item:getType() == unemployed then
            return false
        end
        return not string.sort(a.text, b.text)
    end)    
end




-- when hitting "back", we store current sandbox option (used enhancing UI behavior a bit)
local vanilla_onOptionMouseDown = CharacterCreationProfession.onOptionMouseDown
function CharacterCreationProfession:onOptionMouseDown(button, x, y, ...)

    vanilla_onOptionMouseDown(self, button, x, y, ...) -- execute vanilla

    if button.internal == "BACK" then
        rasSharedData.OldSanbox = SandboxVars.RasProfessions.OverhaulVanillaProfs
    end
end











