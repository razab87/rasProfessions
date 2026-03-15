-- contains several tables used by this mod
--
--
-- by razab


--require "NPCs/RasProfessionsMain" -- we need to ensure that the professions are created before we load the tables



local rasSharedData = { } -- can be accessed via require("RasProfessionsSharedData") in other .lua files

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
   fitnessInstructor = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
   burgerflipper = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
   electrician = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   engineer = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,
                 Fabian = true, FabianCurly = true, LongBraids = true, LongBraids02 = true, Metal = true},
   metalworker = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
   mechanics = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
   tailorProfession = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},

   rasTeacher = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,},
   rasBotanist = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   rasWasteCollector = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
   rasStudent = { Baldspot = true, Picard = true, Recede = true },
   rasDeliveryDriver = { },
   rasLibrarian = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   rasPriest = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true}, 
   rasITProf = { },
   rasArchitect = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,
                    Fabian = true, FabianCurly = true, LongBraids = true, LongBraids02 = true, Metal = true},
   rasVeterinarian = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   rasOfficeEmployee = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,
                         Fabian = true, FabianCurly = true, LongBraids = true, LongBraids02 = true, Metal = true},
   rasArtist = { },
   rasHomeless = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
   rasGangMember = { },
   rasMailCarrier = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   rasPharmacist = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,
                     Fabian = true, FabianCurly = true, LongBraids = true, LongBraids02 = true, Mullet = true, MulletCurly = true, Metal = true}, 
   rasRetired = { Braids = true, Cornrows = true, Donny = true, Fabian = true, FabianCurly = true, CrewCut = true, Fresh = true, LongBraids = true, Grungey = true, GrungeyBehindEars = true, 
                  LongBraids02 = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true, MohawkSpike = true, PonyTail = true, PonyTailBraids = true, ShortAfroCurly = true, Spike = true,
                  LibertySpikes = true, Metal = true },
}




excludedHairStyles.Female = { 
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
   fitnessInstructor = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
   burgerflipper = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
   electrician = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   engineer = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   metalworker = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
   mechanics = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
   tailorProfession = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},

   rasTeacher = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   rasBotanist = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   rasWasteCollector = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
   rasStudent = { },
   rasDeliveryDriver = { },
   rasLibrarian = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   rasPriest = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},   
   rasITProf = { },
   rasArchitect = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   rasVeterinarian = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   rasOfficeEmployee = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   rasArtist = { },
   rasHomeless = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true},
   rasGangMember = { },
   rasMailCarrier = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   rasPharmacist = { LibertySpikes = true,  MohawkSpike = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true},
   rasRetired = { Bald = true, Fresh = true, Cornrows = true, Demi = true, FlatTop = true, MohawkFan = true, MohawkFlat = true, MohawkShort = true,  MohawkSpike = true, Spike = true, 
                  LibertySpikes = true},
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
         for profession,_ in pairs(excludedHairStyles[gender]) do
              rasSharedData["AvailableHairStyles"][gender][profession] = {}
              for i=1,allHairStyles[gender]:size() do
                   local style = allHairStyles[gender]:get(i-1)
                   if rasSharedData["VanillaHair"][gender][style] and not excludedHairStyles[gender][profession][style] then
                          table.insert(rasSharedData["AvailableHairStyles"][gender][profession], style)
                   end
              end
         end
    end
end

Events.OnGameBoot.Add(makeHairTable)


return rasSharedData






