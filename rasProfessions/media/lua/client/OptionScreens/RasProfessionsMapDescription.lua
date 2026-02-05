-- we modify a vanilla function so that the map selection menu can display map descriptions in different languages
--
-- by razab




local vanilla_fillList = MapSpawnSelect.fillList
function MapSpawnSelect:fillList(...)
       vanilla_fillList(self,...) -- execute vanilla code
       
       -- here we add the descriptions for the maps introduced by the mod
       local regions = self:getSpawnRegions()
	if not regions then return end
	for _,v in ipairs(regions) do
		local info = getMapInfo(v.name)
		if info then
			local item = {};
			if info.title == "ra's Professions: Muldraugh, KY" then
			     self.listbox:removeItem("ra's Professions: Muldraugh, KY")
			     item.name = info.title or "NO TITLE";
			     item.region = v;
			     item.dir = v.name;
			     item.desc = getText("UI_rasProfessions_maps_muldraugh");
			     item.worldimage = info.thumb;
			     self.listbox:addItem(item.name, item);
			elseif info.title == "ra's Professions: Riverside, KY" then
			     self.listbox:removeItem("ra's Professions: Riverside, KY")
			     item.name = info.title or "NO TITLE";
			     item.region = v;
			     item.dir = v.name;
			     item.desc = getText("UI_rasProfessions_maps_riverside");
			     item.worldimage = info.thumb;
			     self.listbox:addItem(item.name, item);
			elseif info.title == "ra's Professions: Rosewood, KY" then
			     self.listbox:removeItem("ra's Professions: Rosewood, KY")
			     item.name = info.title or "NO TITLE";
			     item.region = v;
			     item.dir = v.name;
			     item.desc = getText("UI_rasProfessions_maps_rosewood");
			     item.worldimage = info.thumb;
			     self.listbox:addItem(item.name, item);
			elseif info.title == "ra's Professions: West Point, KY" then
			     self.listbox:removeItem("ra's Professions: West Point, KY")
			     item.name = info.title or "NO TITLE";
			     item.region = v;
			     item.dir = v.name;
			     item.desc = getText("UI_rasProfessions_maps_westpoint");
			     item.worldimage = info.thumb;
			     self.listbox:addItem(item.name, item);
			end
	        end
       end
       
       
       self.listbox:sort()
       self:hideOrShowSaveName()      
end





