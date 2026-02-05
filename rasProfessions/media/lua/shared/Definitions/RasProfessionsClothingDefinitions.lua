-- here we define the clothing for the professions and add them to the vanilla ClothingSelectionDefinition table;
-- first part of the code defines the new clothing items for the profession via table containing the following data:
--
-- profession.gender.bodylocation.items = the clothing items for the body location 
-- profession.gender.bodylocation.chance = chance for selecting a clothing item from the list above
-- profession.gender.bodylocation.remove = items we want to remove from a vanilla profession
-- profession.RemoveLocation.gender = body locations we want to remove from a vanilla profession for a specific gender
-- profession.Special.gender.bodylocation.items = a special list of items for location; when defined, the body location will only get items from that list with a certain
--                                                probability but no other clothing item from that location (example: lumberjack should wear fedoras but baseball cap are ok; fedora can 
--                                                still be selected manually if the player desires)
-- profession.Special.gender.bodylocation.chance = the probability from the previous point    
--
--
-- by razab




local clothingDefinitions = {}


------------------------------------------------- vanilla professions:


-- remove the denim shirt for women (men don't have them in default clothing so women shouldn't too); also remove the straps dresses since they don't fit really well as some everday clothing
clothingDefinitions.default = {
           Female = {
               Shirt = { remove = {"Base.Shirt_Denim"}},
               Dress = { remove = {"Base.Dress_long_Straps", "Base.Dress_SmallStrapless", "Base.Dress_Straps", "Base.DressKnees_Straps", "Base.Dress_SmallStraps"}}
           }
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
              Shirt = { items = {"Base.Shirt_OfficerWhite", "Base.Shirt_PoliceBlue", "Base.Shirt_PoliceGrey"}, chance = 100},
              Tshirt = { items = {"Base.Tshirt_PoliceGrey", "Base.Tshirt_PoliceBlue", "Base.Tshirt_Profession_PoliceBlue", "Base.Tshirt_Profession_PoliceWhite" }, chance = 100}
        } 
}

clothingDefinitions.parkranger = {
     Female= {
        Hat = { items = {"Base.Hat_Ranger"}, chance = 100},
        Pants = { items = {"Base.Trousers_Ranger"}, chance = 100},
        Shoes = { items = {"Base.Shoes_Random"}, chance = 100},
        Shirt = { items = {"Base.Shirt_Ranger"}, chance = 100},
        Tshirt = { items = {"Base.Tshirt_Profession_RangerGreen", "Base.Tshirt_Profession_RangerBrown"}, chance = 100}
     }
}

clothingDefinitions.constructionworker = {
     Female = {
        Hat = { items = {"Base.Hat_HardHat"}, chance = 100},
        Pants = { items = {"Base.Trousers_JeanBaggy"}, chance = 100},
        Shoes = { items = {"Base.Shoes_ArmyBoots"}, chance = 100},
        Shirt = { items = {"Base.Shirt_Denim", "Base.Shirt_Lumberjack"}, chance = 100},
        Tshirt = { items = { }, chance = 100},
        TorsoExtra = { items = {"Base.Vest_HighViz", "Base.Vest_Foreman"}, chance = 100}
     }
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
      },
      RemoveLocation = { Female = {"Mask"} }, -- this field is for removing a whole vanilla body location during the character creation (found some vanilla choices here a bit suboptimal, so...)
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
      Shirt = { items = {"Base.Shirt_Denim", "Base.Shirt_Lumberjack"}, chance = 100}
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



clothingDefinitions.fisherman = {
    Female = {
        Hat = { items = {"Base.Hat_BucketHat", "Base.Hat_Beany", "Base.Hat_BonnieHat_CamoGreen"}, chance = 100},
        Pants = { items = {"Base.Trousers_JeanBaggy", "Base.Trousers_Denim"}, chance = 100},
        Shirt = { items = {"Base.Shirt_Lumberjack"}, remove = {"Base.Shirt_Denim"}, chance = 100},
        TorsoExtra = { items = {"Base.Vest_Hunting_Grey", "Base.Vest_Hunting_Camo", "Base.Vest_Hunting_CamoGreen" }, chance = 100}
    },
}


clothingDefinitions.doctor = {
    Female = {
        Hat = { items = { }, remove = {"Base.Hat_SurgicalMask_Blue", "Base.Hat_SurgicalMask_Green", "Base.Hat_SurgicalMask"}, chance = 100 },
        Tshirt = { items = { }, chance = 100},
        Pants = { items = {"Base.Trousers_SuitTEXTURE", "Base.Trousers_Suit"}, chance = 100},
        Shirt = { items = {"Base.Shirt_FormalTINT"}, remove = {"Base.Shirt_FormalWhite"}, chance = 100},
        Jacket = { items = {"Base.JacketLong_Doctor"}, chance = 100},
        Shoes = { items = {"Base.Shoes_Random"}, chance = 100},
        Necklace = { items = {"Base.Necklace_Gold", "Base.Necklace_GoldRuby", "Base.Necklace_Silver", "Base.Necklace_Pearl", "Base.NecklaceLong_Gold", "Base.NecklaceLong_Silver"}, chance = 100},
        UnderwearExtra1 = { items = {"Base.TightsBlack", "Base.TightsBlackTrans", "Base.TightsBlackSemiTrans"}, chance = 50 },
    },
    Male = {
        Hat = { items = { }, remove = {"Base.Hat_SurgicalMask_Blue", "Base.Hat_SurgicalMask_Green", "Base.Hat_SurgicalMask"}, chance = 100 },
        Tshirt = { items = { }},
        Pants = { items = {"Base.Trousers_Suit"}, remove = { "Base.Trousers_SuitTEXTURE"}, chance = 100},
        Shirt = { items = {"Base.Shirt_FormalWhite"}, chance = 100},
        Jacket = { items = {"Base.JacketLong_Doctor"}, chance = 100},
        Shoes = { items = {"Base.Shoes_Random"}, chance = 100},
        Neck = { items = {"Base.Tie_BowTieWorn"}, chance = 100}
    }, 
    RemoveLocation = { Female = {"Hands","Neck", "Mask"}, Male = {"Hands", "Mask"} }
}

clothingDefinitions.veteran = {
    Female = {
        Eyes = { remove = {"Base.Glasses_Shooting"}},
        Hat = { remove = {"Base.Hat_BeretArmy"}, chance = 10,},
        TankTop = { items = {"Base.Vest_DefaultTEXTURE_TINT"}, chance = 100},   
        Tshirt = {items = {"Base.Tshirt_Rock"}, remove ={"Base.Tshirt_Profession_VeterenGreen", "Base.Tshirt_Profession_VeterenRed"}, chance = 70},      
        Shirt =  { items = { }, remove = {"Base.Shirt_CamoGreen"}, chance = 100},
        Pants = { items = {"Base.Shorts_CamoGreenLong", "Base.Trousers_CamoDesert", "Base.Trousers_CamoGreen"}, chance = 100},
        Necklace = { items = {"Base.Necklace_DogTag"}, chance = 100},
        Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}, chance = 100},
    },
    Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap"}, chance = 40 }, 
                Tshirt = {items = {"Base.Tshirt_Rock", "Base.Tshirt_DefaultTEXTURE_TINT"}, chance = 70},             
            }
   } 
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
        Shoes = { items = {"Base.Shoes_ArmyBoots"}, chance = 100},
     },
     Special = { 
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap", "Base.Hat_Beany"}, chance = 10 }
            }
     }
}

clothingDefinitions.fitnessInstructor = {
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
                Hat = { items = {"Base.Hat_BaseballCap","Base.Hat_Sweatband"}, chance = 10 }
            }
       }
}

clothingDefinitions.burgerflipper = {
     Female = {
          Hat = { items = {"Base.Hat_FastFood", "Base.Hat_FastFood_Spiffo"}, chance = 100},
          TankTop = { items = {"Base.Vest_DefaultTEXTURE_TINT"}, chance = 100},
          Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Shorts_ShortDenim", "Base.Shorts_ShortFormal"}, chance = 100},
          Tshirt = { items = {"Base.Tshirt_Rock", "Base.Tshirt_DefaultTEXTURE_TINT", "Base.Tshirt_BusinessSpiffo"}, chance = 100},
          Shirt = { items = { }, chance = 100},
          Shoes = { items = {"Base.Shoes_TrainerTINT"}, chance = 100},
     }
}

clothingDefinitions.electrician = {
     Female = {
       Eyes = { remove = {"Base.Glasses_SafetyGoggles"}},
       Pants = { items = {"Base.Trousers_Denim"}, chance = 100},
       Shirt = { items = {"Base.Shirt_Denim", "Base.Shirt_Lumberjack"}, chance = 100}
     },
     RemoveLocation = { Female = {"Mask", "TorsoExtra"} },
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
           Neck = { items = {"Base.Tie_Full"}, chance = 30 },
	  },
      RemoveLocation = { Female = {"TorsoExtra","Neck"}, Male = {"TorsoExtra"} },
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
          Shirt = { items = {"Base.Shirt_Denim"}, remove = {"Base.Shirt_Lumberjack"}, chance = 100}
       },
       RemoveLocation = { Female = {"Mask", "TorsoExtra"} },
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
          Shirt = { items = { }, chance = 100}
       },
       RemoveLocation = { Female = {"Mask"} },
       Special = {
            Female = {
                Hat = { items = {"Base.Hat_Bandana", "Base.Hat_BaseballCap"}, chance = 10 }
            }
       }
}

--------------------------------------------------- new professions


clothingDefinitions.rasTeacher = {
      Female = {
          Hat = { items = { }},
          Eyes = {items = {"Base.Glasses_Normal"}, chance = 40, },
          Tshirt = {items = {"Base.Tshirt_DefaultTEXTURE_TINT", "Base.Tshirt_PoloStripedTINT", "Base.Tshirt_PoloTINT", "Base.Tshirt_WhiteLongSleeveTINT"}, chance = 100},
          Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Trousers_Black"}, chance = 100},
          Skirt = { items = {"Base.Skirt_Knees", "Base.Skirt_Long", "Base.Skirt_Normal",}, chance = 50,},
          Dress = { items = {"Base.Dress_Normal", "Base.Dress_Knees", "Base.Dress_Long"}, chance = 10, },
          UnderwearExtra1 = { items = {"Base.TightsBlack", "Base.TightsBlackTrans", "Base.TightsBlackSemiTrans"}, chance = 30 },
      },
      Male = {
          Hat = { items = { }},
          Eyes = {items = {"Base.Glasses_Normal"}, chance = 40, },
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

clothingDefinitions.rasWasteCollector = {
       Female = {
          Pants = { items = {"Base.Trousers_JeanBaggy"}},
          Shoes = { items = {"Base.Shoes_ArmyBoots"}},
          Shirt = { items = {"Base.Shirt_Denim"}},
          TorsoExtra = { items = {"Base.Vest_HighViz"}},
       },
       Special = {
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap", "Base.Hat_Visor_WhiteTINT"}, chance = 10 }
            }
       }
}

clothingDefinitions.rasStudent = {
      Female = {
         Back = { items = {"Base.Bag_Schoolbag"}}, 
         Tshirt = { items = {"Base.Tshirt_Rock", "Base.Tshirt_DefaultDECAL_TINT"}, chance = 30},
      },   
      Special = {
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap", "Base.Hat_BucketHat", "Base.Hat_Fedora", "Base.Hat_Visor_WhiteTINT"}, chance = 20 }
            }
       }
}

clothingDefinitions.rasDeliveryDriver = {
      Female = {
         TankTop = { items = {"Base.Vest_DefaultTEXTURE_TINT"}},
         Hat = { items = {"Base.Hat_BaseballCap"}},
         Tshirt = { items = {"Base.Tshirt_Rock", "Base.Tshirt_DefaultDECAL_TINT"}, chance = 30},
         Shirt = { items = {}},
         Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Shorts_ShortDenim", "Base.Shorts_ShortFormal"}},
         Shoes = { items = {"Base.Shoes_TrainerTINT"}},
      },
}

clothingDefinitions.rasLibrarian = {
     Female = {
        Eyes = { items = {"Base.Glasses_Normal", "Base.Glasses_Reading"}},
        Hat = { items = { }},
        Tshirt = {items = {"Base.Tshirt_DefaultTEXTURE_TINT", "Base.Tshirt_PoloStripedTINT", "Base.Tshirt_PoloTINT", "Base.Tshirt_WhiteLongSleeveTINT"}, chance = 100},
        Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Trousers_Black"}, chance = 100},
        Skirt = { items = {"Base.Skirt_Knees", "Base.Skirt_Long", "Base.Skirt_Normal",}, chance = 50,},
        Dress = { items = {"Base.Dress_Normal", "Base.Dress_Knees", "Base.Dress_Long"}, chance = 10, },
        UnderwearExtra1 = { items = {"Base.TightsBlack", "Base.TightsBlackTrans", "Base.TightsBlackSemiTrans"}, chance = 30 },
      },
      Male = {
          Hat = { items = { }},
          Eyes = { items = {"Base.Glasses_Normal", "Base.Glasses_Reading"}},
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

clothingDefinitions.rasPriest = {
     Female = {
        Hat = { items = { }},
        Pants = { items = {"Base.Trousers_Suit"}},
        Shoes = { items = {"Base.Shoes_Random"}},
        Shirt = { items = {"Base.Shirt_Priest"}},
     }
}

-- tailor has no special clothing

clothingDefinitions.rasITProf = {
     Female = {
        Eyes = { items = {"Base.Glasses_Normal"}},
        Shirt = { items = {"Base.Shirt_FormalTINT", "Base.Shirt_FormalWhite_ShortSleeveTINT"}},
        Tshirt = { items = {"Base.Tshirt_IndieStoneDECAL"}},
        LeftWrist = { items = {"Base.WristWatch_Left_DigitalBlack"}},
        Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Shorts_ShortDenim", "Base.Shorts_ShortFormal"}},
        Skirt = { items = {"Base.Skirt_Knees", "Base.Skirt_Long", "Base.Skirt_Mini", "Base.Skirt_Normal", "Base.Skirt_Short"}, chance = 50},
     },
     Male = {
        Eyes = { items = {"Base.Glasses_Normal"}},
        Shirt = { items = {"Base.Shirt_FormalTINT", "Base.Shirt_FormalWhite_ShortSleeveTINT"}},
        Tshirt = { items = {"Base.Tshirt_IndieStoneDECAL"}},
        LeftWrist = { items = {"Base.WristWatch_Left_DigitalBlack"}},
     },
     Special = {
            Female = {
                Hat = { items = {"Base.Hat_BaseballCap", "Base.Hat_BucketHat", "Base.Hat_Fedora"}, chance = 10 }
            }
      }
}

clothingDefinitions.rasArchitect = {      
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


clothingDefinitions.rasVeterinarian = {
      Female = {
           Tshirt = { items = {"Base.Tshirt_DefaultTEXTURE_TINT", "Base.Tshirt_WhiteLongSleeveTINT", "Base.Tshirt_PoloStripedTINT", "Base.Tshirt_PoloTINT"}, chance = 100},
           Pants = { items = {"Base.Trousers_DefaultTEXTURE_TINT", "Base.Trousers_Denim", "Base.Shorts_LongDenim", "Base.Shorts_ShortDenim", "Base.Shorts_ShortFormal"}, chance = 100 },           
           Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}, chance = 100},
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


clothingDefinitions.rasOfficeEmployee = {
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




clothingDefinitions.rasHomeless = {
    Female = {
             TankTop = { items = { }},
             Hat = { items = {"Base.Hat_Beany"}},
             Jacket = { items = {"Base.JacketLong_Random"}},
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
             Jacket = { items = {"Base.JacketLong_Random"}},
             Shirt = { items = { }},
             Tshirt= { items = {"Base.Tshirt_DefaultTEXTURE_TINT"}},
             Pants = { items = {"Base.Trousers_Denim"}},
             Shoes = { items = {"Base.Shoes_Random", "Base.Shoes_TrainerTINT"}},
             Hands = { items = {"Base.Gloves_FingerlessGloves"}},
   }
}

clothingDefinitions.rasGangMember = {
   Female = {
             Hat = { items = {"Base.Hat_Bandana"}},
             Shirt = { items = {"Base.Shirt_Lumberjack"}},
             Tshirt = { items = {"Base.Tshirt_DefaultDECAL_TINT", "Base.Tshirt_Rock"}},
             Pants = { items = {"Base.Trousers_JeanBaggy", "Base.Shorts_CamoUrbanLong", "Base.Trousers_CamoUrban"}},
             Socks = { items = {"Base.Socks_Ankle"}},
             Shoes = { items = {"Base.Shoes_TrainerTINT"}},
   }
}

clothingDefinitions.rasMailCarrier = {
   Female = {
             Hat = { items = {"Base.Hat_BaseballCap"}},
             Shirt = { items = {"Base.Shirt_FormalWhite_ShortSleeve"}},
             Tshirt = { items = {"Base.Tshirt_DefaultTEXTURE_TINT"}},
             Pants = { items = {"Base.Shorts_ShortFormal"}},
             Back = { items = {"Base.Bag_Satchel"}},
   }, 
}

clothingDefinitions.rasPharmacist = {
   Female = {
        Hat = { items = { }},
        Tshirt = { items = { }},
        Pants = { items = {"Base.Trousers_SuitTEXTURE", "Base.Trousers_Suit"}},
        Shirt = { items = {"Base.Shirt_FormalTINT"}},
        Jacket = { items = {"Base.JacketLong_Doctor"}},
        Shoes = { items = {"Base.Shoes_Random"}},
        UnderwearExtra1 = { items = {"Base.TightsBlack", "Base.TightsBlackTrans", "Base.TightsBlackSemiTrans"}, chance = 30},
        Necklace = { items = {"Base.Necklace_Gold", "Base.Necklace_GoldRuby", "Base.Necklace_Silver", "Base.Necklace_Pearl", "Base.NecklaceLong_Gold", "Base.NecklaceLong_Silver"}},
   },
   Male = {
        Hat = { items = { }},
        Tshirt = { items = { }},
        Pants = { items = {"Base.Trousers_Suit"}},
        Shirt = { items = {"Base.Shirt_FormalWhite"}},
        Jacket = { items = {"Base.JacketLong_Doctor"}},
        Shoes = { items = {"Base.Shoes_Random"}},
  },
}



clothingDefinitions.rasRetired = {
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
local function createNewClothingTable(profession)
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
local function createAllClothingTables()

   for profession,_ in pairs(clothingDefinitions) do   
        createNewClothingTable(profession)
   end
end


Events.OnGameBoot.Add(createAllClothingTables)


return clothingDefinitions









