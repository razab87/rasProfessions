-- store selected starting city; also populate profession list (this is to ensure that the list is populated in accordance with the sandbox settings)
--
--
-- by razab


local rasSharedData = require("RasProfessionsSharedData")

local Regs = RasProfessionsRegistries


local vanilla_clickNext = MapSpawnSelect.clickNext
function MapSpawnSelect:clickNext(...)
       
    vanilla_clickNext(self,...) -- execute vanilla code
       
    if self.selectedRegion.name == "Muldraugh, KY" then
        rasSharedData.StartingCity = "Muldraugh"
    elseif self.selectedRegion.name == "West Point, KY" then
        rasSharedData.StartingCity = "WestPoint"
    elseif self.selectedRegion.name == "Riverside, KY" then
        rasSharedData.StartingCity = "Riverside"
    elseif self.selectedRegion.name == "Rosewood, KY" then
        rasSharedData.StartingCity = "Rosewood"
    elseif self.selectedRegion.name == "Echo Creek, KY" then
        rasSharedData.StartingCity = "EchoCreek"
    end



    -- in case sandbox settings are changed, repopulate profession list
    if MainScreen.instance.charCreationProfession and MainScreen.instance.charCreationProfession.listboxProf and rasSharedData.OldSanbox ~= SandboxVars.RasProfessions.OverhaulVanillaProfs then

        MainScreen.instance.charCreationProfession:populateProfessionList(MainScreen.instance.charCreationProfession.listboxProf) -- populate the list

        local profDef = CharacterProfessionDefinition.characterProfessionDefinitions:get(Regs.OldProfs.unemployed)
        if not SandboxVars.RasProfessions.OverhaulVanillaProfs then 
            profDef = CharacterProfessionDefinition.characterProfessionDefinitions:get(CharacterProfession.UNEMPLOYED)
        end
        MainScreen.instance.charCreationProfession:onSelectProf(profDef) -- set default profession to unemployed
        MainScreen.instance.charCreationProfession:resetTraits()
    end
end



-- when player chooses a new character in the same world after death, this map selection menu is called instead of 
-- the above one
local vanilla_Coop_clickNext = CoopMapSpawnSelect.clickNext
function CoopMapSpawnSelect:clickNext(...)

    vanilla_Coop_clickNext(self, ...) -- execute vanilla

    if self.selectedRegion.name == "Muldraugh, KY" then
        rasSharedData.StartingCity = "Muldraugh"
    elseif self.selectedRegion.name == "West Point, KY" then
        rasSharedData.StartingCity = "WestPoint"
    elseif self.selectedRegion.name == "Riverside, KY" then
        rasSharedData.StartingCity = "Riverside"
    elseif self.selectedRegion.name == "Rosewood, KY" then
        rasSharedData.StartingCity = "Rosewood"
    elseif self.selectedRegion.name == "Echo Creek, KY" then
        rasSharedData.StartingCity = "EchoCreek"
    end

    --if MainScreen.instance.charCreationProfession and MainScreen.instance.charCreationProfession.listboxProf then
    --    MainScreen.instance.charCreationProfession:populateProfessionList(MainScreen.instance.charCreationProfession.listboxProf) -- populate the list
    --end
end



