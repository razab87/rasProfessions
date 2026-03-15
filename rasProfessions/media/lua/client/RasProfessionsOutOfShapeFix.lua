-- we manually manage the outOfShape trait if player hase choosen the Retired occupation; don't understand what the vanilla game is doing so I handle it manually  
--
--
-- by razab




local function fixIt(number)

         local player = getPlayer()
         if player:HasTrait("rasOutOfShapeProf") then
                 player:getTraits():remove("rasOutOfShapeProf")
         end

         Events.OnTick.Remove(fixIt) -- do this only on the first tick when new game starts
end



Events.OnTick.Add(fixIt)
