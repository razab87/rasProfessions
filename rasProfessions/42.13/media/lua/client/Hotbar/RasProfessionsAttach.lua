-- add starting inventory to police officer and security guard and attach them if suitable clothing is worn; happens when game starts
--
-- by razab


local rasSharedData = require("RasProfessionsSharedData")


local Regs = RasProfessionsRegistries


local function getSlotIndex(slotList, slotLocation) -- auxiliary function: returns the slot index of a given slot location
    for i,v in pairs(slotList) do
        if v.slotType == slotLocation then 
            return i 
        end
    end
    return nil
end


local equipTool = {}


function equipTool.attachGunToHolster(self)

    local item = self.chr:getInventory():getItemFromType("Base.Revolver")
    if item then
        if self.availableSlot then
            local holsterIndex = getSlotIndex(self.availableSlot, "HolsterRight")
            if holsterIndex then -- if holster is worn, attach revolver to it
                self.chr:setAttachedItem("Holster Right", item)
                item:setAttachedSlot(holsterIndex)
                item:setAttachedSlotType("HolsterRight")
                item:setAttachedToModel("Holster Right")	              
                self:reloadIcons()

                syncItemFields(self.chr, item)
            end
        end
    end 
end


function equipTool.attachNightstickToBelt(self)

    local item = self.chr:getInventory():getItemFromType("Base.Nightstick")
    if item then
        if self.availableSlot then
            local beltIndex = getSlotIndex(self.availableSlot, "SmallBeltLeft")
            if beltIndex then -- if belt is worn, attach nightstick to it
                self.chr:setAttachedItem("Nightstick Left", item)
                item:setAttachedSlot(beltIndex)
                item:setAttachedSlotType("SmallBeltLeft")
                item:setAttachedToModel("Nightstick Left")
                self:reloadIcons()

                syncItemFields(self.chr, item)
            end
        end
    end
end


local vanilla_refresh = ISHotbar.refresh
function ISHotbar:refresh(...)

    vanilla_refresh(self, ...) -- execute vanilla code
       
    if SandboxVars.RasProfessions.OverhaulVanillaProfs then
        if not isClient() then -- only in singleplayer; in MP, we trigger the attachment by server and do it in HandleServerCommands.lua
            if rasSharedData.ShouldAttachWeapon == true then
                rasSharedData.ShouldAttachWeapon = false  -- do this only once when game starts
                local profession = self.chr:getDescriptor():getCharacterProfession()
                if profession == Regs.OldProfs.policeofficer then -- police officer starts with a loaded revolver
                    equipTool.attachGunToHolster(self)                               	     
                elseif profession == Regs.OldProfs.securityguard then -- security guard starts with a nightstick
                    equipTool.attachNightstickToBelt(self)
                end	
            end
        else
            equipTool.hotbarInstance = self    
        end     
    end	  	
end


return equipTool




