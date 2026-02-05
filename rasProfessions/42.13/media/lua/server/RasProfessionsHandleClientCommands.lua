-- handle the commands coming from client when in MP
--
--
-- by razab




local create = require("RasProfessionsCreatePlayer")

local Regs = RasProfessionsRegistries

local function onClientCommand(mod, command, player, args)

    if mod == "rasProfessions" then
        if command == "initPlayer" then
            sendServerCommand(player, "rasProfessions", "stopRequestingAndCreatePlayer", {}) -- this will stop the client from sending "initPlayer" commands  
        elseif command == "createPlayer" then    
            create.createPlayer(player) -- execute the create functions on server
            sendServerCommand(player, "rasProfessions", "attachWeapons", {}) -- send command back to client: attach weapons to belt/holster   
        end         
    end
end


Events.OnClientCommand.Add(onClientCommand)




