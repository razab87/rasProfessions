-- here we define the clothing for the professions and add them to the vanilla ClothingSelectionDefinition table;
-- first part of the code defines the new clothing items for the profession via table containing the following data:
--
-- profession.gender.bodylocation.items = the clothing items for the body location 
-- profession.gender.bodylocation.chance = chance for selecting a clothing item from the list above
-- profession.gender.bodylocation.remove = items we want to remove from a vanilla profession
-- profession.RemoveLocation.gender = body locations we want to remove from a vanilla profession for a specific gender
-- profession.Special.gender.bodylocation.items = a special list of items for a bodylocation; when defined, the body location will only get items from that list with a certain
--                                                probability but no other clothing items for that location (example: lumberjack shouldn't wear fedoras but baseball caps are ok; fedora can 
--                                                still be selected manually if desired)
-- profession.Special.gender.bodylocation.chance = the probability for choosing smth from the "special" list   
-- profession.Prescription.gender = if we want to give a profession specific prescription glasses in case player has the short sighted trait 
-- profession.ShirtDecals = if shirst worn by the profession should only get specific decals
--
--
-- by razab





local Regs = RasProfessionsRegistries



local clothingDefinitions = {} -- can be accessed via require("Definitions/RasProfessionsClothingDefinitions")



-- 42.13 has introduced a new profession system; next tables links the new profession descriptors to my mod's old naming system so we
-- easily access the table below

clothingDefinitions.toTableID = {}

-- vanilla professions 
clothingDefinitions.toTableID[CharacterProfession.BURGER_FLIPPER] = "burgerflipper"
clothingDefinitions.toTableID[CharacterProfession.BURGLAR] = "burglar"
clothingDefinitions.toTableID[CharacterProfession.CARPENTER] = "carpenter"
clothingDefinitions.toTableID[CharacterProfession.CHEF] = "chef"
clothingDefinitions.toTableID[CharacterProfession.CONSTRUCTION_WORKER] = "constructionworker"
clothingDefinitions.toTableID[CharacterProfession.DOCTOR] = "doctor"
clothingDefinitions.toTableID[CharacterProfession.ELECTRICIAN] = "electritician"
clothingDefinitions.toTableID[CharacterProfession.ENGINEER] = "engineer"
clothingDefinitions.toTableID[CharacterProfession.FARMER] = "farmer"
clothingDefinitions.toTableID[CharacterProfession.FIRE_OFFICER] = "fireofficer"
clothingDefinitions.toTableID[CharacterProfession.FISHERMAN] = "fisherman"
clothingDefinitions.toTableID[CharacterProfession.FITNESS_INSTRUCTOR] = "fitnessinstructor"
clothingDefinitions.toTableID[CharacterProfession.LUMBERJACK] = "lumberjack"
clothingDefinitions.toTableID[CharacterProfession.MECHANICS] = "mechanics"
clothingDefinitions.toTableID[CharacterProfession.METALWORKER] = "metalworker"
clothingDefinitions.toTableID[CharacterProfession.NURSE] = "nurse"
clothingDefinitions.toTableID[CharacterProfession.PARK_RANGER] = "parkranger"
clothingDefinitions.toTableID[CharacterProfession.POLICE_OFFICER] = "policeofficer"
clothingDefinitions.toTableID[CharacterProfession.RANCHER] = "rancher"
clothingDefinitions.toTableID[CharacterProfession.REPAIRMAN] = "repairman"
clothingDefinitions.toTableID[CharacterProfession.SECURITY_GUARD] = "securityguard"
clothingDefinitions.toTableID[CharacterProfession.SMITHER] = "smither"
clothingDefinitions.toTableID[CharacterProfession.TAILOR] = "tailorprofession"
--clothingDefinitions.toTableID[CharacterProfession.UNEMPLOYED] -- note: unemployed not reuqired since it has no special profession clothing table!
clothingDefinitions.toTableID[CharacterProfession.VETERAN] = "veteran"


-- overhauled vanilla professions
clothingDefinitions.toTableID[Regs.OldProfs.fireofficer] = "fireofficer"
clothingDefinitions.toTableID[Regs.OldProfs.policeofficer] = "policeofficer"
clothingDefinitions.toTableID[Regs.OldProfs.parkranger] = "parkranger"
clothingDefinitions.toTableID[Regs.OldProfs.constructionworker] = "constructionworker"
clothingDefinitions.toTableID[Regs.OldProfs.securityguard] = "securityguard"
clothingDefinitions.toTableID[Regs.OldProfs.carpenter] = "carpenter"
clothingDefinitions.toTableID[Regs.OldProfs.burglar] = "burglar"
clothingDefinitions.toTableID[Regs.OldProfs.chef] = "chef"
clothingDefinitions.toTableID[Regs.OldProfs.repairman] = "repairman"
clothingDefinitions.toTableID[Regs.OldProfs.rancher] = "rancher"
clothingDefinitions.toTableID[Regs.OldProfs.farmer] = "farmer"
clothingDefinitions.toTableID[Regs.OldProfs.fisherman] = "fisherman"
clothingDefinitions.toTableID[Regs.OldProfs.doctor] = "doctor"
clothingDefinitions.toTableID[Regs.OldProfs.veteran] = "veteran"
clothingDefinitions.toTableID[Regs.OldProfs.nurse] = "nurse"
clothingDefinitions.toTableID[Regs.OldProfs.lumberjack] = "lumberjack"
clothingDefinitions.toTableID[Regs.OldProfs.fitnessInstructor] = "fitnessinstructor"
clothingDefinitions.toTableID[Regs.OldProfs.burgerflipper] = "burgerflipper"
clothingDefinitions.toTableID[Regs.OldProfs.electrician] = "electrician"
clothingDefinitions.toTableID[Regs.OldProfs.engineer] = "engineer"
clothingDefinitions.toTableID[Regs.OldProfs.metalworker] = "metalworker"
clothingDefinitions.toTableID[Regs.OldProfs.smither] = "smither"
clothingDefinitions.toTableID[Regs.OldProfs.mechanics] = "mechanics"
clothingDefinitions.toTableID[Regs.OldProfs.tailor] = "tailorprofessions"


-- new professions
clothingDefinitions.toTableID[Regs.NewProfs.rasTeacher] = "rasteacher"
clothingDefinitions.toTableID[Regs.NewProfs.rasBotanist] = "rasbotanist"
clothingDefinitions.toTableID[Regs.NewProfs.rasWasteCollector] = "raswastecollector"
clothingDefinitions.toTableID[Regs.NewProfs.rasStudent] = "rasstudent"
clothingDefinitions.toTableID[Regs.NewProfs.rasDeliveryDriver] = "rasdeliverydriver"
clothingDefinitions.toTableID[Regs.NewProfs.rasLibrarian] = "raslibrarian"
clothingDefinitions.toTableID[Regs.NewProfs.rasPriest] = "raspriest"
clothingDefinitions.toTableID[Regs.NewProfs.rasITProf] = "rasitprof"
clothingDefinitions.toTableID[Regs.NewProfs.rasArchitect] = "rasarchitect"
clothingDefinitions.toTableID[Regs.NewProfs.rasVeterinarian] = "rasveterinarian"
clothingDefinitions.toTableID[Regs.NewProfs.rasOfficeEmployee] = "rasofficeemployee"
clothingDefinitions.toTableID[Regs.NewProfs.rasArtist] = "rasartist"
clothingDefinitions.toTableID[Regs.NewProfs.rasHomeless] = "rashomeless"
clothingDefinitions.toTableID[Regs.NewProfs.rasGangMember] = "rasgangmember"
clothingDefinitions.toTableID[Regs.NewProfs.rasMailCarrier] = "rasmailcarrier"
clothingDefinitions.toTableID[Regs.NewProfs.rasPharmacist] = "raspharmacist"
clothingDefinitions.toTableID[Regs.NewProfs.rasRetired] = "rasretired"




------------------------------------------------- vanilla professions:


-- remove the straps dresses since they don't fit really well as some everday clothing imo
clothingDefinitions.default = {
    Female = {
        Dress = { remove = {"Base.Dress_long_Straps", "Base.Dress_SmallStrapless", "Base.Dress_Straps", "Base.DressKnees_Straps", "Base.Dress_SmallStraps"}},
        Eyes = { items = {"Base.Glasses_Cosmetic_Round_Normal"}}, -- round glasses as additional option
    },
    Male = {
        Eyes = { items = {"Base.Glasses_Cosmetic_Round_Normal"}},
    },
}


clothingDefinitions.fireofficer = {
        Female = { 
              Shirt = { items = { }, chance = 100},
        }, 
        Special = { 
            Female = {
                 Hat = { items = {"Base.Hat_BaseballCap"}, chance = 10 }
            }
       }
}


clothingDefinitions.policeofficer = { 
        Female = { -- if female and male clothing should be the same, it is sufficient to define for female
              BeltExtra = { items = {"Base.HolsterSimple"}, chance = 100},
              Hat = { items = {"Base.Hat_Police", "Base.Hat_Police_Grey"}, chance = 100},
              Pants = { items = {"Base.Trousers_Police", "Base.Trousers_PoliceGrey"}, chance = 100},
              Shoes = { items = {"Base.Shoes_Random"}, chance = 100},
              Shirt = { items = {"Base.Shirt_OfficerWhite", "Base.Shirt_PoliceBlue", "Base.Shirt_PoliceGrey", "Base.Tshirt_PoliceGrey", "Base.Tshirt_PoliceBlue"}, chance = 100}, -- "Base.Shirt_Sheriff", 
              Tshirt = { items = {"Base.Tshirt_Profession_PoliceBlue", "Base.Tshirt_Profession_PoliceWhite", "Base.Tshirt_DefaultTEXTURE_TINT"}, chance = 100}
        } 
}

clothingDefinitions.parkranger = {
     Female= {
        Hat = { items = {"Base.Hat_Ranger"}, chance = 100},
        Pants = { items = {"Base.Trousers_Ranger"}, chance = 100},
        Shoes = { items = {"Base.Shoes_HikingBoots"}, chance = 100},
        Shirt = { items = {"Base.Shirt_Ranger"}, chance = 100},
        Tshirt = { items = {"Base.Tshirt_Profession_RangerGreen", "Base.Tshirt_Profession_RangerBrown"}, chance = 100}
     }
}

clothingDefinitions.constructionworker = {
     Female = {
        Hat = { items = {"Base.Hat_HardHat"}, chance = 100},
        Pants = { items = {"Base.Trousers_JeanBaggy"}, chance = 100},
        Shoes = { items = {"Base.Shoes_WorkBoots"}, chance = 100},
        Shirt = { items = {"Base.Shirt_Denim", "Base.Shirt_Lumberjack"}, chance = 100},
        Tshirt = { items = { }, chance = 100},
        TorsoExtraVest = { items = {"Base.Vest_HighViz", "Base.Vest_Foreman"}, chance = 100}
     },
     RemoveLocation = { Female = {"TorsoExtra"} }, -- this field is for removing a whole vanilla body location during the character creation (found some vanilla choices here a bit suboptimal, so...)
}

clothingDefinitions.securityguard = {
    Female = {
       Hat = { items = { }, chance = 100},
       Pants = { items = {"Base.Trousers_Black"}, chance = 100},
       Shoes = { items = {"Base.Shoes_Random"}, chance = 100},
       Shirt = { items = {"Base.Shirt_FormalWhite"}, chance = 100},
    }
}

clothingDefinitions.carpenter = {
     Female = {
        Eyes = { remove = {"Base.Glasses_SafetyGoggles"}},
        Pants = { items = {"Base.Trousers_JeanBaggy"}, chance = 100},
        Shirt = { items = {"Base.Shirt_Lumberjack"}, chance = 100},
        Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}, chance = 100},   
        Tshirt = { items = { }, chance = 100},     
      },
      RemoveLocation = { Female = {"Mask"} }, 
      Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap"}, chance = 10 }
            }
       }
}

clothingDefinitions.burglar = {
   Female = {
      Hat = { items = {"Base.Hat_Beany"}, chance = 10 },
      Shoes = { items={"Base.Shoes_TrainerTINT"}, chance = 100},
      Pants = { items={"Base.Trousers_Denim"}, chance = 100},
      Shirt = { items={ }, chance = 100},
      TankTop = { items = { }, chance = 100},
      Sweater= { items = {"Base.HoodieDOWN_WhiteTINT"}, chance = 100}
   },
   RemoveLocation = { Female={"Mask", "MaskFull"} },
   Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap","Base.Hat_Beany"}, chance = 10 }
            }
   }
}

clothingDefinitions.chef = {
   Female = {
      Hat = { items ={"Base.Hat_ChefHat"}, chance = 50},
      Pants = { items = {"Base.Trousers_Chef"}, chance = 100},
      Jacket = { items = {"Base.Jacket_Chef"}, chance = 100},
      TankTop = { items = { }, chance = 100},
      Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}, chance = 100},
   },
   Special = { 
            Female = {
                Hat = { items = {"Base.Hat_ChefHat"}, chance = 50 }
            }
   }
}

clothingDefinitions.repairman = {
   Female = {
      Pants = { items = {"Base.Trousers_Denim"}, chance = 100},
      Shirt = { items = {"Base.Shirt_Denim", "Base.Shirt_Lumberjack"}, chance = 100},
      Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}, chance = 100},
   },
   Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap"}, chance = 10 }
            }
   }   
}

clothingDefinitions.farmer = {
    Female = {
       Hat = { items = {"Base.Hat_Cowboy", "Base.Hat_SummerHat"}, chance = 10,},
       Pants = { items = {"Base.Dungarees"}, remove = { "Base.Trousers_Denim"}, chance = 100},
       Tshirt = { items = { }, chance = 100},
       TankTop = { items = { }},
       Shirt = { items = {"Base.Shirt_Lumberjack"}, remove = {"Base.Shirt_Denim"}, chance = 100},
       Torso1Legs1 = { items = {"Base.LongJohns"}, chance = 100},
       Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT", "Base.Shoes_Wellies"}, chance = 100 }
    },
    Male = {
       Hat = { items = {"Base.Hat_Cowboy"}, chance = 10,},
       Pants = { items = {"Base.Dungarees"}, remove = { "Base.Trousers_Denim"}, chance = 100},
       Tshirt = { items = { }, chance = 100},
       TankTop = { items = { }, chance = 100},
       Shirt = { items = {"Base.Shirt_Lumberjack"}, remove = {"Base.Shirt_Denim"}, chance = 100},
       Torso1Legs1 = { items = {"Base.LongJohns"}, chance = 100},
       Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT", "Base.Shoes_Wellies"}, chance = 100 }
    },
    Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap", "Base.Hat_Cowboy", "Base.Hat_SummerHat"}, chance = 10 }                
            },
            Male = {
                Hat = { items = {"Base.Hat_BaseballCap","Base.Hat_Cowboy"}, chance = 10 }
            },
     }

}


clothingDefinitions.rancher = {
    Female = {
       Hat = { items = {"Base.Hat_Cowboy"}, chance = 10,},
       Pants = { items = {"Base.Dungarees"}, remove = { "Base.Trousers_Denim"}, chance = 100},
       Tshirt = { items = { }, chance = 100},
       TankTop = { items = { }},
       Shirt = { items = {"Base.Shirt_Lumberjack"}, remove = {"Base.Shirt_Denim"}, chance = 100},
       Torso1Legs1 = { items = {"Base.LongJohns"}, chance = 100},
       Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT", "Base.Shoes_Wellies"}, chance = 100 }
    },
    Male = {
       Hat = { items = {"Base.Hat_Cowboy"}, chance = 10,},
       Pants = { items = {"Base.Dungarees"}, remove = { "Base.Trousers_Denim"}, chance = 100},
       Tshirt = { items = { }, chance = 100},
       TankTop = { items = { }, chance = 100},
       Shirt = { items = {"Base.Shirt_Lumberjack"}, remove = {"Base.Shirt_Denim"}, chance = 100},
       Torso1Legs1 = { items = {"Base.LongJohns"}, chance = 100},
       Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT", "Base.Shoes_Wellies"}, chance = 100 }
    },
    Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap","Base.Hat_Cowboy"}, chance = 10 }
            },
            Male = {
                Hat = { items = {"Base.Hat_BaseballCap","Base.Hat_Cowboy"}, chance = 10 }
            },
     }

}


clothingDefinitions.fisherman = {
    Female = {
        Hat = { items = {"Base.Hat_BucketHat", "Base.Hat_Beany", "Base.Hat_BonnieHat"}, chance = 100, remove = {"Base.Hat_BonnieHat_CamoGreen"} },
        Pants = { items = {"Base.Trousers_JeanBaggy", "Base.Trousers_Denim"}, chance = 100},
        Shirt = { items = {"Base.Shirt_Lumberjack"}, remove = {"Base.Shirt_Denim"}, chance = 100},
        TorsoExtraVest = { items = {"Base.Vest_Hunting_Grey", "Base.Vest_Hunting_Camo", "Base.Vest_Hunting_CamoGreen" }, chance = 100},
        Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT", "Base.Shoes_Wellies"}, chance = 100 }
    },
}


clothingDefinitions.doctor = {
    Female = {
        Hat = { items = { }, remove = {"Base.Hat_SurgicalMask_Blue", "Base.Hat_SurgicalMask_Green", "Base.Hat_SurgicalMask"}, chance = 100 },
        Tshirt = { items = { }, chance = 100},
        Pants = { items = {"Base.Trousers_SuitTEXTURE", "Base.Trousers_Suit"}, chance = 100},
        Shirt = { items = {"Base.Shirt_FormalTINT"}, remove = {"Base.Shirt_FormalWhite"}, chance = 100},
        JacketSuit = { items = {"Base.JacketLong_Doctor"}, chance = 100},
        Shoes = { items = {"Base.Shoes_Random"}, chance = 100},
        Necklace = { items = {"Base.Necklace_Gold", "Base.Necklace_GoldRuby", "Base.Necklace_Silver", "Base.Necklace_Pearl", "Base.NecklaceLong_Gold", "Base.NecklaceLong_Silver"}, chance = 100},
        UnderwearExtra1 = { items = {"Base.TightsBlack", "Base.TightsBlackTrans", "Base.TightsBlackSemiTrans"}, chance = 50 },
    },
    Male = {
        Hat = { items = { }, remove = {"Base.Hat_SurgicalMask_Blue", "Base.Hat_SurgicalMask_Green", "Base.Hat_SurgicalMask"}, chance = 100 },
        Tshirt = { items = { }},
        Pants = { items = {"Base.Trousers_Suit"}, remove = { "Base.Trousers_SuitTEXTURE"}, chance = 100},
        Shirt = { items = {"Base.Shirt_FormalWhite"}, chance = 100},
        JacketSuit = { items = {"Base.JacketLong_Doctor"}, chance = 100},
        Shoes = { items = {"Base.Shoes_Random"}, chance = 100},
        Neck = { items = {"Base.Tie_BowTieWorn"}, chance = 100},
    }, 
    RemoveLocation = { Female = {"Hands","Neck", "Mask"}, Male = {"Hands", "Mask"} },
    Prescription = { Female = {"Base.Glasses_Normal", "Base.Glasses_Round_Normal"} }
}

clothingDefinitions.veteran = {
    Female = {
        Eyes = { remove = {"Base.Glasses_Shooting", "Base.Glasses_Eyepatch_Left", "Base.Glasses_Eyepatch_Right"} },
        LeftEye = { items = {"Base.Glasses_Eyepatch_Left"}, chance = 10 },
        Hat = { remove = {"Base.Hat_BeretArmy"}},
        TankTop = { items = {"Base.Vest_DefaultTEXTURE_TINT"}, chance = 100}, 
        Tshirt = { items = {"Base.Tshirt_BluesCountry", "Base.Tshirt_DefaultDECAL"}, remove = {"Base.Tshirt_Profession_VeterenGreen", "Base.Tshirt_Profession_VeterenRed"} },
        Shirt =  { items = { }, remove = {"Base.Shirt_CamoGreen"}, chance = 100},
        Pants = { items = {"Base.Shorts_CamoGreenLong", "Base.Trousers_CamoDesert", "Base.Trousers_CamoGreen"}, chance = 100},
        Necklace = { items = {"Base.Necklace_DogTag"}, chance = 100},
        Socks = { items = {"Base.Socks_Ankle"}, chance = 100},
        Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}, chance = 100},
    },
    Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap"}, chance = 40 },
                Tshirt = { items = {"Base.Tshirt_BluesCountry", "Base.Tshirt_DefaultDECAL", "Base.Tshirt_DefaultTEXTURE_TINT"}, chance = 70},
            }
   },
   ShirtDecals = { ["Base.Tshirt_DefaultDECAL"] = {"TShirt_Culture_USAflagDECAL"}, ["Base.Tshirt_BluesCountry"] = {"TShirt_Blues_2", "TShirt_Blues_3", "TShirt_Country_2", "TShirt_Country_3"} } 
}

clothingDefinitions.nurse = {
   Female = {
        Hat = { items = { }, remove = {"Base.Hat_SurgicalCap_Blue", "Base.Hat_SurgicalCap_Green", "Hat_SurgicalCap"}, chance = 100 }, 
        Shirt =  { items = {"Base.Shirt_Scrubs"}, chance = 100},
        Pants = { items = {"Base.Trousers_Scrubs"}, remove = {"Base.Trousers_DefaultTEXTURE_TINT"}, chance = 100},
        Shoes = { items = {"Base.Shoes_TrainerTINT"}, chance = 100},
   },
   RemoveLocation = { Female = {"Mask", "Hands"} }
}


clothingDefinitions.lumberjack = {
     Female = {
        Hat = { items = {"Base.Hat_Beany"}, chance = 10,},
        Pants = { items = {"Base.Trousers_JeanBaggy"}, chance = 100},
        Shirt = { items = {"Base.Shirt_Lumberjack"}, remove = {"Base.Shirt_Denim"}, chance = 100},
        Shoes = { items = {"Base.Shoes_WorkBoots"}, chance = 100},
     },
     Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap", "Base.Hat_Beany"}, chance = 20 }
            }
     }
}

clothingDefinitions.fitnessinstructor = {
       Female = {
            Hat = {	items = {"Base.Hat_Sweatband",}, chance = 10,},
            TankTop = { items = {"Base.Vest_DefaultTEXTURE_TINT"}, chance = 100},
            Pants = { items = {"Base.Shorts_LongSport", "Base.Shorts_ShortSport"}, chance = 100},
            Tshirt = { items = {"Base.Tshirt_Sport"}, chance = 100},
            Shirt = { items = { }, chance = 100},
            Shoes = { items = {"Base.Shoes_TrainerTINT"}, chance = 100},
            Socks = { items = {"Base.Socks_Ankle"}, chance = 100},
       },
       Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap","Base.Hat_Sweatband", "Base.Hat_Visor_WhiteTINT"}, chance = 10 }
            }
       }
}

clothingDefinitions.burgerflipper = {
     Female = {
          Hat = { items = {"Base.Hat_FastFood", "Base.Hat_FastFood_Spiffo"}, chance = 100},
          TankTop = { items = {"Base.Vest_DefaultTEXTURE_TINT"}, chance = 100},
          Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Shorts_ShortDenim", "Base.Shorts_ShortFormal"}, chance = 100},
          Tshirt = { items = {"Base.Tshirt_BusinessSpiffo"}}, -- "Base.Tshirt_Punk", 
          TankTop = { items = {"Base.Vest_DefaultTEXTURE_TINT"}},
          Shirt = { items = { }, chance = 100},
          Socks = { items = {"Base.Socks_Ankle"}, chance = 100},
          Shoes = { items = {"Base.Shoes_TrainerTINT"}, chance = 100},
     },
      Special = { 
            Female = {
              Tshirt = { items = {"Base.Tshirt_DefaultTEXTURE_TINT", "Base.Tshirt_BusinessSpiffo"}, chance = 65}  -- "Base.Tshirt_Punk", 
            }
       }
}

clothingDefinitions.electrician = {
     Female = {
       Eyes = { remove = {"Base.Glasses_SafetyGoggles"}},
       Pants = { items = {"Base.Trousers_Denim"}, chance = 100},
       Shirt = { items = {"Base.Shirt_Denim", "Base.Shirt_Lumberjack"}, chance = 100},
       Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}, chance = 100},
     },
     RemoveLocation = { Female = {"Mask", "TorsoExtra", "TorsoExtraVest"} },
     Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap"}, chance = 10 }
            }
     }
}

clothingDefinitions.engineer = {
       Female = {
           Hat = { items = { }, remove = {"Base.Hat_DustMask"}, chance = 100 },
           Tshirt = { items = {"Base.Tshirt_DefaultTEXTURE_TINT"}, chance = 100},
           Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim"}, remove = {"Base.Trousers_SuitTEXTURE"}, chance = 100 },
           Shirt = { items = {"Base.Shirt_FormalWhite", "Base.Shirt_FormalWhite_ShortSleeve"}, remove = {"Base.Shirt_FormalTINT"}, chance = 100},           
           Shoes = { items = {"Base.Shoes_Random"}, chance = 100},
       }, 
       Male = {
           Hat = { items = { }, remove = {"Base.Hat_DustMask"}, chance = 100 },
           Tshirt = { items = {"Base.Tshirt_DefaultTEXTURE_TINT"}, chance = 100},
           Shirt = { items = {"Base.Shirt_FormalWhite", "Base.Shirt_FormalWhite_ShortSleeve"}, remove = {"Base.Shirt_FormalTINT"}, chance = 100},
           Pants = { items = {"Base.Trousers_Denim"}, remove = {"Base.Trousers_SuitTEXTURE"}, chance = 100},
           Shoes = { items = {"Base.Shoes_Random"}, chance = 100},
           Neck = { items = {"Base.Tie_Full"}, chance = 40 },
	  },
      RemoveLocation = { Female = {"TorsoExtra", "TorsoExtraVest", "Neck"}, Male = {"TorsoExtra", "TorsoExtraVest"} },
      Special = { 
            Male = {
                Hat = { items = {"Base.Hat_GolfHat", "Base.Hat_Fedora"}, chance = 10 }
            }
      }
}

clothingDefinitions.metalworker = {
       Female = {
          Eyes = { remove = {"Base.Glasses_SafetyGoggles"}},
          Pants = { items = {"Base.Trousers_Denim", "Base.Trousers_JeanBaggy"}, chance = 100},
          Shirt = { items = {"Base.Shirt_Denim"}, remove = {"Base.Shirt_Lumberjack"}, chance = 100},
          Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}, chance = 100},
       },
       RemoveLocation = { Female = {"Mask", "TorsoExtra", "TorsoExtraVest"} },
       Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap"}, chance = 10 }
            }
        }
}

clothingDefinitions.mechanics = {
       Female = {	
          Eyes = { remove = {"Base.Glasses_SafetyGoggles"}},
          FullSuit = { items = {"Base.Boilersuit_BlueRed"}, chance = 100},
          Shirt = { items = { }, chance = 100},
          Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}, chance = 100},
       },
       RemoveLocation = { Female = {"Mask"} },
       Special = {
            Female = {
                Hat = { items = {"Base.Hat_Bandana", "Base.Hat_BaseballCap"}, chance = 10 }
            }
       }
}


-- tailor has no special clothing

--------------------------------------------------- new professions


clothingDefinitions.rasteacher = {
      Female = {
          Hat = { items = { }},
          Eyes = {items = {"Base.Glasses_Cosmetic_Normal", "Base.Glasses_Cosmetic_Round_Normal", "Base.Glasses_Cosmetic_Normal_HornRimmed", "Base.Glasses_Cosmetic_CatsEye", "Base.Glasses_Reading"}, 
                  chance = 40, },
          Tshirt = {items = {"Base.Tshirt_DefaultTEXTURE_TINT", "Base.Tshirt_PoloStripedTINT", "Base.Tshirt_PoloTINT", "Base.Tshirt_WhiteLongSleeveTINT"}, chance = 100},
          Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Trousers_Black"}, chance = 100},
          Skirt = { items = {"Base.Skirt_Knees", "Base.Skirt_Long", "Base.Skirt_Normal",}, chance = 50,},
          Dress = { items = {"Base.Dress_Normal", "Base.Dress_Knees", "Base.Dress_Long"}, chance = 10, },
          UnderwearExtra1 = { items = {"Base.TightsBlack", "Base.TightsBlackTrans", "Base.TightsBlackSemiTrans"}, chance = 30 },
      },
      Male = {
          Hat = { items = { }},
          Eyes = {items = {"Base.Glasses_Cosmetic_Normal", "Base.Glasses_Cosmetic_Round_Normal", "Base.Glasses_Cosmetic_Normal_HornRimmed", "Base.Glasses_Reading"}, chance = 40, },
          Pants = { items = {"Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Trousers_Black"}, chance = 100},
      },
      Special = {
            Female = {
              Shirt = {items = {"Base.Shirt_FormalTINT", "Base.Shirt_FormalWhite_ShortSleeveTINT",}, chance = 30 }
            },
            Male = {
                Shirt = {items = {"Base.Shirt_FormalTINT", "Base.Shirt_FormalWhite_ShortSleeveTINT","Base.Shirt_HawaiianTINT"}, chance = 30 }
            }
      }     
}

-- botanist has no special clothing

clothingDefinitions.raswastecollector = {
       Female = {
          Pants = { items = {"Base.Trousers_JeanBaggy"}},
          Shoes = { items = {"Base.Shoes_WorkBoots"}},
          Shirt = { items = {"Base.Shirt_Denim"}},
          TorsoExtraVest = { items = {"Base.Vest_HighViz"}},
       },
       Special = {
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap", "Base.Hat_Visor_WhiteTINT"}, chance = 10 }
            }
       }
}

clothingDefinitions.rasstudent = {
      Female = {
         Back = { items = {"Base.Bag_Schoolbag", "Base.Bag_Satchel", "Base.Bag_Satchel_Leather", "Base.Bag_Schoolbag_Patches"}}, 
         Tshirt = { items = {"Base.Tshirt_DefaultTEXTURE_TINT", "Base.Tshirt_WhiteLongSleeveTINT", "Base.Tshirt_PoloStripedTINT", "Base.Tshirt_PoloTINT", "Base.Shirt_CropTopTINT", "Base.Shirt_CropTopNoArmTINT", 
                             "Base.BoobTube", "Base.Tshirt_Punk", "Base.Tshirt_Indie", "Base.Tshirt_TieDye", "Base.Tshirt_DefaultDECAL"}, chance = 100},
         Shoes = { items = {"Base.Shoes_TrainerTINT"}},
         Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Shorts_ShortDenim", "Base.Shorts_ShortFormal"}},		
		 Skirt = { items = {"Base.Skirt_Knees", "Base.Skirt_Long", "Base.Skirt_Mini", "Base.Skirt_Normal"}, chance = 50 },		
		 Dress = { items = {"Base.Dress_Normal", "Base.Dress_Normal", "Base.Dress_Knees", "Base.Dress_Long"}, chance = 10 },
      }, 
      Male = {
         Back = { items = {"Base.Bag_Schoolbag", "Base.Bag_Satchel", "Base.Bag_Satchel_Leather", "Base.Bag_Schoolbag_Patches"}}, 
         Tshirt = { items = {"Base.Tshirt_DefaultTEXTURE_TINT", "Base.Tshirt_WhiteLongSleeveTINT", "Base.Tshirt_PoloStripedTINT", "Base.Tshirt_PoloTINT", "Base.Tshirt_Punk", 
                             "Base.Tshirt_Indie", "Base.Tshirt_TieDye", "Base.Tshirt_DefaultDECAL"}, chance = 100},
         Shoes = { items = {"Base.Shoes_TrainerTINT"}},	
         Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Shorts_ShortDenim", "Base.Shorts_ShortFormal"}},	
      },   
      Special = {
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap", "Base.Hat_BucketHat", "Base.Hat_Fedora", "Base.Hat_Visor_WhiteTINT"}, chance = 20 },
                Eyes = { items = {"Base.Glasses_Cosmetic_Normal", "Base.Glasses_Cosmetic_Round_Normal"}, chance = 10 } -- no reading glasses for student
            }
       },
       Prescription = {
            Female = {"Base.Glasses_Normal", "Base.Glasses_Round_Normal", "Base.Glasses_Normal_HornRimmed", "Base.Glasses_CatsEye"},
            Male = {"Base.Glasses_Normal", "Base.Glasses_Round_Normal", "Base.Glasses_Normal_HornRimmed"},
       },
       ShirtDecals = { ["Base.Tshirt_DefaultDECAL"] = {"TShirtPie", "TShirt_Sport_OmegaDECAL", "TShirt_Culture_WolfDECAL", "TShirt_Culture_CardinalDECAL", "TShirt_TieDye_1", 
                                                       "TShirt_Sport_AlphaDECAL", "TShirt_Sport_BasketBallDECAL", "TShirt_Sport_BaseBallZDECAL"} 
                     }
}

clothingDefinitions.rasdeliverydriver = {
      Female = {
         TankTop = { items = {"Base.Vest_DefaultTEXTURE_TINT"}},
         Hat = { items = {"Base.Hat_BaseballCap"}},
         Tshirt = { items = {"Base.Tshirt_DefaultDECAL", "Base.Tshirt_BusinessSpiffo"}, chance = 30}, -- "Base.Tshirt_Rock2", "Base.Tshirt_Punk", 
         Shirt = { items = {}},
         Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Shorts_ShortDenim", "Base.Shorts_ShortFormal"}},
         Shoes = { items = {"Base.Shoes_TrainerTINT"}},
      },
      ShirtDecals = { ["Base.Tshirt_DefaultDECAL"] = {"TShirtPie", "TShirt_Sport_OmegaDECAL", "TShirt_Culture_WolfDECAL", "TShirt_Culture_CardinalDECAL", "TShirt_TieDye_1", 
                                                       "TShirt_Sport_AlphaDECAL", "TShirt_Sport_BasketBallDECAL", "TShirt_Sport_BaseBallZDECAL"} 
                     },
}

clothingDefinitions.raslibrarian = {
     Female = {
        Eyes = { items = {"Base.Glasses_Cosmetic_Normal", "Base.Glasses_Cosmetic_Round_Normal", "Base.Glasses_Cosmetic_Normal_HornRimmed", "Base.Glasses_Cosmetic_CatsEye", "Base.Glasses_Reading"}},
        Hat = { items = { }},
        Tshirt = {items = {"Base.Tshirt_DefaultTEXTURE_TINT", "Base.Tshirt_PoloStripedTINT", "Base.Tshirt_PoloTINT", "Base.Tshirt_WhiteLongSleeveTINT"}, chance = 100},
        Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Trousers_Black"}, chance = 100},
        Skirt = { items = {"Base.Skirt_Knees", "Base.Skirt_Long", "Base.Skirt_Normal",}, chance = 50,},
        Dress = { items = {"Base.Dress_Normal", "Base.Dress_Knees", "Base.Dress_Long"}, chance = 10, },
        UnderwearExtra1 = { items = {"Base.TightsBlack", "Base.TightsBlackTrans", "Base.TightsBlackSemiTrans"}, chance = 30 },
      },
      Male = {
          Hat = { items = { }},
          Eyes = { items = {"Base.Glasses_Cosmetic_Normal", "Base.Glasses_Cosmetic_Round_Normal", "Base.Glasses_Cosmetic_Normal_HornRimmed", "Base.Glasses_Reading"}},
          Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT","Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Trousers_Black"}, chance = 100},
      },
      Special = {
            Female = {
                Shirt = {items = {"Base.Shirt_FormalTINT", "Base.Shirt_FormalWhite_ShortSleeveTINT",}, chance = 30 }
            },
            Male = {
                Shirt = {items = {"Base.Shirt_FormalWhite", "Base.Shirt_FormalWhite_ShortSleeve"}, chance = 30 }, 
                Hat = { items = {"Base.Hat_GolfHat", "Base.Hat_Fedora"}, chance = 10 }
            }
      }
}

clothingDefinitions.raspriest = {
     Female = {
        Hat = { items = { }},
        Pants = { items = {"Base.Trousers_Suit"}},
        Shoes = { items = {"Base.Shoes_Random"}},
        Shirt = { items = {"Base.Shirt_Priest"}},
        Necklace = {items = {"Base.Necklace_Crucifix"}},
     }
}

clothingDefinitions.rasitprof = {
     Female = {
        Eyes = { items = {"Base.Glasses_Cosmetic_Normal", "Base.Glasses_Cosmetic_Normal_HornRimmed"}},
        Shirt = { items = {"Base.Shirt_FormalTINT", "Base.Shirt_FormalWhite_ShortSleeveTINT"}},
        Tshirt = { items = {"Base.Tshirt_IndieStoneDECAL"}},
        LeftWrist = { items = {"Base.WristWatch_Left_DigitalBlack"}},
        Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Shorts_ShortDenim", "Base.Shorts_ShortFormal"}},
        Skirt = { items = {"Base.Skirt_Knees", "Base.Skirt_Long", "Base.Skirt_Mini", "Base.Skirt_Normal", "Base.Skirt_Short"}, chance = 50},
     },
     Male = {
        Eyes = { items = {"Base.Glasses_Cosmetic_Normal", "Base.Glasses_Cosmetic_Normal_HornRimmed"}},
        Shirt = { items = {"Base.Shirt_FormalTINT", "Base.Shirt_FormalWhite_ShortSleeveTINT"}},
        Tshirt = { items = {"Base.Tshirt_IndieStoneDECAL"}},
        LeftWrist = { items = {"Base.WristWatch_Left_DigitalBlack"}},
     },
     Special = {
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap", "Base.Hat_BucketHat", "Base.Hat_Fedora"}, chance = 10 },
                Shirt = { items = {"Base.Shirt_FormalTINT", "Base.Shirt_FormalWhite_ShortSleeveTINT"}, chance = 65 },
            }
      },
      Prescription = { Female = {"Base.Glasses_Normal", "Base.Glasses_Normal_HornRimmed"} }
}

clothingDefinitions.rasarchitect = {      
      Female = {
           Hat = { items = { }},
           Tshirt = { items = {"Base.Tshirt_DefaultTEXTURE_TINT"}},
           Shirt = { items = {"Base.Shirt_FormalTINT", "Base.Shirt_FormalWhite_ShortSleeveTINT"}},
           Pants = { items = {"Base.Trousers_Black","Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim"}},
           Shoes = { items = {"Base.Shoes_Random"}}, 
           Necklace = { items = {"Base.Necklace_Gold", "Base.Necklace_GoldRuby", "Base.Necklace_Silver", "Base.Necklace_Pearl", "Base.NecklaceLong_Gold", "Base.NecklaceLong_Silver"}},
     }, 
     Male = {
           Hat = { items = { }},
           Tshirt = { items = {"Base.Tshirt_DefaultTEXTURE_TINT"}},
           Shirt = { items = {"Base.Shirt_FormalWhite", "Base.Shirt_FormalWhite_ShortSleeve"}},
           Pants = { items = {"Base.Trousers_Black", "Base.Trousers_Denim"}},
           Shoes = { items = {"Base.Shoes_Random"}},
           Neck = { items = {"Base.Tie_Full"}},
     },
     Special = {
            Male = {
                Hat = { items = {"Base.Hat_GolfHat", "Base.Hat_Fedora"}, chance = 10 }
            }
      }
}


clothingDefinitions.rasveterinarian = {
      Female = {
           Tshirt = { items = {"Base.Tshirt_DefaultTEXTURE_TINT", "Base.Tshirt_WhiteLongSleeveTINT", "Base.Tshirt_PoloStripedTINT", "Base.Tshirt_PoloTINT"}},
           Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Shorts_ShortDenim", "Base.Shorts_ShortFormal"}},           
           Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}},
      }, 
      Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap"}, chance = 10 }
            },
            Male = {
                Hat = { items = {"Base.Hat_GolfHat", "Base.Hat_BaseballCap"}, chance = 10 }
            }
      }
}


clothingDefinitions.rasofficeemployee = {
      Female = {
           Hat = { items = { }},
           Tshirt = { items = {"Base.Tshirt_DefaultTEXTURE_TINT"}},
           Shirt = { items = {"Base.Shirt_FormalTINT", "Base.Shirt_FormalWhite_ShortSleeveTINT"}},
           Pants = { items = {"Base.Trousers_SuitWhite","Base.Trousers_SuitTEXTURE"}},
           Skirt = { items = {"Base.Skirt_Knees", "Base.Skirt_Long", "Base.Skirt_Normal", "Base.Skirt_Short"}, chance = 50 },
           Dress = { items = {"Base.Dress_Knees"}, chance = 10, },
           Shoes = { items = {"Base.Shoes_BlackBoots", "Base.Shoes_Fancy"}},
           LeftWrist = { items = {"Base.WristWatch_Left_ClassicBlack"}}, 
           Necklace = { items = {"Base.Necklace_Gold", "Base.Necklace_GoldRuby", "Base.Necklace_Silver", "Base.Necklace_Pearl", "Base.NecklaceLong_Gold", "Base.NecklaceLong_Silver"}},
           UnderwearExtra1 = { items = {"Base.TightsBlack", "Base.TightsBlackTrans", "Base.TightsBlackSemiTrans"}},
           Socks = { items = { }},
     },
     Male = {
           Hat = { items = { }},
           Neck = { items = {"Base.Tie_Full"}},
           Shirt = { items = {"Base.Shirt_FormalWhite"}},
           Pants = { items = {"Base.Trousers_Suit"}},
           Shoes = { items = {"Base.Shoes_Random"}},
           LeftWrist = { items = {"Base.WristWatch_Left_ClassicBlack"}},
     },
     Special = {
            Male = {
                Hat = { items = {"Base.Hat_Fedora"}, chance = 10 }
            }
     }
    
}


clothingDefinitions.rasartist = {
      Female = {
           Eyes = { items = {"Base.Glasses_Cosmetic_HalfMoon", "Base.Glasses_Cosmetic_Round_Normal", "Base.Glasses_Round_Shades"}},
           Hat = { items = {"Base.Hat_Beret"}},
           TankTop = { items = {"Base.Vest_DefaultTEXTURE_TINT"}},
           Tshirt = { items = { }},
           Shirt = { items = { }},
           Sweater = { items = {"Base.Jumper_PoloNeck"}},
           Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT"}},     
           Socks = { items = { }},      
           Shoes = { items = {"Base.Shoes_Sandals", "Base.Shoes_FlipFlop"}},
      },
      Prescription = {
          Female = {"Base.Glasses_HalfMoon", "Base.Glasses_Round_Normal"}
      }
}



clothingDefinitions.rashomeless = {
    Female = {
             TankTop = { items = { }},
             Hat = { items = {"Base.Hat_Beany"}},
             JacketSuit = { items = {"Base.JacketLong_Random"}},
             Shirt = { items = { }},
             Tshirt= { items = {"Base.Tshirt_DefaultTEXTURE_TINT"}},
             Pants = { items = {"Base.Trousers_Denim"}},
             Skirt = { items = {"Base.Skirt_Long"}, chance = 50 },
             Hands = { items = {"Base.Gloves_FingerlessGloves"}},
             Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}},
    },
    Male = {
             TankTop = { items = { }},
             Hat = { items = {"Base.Hat_Beany"}},
             JacketSuit = { items = {"Base.JacketLong_Random"}},
             Shirt = { items = { }},
             Tshirt= { items = {"Base.Tshirt_DefaultTEXTURE_TINT"}},
             Pants = { items = {"Base.Trousers_Denim"}},
             Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}},
             Hands = { items = {"Base.Gloves_FingerlessGloves"}},
   }
}

clothingDefinitions.rasgangmember = {
   Female = {
             Hat = { items = {"Base.Hat_Bandana"}},
             Shirt = { items = {"Base.Shirt_Lumberjack"}},
             Tshirt = { items = {"Base.Tshirt_Rock2", "Base.Tshirt_Punk", "Base.BoobTube", "Base.BoobTubeSmall"}},
             Pants = { items = {"Base.Shorts_CamoUrbanLong", "Base.Trousers_CamoUrban"}},
             Socks = { items = {"Base.Socks_Ankle"}},
             Shoes = { items = {"Base.Shoes_TrainerTINT"}},
   },
   Male = {
             Hat = { items = {"Base.Hat_Bandana"}},
             TankTop = { items = {"Base.Vest_DefaultTEXTURE_TINT"}},
             Shirt = { items = {"Base.Shirt_Lumberjack"}},
             Tshirt = { items = {"Base.Tshirt_Rock2", "Base.Tshirt_Punk"}},
             Pants = { items = {"Base.Shorts_CamoUrbanLong", "Base.Trousers_CamoUrban"}},
             Socks = { items = {"Base.Socks_Ankle"}},
             Shoes = { items = {"Base.Shoes_TrainerTINT"}},
   },
   Special = {
       Female = { 
             Shirt = { items = {"Base.Shirt_Lumberjack"}, chance = 30 },
             Eyes = { items = {"Base.Glasses_Cosmetic_Normal"}, chance = 10 } -- no reading glasses for gang member
       },
       Male = { 
             Shirt = { items = {"Base.Shirt_Lumberjack"}, chance = 30 },            
             Tshirt = { items = {"Base.Tshirt_Rock2", "Base.Tshirt_Punk"}, chance = 40},
             Eyes = { items = {"Base.Glasses_Cosmetic_Normal"}, chance = 10 }, -- no reading glasses for gang member
       },
   }
}

clothingDefinitions.rasmailcarrier = {
   Female = {
             Hat = { items = {"Base.Hat_BaseballCap"}},
             Shirt = { items = {"Base.Shirt_FormalWhite_ShortSleeve"}},
             Tshirt = { items = {"Base.Tshirt_DefaultTEXTURE_TINT"}},
             Pants = { items = {"Base.Shorts_ShortFormal"}},
             Back = { items = {"Base.Bag_Satchel", "Base.Bag_Satchel_Mail"}},
             Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}},
   }, 
}

clothingDefinitions.raspharmacist = {
   Female = {
        Hat = { items = { }},
        Tshirt = { items = { }},
        Pants = { items = {"Base.Trousers_SuitTEXTURE", "Base.Trousers_Suit"}},
        Shirt = { items = {"Base.Shirt_FormalTINT"}},
        JacketSuit = { items = {"Base.JacketLong_Doctor"}},
        Shoes = { items = {"Base.Shoes_Random"}},
        UnderwearExtra1 = { items = {"Base.TightsBlack", "Base.TightsBlackTrans", "Base.TightsBlackSemiTrans"}, chance = 30},
        Necklace = { items = {"Base.Necklace_Gold", "Base.Necklace_GoldRuby", "Base.Necklace_Silver", "Base.Necklace_Pearl", "Base.NecklaceLong_Gold", "Base.NecklaceLong_Silver"}},
   },
   Male = {
        Hat = { items = { }},
        Tshirt = { items = { }},
        Pants = { items = {"Base.Trousers_Suit"}},
        Shirt = { items = {"Base.Shirt_FormalWhite"}},
        JacketSuit = { items = {"Base.JacketLong_Doctor"}},
        Shoes = { items = {"Base.Shoes_Random"}},
  },
}



clothingDefinitions.rasretired = {
   Female = {
        Hat = { items = { }},
        Tshirt = { items = { }},
        Shirt = { items = { }},
        TankTop = { items = {"Base.Vest_DefaultTEXTURE_TINT"}},
        Sweater = { items = {"Base.Jumper_DiamondPatternTINT", "Base.Jumper_VNeck"}},
        Eyes = { items = {"Base.Glasses_Reading"}},
        Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT"}},
        Skirt = { items = {"Base.Skirt_Normal"}, chance = 30 },
        Dress = { items = {"Base.Dress_Normal"}, chance = 30, }, 
        Shoes = { items = {"Base.Shoes_Sandals", "Base.Shoes_Slippers"}}, 
        Socks = { items = {"Base.Socks_Long"} },       
   },
   Male = {
        Hat = { items = { }},
        Tshirt = { items = { }},
        Shirt = { items = { }},
        TankTop = { items = {"Base.Vest_DefaultTEXTURE_TINT"}},
        Eyes = { items = {"Base.Glasses_Reading"}},
        Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT"}},        
        Sweater = { items = {"Base.Jumper_DiamondPatternTINT", "Base.Jumper_VNeck"}},
        Shoes = { items = {"Base.Shoes_Sandals", "Base.Shoes_Slippers"}},
        Socks = { items = {"Base.Socks_Long"} },
  },
  Special = { 
          Male = {
              Hat = { items = {"Base.Hat_GolfHat"}, chance = 10 }
          }
  },
  Prescription = {
       Female = {"Base.Glasses_Round_Normal"}
  }
}




------------------- now we add the new clothing definition to the vanilla clothing tables



-- in case a clothing slot in vanilla is not defined, we initialise it with an empty list
local function initClothingSlot(profession,gender,bodyLocation) -- note: variable profession might contain the value "default" for default clothing
         local vanillaDefs = ClothingSelectionDefinitions
         if not vanillaDefs[profession] then 
                    vanillaDefs[profession] = { }
                    vanillaDefs[profession][gender] = { }
                    vanillaDefs[profession][gender][bodyLocation] = { items = { } } 
         elseif not vanillaDefs[profession][gender] then
                    vanillaDefs[profession][gender] = { }
                    vanillaDefs[profession][gender][bodyLocation] = { items = { } }
         elseif not vanillaDefs[profession][gender][bodyLocation] then
                    vanillaDefs[profession][gender][bodyLocation] = { items = { } }  

         end                
end

-- auxiliary function: check whether table contains value
local function contains(myTable,value) -- auxiliary function: check whether table contains value 
         for i,v in pairs(myTable) do
               if v == value then return true end
         end
         return false
end

-- auxiliary function: remove value from table
local function removeValue(myTable,value) 
         for i,v in pairs(myTable) do
             if v == value then
                table.remove(myTable,i)
             end
         end
end

-- auxiliary function: remove field from table 
local function removeField(myTable, index) 
    for i,_ in pairs(myTable) do
        if myTable[i] == myTable[index] then
            myTable[i] = nil
        end
    end
end


-- append the new clothing definition of a profession to the vanilla clothing list
local function modifyClothingTable(profession)
    local newDefs = clothingDefinitions
    local vanillaDefs = ClothingSelectionDefinitions
    if newDefs[profession] then           
         for _, gender in pairs{"Female", "Male"} do
                  if newDefs[profession][gender] then
                           for bodyLocation, value in pairs(newDefs[profession][gender]) do 
                                   if value then
                                          initClothingSlot(profession,gender,bodyLocation) -- create clothing slots
                                          if value.items then  
                                               for _, clothingItem in pairs(value.items) do
                                                   if not contains(vanillaDefs[profession][gender][bodyLocation]["items"], clothingItem) then -- don't duplicate elements!
                                                       table.insert(vanillaDefs[profession][gender][bodyLocation]["items"], clothingItem)
                                                   end
                                               end
                                          end
                                          if value.remove then -- case we want to remove vanilla clothing
                                                for _, itemToBeRemoved in pairs(value.remove) do
                                                    removeValue(vanillaDefs[profession][gender][bodyLocation]["items"], itemToBeRemoved)
                                                end 
                                          end
                                          if value.chance then  -- in case we defined a chance (use with caution! does not always works as intended!) 
                                              vanillaDefs[profession][gender][bodyLocation]["chance"] = value.chance
                                          end
                                   end
                          end                         
                  end
                  if newDefs[profession]["RemoveLocation"] and newDefs[profession]["RemoveLocation"][gender] then -- in case we want to remove a body location
                      if vanillaDefs[profession] and vanillaDefs[profession][gender] then
                           for _,v in pairs(newDefs[profession]["RemoveLocation"][gender]) do 
                                  removeField(vanillaDefs[profession][gender], v)
                           end
                      end
                 end
         end                 
   end
end 


-- apply previous function to all professions from the above table
local function modifyAllClothingTables()

   for profession,_ in pairs(clothingDefinitions) do   
        modifyClothingTable(profession)
   end
end


Events.OnGameBoot.Add(modifyAllClothingTables)


return clothingDefinitions


-- NOTE: above table still works for 42.13 since vanilla game generates the profession keys by desc:getCharacterProfession():getName() where getName() removes the "module:" prefix form the 
-- profession's string id (so "rasprofs:xyz" becomes "xyz", "base:xyz" becomes "xyz")




