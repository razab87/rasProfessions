-- contains several tables used by this mod
--
--
-- by razab


--require "NPCs/RasProfessionsMain" -- we need to ensure that the professions are created before we load the tables



local rasSharedData = { } -- can be accessed via require("RasProfessionsSharedData") in other .lua files


local Regs = RasProfessionsRegistries



rasSharedData.OldSanbox = true -- the default/actual value of "overhaul vanilla professions" in the sandbox (used elsewhere to enhance ui behavior a bit)


-- list of vanilla professions
rasSharedData.VanillaProfessions = { }
rasSharedData.VanillaProfessions[CharacterProfession.BURGER_FLIPPER] = true
rasSharedData.VanillaProfessions[CharacterProfession.BURGLAR] = true
rasSharedData.VanillaProfessions[CharacterProfession.CARPENTER] = true
rasSharedData.VanillaProfessions[CharacterProfession.CHEF] = true
rasSharedData.VanillaProfessions[CharacterProfession.CONSTRUCTION_WORKER] = true
rasSharedData.VanillaProfessions[CharacterProfession.DOCTOR] = true
rasSharedData.VanillaProfessions[CharacterProfession.ELECTRICIAN] = true
rasSharedData.VanillaProfessions[CharacterProfession.ENGINEER] = true
rasSharedData.VanillaProfessions[CharacterProfession.FARMER] = true
rasSharedData.VanillaProfessions[CharacterProfession.FIRE_OFFICER] = true
rasSharedData.VanillaProfessions[CharacterProfession.FISHERMAN] = true
rasSharedData.VanillaProfessions[CharacterProfession.FITNESS_INSTRUCTOR] = true
rasSharedData.VanillaProfessions[CharacterProfession.LUMBERJACK] = true
rasSharedData.VanillaProfessions[CharacterProfession.MECHANICS] = true
rasSharedData.VanillaProfessions[CharacterProfession.METALWORKER] = true
rasSharedData.VanillaProfessions[CharacterProfession.NURSE] = true
rasSharedData.VanillaProfessions[CharacterProfession.PARK_RANGER] = true
rasSharedData.VanillaProfessions[CharacterProfession.POLICE_OFFICER] = true
rasSharedData.VanillaProfessions[CharacterProfession.RANCHER] = true
rasSharedData.VanillaProfessions[CharacterProfession.REPAIRMAN] = true
rasSharedData.VanillaProfessions[CharacterProfession.SECURITY_GUARD] = true
rasSharedData.VanillaProfessions[CharacterProfession.SMITHER] = true
rasSharedData.VanillaProfessions[CharacterProfession.TAILOR] = true
rasSharedData.VanillaProfessions[CharacterProfession.UNEMPLOYED] = true
rasSharedData.VanillaProfessions[CharacterProfession.VETERAN] = true


-- list of overhauled vanilla professions
rasSharedData.OverhauledVanillaProfessions = {}
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.unemployed] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.fireofficer] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.policeofficer] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.parkranger] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.constructionworker] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.securityguard] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.carpenter] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.burglar] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.chef] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.repairman] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.rancher] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.farmer] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.fisherman] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.doctor] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.veteran] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.nurse] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.lumberjack] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.fitnessInstructor] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.burgerflipper] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.electrician] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.engineer] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.metalworker] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.smither] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.mechanics] = true
rasSharedData.OverhauledVanillaProfessions[Regs.OldProfs.tailor] = true



-- we exclude some traits for specific professions
rasSharedData.ExcludedTraits = {}
rasSharedData.ExcludedTraits[Regs.OldProfs.policeofficer] = {CharacterTrait.ILLITERATE}
rasSharedData.ExcludedTraits[Regs.OldProfs.doctor] = {CharacterTrait.ILLITERATE, CharacterTrait.FIRST_AID}
rasSharedData.ExcludedTraits[Regs.OldProfs.engineer] = {CharacterTrait.ILLITERATE}
rasSharedData.ExcludedTraits[Regs.OldProfs.mechanics] = {CharacterTrait.MECHANICS}
rasSharedData.ExcludedTraits[Regs.OldProfs.fisherman] = {CharacterTrait.FISHING}
rasSharedData.ExcludedTraits[Regs.OldProfs.tailor] = {CharacterTrait.TAILOR}
rasSharedData.ExcludedTraits[Regs.OldProfs.farmer] = {CharacterTrait.GARDENER}

rasSharedData.ExcludedTraits[Regs.NewProfs.rasBotanist] = {CharacterTrait.ILLITERATE}
rasSharedData.ExcludedTraits[Regs.NewProfs.rasStudent] = {CharacterTrait.ILLITERATE}
rasSharedData.ExcludedTraits[Regs.NewProfs.rasPriest] = {CharacterTrait.ILLITERATE}
rasSharedData.ExcludedTraits[Regs.NewProfs.rasITProf] = {CharacterTrait.ILLITERATE}
rasSharedData.ExcludedTraits[Regs.NewProfs.rasArchitect] = {CharacterTrait.ILLITERATE}
rasSharedData.ExcludedTraits[Regs.NewProfs.rasVeterinarian] = {CharacterTrait.ILLITERATE}
rasSharedData.ExcludedTraits[Regs.NewProfs.rasOfficeEmployee] = {CharacterTrait.ILLITERATE}
rasSharedData.ExcludedTraits[Regs.NewProfs.rasPharmacist] = {CharacterTrait.ILLITERATE}
rasSharedData.ExcludedTraits[Regs.NewProfs.rasGangMember] = {CharacterTrait.PACIFIST}
rasSharedData.ExcludedTraits[Regs.NewProfs.rasArtist] = {CharacterTrait.ALL_THUMBS}



-- professions traits gets swapped with their vanilla counterpart when game starts via this table
rasSharedData.TraitsToSwap  = { {swap = Regs.Traits.Outdoorsman, with = CharacterTrait.OUTDOORSMAN}, 
                              {swap = Regs.Traits.FastReader, with = CharacterTrait.FAST_READER}, 
                              {swap = Regs.Traits.Herbalist, with = CharacterTrait.HERBALIST}, 
                              {swap = Regs.Traits.Resilient, with = CharacterTrait.RESILIENT}, 
                              {swap = Regs.Traits.FastLearner, with = CharacterTrait.FAST_LEARNER}, 
                              {swap = Regs.Traits.SpeedDemon, with = CharacterTrait.SPEED_DEMON},
                              {swap = Regs.Traits.Pacifist, with = CharacterTrait.PACIFIST},
                              {swap = Regs.Traits.Dextrous, with = CharacterTrait.DEXTROUS},
                              {swap = Regs.Traits.Organized, with = CharacterTrait.ORGANIZED},
                              {swap = Regs.Traits.ThickSkinned, with = CharacterTrait.THICK_SKINNED},
                              {swap = Regs.Traits.OutOfShape, with = CharacterTrait.OUT_OF_SHAPE},
                              {swap = Regs.Traits.Inventive, with = CharacterTrait.INVENTIVE}
                            }


-- the starting equipment the professions spawn with
rasSharedData.Equipment = {} 
rasSharedData.Equipment[Regs.OldProfs.policeofficer] = {"Base.Bullets45"} -- gun gets added in client/Hotbar code since it gets attached to holster
-- nightstick for security guard gets added in client/Hotbar code since it gets attached to belt
rasSharedData.Equipment[Regs.OldProfs.carpenter] = {"Base.Hammer", "Base.Nails", "Base.Nails", "Base.Nails", "Base.Nails", "Base.Nails"}
rasSharedData.Equipment[Regs.OldProfs.chef] = {"Base.KitchenKnife"}
rasSharedData.Equipment[Regs.OldProfs.repairman] = {"Base.Screwdriver"}
rasSharedData.Equipment[Regs.OldProfs.fisherman] = {"Base.FishingRod"}
rasSharedData.Equipment[Regs.OldProfs.doctor] = {"Base.Antibiotics"}
rasSharedData.Equipment[Regs.OldProfs.metalworker] = {"Base.WeldingMask"}
rasSharedData.Equipment[Regs.OldProfs.mechanics] = {"Base.Wrench"}
rasSharedData.Equipment[Regs.OldProfs.tailor] = {"Base.Needle", "Base.Thread", "Base.Scissors"}
rasSharedData.Equipment[Regs.NewProfs.rasWasteCollector] = {"Base.Garbagebag"}
rasSharedData.Equipment[Regs.NewProfs.rasPriest] = {"BookFancy_Bible"}
-- office worker: add briefcase in createPlayer() since it gets equipped in hand
-- homeless: add garbage bag in createPlayer() since it gets equipped in hand
rasSharedData.Equipment[Regs.NewProfs.rasHomeless] = {"Base.WaterBottleEmpty"}
rasSharedData.Equipment[Regs.NewProfs.rasGangMember] = {"Base.KnifeButterfly"}
rasSharedData.Equipment[Regs.NewProfs.rasPharmacist] = {"Base.Pills"}



-- some overhauled vanilla professions get extra descriptions so that they can be appended to the vanilla descriptions
rasSharedData.ExtraDescr = {}
rasSharedData.ExtraDescr[Regs.OldProfs.policeofficer] = "UI_rasProfessions_policeofficer_descr"
rasSharedData.ExtraDescr[Regs.OldProfs.constructionworker] = "UI_rasProfessions_constructionworker_descr"
rasSharedData.ExtraDescr[Regs.OldProfs.securityguard] = "UI_rasProfessions_securityguard_descr"
rasSharedData.ExtraDescr[Regs.OldProfs.carpenter] = "UI_rasProfessions_carpenter_descr"
rasSharedData.ExtraDescr[Regs.OldProfs.burglar] = "UI_rasProfessions_burglar_descr"
rasSharedData.ExtraDescr[Regs.OldProfs.chef] = "UI_rasProfessions_chef_descr"
rasSharedData.ExtraDescr[Regs.OldProfs.repairman] = "UI_rasProfessions_repairman_descr"
rasSharedData.ExtraDescr[Regs.OldProfs.farmer] = "UI_rasProfessions_farmer_descr"
rasSharedData.ExtraDescr[Regs.OldProfs.rancher] = "UI_rasProfessions_rancher_descr"
rasSharedData.ExtraDescr[Regs.OldProfs.fisherman] = "UI_rasProfessions_fisherman_descr"
rasSharedData.ExtraDescr[Regs.OldProfs.doctor] = "UI_rasProfessions_doctor_descr"
-- rasSharedData.ExtraDescr[Regs.OldProfs.engineer] = "UI_rasProfessions_engineer_descr" -- 42.13 knows generators by vanilla and alredy has correct description, so exclude
rasSharedData.ExtraDescr[Regs.OldProfs.metalworker] = "UI_rasProfessions_metalworker_descr"
rasSharedData.ExtraDescr[Regs.OldProfs.mechanics] = "UI_rasProfessions_mechanics_descr"
rasSharedData.ExtraDescr[Regs.OldProfs.tailor] = "UI_rasProfessions_rasTailor_descr" -- different format for compatibility with older mod versions



-- list of all new professions added by the mod
rasSharedData.ModdedProfessions = { }
rasSharedData.ModdedProfessions["rasTeacher"] = true
rasSharedData.ModdedProfessions["rasBotanist"] = true
rasSharedData.ModdedProfessions["rasWasteCollector"] = true
rasSharedData.ModdedProfessions["rasStudent"] = true
rasSharedData.ModdedProfessions["rasDeliveryDriver"] = true
rasSharedData.ModdedProfessions["rasLibrarian"] = true
rasSharedData.ModdedProfessions["rasPriest"] = true
rasSharedData.ModdedProfessions["rasITProf"] = true
rasSharedData.ModdedProfessions["rasArchitect"] = true
rasSharedData.ModdedProfessions["rasVeterinarian"] = true
rasSharedData.ModdedProfessions["rasOfficeEmployee"] = true
rasSharedData.ModdedProfessions["rasArtist"] = true
rasSharedData.ModdedProfessions["rasHomeless"] = true
rasSharedData.ModdedProfessions["rasGangMember"] = true
rasSharedData.ModdedProfessions["rasMailCarrier"] = true
rasSharedData.ModdedProfessions["rasPharmacist"] = true
rasSharedData.ModdedProfessions["rasRetired"] = true


rasSharedData.Spawns = { } -- used for defining the professions spawn points (see files in this mod's folder shared/Spawn)
rasSharedData.StartingCity = nil -- will contain the selected starting city

-- contains hair colors for younger persons; no grey-ish colors (only applied to student and gang member)
rasSharedData.YoungColors = { }
rasSharedData.YoungColors[1] = { r = 0.8313725590705872, g = 0.6705882549285889, b = 0.2705882489681244 }
rasSharedData.YoungColors[2] = { r = 0.6627451181411743, g = 0.5215686559677124, b = 0.3176470696926117 }
rasSharedData.YoungColors[3] = { r = 0.6235294342041016, g = 0.42352941632270813, b = 0.16862745583057404 }
rasSharedData.YoungColors[4] = { r = 0.6117647290229797, g = 0.5098039507865906, b = 0.33725491166114807 }
rasSharedData.YoungColors[5] = { r = 0.5960784554481506, g = 0.43921568989753723, b = 0.2980392277240753 }
rasSharedData.YoungColors[6] = { r = 0.572549045085907, g = 0.4745098054409027, b = 0.3490196168422699 }
rasSharedData.YoungColors[7] = { r = 0.43529412150382996, g = 0.34117648005485535, b = 0.23529411852359772 }
rasSharedData.YoungColors[8] = { r = 0.33725491166114807, g = 0.26274511218070984, b = 0.1764705926179886 }
rasSharedData.YoungColors[9] = { r = 0.3450980484485626, g = 0.2078431397676468, b = 0.13333334028720856 }
rasSharedData.YoungColors[10] = { r = 0.21960784494876862, g = 0.16078431904315948, b = 0.10588235408067703 }
rasSharedData.YoungColors[11] = { r = 0.10588235408067703, g = 0.09019608050584793, b = 0.08627451211214066 }
rasSharedData.YoungColors[12] = { r = 0.7450980544090271, g = 0.5215686559677124, b = 0.40392157435417175 }
rasSharedData.YoungColors[13] = { r = 0.6509804129600525, g = 0.364705890417099, b = 0.24705882370471954 }
rasSharedData.YoungColors[14] = { r = 0.5843137502670288, g = 0.250980406999588, b = 0.250980406999588 }
rasSharedData.YoungColors[15] = {	r = 0.5254902243614197, g = 0.25882354378700256, b = 0.1882352977991104 }


-- contains hair colors for older persons; only grey-ish colors (only applied to retired profession)
rasSharedData.OldColors = { }
rasSharedData.OldColors[1] = { r = 0.48627451062202454, g = 0.47058823704719543,	b = 0.43921568989753723 }
rasSharedData.OldColors[2] = { r = 0.6509804129600525, g = 0.6196078658103943, b = 0.501960813999176 }
rasSharedData.OldColors[3] = { r = 0.7372549176216125, g = 0.6941176652908325, b = 0.615686297416687 }
rasSharedData.OldColors[4] = { r = 0.6509804129600525, g = 0.6431372761726379, b = 0.6235294342041016 }


-- contains beard styles for young people (only applied to student)
rasSharedData.YoungBeards = {"", "Chin", "Chops", "BeardOnly", "PointyChin"}




-- we now generate a list of available hairstyles for each profession (those are the ones which are randomly assigned during char creation; other styles can still be chosen manually)

-- store all the vanilla hair styles (we have to ensure that AvailableHairStyles list will contain only vanilla hairs; modded hair and the "hat" variants of hair may cause bugs)
rasSharedData.VanillaHair = {

    Female = {Bald = true, Bob = true, BobCurly = true, Braids = true, Buffont = true, Bun = true, BunCurly = true, Fresh = true, CentreParting = true, Cornrows = true, 
              Demi = true, FlatTop = true, GreasedBack = true, Grungey = true, GrungeyBehindEars = true, Grungey02 = true, GrungeyParted = true, LeftParting = true, Long = true, Longcurly = true, 
              Long2 = true, Long2curly = true, LongBraids = true, CentrePartingLong = true, LongBraids02 = true,  MohawkFan = true, MohawkFlat = true, MohawkShort = true, MohawkSpike = true, 
              Kate = true, KateCurly = true, OverEye = true, OverEyeCurly = true, OverLeftEye = true, PonyTail = true, PonyTailBraids = true, Back=true, Rachel = true, RachelCurly = true, 
              RightParting = true, ShortCurly = true, Spike = true, LibertySpikes = true, TopCurls = true},

    Male = {Bald = true, Baldspot = true, Braids = true, Buffont = true, Fresh = true, CentreParting = true, Cornrows = true, CrewCut = true, Donny = true, Fabian = true, 
            FabianCurly = true, FlatTop = true, GreasedBack = true, Grungey = true, GrungeyBehindEars = true, LeftParting = true, 
            LongBraids = true, CentrePartingLong = true, LongBraids02 = true, Messy = true, MessyCurly = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true, MohawkSpike = true, Mullet = true, 
            MulletCurly = true, Picard = true, PonyTail = true, PonyTailBraids = true, Recede = true, RightParting = true, Short = true, ShortHatCurly = true, ShortAfroCurly = true, Spike = true, 
            LibertySpikes = true, Metal = true} 

}





-- contains hair styles which a profession shouldn't get randomly assigned during character creation; can still be choosen manually by player if desired
local excludedHairStyles = { }

excludedHairStyles.Male = { 

    Old = { -- vanilla and overhauled vanilla professions
        unemployed = {  },
        fireofficer = { LibertySpikes = true, MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,
                       Fabian = true, FabianCurly = true, LongBraids = true, LongBraids02 = true, Metal = true },
        policeofficer = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true, 
                         Braids = true, Fabian = true, FabianCurly = true, LongBraids = true, LongBraids02 = true, Mullet = true, MulletCurly = true, CentrePartingLong = true, Metal = true },
        parkranger = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        constructionworker = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        securityguard = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true,
                         Fabian = true, FabianCurly = true, LongBraids = true, LongBraids02 = true, Metal = true},
        carpenter = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        burglar = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        chef = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        repairman = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        farmer = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        fisherman = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        doctor = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,
                  Fabian = true, FabianCurly = true, LongBraids = true, LongBraids02 = true, Mullet = true, MulletCurly = true, Metal = true },
        veteran = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        nurse = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        lumberjack = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        fitnessinstructor = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        burgerflipper = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        electrician = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        engineer = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,
                     Fabian = true, FabianCurly = true, LongBraids = true, LongBraids02 = true, Metal = true},
        metalworker = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        mechanics = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        tailor = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true}
    },

    New = { -- new professions
        rasteacher = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,},
        rasbotanist = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        raswastecollector = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        rasstudent = { Baldspot = true, Picard = true, Recede = true },
        rasdeliverydriver = { },
        raslibrarian = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        raspriest = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true}, 
        rasitprof = { },
        rasarchitect = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,
                        Fabian = true, FabianCurly = true, LongBraids = true, LongBraids02 = true, Metal = true},
        rasveterinarian = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        rasofficeemployee = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,
                             Fabian = true, FabianCurly = true, LongBraids = true, LongBraids02 = true, Metal = true},
        rasartist = { },
        rashomeless = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        rasgangmember = { },
        rasmailcarrier = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        raspharmacist = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,
                         Fabian = true, FabianCurly = true, LongBraids = true, LongBraids02 = true, Mullet = true, MulletCurly = true, Metal = true}, 
        rasretired = { Braids = true, Cornrows = true, Donny = true, Fabian = true, FabianCurly = true, CrewCut = true, Fresh = true, LongBraids = true, Grungey = true, GrungeyBehindEars = true, 
                      LongBraids02 = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true, MohawkSpike = true, PonyTail = true, PonyTailBraids = true, ShortAfroCurly = true, Spike = true,
                      LibertySpikes = true, Metal = true }
    }
}




excludedHairStyles.Female = { 

    Old = { -- vanilla and overhauled vanilla professions
        unemployed = {  },
        fireofficer = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true },
        policeofficer = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true },
        parkranger = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        constructionworker = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        securityguard = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true},
        carpenter = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        burglar = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        chef = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        repairman = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        farmer = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        fisherman = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        doctor = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        veteran = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        nurse = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        lumberjack = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        fitnessinstructor = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        burgerflipper = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        electrician = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        engineer = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        metalworker = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        mechanics = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        tailor = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true}
    },

    New = { -- new professions
        rasteacher = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        rasbotanist = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        raswastecollector = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        rasstudent = { },
        rasdeliverydriver = { },
        raslibrarian = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        raspriest = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},   
        rasitprof = { },
        rasarchitect = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        rasveterinarian = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        rasofficeemployee = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        rasartist = { },
        rashomeless = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
        rasgangmember = { },
        rasmailcarrier = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        raspharmacist = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
        rasretired = { Bald = true, Fresh = true, Cornrows = true, Demi = true, FlatTop = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,  MohawkSpike = true, Spike = true, 
                      LibertySpikes = true},
    }
}



rasSharedData.AvailableHairStyles = { } -- this is table is populated below; will contain hair styles allowed for a certain profession 
rasSharedData.AvailableHairStyles.Male = { }
rasSharedData.AvailableHairStyles.Female = { }


-- write all allowed hair styles for a professtion to table
local function makeHairTable()

    local allHairStyles = {}
    allHairStyles["Male"] = getAllHairStyles(false) -- note: false is for male
    allHairStyles["Female"] = getAllHairStyles(true)

    local genders = {"Female", "Male"}
    for _,gender in pairs(genders) do         
        for profession,_ in pairs(excludedHairStyles[gender]["Old"]) do
            local prefixs = {"base:", "rasprofs:"}
            for _,prefix in pairs(prefixs) do
                rasSharedData["AvailableHairStyles"][gender][prefix .. profession] = {}
                for i=1,allHairStyles[gender]:size() do
                    local style = allHairStyles[gender]:get(i-1)
                    if rasSharedData["VanillaHair"][gender][style] and not excludedHairStyles[gender]["Old"][profession][style] then
                        table.insert(rasSharedData["AvailableHairStyles"][gender][prefix .. profession], style)
                    end
                end
            end
        end
        for profession,_ in pairs(excludedHairStyles[gender]["New"]) do
            rasSharedData["AvailableHairStyles"][gender]["rasprofs:" .. profession] = {}
            for i=1,allHairStyles[gender]:size() do
                local style = allHairStyles[gender]:get(i-1)
                if rasSharedData["VanillaHair"][gender][style] and not excludedHairStyles[gender]["New"][profession][style] then
                    table.insert(rasSharedData["AvailableHairStyles"][gender]["rasprofs:" .. profession], style)
                end
            end
        end
    end
end

Events.OnGameBoot.Add(makeHairTable)


return rasSharedData






