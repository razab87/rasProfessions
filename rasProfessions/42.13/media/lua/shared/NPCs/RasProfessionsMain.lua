-- define mutually exclusive traits; define correct descriptions for professions
--      
--
-- by razab



local Regs = RasProfessionsRegistries


-- define mutually exclusive traits  
local function doRasTraits()
             
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:raspacifistprof")), CharacterTrait.get(ResourceLocation.of("base:pacifist")))
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:raspacifistprof")), CharacterTrait.get(ResourceLocation.of("base:brawler")))

    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasorganizedprof")), CharacterTrait.get(ResourceLocation.of("base:organized")))
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasorganizedprof")), CharacterTrait.get(ResourceLocation.of("base:disorganized")))

    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasthickskinnedprof")), CharacterTrait.get(ResourceLocation.of("base:thickskinned")))
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasthickskinnedprof")), CharacterTrait.get(ResourceLocation.of("base:thinskinned")))
     
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasoutofshapeprof")), CharacterTrait.get(ResourceLocation.of("base:out of shape")))
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasoutofshapeprof")), CharacterTrait.get(ResourceLocation.of("base:athletic")))
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasoutofshapeprof")), CharacterTrait.get(ResourceLocation.of("base:fit")))
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasoutofshapeprof")), CharacterTrait.get(ResourceLocation.of("base:unfit")))
     
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasfastlearnerprof")), CharacterTrait.get(ResourceLocation.of("base:fastlearner")))
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasfastlearnerprof")), CharacterTrait.get(ResourceLocation.of("base:slowlearner")))

    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasinventiveprof")), CharacterTrait.get(ResourceLocation.of("base:inventive")))

    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasoutdoorsmanprof")), CharacterTrait.get(ResourceLocation.of("base:outdoorsman")))
     
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasherbalistprof")), CharacterTrait.get(ResourceLocation.of("base:herbalist")))

    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasresilientprof")), CharacterTrait.get(ResourceLocation.of("base:resilient")))
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasresilientprof")), CharacterTrait.get(ResourceLocation.of("base:pronetoillness")))

    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasfastreaderprof")), CharacterTrait.get(ResourceLocation.of("base:illiterate")))
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasfastreaderprof")), CharacterTrait.get(ResourceLocation.of("base:fastreader")))

    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasdextrousprof")), CharacterTrait.get(ResourceLocation.of("base:dextrous")))
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasdextrousprof")), CharacterTrait.get(ResourceLocation.of("base:allthumbs")))
     
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasspeeddemonprof")), CharacterTrait.get(ResourceLocation.of("base:speeddemon")))
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.get(ResourceLocation.of("rasprofs:rasspeeddemonprof")), CharacterTrait.get(ResourceLocation.of("base:sundaydriver")))
    
    -- also make vanilla pacifist and vanilla brawler mutually exclusive (cause otherwise makes no sense)      
    CharacterTraitDefinition.setMutualExclusive(CharacterTrait.PACIFIST, CharacterTrait.BRAWLER)               
end
   

function BaseGameCharacterDetails.DoTraits(...)
    vanilla_DoTraits(...) -- execute vanilla code
    doRasTraits() 
end         
Events.OnGameBoot.Add(doRasTraits)

     

-- this function generates the correct description for a profession
local function setDescription(prof)

    local profession = prof:getType()
    
    if rasSharedData.OverhauledVanillaProfessions[profession] then --only for the overhauled vanilla professions (everything else is done automatically by game and our prof definitions)

        local profString = profession:toString()
        local mod, profID
        mod, profID = profString:match("^(.-:)(.*)$")

	    local desc = getTextOrNull("UI_profdesc_" .. profID) or ""
	    if rasSharedData.ExtraDescr[profession] then
	          if desc == "" then
	                desc = getText(rasSharedData.ExtraDescr[profession]) -- add new descriptions
	          else
	                desc = desc .. "\n" .. getText(rasSharedData.ExtraDescr[profession]) -- add new description after vanilla description
	          end
	    end

        -- add stats
	    local boost = transformIntoKahluaTable(prof:getXpBoosts()) --prof:getXPBoostMap()
	    local infoList = {}
	    for perk,level in pairs(boost) do
		    local perkName = PerkFactory.getPerkName(perk)
		    -- "+1 Cooking" etc
		    local levelStr = tostring(level:intValue())
		    if level:intValue() > 0 then -- only show perks with skill>0 in drop down menuu
		        levelStr = "+" .. levelStr
		        table.insert(infoList, { perkName = perkName, levelStr = levelStr })
            end
	    end
        table.sort(infoList, function(a,b) if a.levelStr > b.levelStr then return true; 
                                           elseif a.levelStr == b.levelStr and not string.sort(a.perkName, b.perkName) then return true; 
                                           else return false end
                                           end) 
	    for _,info in ipairs(infoList) do
            if desc ~= "" then desc = desc .. "\n" end
		    desc = desc .. info.levelStr .. " " .. info.perkName
	    end

        -- add free traits
	    local traits = prof:getGrantedTraits()
        for j=1,traits:size() do
		    local traitName = traits:get(j-1)
		    local trait = CharacterTraitDefinition.getCharacterTraitDefinition(traitName)
		    local traitLabel = trait:getLabel()		
		    if desc ~= "" then desc = desc .. "\n" end
		    desc = desc .. traitLabel
	    end
	    prof:setDescription(desc) -- command from the game's java code	
    end

    -- vanilla constructionworker still starts with hard hat in character creation when "overhaul vanilla professions" disabled, therefore
    -- add this to the vanilla profession's description
    if profession == CharacterProfession.CONSTRUCTION_WORKER then
        local desc = prof:getDescription()
        desc = getText("UI_rasProfessions_constructionworker_descr") .. "\n" .. desc
        prof:setDescription(desc)
    end 
end


-- set descriptions for each profession   
local function doRasProfessions()
    
    local profList = CharacterProfessionDefinition.getProfessions() 
    for i=1,profList:size() do 
		local prof = profList:get(i-1)
		setDescription(prof) 
    end
end 


local vanilla_DoProfessions = BaseGameCharacterDetails.DoProfessions
function BaseGameCharacterDetails.DoProfessions(...)
    vanilla_DoProfessions(...) -- execute vanilla code
    doRasProfessions()
end    
Events.OnGameBoot.Add(doRasProfessions)









