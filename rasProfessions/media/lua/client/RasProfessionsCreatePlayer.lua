-- here we make sure the character is correctly set up when game starts (adding special equipment to inventory etc.)
--
--
-- by razab



local rasMainData = require("NPCs/RasProfessionsMain")

   
-- add profession items to player inventory
local function makeInventory(player)
         local profession = player:getDescriptor():getProfession()
         local playerInv = player:getInventory()
         if rasMainData.inventory[profession] then
             for _,value in pairs(rasMainData.inventory[profession]) do
                   local item = InventoryItemFactory.CreateItem(value)
                   playerInv:addItem(item)
             end
         end
end


-- swap the custom traits from doRasTraits with their vanilla counterparts; also remove hidden traits
local function manageTraits(player) 
        local playerTraits = player:getTraits()         
        for _,traitPair in pairs(rasMainData.traitsToSwap) do 
              if player:HasTrait(traitPair.swap) then                                      
                   if traitPair.swap ~= "rasOutOfShapeProf" then -- outOfShape trait requires special treatment in OutOfShapeFix.lua                     
                       playerTraits:remove(traitPair.swap)
                       playerTraits:add(traitPair.with)
                   end
              end
        end  
        for _,hiddenTraits in pairs(rasMainData.hiddenTraits) do
              if player:HasTrait(hiddenTrait) then
                   playerTraits:remove(hiddenTrait)  
              end
        end                       
end



-- create the player: add profession items to inventory, swap custom traits with vanilla and equip items
local function createPlayer(player, square)
         makeInventory(player) -- add rasMainData.inventory items
         manageTraits(player) -- swap traits
         
         -- some professions get special treatment regarding their starting equipment
         local profession = player:getDescriptor():getProfession()
                  
         if profession == "policeofficer" or profession == "securityguard" then  -- they should start with their weapons attached; is done in client/Hotbar/RasProfessionsAttach.lua
                rasMainData.ShouldAttachWeapon = true                
         elseif profession == "rasStudent" then -- put some random items in student's backpack
               local backpack = player:getWornItem("Back")
               if backpack then 
                   if backpack:getFullType() == "Base.Bag_Schoolbag" then -- only if backpack is worn      
                         local junk = { }
                         junk[0] = "Base.Book"
                         junk[1] = "Base.Eraser"  
                         junk[2] = "Base.Pencil"
                         junk[3] = "Base.Paperclip"
                         junk[4] = "Base.Magazine"
                         junk[5] = "Base.Apple"
                         junk[6] = "Radio.CDplayer"
                         junk[7] = "Base.Disc_Retail"
                         junk[8] = "Base.Earbuds"
                  
                         local size = 9
                         local e = 2 + ZombRand(4) -- add between two and five random items
                         for i=1,e do
                             local index = ZombRand(size)
                             local item = InventoryItemFactory.CreateItem(junk[index])
                             backpack:getInventory():addItem(item)
                             if index ~= size - 1 then
                                 junk[index] = junk[size - 1]  -- write last item to current index so we can just remove the last entry of the table and have no issues with indices
                             end
                             table.remove(junk, size - 1)
                             size = size - 1
                        end
                   end                  
              end       
                
         elseif profession == "rasHomeless" then -- homeless starts with garbage bag equipped and low condition clothing
                local garbagebag = InventoryItemFactory.CreateItem("Base.Garbagebag") 
                
                local twine = InventoryItemFactory.CreateItem("Base.Twine")  -- random junk to be added to garbagebag
                local sneakers = InventoryItemFactory.CreateItem("Base.Shoes_TrainerTINT") 
                sneakers:setCondition(ZombRand(3) + 1 )
                sneakers:setDirtyness(ZombRand(30))
                local socks = InventoryItemFactory.CreateItem("Base.Socks_Ankle")
                socks:setCondition(5 + ZombRand(5))
                socks:setDirtyness(70 + ZombRand(31))
                local matches = InventoryItemFactory.CreateItem("Base.Matches")
                local toiletpaper = InventoryItemFactory.CreateItem("Base.ToiletPaper")
                local newspaper =  InventoryItemFactory.CreateItem("Base.Newspaper")
                local toothbrush = InventoryItemFactory.CreateItem("Base.Toothbrush")
                local apple = InventoryItemFactory.CreateItem("Base.Apple")
                apple:setAge(5.5)
                
                local junk = { } 
                junk[0] = twine
                junk[1] = sneakers
                junk[2] = socks
                junk[3] = matches
                junk[4] = toiletpaper
                junk[5] = newspaper
                junk[6] = toothbrush
                junk[7] = apple
                
                local size = 8 
                local e = 2 + ZombRand(3) -- add between two and four  junk items
                for i=1,e do
                    local index = ZombRand(size)
                    garbagebag:getInventory():addItem(junk[index])
                    if index ~= size - 1 then
                        junk[index] = junk[size - 1] 
                    end
                    table.remove(junk, size - 1)
                    size = size - 1
                end
                
                player:getInventory():addItem(garbagebag)
                player:setSecondaryHandItem(garbagebag)
                
                local allLocations = BodyLocations.getGroup("Human"):getAllLocations() -- lower condition of worn clothes and make them dirty
                for i=0, allLocations:size()-1 do
                    local bodyLocation = allLocations:get(i):getId()
                    local item = player:getWornItem(bodyLocation)
                    if item then
                       local n = item:getCondition()
                       item:setCondition(n - math.floor(n/2) + ZombRand(math.floor(n/2) + 1) )
                       item:setDirtyness(ZombRand(30))
                    end
                end
                
         elseif profession == "rasOfficeEmployee" then -- office employee starts with briefcase equipped
                local briefcase = InventoryItemFactory.CreateItem("Base.Briefcase") 
                
                local junk = { } -- add some random junk to the briefcase
                junk[0] = "Base.Notebook"
                junk[1] = "Base.Pen"
                junk[2] = "Base.Newspaper"
                junk[3] = "Base.Wallet4"
                junk[4] = "Base.Money"
                junk[5] = "Base.PaperclipBox"
                junk[6] = "Base.Cube"
                junk[7] = "Base.CheeseSandwich"
               
                local size = 8
                local e = 2 + ZombRand(3) -- add between two and four random items
                for i=1,e do
                    local index = ZombRand(size)
                    local item = InventoryItemFactory.CreateItem(junk[index])
                    briefcase:getInventory():addItem(item)
                    if index ~= size - 1 then
                        junk[index] = junk[size - 1]
                    end
                    table.remove(junk, size - 1)
                    size = size - 1
                end
                
                player:getInventory():addItem(briefcase) -- put briefcase to rasMainData.inventory
                player:setSecondaryHandItem(briefcase) -- equip briefcase
                
         elseif profession == "rasMailCarrier" then -- put some random junk in mail carrier's satchel
               local satchel = player:getWornItem("Back")
               if satchel then
                   if satchel:getFullType() == "Base.Bag_Satchel" then -- only if satchel is worn      
                         local junk = { }
                         junk[0] = "Base.SheetPaper2"
                         junk[1] = "Base.SheetPaper2"
                         junk[2] = "Base.Pen"
                         junk[3] = "Base.Paperclip"
                         junk[4] = "Base.Paperclip"
                         junk[5] = "Base.Magazine"
                         junk[6] = "Base.FishingMag2"
                  
                         local size = 7
                         local e = 2 + ZombRand(2) -- add two or three random items
                         for i=1,e do
                             local index = ZombRand(size)
                             local item = InventoryItemFactory.CreateItem(junk[index])
                             satchel:getInventory():addItem(item)
                             if index ~= size - 1 then
                                 junk[index] = junk[size - 1]
                             end
                             table.remove(junk, size - 1)
                             size = size - 1
                        end
                   end                  
              end 
       end                 
end



Events.OnNewGame.Add(createPlayer)




