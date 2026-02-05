-- define some new traits, change some vanilla professions and define the new professions
--      
--
-- by razab



local rasMainData = {}  -- can be called via require(NPCs/RasProfessionsMain")


-- add profession of vanilla traits; profession traits get exchanged with the corresponding vanilla traits on new game start (i've taken that clever idea from one of FenrisWolf's mods; thx!)
local function doRasTraits()
                  

         rasMainData.traitsToSwap = { }
         rasMainData.hiddenTraits = { }

             
----------- rename reluctant fighter to pacifist (happens in tranlate folder) 

----------- vanilla traits for professions:
                 
         TraitFactory.addTrait("rasOutdoorsmanProf", getText("UI_trait_outdoorsman"), 0, getText("UI_trait_outdoorsmandesc"), true) -- for parkranger, mail carrier
         table.insert(rasMainData.traitsToSwap, { swap = "rasOutdoorsmanProf", with = "Outdoorsman" } )
         TraitFactory.setMutualExclusive("rasOutdoorsmanProf", "Outdoorsman")
                                          
         TraitFactory.addTrait("rasFastReaderProf", getText("UI_trait_FastReader"), 0, getText("UI_trait_FastReaderDesc"), true) -- for teacher, librarian
         table.insert(rasMainData.traitsToSwap, { swap = "rasFastReaderProf", with = "FastReader" } )    
         TraitFactory.setMutualExclusive("rasFastReaderProf", "FastReader")    
         TraitFactory.setMutualExclusive("rasFastReaderProf", "SlowReader")    
         TraitFactory.setMutualExclusive("rasFastReaderProf", "Illiterate") 
                         
         TraitFactory.addTrait("rasHerbalistProf", getText("UI_trait_Herbalist"), 0, getText("UI_rasProfessions_rasHerbalist_descr"), true) -- for botanist, pharmacist
         table.insert(rasMainData.traitsToSwap, { swap = "rasHerbalistProf", with = "Herbalist" } ) -- +1 foraging is manually assigned on game start up
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
         TraitFactory.setMutualExclusive("rasNeedsLessSleepProf", "NeedsLessSleep")
         TraitFactory.setMutualExclusive("rasNeedsLessSleepProf", "NeedsMoreSleep")
                  
         TraitFactory.addTrait("rasOrganizedProf", getText("UI_trait_Packmule"), 0, getText("UI_trait_PackmuleDesc"), true);
         table.insert(rasMainData.traitsToSwap, { swap = "rasOrganizedProf", with = "Organized" } )
         TraitFactory.setMutualExclusive("rasOrganizedProf", "Organized")
         TraitFactory.setMutualExclusive("rasOrganizedProf", "Disorganized")
                  
         TraitFactory.addTrait("rasThickSkinnedProf", getText("UI_trait_thickskinned"), 0, getText("UI_trait_thickskinneddesc"), true);
         table.insert(rasMainData.traitsToSwap, { swap = "rasThickSkinnedProf", with = "ThickSkinned" } )
         TraitFactory.setMutualExclusive("rasThickSkinnedProf", "ThickSkinned")
         TraitFactory.setMutualExclusive("rasThickSkinnedProf", "ThinSkinned")

         local outOfShape = TraitFactory.addTrait("rasOutOfShapeProf", getText("UI_trait_outofshape"), 0, getText("UI_rasProfessions_rasOutOfShapeProf_descr"), true);
         outOfShape:addXPBoost(Perks.Fitness, -2)
         table.insert(rasMainData.traitsToSwap, { swap = "rasOutOfShapeProf", with = "Out of Shape" } )
         TraitFactory.setMutualExclusive("Athletic", "rasOutOfShapeProf")
         TraitFactory.setMutualExclusive("Fit", "rasOutOfShapeProf")
         TraitFactory.setMutualExclusive("Unfit", "rasOutOfShapeProf")
         TraitFactory.setMutualExclusive("rasOutOfShapeProf", "Out of Shape")

         TraitFactory.addTrait("rasInventiveProf", getText("UI_trait_Inventive"), 0, getText("UI_trait_InventiveDesc"), true)
         table.insert(rasMainData.traitsToSwap, { swap = "rasInventiveProf", with = "Inventive" } )
         TraitFactory.setMutualExclusive("rasInventiveProf", "Inventive")
                     
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
                  
         rasMainData.hiddenTraits["Cook2"] = true     -- also mark the vanilla profession versions of traits as hidden (they have the same purpose as the mod's "hidden" traits)  
         rasMainData.hiddenTraits["Mechanics2"] = true
         
         TraitFactory.addTrait("rasNoAllThumbs", getText("rasNoAllThumbs"), 0, getText(""), true)
         rasMainData.hiddenTraits["rasNoAllThumbs"] = true
         TraitFactory.setMutualExclusive("rasNoAllThumbs", "AllThumbs")
         
         TraitFactory.setMutualExclusive("Pacifist", "Brawler") -- we make vanilla pacifist and vanilla brawler mutually exclusive (cause otherwise makes no sense)
                  
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
	            desc = desc .. "\n" .. rasMainData["description"][profession] -- add new description after vanilla description
	      end
	end

    -- add stats
	local boost = transformIntoKahluaTable(prof:getXPBoostMap())
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



-- overhaul vanilla professions
local function overhaulVanillaProfessions()

    --[[if not rasMainData.description then
        rasMainData.description = { } -- will contain some profession data
    end
    if not rasMainData.inventory then
        rasMainData.inventory = { } 
    end]]--

    local firefighter = ProfessionFactory.getProfession("fireofficer")
    if firefighter then
        firefighter:setName(getText("UI_rasProfessions_firefighter")) 
    end
    
    local policeofficer = ProfessionFactory.getProfession("policeofficer")
    if policeofficer then
        policeofficer:setCost(-6) 
        policeofficer:addXPBoost(Perks.Nimble, 0)
        policeofficer:addFreeTrait("rasNoIlliterate") -- police officers shouldn't be illiterate!; Note: hidden traits should be added after visible traits in order to avoid clunky interface     
        rasMainData.inventory.policeofficer = { "Base.Bullets45" } -- gun gets added in client/Hotbar code since it gets attached to holster
        rasMainData.description.policeofficer = getText("UI_rasProfessions_policeofficer_descr")     
    end   
        
    local parkranger = ProfessionFactory.getProfession("parkranger")
    if parkranger then
        parkranger:setCost(0) 
        parkranger:addXPBoost(Perks.Woodwork, 0) 
        parkranger:addXPBoost(Perks.Axe, 0)
        parkranger:addFreeTrait("rasOutdoorsmanProf")  
    end   
     
    local constructionworker = ProfessionFactory.getProfession("constructionworker")
    if constructionworker then
        constructionworker:setCost(-4) 
        rasMainData.description.constructionworker = getText("UI_rasProfessions_constructionworker_descr")
    end            
    
    local securityguard = ProfessionFactory.getProfession("securityguard")
    if securityguard then
        securityguard:setCost(-2) 
        securityguard:addXPBoost(Perks.Lightfoot, 1)
        securityguard:addXPBoost(Perks.Sprinting, 2)
        -- nightstick gets added in client/Hotbar code since it gets attached to belt
        rasMainData.description.securityguard = getText("UI_rasProfessions_securityguard_descr") 
    end   
    
    local carpenter = ProfessionFactory.getProfession("carpenter")
    if carpenter then
        carpenter:setCost(2) 
        carpenter:addXPBoost(Perks.Masonry, 0)
        rasMainData.inventory.carpenter = {"Base.Hammer", "Base.Nails", "Base.Nails", "Base.Nails", "Base.Nails", "Base.Nails"}
        rasMainData.description.carpenter = getText("UI_rasProfessions_carpenter_descr")    
    end
    
    -- burglar   
    rasMainData.description.burglar = getText("UI_rasProfessions_burglar_descr")
 
    local chef = ProfessionFactory.getProfession("chef")
    if chef then
        chef:setCost(2) 
        rasMainData.inventory.chef = { "Base.KitchenKnife" }
        rasMainData.description.chef = getText("UI_rasProfessions_chef_descr") 
    end     
            
    local repairman = ProfessionFactory.getProfession("repairman")
    if repairman then
        repairman:setCost(-2)
        repairman:setName(getText("UI_rasProfessions_janitor")) 
        repairman:addXPBoost(Perks.Maintenance, 3)
        repairman:addXPBoost(Perks.Electricity, 1)
        repairman:addXPBoost(Perks.SmallBlunt, 0)
        repairman:addXPBoost(Perks.Carving, 0)
        repairman:addXPBoost(Perks.Masonry, 0)
        rasMainData.inventory.repairman = { "Base.Screwdriver" }
        rasMainData.description.repairman = getText("UI_rasProfessions_repairman_descr")
    end
        
    local farmer = ProfessionFactory.getProfession("farmer") 
    if farmer then
        farmer:addFreeTrait("rasNoGardener")
        farmer:addXPBoost(Perks.Husbandry, 1)
        rasMainData.description.farmer = getText("UI_rasProfessions_farmer_descr")
    end

    local rancher = ProfessionFactory.getProfession("rancher") 
    if rancher then
        rasMainData.description.rancher = getText("UI_rasProfessions_rancher_descr")
    end        
        
    local fisherman = ProfessionFactory.getProfession("fisherman")
    if fisherman then
        fisherman:setCost(0)
        fisherman:addFreeTrait("rasNoFishing")
        rasMainData.inventory.fisherman = { "Base.FishingRod" }
        rasMainData.description.fisherman = getText("UI_rasProfessions_fisherman_descr")
    end

    local doctor = ProfessionFactory.getProfession("doctor")
    if doctor then
        rasMainData.inventory.doctor = { "Base.Antibiotics" }
        doctor:addFreeTrait("rasNoIlliterate")
        doctor:addFreeTrait("rasNoFirstAid")
        rasMainData.description.doctor = getText("UI_rasProfessions_doctor_descr")
    end
        
    local nurse = ProfessionFactory.getProfession("nurse")
    if nurse then
        nurse:setCost(4)
    end
    
    -- no changes to lumberjack
   
    -- no changes to fitnessInstructor
    
    local burgerflipper = ProfessionFactory.getProfession("burgerflipper")
    if burgerflipper then
        burgerflipper:setCost(4)
    end
    
    -- no changes to electrician
                
    local engineer = ProfessionFactory.getProfession("engineer")
    if engineer then
        engineer:setCost(-4)
        engineer:addXPBoost(Perks.Mechanics, 1)
        engineer:addXPBoost(Perks.Woodwork, 0)
        engineer:addXPBoost(Perks.Masonry, 0)
        engineer:addFreeTrait("rasNoIlliterate")
        engineer:getFreeRecipes():add("Generator")
        rasMainData.description.engineer = getText("UI_rasProfessions_engineer_descr")  
    end  
            
    local metalworker = ProfessionFactory.getProfession("metalworker")
    if metalworker then
        metalworker:setCost(-2)
        rasMainData.inventory.metalworker = {"Base.WeldingMask"}
        rasMainData.description.metalworker = getText("UI_rasProfessions_metalworker_descr")
    end
        
    local mechanics = ProfessionFactory.getProfession("mechanics")
    if mechanics then
        rasMainData.inventory.mechanics = {"Base.Wrench"}
        rasMainData.description.mechanics = getText("UI_rasProfessions_mechanics_descr")
    end

    local tailor = ProfessionFactory.getProfession("tailorProfession")
    if tailor then
        tailor:setCost(-4)
        tailor:addXPBoost(Perks.Tailoring, 3)
        tailor:addXPBoost(Perks.SmallBlade, 1)
        tailor:addFreeTrait("rasDextrousProf")
        tailor:addFreeTrait("rasNoTailor")
        tailor:getFreeRecipes():add("KnitBalaclavaFace")
        tailor:getFreeRecipes():add("KnitBalaclavaFull")
        tailor:getFreeRecipes():add("KnitBeany")
        tailor:getFreeRecipes():add("KnitDoily")
        tailor:getFreeRecipes():add("KnitLegwarmers")
        tailor:getFreeRecipes():add("KnitScarf")
        tailor:getFreeRecipes():add("KnitSocks")
        tailor:getFreeRecipes():add("KnitSweaterVest")
        tailor:getFreeRecipes():add("KnitWoolyHat")
        tailor:getFreeRecipes():add("SewCrudeLeatherBackpack")
        tailor:getFreeRecipes():add("SewHideBoots")
        tailor:getFreeRecipes():add("SewHidePants")
        tailor:getFreeRecipes():add("SewHideSleepingBag")
        tailor:getFreeRecipes():add("SewHideCoat")
        tailor:getFreeRecipes():add("SewHideHoodie")
        tailor:getFreeRecipes():add("SewHideJacket")
        tailor:getFreeRecipes():add("SewHideRobe")
        tailor:getFreeRecipes():add("SewHideHat")
        tailor:getFreeRecipes():add("MakeTarpChestRig")
        tailor:getFreeRecipes():add("AssembleSmallFramepack")
        tailor:getFreeRecipes():add("AssembleLargeFramepack")
        tailor:getFreeRecipes():add("MakeGarbageBagTankTop")
        tailor:getFreeRecipes():add("MakeTarpTankTop")
        tailor:getFreeRecipes():add("MakeGarbageBagDress")
        tailor:getFreeRecipes():add("MakeTarpDress")
        tailor:getFreeRecipes():add("WeaveTwineShoes")
        rasMainData.inventory.tailorProfession = { "Base.Needle", "Base.Thread", "Base.Scissors" }
        rasMainData.description.tailorProfession = getText("UI_rasProfessions_rasTailor_descr")
    end

    -- set descriptions for the professions       
    local profList = ProfessionFactory.getProfessions() 
    for i=1,profList:size() do 
		local prof = profList:get(i-1)
		setDescription(prof) 
    end 
end

-- create the modded professions
local function createModdedProfessions()

    if not rasMainData.description then
        rasMainData.description = { } -- have to init the tables in case function is loaded OnGameBoot
    end
    if not rasMainData.inventory then
        rasMainData.inventory = { } 
    end

    local teacher = ProfessionFactory.addProfession("rasTeacher", getText("UI_rasProfessions_rasTeacher"), "icon_rasTeacher", 6)
    teacher:addXPBoost(Perks.Doctor, 1) 
    teacher:addFreeTrait("rasFastReaderProf")
                
    local botanist = ProfessionFactory.addProfession("rasBotanist", getText("UI_rasProfessions_rasBotanist"), "icon_rasBotanist", -2)
    botanist:addXPBoost(Perks.PlantScavenging, 2)
    botanist:addXPBoost(Perks.Farming, 2)
    botanist:addFreeTrait("rasHerbalistProf")
    botanist:addFreeTrait("rasNoIlliterate")
    botanist:getFreeRecipes():add("Herbalist")
    rasMainData.description.rasBotanist = getText("UI_rasProfessions_rasBotanist_descr")
    -- a lot of recipes:
    botanist:getFreeRecipes():add("Make Mildew Cure") -- cures
    botanist:getFreeRecipes():add("MakeFliesCureFromCigarettes")
    botanist:getFreeRecipes():add("MakeFliesCureFromLooseTobacco")
    botanist:getFreeRecipes():add("MakeFliesCureFromChewingTobacco")
    botanist:getFreeRecipes():add("MakeAphidsCure")

    botanist:getFreeRecipes():add("MakePlantainPoultice")
    botanist:getFreeRecipes():add("MakeComfreyPoultice")
    botanist:getFreeRecipes():add("MakeWildGarlicPoultice")

    botanist:getFreeRecipes():add("Black Sage Growing Season")
    botanist:getFreeRecipes():add("Broadleaf Plantain Growing Season")
    botanist:getFreeRecipes():add("Comfrey Growing Season")
    botanist:getFreeRecipes():add("Common Mallow Growing Season")
    botanist:getFreeRecipes():add("Wild Garlic Growing Season")
    botanist:getFreeRecipes():add("Lemongrass Growing Season") 

    botanist:getFreeRecipes():add("Carrot Growing Season");
    botanist:getFreeRecipes():add("Broccoli Growing Season");
    botanist:getFreeRecipes():add("Radish Growing Season");
    botanist:getFreeRecipes():add("Strawberry Growing Season");
    botanist:getFreeRecipes():add("Tomato Growing Season");
    botanist:getFreeRecipes():add("Potato Growing Season");
    botanist:getFreeRecipes():add("Cabbage Growing Season");

    botanist:getFreeRecipes():add("Corn Growing Season");
    botanist:getFreeRecipes():add("Kale Growing Season");
    botanist:getFreeRecipes():add("Sweet Potato Growing Season");
    botanist:getFreeRecipes():add("Green Pea Growing Season");
    botanist:getFreeRecipes():add("Onion Growing Season");
    botanist:getFreeRecipes():add("Garlic Growing Season");
    botanist:getFreeRecipes():add("Soybean Growing Season");
    botanist:getFreeRecipes():add("Wheat Growing Season");

    botanist:getFreeRecipes():add("Basil Growing Season");
    botanist:getFreeRecipes():add("Chives Growing Season");
    botanist:getFreeRecipes():add("Cilantro Growing Season");
    botanist:getFreeRecipes():add("Oregano Growing Season");
    botanist:getFreeRecipes():add("Parsley Growing Season");
    botanist:getFreeRecipes():add("Sage Growing Season");
    botanist:getFreeRecipes():add("Rosemary Growing Season");
    botanist:getFreeRecipes():add("Thyme Growing Season");

    botanist:getFreeRecipes():add("Hemp Growing Season")
    botanist:getFreeRecipes():add("Barley Growing Season");
    botanist:getFreeRecipes():add("Flax Growing Season");
    botanist:getFreeRecipes():add("Hops Growing Season");
    botanist:getFreeRecipes():add("Rye Growing Season");
    botanist:getFreeRecipes():add("Sugar Beet Growing Season");
    botanist:getFreeRecipes():add("Tobacco Growing Season");

    botanist:getFreeRecipes():add("Bell Pepper Growing Season");
    botanist:getFreeRecipes():add("Cauliflower Growing Season");
    botanist:getFreeRecipes():add("Cucumber Growing Season");
    botanist:getFreeRecipes():add("Habanero Growing Season");
    botanist:getFreeRecipes():add("Jalapeno Growing Season");
    botanist:getFreeRecipes():add("Leek Growing Season");
    botanist:getFreeRecipes():add("Lettuce Growing Season");
    botanist:getFreeRecipes():add("Pumpkin Growing Season");
    botanist:getFreeRecipes():add("Spinach Growing Season");
    botanist:getFreeRecipes():add("Sunflower Growing Season");
    botanist:getFreeRecipes():add("Turnip Growing Season");
    botanist:getFreeRecipes():add("Watermelon Growing Season");
    botanist:getFreeRecipes():add("Zucchini Growing Season");

    botanist:getFreeRecipes():add("Chamomile Growing Season");    
    botanist:getFreeRecipes():add("Marigold Growing Season");
    botanist:getFreeRecipes():add("Mint Growing Season");
  
    botanist:getFreeRecipes():add("Rose Growing Season")
    botanist:getFreeRecipes():add("Poppy Growing Season")
    botanist:getFreeRecipes():add("Lavender Growing Season")
    
        
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
    rasMainData.inventory.rasPriest = { "BookFancy_Bible" }
    rasMainData.description.rasPriest = getText("UI_rasProfessions_rasPriest_descr")
                           
    local itprofessional = ProfessionFactory.addProfession("rasITProf", getText("UI_rasProfessions_rasITProf"), "icon_rasITProf", 6)
    itprofessional:addXPBoost(Perks.Electricity, 1)
    itprofessional:addFreeTrait("rasInventiveProf")
    itprofessional:addFreeTrait("rasNoIlliterate")
    itprofessional:getFreeRecipes():add("MakeRemoteControllerV1");
    itprofessional:getFreeRecipes():add("MakeRemoteControllerV2");
    itprofessional:getFreeRecipes():add("MakeRemoteControllerV3");
    itprofessional:getFreeRecipes():add("MakeRemoteTrigger");
    itprofessional:getFreeRecipes():add("MakeTimer");
    itprofessional:getFreeRecipes():add("CraftMakeshiftRadio");
    itprofessional:getFreeRecipes():add("CraftMakeshiftHAMRadio");
    itprofessional:getFreeRecipes():add("CraftMakeshiftWalkieTalkie");
    rasMainData.description.rasITProf = getText("UI_rasProfessions_rasITProf_descr")
             
    local architect = ProfessionFactory.addProfession("rasArchitect", getText("UI_rasProfessions_rasArchitect"), "icon_rasArchitect", -4)
    architect:addXPBoost(Perks.Woodwork, 2)
    architect:addXPBoost(Perks.MetalWelding, 1)
    architect:addXPBoost(Perks.Masonry, 1)
    architect:addFreeTrait("rasNoIlliterate")
    architect:getFreeRecipes():add("Make Metal Walls") 
    architect:getFreeRecipes():add("Make Metal Fences") 
    architect:getFreeRecipes():add("Make Metal Roof")
    rasMainData.description.rasArchitect = getText("UI_rasProfessions_rasArchitect_descr")
             
    local veterinarian = ProfessionFactory.addProfession("rasVeterinarian", getText("UI_rasProfessions_rasVeterinarian"), "icon_rasVeterinarian", -2)
    veterinarian:addXPBoost(Perks.Doctor, 2)
    veterinarian:addXPBoost(Perks.Husbandry, 2)
    veterinarian:addXPBoost(Perks.Butchering, 1)
    veterinarian:addXPBoost(Perks.Trapping, 1)
    veterinarian:addXPBoost(Perks.SmallBlade, 1)
    veterinarian:addFreeTrait("rasNoIlliterate")
             
    local officeemployee = ProfessionFactory.addProfession("rasOfficeEmployee", getText("UI_rasProfessions_rasOfficeEmployee"), "icon_rasOfficeEmployee", 6)
    officeemployee:addFreeTrait("rasOrganizedProf")
    officeemployee:addFreeTrait("rasNoIlliterate")
    -- add briefcase in shared/createPlayer() since it gets equipped in hand
    rasMainData.description.rasOfficeEmployee = getText("UI_rasProfessions_rasOfficeEmployee_descr")

      
    local artist = ProfessionFactory.addProfession("rasArtist", getText("UI_rasProfessions_rasArtist"), "icon_rasArtist", 4)
    artist:addFreeTrait("rasNoAllThumbs")
    artist:addXPBoost(Perks.Glassmaking, 2)
	artist:addXPBoost(Perks.Pottery, 2)
    --artist:addXPBoost(Perks.Masonry, 2)
    artist:addXPBoost(Perks.Carving, 2)
    rasMainData.description.rasArtist = getText("UI_rasProfessions_rasArtist_descr") 
    artist:getFreeRecipes():add("MakeGlassJar")
    artist:getFreeRecipes():add("MakeGlassBottle")
    artist:getFreeRecipes():add("MakeDrinkingGlass")
    artist:getFreeRecipes():add("MakeWineGlass")
    artist:getFreeRecipes():add("MakeGlassPanel")
    artist:getFreeRecipes():add("MakeLanternGlass")
    artist:getFreeRecipes():add("CarveKnittingNeedles")
    artist:getFreeRecipes():add("CarveWoodenFork") 
    artist:getFreeRecipes():add("CarveWoodenSpade")
    artist:getFreeRecipes():add("CarveGoblets") 
    artist:getFreeRecipes():add("CarveBucket")
    artist:getFreeRecipes():add("CarveBat")
    artist:getFreeRecipes():add("CarveShortBat")


    local homeless = ProfessionFactory.addProfession("rasHomeless", getText("UI_rasProfessions_rasHomeless"), "icon_rasHomeless", 0)
    homeless:addXPBoost(Perks.PlantScavenging, 1)
    homeless:addFreeTrait("rasThickSkinnedProf")
    rasMainData.inventory.rasHomeless = { "Base.WaterBottleEmpty" }  -- add briefcase in shared/createPlayer() since it gets equipped in hand
    rasMainData.description.rasHomeless = getText("UI_rasProfessions_rasHomeless_descr")
                
    local gangmember = ProfessionFactory.addProfession("rasGangMember", getText("UI_rasProfessions_rasGangMember"), "icon_rasGangMember", -6) 
    gangmember:addXPBoost(Perks.Blunt, 2)
    gangmember:addXPBoost(Perks.SmallBlade, 2)
    gangmember:addXPBoost(Perks.Aiming, 1)
    gangmember:getFreeRecipes():add("MakeGlassShiv")
    gangmember:getFreeRecipes():add("MakeShiv")
    gangmember:getFreeRecipes():add("MakeToothbrushShiv")
    gangmember:getFreeRecipes():add("Hemp Growing Season")
    gangmember:addFreeTrait("rasNoPacifist")
    rasMainData.inventory.rasGangMember = { "Base.KnifeButterfly" }
    rasMainData.description.rasGangMember = getText("UI_rasProfessions_rasGangMember_descr")
        
    local mailcarrier = ProfessionFactory.addProfession("rasMailCarrier", getText("UI_rasProfessions_rasMailCarrier"), "icon_rasMailCarrier", 2) 
    mailcarrier:addXPBoost(Perks.Fitness, 1)
    mailcarrier:addXPBoost(Perks.Sprinting, 2)
    mailcarrier:addFreeTrait("rasOutdoorsmanProf")
    rasMainData.description.rasMailCarrier = getText("UI_rasProfessions_rasMailCarrier_descr")
     
    local pharmacist = ProfessionFactory.addProfession("rasPharmacist", getText("UI_rasProfessions_rasPharmacist"), "icon_rasPharmacist", 2)
    pharmacist:addXPBoost(Perks.Doctor, 2)
    pharmacist:addXPBoost(Perks.PlantScavenging, 1)    
    pharmacist:addFreeTrait("rasHerbalistProf")
    pharmacist:addFreeTrait("rasNoIlliterate")
    pharmacist:getFreeRecipes():add("Herbalist")  
    pharmacist:getFreeRecipes():add("MakePlantainPoultice")
    pharmacist:getFreeRecipes():add("MakeComfreyPoultice")
    pharmacist:getFreeRecipes():add("MakeWildGarlicPoultice")
    pharmacist:getFreeRecipes():add("Black Sage Growing Season")
    pharmacist:getFreeRecipes():add("Broadleaf Plantain Growing Season")
    pharmacist:getFreeRecipes():add("Comfrey Growing Season")
    pharmacist:getFreeRecipes():add("Common Mallow Growing Season")
    pharmacist:getFreeRecipes():add("Wild Garlic Growing Season")
    pharmacist:getFreeRecipes():add("Lemongrass Growing Season") 
    rasMainData.inventory.rasPharmacist = { "Base.Pills" }
    rasMainData.description.rasPharmacist = getText("UI_rasProfessions_rasPharmacist_descr")

    local retired = ProfessionFactory.addProfession("rasRetired", getText("UI_rasProfessions_rasRetired"), "icon_rasRetired", 16)
    retired:addFreeTrait("rasOutOfShapeProf")
    rasMainData.description.rasRetired = getText("UI_rasProfessions_rasRetired_descr")

    -- set descriptions for the professions       
    local profList = ProfessionFactory.getProfessions() 
    for i=1,profList:size() do 
		local prof = profList:get(i-1)
		setDescription(prof) 
    end     
end




-- change vanilla professions and create new ones
function rasMainData.doRasProfessions() 

    rasMainData.description = { }
    rasMainData.inventory = { } 

    if SandboxVars.RasProfessions.OverhaulVanillaProfs then
        overhaulVanillaProfessions()
    end
    createModdedProfessions()              
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
         rasMainData.doRasProfessions()
end    
    
    
-- execute new functions via lua events (this is necessary to correctly execute the functions when the mod is enabled the first time)
Events.OnGameBoot.Add(doRasTraits)
Events.OnGameBoot.Add(createModdedProfessions)

return rasMainData




