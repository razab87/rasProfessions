-- we define some functions and data for back upping and restoring professions
--
--
-- ba razab




local rasSharedData = require("RasProfessionsSharedData")

local backUpProfs = {}



-- to make the "Overhaul vanilla professions" sandbox option work properly, we back up all vanilla professions (or professions coming from an other mods),
-- so we can restore later if player changes sanbox option to enabled->disabled->enabled etc in the same session
function backUpProfs.backUp()

    backUpProfs.professionData = { }
    local profList = ProfessionFactory.getProfessions()
    for i=1,profList:size() do 
        local prof = profList:get(i-1)
        local profType = prof:getType()
      
        if not rasSharedData.ModdedProfessions[profType] then -- only backup profession not coming from our mod
            backUpProfs.professionData[profType] = {}
            local profData = backUpProfs.professionData[profType] -- short hand
            
            profData.traits = {}
            local traits = prof:getFreeTraits()
            for j=1,traits:size() do
                table.insert(profData.traits, traits:get(j-1))    
            end
          
            profData.name = prof:getName()
            profData.icon = prof:getIconPath()
            profData.cost = prof:getCost()
            profData.descr = prof:getDescription()

            profData.perks = {}
            local perkTable = transformIntoKahluaTable(prof:getXPBoostMap())
            for p, l in pairs(perkTable) do
                table.insert(profData.perks, { perk = p, level = l})
            end

            profData.recipes = {}
            local recipes = prof:getFreeRecipes()
            for j=1,recipes:size() do
                table.insert(profData.recipes, recipes:get(j-1))
            end
        end
    end
end


-- restore professions from back-up
function backUpProfs.restore()

    for profType,_ in pairs(backUpProfs.professionData) do
        
        local profData = backUpProfs.professionData[profType] -- short hand
        local prof = ProfessionFactory.addProfession(profType, profData.name, profData.icon, profData.cost) -- add profession
        prof:setDescription(profData.descr)         

        for _,v in pairs(profData.traits) do
            prof:addFreeTrait(v)
        end         
 
        for _,v in pairs(profData.perks) do
            prof:addXPBoost(v.perk, v.level)
        end
 
        for _,v in pairs(profData.recipes) do
            prof:getFreeRecipes():add(v)
        end
    end
end



return backUpProfs




