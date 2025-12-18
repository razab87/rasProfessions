-- define new some traits, change some vanilla professions and new ones
--      
--
-- by razab


--require "ISHotbar"


local rasMainData = {}  -- can be called via require(NPCs/RasProfessionsMain")

-- add profession of vanilla traits; profession traits get exchanged with the corresponding vanilla traits on new game start (i've taken that clever idea from one of FenrisWolf's mods; thx!)
local function doRasTraits()
                 
         rasMainData.traitsToSwap = { }
         rasMainData.hiddenTraits = { }
 
----------- vanilla traits for professions:                 
         TraitFactory.addTrait("rasOutdoorsmanProf", getText("UI_trait_outdoorsman"), 0, getText("UI_trait_outdoorsmandesc"), true) -- for parkranger, mail carrier
         table.insert(rasMainData.traitsToSwap, { swap = "rasOutdoorsmanProf", with = "Outdoorsman" } )
         TraitFactory.setMutualExclusive("rasOutdoorsmanProf", "Outdoorsman")
                                          
         TraitFactory.addTrait("rasFastReaderProf", getText("UI_trait_FastReader"), 0, getText("UI_trait_FastReaderDesc"), true) -- for teacher, librarian
         table.insert(rasMainData.traitsToSwap, { swap = "rasFastReaderProf", with = "FastReader" } )    
         TraitFactory.setMutualExclusive("rasFastReaderProf", "FastReader")    
         TraitFactory.setMutualExclusive("rasFastReaderProf", "SlowReader")    
         TraitFactory.setMutualExclusive("rasFastReaderProf", "Illiterate") 
                         
         TraitFactory.addTrait("rasHerbalistProf", getText("UI_trait_Herbalist"), 0, getText("UI_trait_HerbalistDesc"), true) -- for botanist, pharmacist
         table.insert(rasMainData.traitsToSwap, { swap = "rasHerbalistProf", with = "Herbalist" } )
         TraitFactory.setMutualExclusive("rasHerbalistProf", "Herbalist")  
                  
         TraitFactory.addTrait("rasResilientProf", getText("UI_trait_resilient"), 0, getText("UI_trait_resilientdesc"), true) -- for waste collector
         table.insert(rasMainData.traitsToSwap, { swap = "rasResilientProf", with = "Resilient" } )
         TraitFactory.setMutualExclusive("rasResilientProf", "Resilient") 
         TraitFactory.setMutualExclusive("rasResilientProf", "ProneToIllness");
                  
         TraitFactory.addTrait("rasFastLearnerProf", getText("UI_trait_FastLearner"), 0, getText("UI_trait_FastLearnerDesc"), true) -- for student         
         table.insert(rasMainData.traitsToSwap, { swap = "rasFastLearnerProf", with = "FastLearner" } )
         TraitFactory.setMutualExclusive("rasFastLearnerProf", "FastLearner");
         TraitFactory.setMutualExclusive("rasFastLearnerProf", "SlowLearner");
                  
         TraitFactory.addTrait("rasSpeedDemonProf", getText("UI_trait_SpeedDemon"), 0, getText("UI_trait_SpeedDemonDesc"), true) -- for delivery driver
         table.insert(rasMainData.traitsToSwap, { swap = "rasSpeedDemonProf", with = "SpeedDemon" } )
         TraitFactory.setMutualExclusive("rasSpeedDemonProf", "SpeedDemon");
         TraitFactory.setMutualExclusive("rasSpeedDemonProf", "SundayDriver");
                  
         TraitFactory.addTrait("rasPacifistProf", getText("UI_trait_Pacifist"), 0, getText("UI_trait_PacifistDesc"), true);
         table.insert(rasMainData.traitsToSwap, { swap = "rasPacifistProf", with = "Pacifist" } )
         TraitFactory.setMutualExclusive("rasPacifistProf", "Pacifist");
         TraitFactory.setMutualExclusive("rasPacifistProf", "Brawler");
                        
         TraitFactory.addTrait("rasDextrousProf", getText("UI_trait_Dexterous"), 0, getText("UI_trait_DexterousDesc"), true);
         table.insert(rasMainData.traitsToSwap, { swap = "rasDextrousProf", with = "Dextrous" } )
         TraitFactory.setMutualExclusive("rasDextrousProf", "Dextrous");
         TraitFactory.setMutualExclusive("rasDextrousProf", "AllThumbs");
                  
         TraitFactory.addTrait("rasNeedsLessSleepProf", getText("UI_trait_LessSleep"), 0, getText("UI_trait_LessSleepDesc"), true);
         table.insert(rasMainData.traitsToSwap, { swap = "rasNeedsLessSleepProf", with = "NeedsLessSleep" } )
         TraitFactory.setMutualExclusive("rasNeedsLessSleepProf", "NeedsLessSleep");
         TraitFactory.setMutualExclusive("rasNeedsLessSleepProf", "NeedsMoreSleep");
                  
         TraitFactory.addTrait("rasOrganizedProf", getText("UI_trait_Packmule"), 0, getText("UI_trait_PackmuleDesc"), true);
         table.insert(rasMainData.traitsToSwap, { swap = "rasOrganizedProf", with = "Organized" } )
         TraitFactory.setMutualExclusive("rasOrganizedProf", "Organized");
         TraitFactory.setMutualExclusive("rasOrganizedProf", "Disorganized");
                  
         TraitFactory.addTrait("rasThickSkinnedProf", getText("UI_trait_thickskinned"), 0, getText("UI_trait_thickskinneddesc"), true);
         table.insert(rasMainData.traitsToSwap, { swap = "rasThickSkinnedProf", with = "ThickSkinned" } )
         TraitFactory.setMutualExclusive("rasThickSkinnedProf", "ThickSkinned");
         TraitFactory.setMutualExclusive("rasThickSkinnedProf", "Thinskinned");


         local outOfShape = TraitFactory.addTrait("rasOutOfShapeProf", getText("UI_trait_outofshape"), 0, getText("UI_rasProfessions_rasOutOfShapeProf_descr"), true);
         --outOfShape:addXPBoost(Perks.Fitness, -2)
         table.insert(rasMainData.traitsToSwap, { swap = "rasOutOfShapeProf", with = "Out of Shape" } )
         TraitFactory.setMutualExclusive("Athletic", "rasOutOfShapeProf")
         TraitFactory.setMutualExclusive("Fit", "rasOutOfShapeProf")
         TraitFactory.setMutualExclusive("Unfit", "rasOutOfShapeProf")
         TraitFactory.setMutualExclusive("rasOutOfShapeProf", "Out of Shape")
                           

----------- hidden traits; they are not shown in interface and are used to exclude certain profession from certain traits (example: no illiterate doctors)                   
         TraitFactory.addTrait("rasNoIlliterate", getText("rasNoIlliterate"), 0, getText(""), true);
         rasMainData.hiddenTraits["rasNoIlliterate"] = true
         TraitFactory.setMutualExclusive("rasNoIlliterate", "Illiterate");
         
         TraitFactory.addTrait("rasNoPacifist", getText("rasNoPacifist"), 0, getText(""), true);
         rasMainData.hiddenTraits["rasNoPacifist"] = true
         TraitFactory.setMutualExclusive("rasNoPacifist", "Pacifist");
         
         TraitFactory.addTrait("rasNoFishing", getText("rasNoFishing"), 0, getText(""), true);
         rasMainData.hiddenTraits["rasNoFishing"] = true
         TraitFactory.setMutualExclusive("rasNoFishing", "Fishing");
         
         TraitFactory.addTrait("rasNoTailor", getText("rasNoTailor"), 0, getText(""), true);
         rasMainData.hiddenTraits["rasNoTailor"] = true
         TraitFactory.setMutualExclusive("rasNoTailor", "Tailor");
         
         TraitFactory.addTrait("rasNoGardener", getText("rasNoGardener"), 0, getText(""), true);
         rasMainData.hiddenTraits["rasNoGardener"] = true
         TraitFactory.setMutualExclusive("rasNoGardener", "Gardener");
         
         TraitFactory.addTrait("rasNoFirstAid", getText("rasNoFirstAid"), 0, getText(""), true);
         rasMainData.hiddenTraits["rasNoFirstAid"] = true
         TraitFactory.setMutualExclusive("rasNoFirstAid", "FirstAid");
                  
         rasMainData.hiddenTraits["Cook2"] = true     -- also mark the vanilla profession versions of traits as hidden (they have the same purpose as our "hidden" traits)  
         rasMainData.hiddenTraits["Mechanics2"] = true
         
         
         TraitFactory.setMutualExclusive("Pacifist", "Brawler"); -- we make vanilla pacifist and vanilla brawler mutually exclusive (cause otherwise makes no sense)                  
end

        
 




-- this function generates the correct description for a profession
local function setDescription(prof)

    -- add description text
    local profession = prof:getType()
	local desc = getTextOrNull("UI_profdesc_" .. profession) or ""
	if rasMainData["description"][profession] then
	      if desc == "" then
	            desc = rasMainData["description"][profession] -- add new descriptions
	      else
	            desc = desc .. "\n" .. rasMainData["description"][profession] -- add new description after predefined description
	      end
	end

    -- add stats
	local boost = transformIntoKahluaTable(prof:getXPBoostMap())
	local infoList = {}
	for perk,level in pairs(boost) do
		local perkName = PerkFactory.getPerkName(perk)
		-- "+1 Cooking" etc
        local skillLvl = level:intValue()
		local levelStr = tostring(skillLvl)
		if skillLvl ~= 0 then -- only show perks in drop down menu when not equal 0
		      if skillLvl > 0 then
                levelStr = "+" .. levelStr
              end
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
	local traits = prof:getFreeTraits()
	for j=1,traits:size() do
		local traitName = traits:get(j-1)
		local trait = TraitFactory.getTrait(traitName)
		local traitLabel = trait:getLabel()		
		if not rasMainData.hiddenTraits[traitName] then -- do not show hidden traits in the profession's drop down window
		   if desc ~= "" then desc = desc .. "\n" end
		       desc = desc .. traitLabel
		end
	end
	prof:setDescription(desc) -- command from the game's java code	
end



-- change vanilla professions and define new ones
local function doRasProfessions() 

    rasMainData.description = { } -- will contain some profession data
    rasMainData.inventory = { } 

------------------------------------- overhauled vanilla professions:

    local firefighter = ProfessionFactory.getProfession("fireofficer")
    firefighter:setName(getText("UI_rasProfessions_firefighter")) 
    
    local policeofficer = ProfessionFactory.getProfession("policeofficer")
    policeofficer:setCost(-6) 
    policeofficer:addXPBoost(Perks.Nimble, 0)
    policeofficer:addFreeTrait("rasNoIlliterate") -- police officers shouldn't be illiterate!; Note: hidden traits should be added after visible traits in order to avoid interface problems     
    rasMainData.inventory.policeofficer = {"Base.Bullets45", "Base.Bullets45", "Base.Bullets45", "Base.Bullets45", "Base.Bullets45", "Base.Bullets45"} -- gun gets added on game start in client/Hotbar, Attach.lua 
    rasMainData.description.policeofficer = getText("UI_rasProfessions_policeofficer_descr")        
        
    local parkranger = ProfessionFactory.getProfession("parkranger")
    parkranger:setCost(-2) 
    parkranger:addXPBoost(Perks.Woodwork, 0) 
    parkranger:addXPBoost(Perks.Axe, 0)
    parkranger:addFreeTrait("rasOutdoorsmanProf");     
     
    local constructionworker = ProfessionFactory.getProfession("constructionworker")
    constructionworker:setCost(-4) 
    rasMainData.description.constructionworker = getText("UI_rasProfessions_constructionworker_descr")
        
    local securityguard = ProfessionFactory.getProfession("securityguard")
    securityguard:setCost(-2) 
    securityguard:addXPBoost(Perks.Lightfoot, 1)
    securityguard:addXPBoost(Perks.Sprinting, 2) -- nightstick gets added in client/Hotbar, Attch.lua
    rasMainData.description.securityguard = getText("UI_rasProfessions_securityguard_descr")    
    
    rasMainData.inventory.carpenter = { "Base.Hammer", "Base.Nails", "Base.Nails" }
    rasMainData.description.carpenter = getText("UI_rasProfessions_carpenter_descr")    
        
    local chef = ProfessionFactory.getProfession("chef")
    chef:setCost(2) 
    rasMainData.inventory.chef = { "Base.KitchenKnife" }
    rasMainData.description.chef = getText("UI_rasProfessions_chef_descr")      
            
    local repairman = ProfessionFactory.getProfession("repairman")
    repairman:setName(getText("UI_rasProfessions_janitor")) 
    repairman:addXPBoost(Perks.Maintenance, 3)
    repairman:addXPBoost(Perks.Woodwork, 1)
    repairman:addXPBoost(Perks.Electricity, 1)
    repairman:addXPBoost(Perks.SmallBlunt, 0)
    rasMainData.inventory.repairman = { "Base.Screwdriver" }
    rasMainData.description.repairman = getText("UI_rasProfessions_repairman_descr")
        
    local farmer = ProfessionFactory.getProfession("farmer") 
    farmer:addFreeTrait("rasNoGardener")
    rasMainData.description.farmer = getText("UI_rasProfessions_farmer_descr")        
        
    local fisherman = ProfessionFactory.getProfession("fisherman")
    fisherman:setCost(0)
    fisherman:addFreeTrait("rasNoFishing")
    rasMainData.inventory.fisherman = { "Base.FishingRod" }
    rasMainData.description.fisherman = getText("UI_rasProfessions_fisherman_descr")

    local doctor = ProfessionFactory.getProfession("doctor")
    rasMainData.inventory.doctor = { "Base.Pills" }
    doctor:addFreeTrait("rasNoIlliterate")
    doctor:addFreeTrait("rasNoFirstAid")
    rasMainData.description.doctor = getText("UI_rasProfessions_doctor_descr")
        
    local nurse = ProfessionFactory.getProfession("nurse")
    nurse:setCost(4)
    
    -- no changes to lumberjack
   
    -- no changes to fitnessInstructor
    
    local burgerflipper = ProfessionFactory.getProfession("burgerflipper")
    burgerflipper:setCost(4)
    
    -- no changes to electrician
                
    local engineer = ProfessionFactory.getProfession("engineer")
    engineer:setCost(-6)
    engineer:addXPBoost(Perks.Mechanics, 1)
    engineer:addXPBoost(Perks.Woodwork, 0)
    engineer:addFreeTrait("rasNoIlliterate")
    engineer:getFreeRecipes():add("Generator")
    rasMainData.description.engineer = getText("UI_rasProfessions_engineer_descr")    
            
    local metalworker = ProfessionFactory.getProfession("metalworker")
    metalworker:setCost(-4)
    rasMainData.inventory.metalworker = { "Base.WeldingMask" }
    rasMainData.description.metalworker = getText("UI_rasProfessions_metalworker_descr")
        
    local mechanics = ProfessionFactory.getProfession("mechanics")
    mechanics:addXPBoost(Perks.SmallBlunt, 0)
    rasMainData.inventory.mechanics = { "Base.Wrench" }
    rasMainData.description.mechanics = getText("UI_rasProfessions_mechanics_descr")

----------------------- new professions:  

    local teacher = ProfessionFactory.addProfession("rasTeacher", getText("UI_rasProfessions_rasTeacher"), "icon_rasTeacher", 6)
    teacher:addXPBoost(Perks.Doctor, 1) 
    teacher:addFreeTrait("rasFastReaderProf")
                
    local botanist = ProfessionFactory.addProfession("rasBotanist", getText("UI_rasProfessions_rasBotanist"), "icon_rasBotanist", -4)
    botanist:addXPBoost(Perks.PlantScavenging, 2)
    botanist:addXPBoost(Perks.Farming, 2)
    botanist:addFreeTrait("rasHerbalistProf")
    botanist:addFreeTrait("rasNoIlliterate")
    botanist:getFreeRecipes():add("Make Mildew Cure")
    botanist:getFreeRecipes():add("Make Flies Cure")
    botanist:getFreeRecipes():add("Herbalist")
    rasMainData.description.rasBotanist = getText("UI_rasProfessions_rasBotanist_descr")
        
    local wastecollector = ProfessionFactory.addProfession("rasWasteCollector", getText("UI_rasProfessions_rasWasteCollector"), "icon_rasWasteCollector", 4)
    wastecollector:addXPBoost(Perks.Strength, 1)
    wastecollector:addFreeTrait("rasResilientProf")
    rasMainData.inventory.rasWasteCollector = { "Base.Garbagebag" }
    rasMainData.description.rasWasteCollector = getText("UI_rasProfessions_rasWasteCollector_descr")
       
    local student = ProfessionFactory.addProfession("rasStudent", getText("UI_rasProfessions_rasStudent"), "icon_rasStudent", 2)
    student:addXPBoost(Perks.Fitness, 1)
    student:addFreeTrait("rasFastLearnerProf")
    rasMainData.description.rasStudent = getText("UI_rasProfessions_rasStudent_descr")
        
    local deliverydriver = ProfessionFactory.addProfession("rasDeliveryDriver", getText("UI_rasProfessions_rasDeliveryDriver"), "icon_rasDeliveryDriver", 0)
    deliverydriver:addXPBoost(Perks.Fitness, 1)
    deliverydriver:addXPBoost(Perks.Sprinting, 1)
    deliverydriver:addXPBoost(Perks.Lightfoot, 1)
    deliverydriver:addXPBoost(Perks.Nimble, 1)
    deliverydriver:addFreeTrait("rasSpeedDemonProf")     
        
    local librarian = ProfessionFactory.addProfession("rasLibrarian", getText("UI_rasProfessions_rasLibrarian"), "icon_rasLibrarian", 2)
    librarian:addXPBoost(Perks.Lightfoot, 3)
    librarian:addFreeTrait("rasFastReaderProf")
            
    local priest = ProfessionFactory.addProfession("rasPriest", getText("UI_rasProfessions_rasPriest"), "icon_rasPriest", 14)
    priest:addFreeTrait("rasPacifistProf")
    priest:addFreeTrait("rasNoIlliterate")
               
    local tailor = ProfessionFactory.addProfession("rasTailor", getText("UI_rasProfessions_rasTailor"), "icon_rasTailor", -2)
    tailor:addXPBoost(Perks.Tailoring, 3)
    tailor:addXPBoost(Perks.SmallBlade, 1)
    tailor:addFreeTrait("rasDextrousProf")
    tailor:addFreeTrait("rasNoTailor")
    rasMainData.inventory.rasTailor = { "Base.Needle", "Base.Thread", "Base.Scissors" }
    rasMainData.description.rasTailor = getText("UI_rasProfessions_rasTailor_descr")
            
    local itprofessional = ProfessionFactory.addProfession("rasITProf", getText("UI_rasProfessions_rasITProf"), "icon_rasITProf", 6)
    itprofessional:addXPBoost(Perks.Electricity, 1)
    itprofessional:addFreeTrait("rasNeedsLessSleepProf")
    itprofessional:addFreeTrait("rasNoIlliterate")
    rasMainData.description.rasITProf = getText("UI_rasProfessions_rasITProf_descr")
             
    local architect = ProfessionFactory.addProfession("rasArchitect", getText("UI_rasProfessions_rasArchitect"), "icon_rasArchitect", -4)
    architect:addXPBoost(Perks.Woodwork, 2)
    architect:addXPBoost(Perks.MetalWelding, 2)
    architect:addFreeTrait("rasNoIlliterate")
    architect:getFreeRecipes():add("Make Metal Walls") 
    architect:getFreeRecipes():add("Make Metal Fences") 
    architect:getFreeRecipes():add("Make Metal Roof")
    rasMainData.description.rasArchitect = getText("UI_rasProfessions_rasArchitect_descr")
             
    local veterinarian = ProfessionFactory.addProfession("rasVeterinarian", getText("UI_rasProfessions_rasVeterinarian"), "icon_rasVeterinarian", 0)
    veterinarian:addXPBoost(Perks.Doctor, 2)
    veterinarian:addXPBoost(Perks.Trapping, 1)
    veterinarian:addXPBoost(Perks.SmallBlade, 1)
    veterinarian:addFreeTrait("rasNoIlliterate")
             
    local officeemployee = ProfessionFactory.addProfession("rasOfficeEmployee", getText("UI_rasProfessions_rasOfficeEmployee"), "icon_rasOfficeEmployee", 4)
    officeemployee:addFreeTrait("rasOrganizedProf")
    officeemployee:addFreeTrait("rasNoIlliterate")
    -- we add briefcase in CreatePlayer() below
    rasMainData.description.rasOfficeEmployee = getText("UI_rasProfessions_rasOfficeEmployee_descr")
              
    local homeless = ProfessionFactory.addProfession("rasHomeless", getText("UI_rasProfessions_rasHomeless"), "icon_rasHomeless", 0)
    homeless:addXPBoost(Perks.PlantScavenging, 1)
    homeless:addFreeTrait("rasThickSkinnedProf")
    rasMainData.inventory.rasHomeless = { "Base.WaterBottleEmpty" }  -- we add the garbage bag in CreatePlayer() below
    rasMainData.description.rasHomeless = getText("UI_rasProfessions_rasHomeless_descr")
                
    local gangmember = ProfessionFactory.addProfession("rasGangMember", getText("UI_rasProfessions_rasGangMember"), "icon_rasGangMember", -6) 
    gangmember:addXPBoost(Perks.Blunt, 2)
    gangmember:addXPBoost(Perks.SmallBlade, 2)
    gangmember:addXPBoost(Perks.Aiming, 1)
    gangmember:addFreeTrait("rasNoPacifist")
        
    local mailcarrier = ProfessionFactory.addProfession("rasMailCarrier", getText("UI_rasProfessions_rasMailCarrier"), "icon_rasMailCarrier", 4) 
    mailcarrier:addXPBoost(Perks.Fitness, 1)
    mailcarrier:addXPBoost(Perks.Sprinting, 2)
    mailcarrier:addFreeTrait("rasOutdoorsmanProf")
    rasMainData.description.rasMailCarrier = getText("UI_rasProfessions_rasMailCarrier_descr")
     
    local pharmacist = ProfessionFactory.addProfession("rasPharmacist", getText("UI_rasProfessions_rasPharmacist"), "icon_rasPharmacist", 0)
    pharmacist:addXPBoost(Perks.Doctor, 2)
    pharmacist:getFreeRecipes():add("Herbalist")
    pharmacist:addFreeTrait("rasHerbalistProf")
    pharmacist:addFreeTrait("rasNoIlliterate")
    rasMainData.inventory.rasPharmacist = { "Base.Antibiotics" }
    rasMainData.description.rasPharmacist = getText("UI_rasProfessions_rasPharmacist_descr")

    local retired = ProfessionFactory.addProfession("rasRetired", getText("UI_rasProfessions_rasRetired"), "icon_rasRetired", 16)
    retired:addXPBoost(Perks.Fitness, -2)
    retired:addFreeTrait("rasOutOfShapeProf")
 

    -- set descriptions for the professions       
    local profList = ProfessionFactory.getProfessions() 
    for i=1,profList:size() do 
		local prof = profList:get(i-1)
		 setDescription(prof) 
    end           
end  


   
-- append doRasTraits() and doRasProfessions() to their vanilla counterparts so that players are able to choose the modded professions when they rejoin an already existing 
-- world after player death
local vanilla_DoTraits = BaseGameCharacterDetails.DoTraits
function BaseGameCharacterDetails.DoTraits(...)
         vanilla_DoTraits(...) -- execute vanilla code
         doRasTraits()
end         

local vanilla_DoProfessions = BaseGameCharacterDetails.DoProfessions
function BaseGameCharacterDetails.DoProfessions(...)
         vanilla_DoProfessions(...) -- execute vanilla code
         doRasProfessions()
end    
    
    
-- also execute our new functions via lua events (this is necessary to correctly execute the functions when the mod is enabled the first time)
Events.OnGameBoot.Add(doRasTraits)
Events.OnGameBoot.Add(doRasProfessions)



return rasMainData




