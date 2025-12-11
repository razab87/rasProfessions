-- here we change the display name of a few clothing items so that they are displayed in the character customisation screen; in vanilla, some items have the same display name but
-- the game doesn't allow different items with same name (it mistakenly thinks they are duplicates and deletes them)
--
--
-- by razab






local function changeNames()

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

  item = ScriptManager.instance:getItem("Base.Tshirt_DefaultDECAL_TINT")
  if item then
      item:setDisplayName(getText("UI_rasProfessions_Tshirt_DefaultDECAL_TINT"))
  end

end


	

Events.OnGameBoot.Add(changeNames)




