-- here we make sure the character is correctly set up when game starts (adding special equipment to inventory etc.)
--
--
-- by razab




local rasSharedData = require("RasProfessionsSharedData")

local Regs = RasProfessionsRegistries

   
-- add profession items to player inventory
local function makeInventory(player)
         local profession = player:getDescriptor():getCharacterProfession()
         local playerInv = player:getInventory()

         local number = 1
         if profession == Regs.OldProfs.policeofficer then
             number = 12 -- 12 bullets for police officer
         end
         if rasSharedData.Equipment[profession] then
             for _,value in pairs(rasSharedData.Equipment[profession]) do
                   for i=0,number-1 do
                      local item = instanceItem(value)
                      playerInv:addItem(item)
                   end
             end
         end        
end


-- swap the custom traits from doRasTraits with their vanilla counterparts; also remove hidden traits
local function manageTraits(player)         
       local playerTraits = player:getCharacterTraits() 
       for _,traitPair in pairs(rasSharedData.TraitsToSwap) do 
              if player:hasTrait(traitPair.swap) then                                      
                   if traitPair.swap ~= Regs.Traits.OutOfShape then -- outOfShape trait requires special treatment in FirstTicks.lua                                            
                       playerTraits:remove(traitPair.swap)
                       playerTraits:add(traitPair.with)
                   end
              end
        end                        
end



-- create the player: add profession items to inventory, swap custom traits with vanilla and equip items
local function createPlayer(player, square)
         
         makeInventory(player) -- add items to player inventory
         manageTraits(player)  -- swap traits
         
         -- some professions get special treatment regarding their starting equipment 
         local profession = player:getDescriptor():getCharacterProfession()                
         if profession == Regs.OldProfs.policeofficer or profession == Regs.OldProfs.securityguard then  -- they should start with their weapons attached; is done in client/Hotbar/RasProfessionsAttach.lua
                rasSharedData.ShouldAttachWeapon = true                
         elseif profession == Regs.NewProfs.rasStudent then -- put some random items in student's backpack
               local backpack = player:getWornItem(ItemBodyLocation.BACK)
               if backpack then 
                   local backpackType = backpack:getFullType()
                   if backpackType == "Base.Bag_Schoolbag" or backpackType == "Base.Bag_Satchel" or backpackType == "Base.Bag_Satchel_Leather" 
                      or backpackType == "Base.Bag_Schoolbag_Patches" then -- only if correct backpack is worn      
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
                             local item = instanceItem(junk[index])
                             backpack:getInventory():addItem(item)
                             if index ~= size - 1 then
                                 junk[index] = junk[size - 1]  -- write last item to current index so we can just remove the last entry of the table and have no issues with indices
                             end
                             table.remove(junk, size - 1)
                             size = size - 1
                        end
                   end                  
              end       
                
         elseif profession == Regs.NewProfs.rasHomeless then -- homeless starts with garbage bag equipped and low condition clothing
                local garbagebag = instanceItem("Base.Garbagebag") 
                
                local twine = instanceItem("Base.Twine")  -- random junk to be added to garbagebag
                local sneakers = instanceItem("Base.Shoes_TrainerTINT") 
                sneakers:setCondition(ZombRand(3) + 1 )
                sneakers:setDirtyness(ZombRand(30))
                local socks = instanceItem("Base.Socks_Ankle")
                socks:setCondition(5 + ZombRand(5))
                socks:setDirtyness(70 + ZombRand(31))
                local matches = instanceItem("Base.Matches")
                local toiletpaper = instanceItem("Base.ToiletPaper")
                local newspaper =  instanceItem("Base.Newspaper")
                local toothbrush = instanceItem("Base.Toothbrush")
                local apple = instanceItem("Base.Apple")
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
                
         elseif profession == Regs.NewProfs.rasOfficeEmployee then -- office employee starts with briefcase equipped
                local briefcase = instanceItem("Base.Briefcase") 
                
                local junk = { } -- add some random junk to the briefcase
                junk[0] = "Base.Notebook"
                junk[1] = "Base.Pen"
                junk[2] = "Base.Newspaper"
                junk[3] = "Base.Money"
                junk[4] = "Base.PaperclipBox"
                junk[5] = "Base.Cube"
                junk[6] = "Base.Sandwich"
               
                local size = 7
                local e = 2 + ZombRand(3) -- add between two and four random items
                for i=1,e do
                    local index = ZombRand(size)
                    local item = instanceItem(junk[index])
                    briefcase:getInventory():addItem(item)
                    if index ~= size - 1 then
                        junk[index] = junk[size - 1]
                    end
                    table.remove(junk, size - 1)
                    size = size - 1
                end
                
                player:getInventory():addItem(briefcase) -- put briefcase to inventory
                player:setSecondaryHandItem(briefcase) -- equip briefcase
                
         elseif profession == Regs.NewProfs.rasMailCarrier then -- put some random junk in mail carrier's satchel
               local satchel = player:getWornItem(ItemBodyLocation.BACK)
               if satchel then
                   local satchelType = satchel:getFullType()
                   if satchelType == "Base.Bag_Satchel" or satchelType == "Base.Bag_Satchel_Mail" then -- only if satchel is worn      
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
                             local item = instanceItem(junk[index])
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




