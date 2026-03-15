-- in case sandbox mode is enabled, we define new professions here so the sandbox options choosen by the player have an effect on the
-- professions list
--
--
-- by razab


local rasMainData = require("NPCs/RasProfessionsMain")
local backUpProfs = require("OptionScreens/RasProfessionsProfStoreUtil")



local vanilla_onOptionMouseDown = SandboxOptionsScreen.onOptionMouseDown
function SandboxOptionsScreen:onOptionMouseDown(button, x, y, ...)

    vanilla_onOptionMouseDown(self, button, x, y, ...)

    if button.internal == "PLAY" then -- when player goes to next menu

        if not backUpProfs.professionData then -- back up professions 
            backUpProfs.backUp() 
        end
         
        ProfessionFactory.Reset() -- reset all professions
        backUpProfs.restore() -- restore old professions

        rasMainData.doRasProfessions() -- create new profession and overhaul vanilla professions (depending on sandbox options)
        MainScreen.instance.charCreationProfession.listboxProf:clear() -- clear profession list in prof selection menu
        MainScreen.instance.charCreationProfession:populateProfessionList(MainScreen.instance.charCreationProfession.listboxProf) -- repopulate the list
    end
end



