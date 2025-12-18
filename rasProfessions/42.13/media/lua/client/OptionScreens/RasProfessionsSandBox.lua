-- in case sandbox mode is enabled, we repopulate ui professionlist so that sandbox options choosen by the player have an effect
--
--
-- by razab


local rasSharedData = require("RasProfessionsSharedData")

local Regs = RasProfessionsRegistries




local vanilla_onOptionMouseDown = SandboxOptionsScreen.onOptionMouseDown
function SandboxOptionsScreen:onOptionMouseDown(button, x, y, ...)

    local oldValue = SandboxVars.RasProfessions.OverhaulVanillaProfs

    vanilla_onOptionMouseDown(self, button, x, y, ...)

    if button.internal == "PLAY" then -- when player goes to next menu
        
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
end



