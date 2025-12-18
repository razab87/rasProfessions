-- here we change the display name of a few clothing items so that they are displayed in the character customisation screen; in vanilla, some items have the same display name but
-- the game doesn't allow different items with same name (only works in all-clothing-unlocked mode but not in default mode); also rename "prescription reading glasses" to 
-- "reading glasses"  (since they don't change short sightedness)
--
-- change body location for short shleeve ranger and police shirts and for crop tops (they are wrong in vanilla game or make no sense??)
--
--
-- by razab



local function renameItems()

  local item = ScriptManager.instance:getItem("Base.Trousers_SuitTEXTURE")
  if item then
      item:setDisplayName(getText("UI_rasProfessions_Trousers_SuitTEXTURE"))
  end

  item = ScriptManager.instance:getItem("Base.Shirt_FormalWhite")
  if item then
      item:setDisplayName(getText("UI_rasProfessions_Shirt_FormalWhite"))
  end

  item = ScriptManager.instance:getItem("Base.Shirt_FormalWhite_ShortSleeve")
  if item then
      item:setDisplayName(getText("UI_rasProfessions_Shirt_FormalWhite_ShortSleeve"))
  end

  item = ScriptManager.instance:getItem("Base.Tshirt_DefaultDECAL")
  if item then
     item:setDisplayName(getText("UI_rasProfessions_Tshirt_DefaultDECAL"))
  end

  item = ScriptManager.instance:getItem("Base.Bag_Schoolbag_Patches")
  if item then
     item:setDisplayName(getText("UI_rasProfessions_Bag_Schoolbag_Patches"))
  end

  item = ScriptManager.instance:getItem("Base.Tshirt_Punk")
  if item then
     item:setDisplayName(getText("UI_rasProfessions_Tshirt_Punk"))
  end

  item = ScriptManager.instance:getItem("Base.Tshirt_HipHop")
  if item then
     item:setDisplayName(getText("UI_rasProfessions_Tshirt_HipHop"))
  end

  item = ScriptManager.instance:getItem("Base.Tshirt_Metal")
  if item then
     item:setDisplayName(getText("UI_rasProfessions_Tshirt_Metal"))
  end

  item = ScriptManager.instance:getItem("Base.Tshirt_Rock2")
  if item then
     item:setDisplayName(getText("UI_rasProfessions_Tshirt_Rock2"))
  end

  item = ScriptManager.instance:getItem("Base.Tshirt_Indie")
  if item then
     item:setDisplayName(getText("UI_rasProfessions_Tshirt_Indie"))
  end

  item = ScriptManager.instance:getItem("Base.Glasses_Reading")
  if item then
     item:setDisplayName(getText("UI_rasProfessions_Reading_Glasses"))
  end

  item = ScriptManager.instance:getItem("Base.Tshirt_Profession_PoliceBlue")
  if item then
     item:setDisplayName(getText("UI_rasProfessions_Tshirt_Police_Blue"))
  end

  -- change body locations:
  item = ScriptManager.instance:getItem("Base.Tshirt_Ranger")
  if item then
     item:DoParam("BodyLocation = ShortSleeveShirt")
  end

  item = ScriptManager.instance:getItem("Base.Tshirt_PoliceBlue")
  if item then
     item:setDisplayName(getText("UI_rasProfessions_ShortSleeve_Police_Blue"))
     item:DoParam("BodyLocation = ShortSleeveShirt")
  end

  item = ScriptManager.instance:getItem("Base.Base.Tshirt_PoliceGrey")
  if item then
     item:setDisplayName(getText("UI_rasProfessions_ShortSleeve_Police_Grey"))
     item:DoParam("BodyLocation = ShortSleeveShirt")
  end

  item = ScriptManager.instance:getItem("Base.Shirt_CropTopTINT")
  if item then
     item:DoParam("BodyLocation = Tshirt")
  end

  item = ScriptManager.instance:getItem("Base.Shirt_CropTopNoArmTINT")
  if item then
     item:DoParam("BodyLocation = Tshirt")
  end

end



Events.OnGameBoot.Add(renameItems)




