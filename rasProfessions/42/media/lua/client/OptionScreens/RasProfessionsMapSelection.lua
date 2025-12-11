-- store selected starting city; in case sandbox is disabled, apply mod's new professions and overhaul vanilla ones
--
--
-- by razab


local rasSharedData = require("RasProfessionsSharedData")
local rasMainData = require("NPCs/RasProfessionsMain")
local backUpProfs = require("OptionScreens/RasProfessionsProfStoreUtil")


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

    if not backUpProfs.professionData then -- back up professions so user can later restore them if desired (professons may come from vanilla or from a mod)
        backUpProfs.backUp() 
    end

    ProfessionFactory.Reset() -- reset all professions (necessary in case player goes to sandbox, changes mod's settings, goes back, disables sandbox and enters again)
    backUpProfs.restore() -- restore old professions 

    rasMainData.doRasProfessions() -- create new profession and overhaul vanilla professions
    MainScreen.instance.charCreationProfession.listboxProf:clear() -- clear profession list in prof selection menu
    MainScreen.instance.charCreationProfession:populateProfessionList(MainScreen.instance.charCreationProfession.listboxProf) -- repopulate the list
end



-- when player chooses a new character in the same world after death, this map selection menu is called instead of 
-- the above one
local vanilla_Coop_clickNext = CoopMapSpawnSelect.clickNext
function CoopMapSpawnSelect:clickNext(...)

    vanilla_Coop_clickNext(self, ...)

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
end



