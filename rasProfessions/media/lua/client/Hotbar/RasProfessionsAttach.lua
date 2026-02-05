-- we add starting inventory to police officer and security guard and attach them if suitable clothing is worn; happens when game starts
--
-- by razab


rasMainData = require("NPCs/RasProfessionsMain")


local function getSlotIndex(slotList, slotLocation) -- auxiliary function: returns the slot index of a given slot location
         for i,v in pairs(slotList) do
                if v.slotType == slotLocation then return i end
         end
         return nil
end



local vanilla_refresh = ISHotbar.refresh
function ISHotbar:refresh(...)

      vanilla_refresh(self, ...) -- execute vanilla code
            
      if rasMainData.ShouldAttachWeapon == true then	-- add/attach weapons to police officer and security guard when game starts
             rasMainData.ShouldAttachWeapon = false  -- do this only once when game starts
	         local profession = self.chr:getDescriptor():getProfession()

	         if profession == "policeofficer" then -- police officer starts with a loaded revolver
	               local item = InventoryItemFactory.CreateItem("Base.Revolver")
	               if item then
                          item:setCurrentAmmoCount(6)
                          self.chr:getInventory():addItem(item)
                          if self.availableSlot then
                               local holsterIndex = getSlotIndex(self.availableSlot, "HolsterRight")
                               if holsterIndex then -- if holster is worn, attach revolver to it
                                  self.chr:setAttachedItem("Holster Right", item)
                                  item:setAttachedSlot(holsterIndex)
	                              item:setAttachedSlotType("HolsterRight")
	                              item:setAttachedToModel("Holster Right")	              
	                              self:reloadIcons()
                               end
                          end
                   end                                	     
	        elseif profession == "securityguard" then -- security guard starts with a nightstick
	              local item = InventoryItemFactory.CreateItem("Base.Nightstick")
	              if item then
	                   self.chr:getInventory():addItem(item)
	                   if self.availableSlot then
	                        local beltIndex = getSlotIndex(self.availableSlot, "SmallBeltLeft")
	                        if beltIndex then -- if belt is worn, attach nightstick to it
	                            self.chr:setAttachedItem("Nightstick Left", item)
                                item:setAttachedSlot(beltIndex)
	                            item:setAttachedSlotType("SmallBeltLeft")
	                            item:setAttachedToModel("Nightstick Left")
	                            self:reloadIcons()
	                       end
	                  end
	             end
	       end	     
    end	  	
end







