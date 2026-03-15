-- we manually have to setup the OutOfShape trait during the first game ticks in case player chooses the retired professions (vanilla game behave a bit strange here so we do it manually);
-- we do it here only for singleplayer, mp case is handled in CreatePlayer.lua, manageTraits()
--
--
-- by razab




local Regs = RasProfessionsRegistries


-- remove OutOfShape trait in case player has selected "retired" profession; is only called in SP; for MP, server needs it's own version to make sure we get the correct
-- player
local function fixOutOfShape(tick)

    local player = getPlayer()   
    local profession = player:getDescriptor():getCharacterProfession()
    if profession == Regs.NewProfs.rasRetired and player:hasTrait(Regs.Traits.OutOfShape) then
        player:getCharacterTraits():remove(Regs.Traits.OutOfShape)
    end
    Events.OnTick.Remove(fixOutOfShape) -- remove from events
end


-- execute everything OnNewGame
local function mainFunction(player, square)

    if (not isServer()) and (not isClient()) then -- only in SP
        Events.OnTick.Add(fixOutOfShape)
    end
end


Events.OnNewGame.Add(mainFunction)


