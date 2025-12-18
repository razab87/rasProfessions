-- Echo Creek spawn points
--
--
-- by razab


local rasSharedData = require("RasProfessionsSharedData")


rasSharedData.Spawns.EchoCreek = { 

------------------------------ vanilla professions ----------------------------------------


    unemployed = {
      { posX = 3425, posY = 10910, posZ = 0 }, -- trailer, north west, wooden entrance
      { posX = 3529, posY = 10910, posZ = 0 }, -- trailer, south, large us falg
      { posX = 3461, posY = 11008, posZ = 0 }, -- small house, north central, metal fence, garage, little dirty
      { posX = 3580, posY = 11135, posZ = 0 }, -- small house, south, metal fence, painting
      { posX = 3710, posY = 10956, posZ = 0 }, -- medium house, far south, near auto repair, metal fence, garage
    },

    fireofficer = {
      { posX = 3461, posY = 10908, posZ = 0 }, -- black trailer
      { posX = 3536, posY = 11047, posZ = 0 }, -- small house, south central, wodden fence, large property
      { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
      { posX = 3578, posY = 11167, posZ = 0 }, -- medium house, south, near graveyard 
      { posX = 3463, posY = 10979, posZ = 0 }, -- 2-story house, north central, fancy walls, near construction side
    },

    policeofficer = {
      { posX = 3580, posY = 11135, posZ = 0 }, -- small house, south, metal fence, painting
      { posX = 3580, posY = 10978, posZ = 0 }, -- medium house, south, metal&wooden fence, wooden floor
      { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
      { posX = 3747, posY = 10996, posZ = 0 }, -- 2-story house, far south, white fence
      { posX = 3460, posY = 11047, posZ = 0 }, -- 2-story house, north central, no fence, blue table garden
    },

    parkranger = {
      { posX = 3494, posY = 10883, posZ = 0 }, -- trailer, center east, painting, wooden table garden 
      { posX = 3425, posY = 10882, posZ = 0 }, -- trailer, north, small us flag 
      { posX = 3394, posY = 11006, posZ = 0 }, -- small house, north, no fence, near farmland 
      { posX = 3570, posY = 11314, posZ = 0 }, -- medium house, far west, wooden entrance 
      { posX = 3680, posY = 10957, posZ = 0 }, -- small 2-story house, far south, no fence
    },

    constructionworker = {
      { posX = 3511, posY = 10903, posZ = 0 }, -- trailer, south west, wooden entrance, no flag 
      { posX = 3425, posY = 10910, posZ = 0 }, -- trailer, north west, wooden entrance
      { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
      { posX = 3544, posY = 11006, posZ = 0 }, -- medium house, central, purple walls, toy garden
      { posX = 3463, posY = 10979, posZ = 0 }, -- 2-story house, north central, fancy walls, near construction side
    },

    securityguard = {
      { posX = 3425, posY = 10910, posZ = 0 }, -- trailer, north west, wooden entrance
      { posX = 3461, posY = 10908, posZ = 0 }, -- black trailer
      { posX = 3461, posY = 11008, posZ = 0 }, -- small house, north central, metal fence, garage, little dirty
      { posX = 3536, posY = 11109, posZ = 0 }, -- medium house, south, partial wooden fence
      { posX = 3580, posY = 10978, posZ = 0 }, -- medium house, south, metal&wooden fence, wooden floor
    },

    carpenter = {
      { posX = 3511, posY = 10903, posZ = 0 }, -- trailer, south west, wooden entrance, no flag
      { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
      { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
      { posX = 3579, posY = 11111, posZ = 0 }, -- medium house, south, no fence, garden toys
      { posX = 3485, posY = 10981, posZ = 0 }, -- 2-story house, central, wooden patio
    },

    burglar = {
      { posX = 3494, posY = 10883, posZ = 0 }, -- trailer, center east, painting, wooden table garden
      { posX = 3442, posY = 10901, posZ = 0 }, -- trailer, north, little dirty, garden shack
      { posX = 3461, posY = 11008, posZ = 0 }, -- small house, north central, metal fence, garage, little dirty
      { posX = 3536, posY = 11047, posZ = 0 }, -- small house, south central, wodden fence, large property
      { posX = 3680, posY = 10957, posZ = 0 }, -- small 2-story house, far south, no fence
    },

    chef = {
      { posX = 3511, posY = 10903, posZ = 0 }, -- trailer, south west, wooden entrance, no flag
      { posX = 3580, posY = 11135, posZ = 0 }, -- small house, south, metal fence, painting
      { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
      { posX = 3747, posY = 10996, posZ = 0 }, -- 2-story house, far south, white fence
      { posX = 3567, posY = 10898, posZ = 0 }, -- diner, kitchen
    },

    repairman = {
      { posX = 3529, posY = 10910, posZ = 0 }, -- trailer, south, large us falg
      { posX = 3394, posY = 11006, posZ = 0 }, -- small house, north, no fence, near farmland 
      { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
      { posX = 3544, posY = 11006, posZ = 0 }, -- medium house, central, purple walls, toy garden
      { posX = 3537, posY = 11138, posZ = 0 }, -- 2-story house, south, fence, garage, little dirty, near church
    },

    rancher = { -- cattle farmer
      { posX = 3744, posY = 11062, posZ = 0 }, -- medium house, far south, near wooden shack      
      { posX = 4174, posY = 11238, posZ = 0 }, -- 2-story house, ultra far south centeral, 2 dog shacks, wooden fence
      { posX = 3736, posY = 11234, posZ = 0 }, -- farm, far south, west, chicken shack
      { posX = 3881, posY = 11591, posZ = 0 }, -- farm, far south, far west, chicken shack
    },

   farmer = { -- crop farmer
      { posX = 3744, posY = 11062, posZ = 0 }, -- medium house, far south, near wooden shack      
      { posX = 4174, posY = 11238, posZ = 0 }, -- 2-story house, ultra far south centeral, 2 dog shacks, wooden fence
      { posX = 3736, posY = 11234, posZ = 0 }, -- farm, far south, west, chicken shack
      { posX = 3881, posY = 11591, posZ = 0 }, -- farm, far south, far west, chicken shack
   },

   fisherman = {
      { posX = 3461, posY = 10908, posZ = 0 }, -- black trailer
      { posX = 3511, posY = 10903, posZ = 0 }, -- trailer, south west, wooden entrance, no flag
      { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
      { posX = 3580, posY = 10978, posZ = 0 }, -- medium house, south, metal&wooden fence, wooden floor
      { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
   },

   doctor = {
      { posX = 3578, posY = 11167, posZ = 0 }, -- medium house, south, near graveyard 
      { posX = 3515, posY = 10980, posZ = 0 }, -- medium house, south central, wooden fence, partioned property 
      { posX = 3460, posY = 11047, posZ = 0 }, -- 2-story house, north central, no fence, blue table garden
      { posX = 3747, posY = 10996, posZ = 0 }, -- 2-story house, far south, white fence
      { posX = 3395, posY = 11075, posZ = 0 }, -- large 2-story house, north west 
   },

   veteran = {
      { posX = 3529, posY = 10910, posZ = 0 }, -- trailer, south, large us falg
      { posX = 3425, posY = 10882, posZ = 0 }, -- trailer, north, small us flag 
      { posX = 3461, posY = 11008, posZ = 0 }, -- small house, north central, metal fence, garage, little dirty
      { posX = 3710, posY = 10956, posZ = 0 }, -- medium house, far south, near auto repair, metal fence, garage
      { posX = 3537, posY = 11138, posZ = 0 }, -- 2-story house, south, fence, garage, little dirty, near church
   },

   nurse = {
      { posX = 3511, posY = 10903, posZ = 0 }, -- trailer, south west, wooden entrance, no flag
      { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
      { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
      { posX = 3579, posY = 11111, posZ = 0 }, -- medium house, south, no fence, garden toys
      { posX = 3485, posY = 10981, posZ = 0 }, -- 2-story house, central, wooden patio
   },

   lumberjack = {
      { posX = 3425, posY = 10910, posZ = 0 }, -- trailer, north west, wooden entrance
      { posX = 3511, posY = 10903, posZ = 0 }, -- trailer, south west, wooden entrance, no flag
      { posX = 3680, posY = 10957, posZ = 0 }, -- small 2-story house, far south, no fence
      { posX = 3580, posY = 10978, posZ = 0 }, -- medium house, south, metal&wooden fence, wooden floor
      { posX = 3744, posY = 11062, posZ = 0 }, -- medium house, far south, near wooden shack
   },

   fitnessinstructor = {
      { posX = 3461, posY = 10908, posZ = 0 }, -- black trailer
      { posX = 3461, posY = 11008, posZ = 0 }, -- small house, north central, metal fence, garage, little dirty
      { posX = 3580, posY = 11135, posZ = 0 }, -- small house, south, metal fence, painting
      { posX = 3710, posY = 10956, posZ = 0 }, -- medium house, far south, near auto repair, metal fence, garage
      { posX = 3544, posY = 11006, posZ = 0 }, -- medium house, central, purple walls, toy garden
   },

   burgerflipper = {
      { posX = 3494, posY = 10883, posZ = 0 }, -- trailer, center east, painting, wooden table garden
      { posX = 3442, posY = 10901, posZ = 0 }, -- trailer, north, little dirty, garden shack
      { posX = 3461, posY = 11008, posZ = 0 }, -- small house, north central, metal fence, garage, little dirty
      { posX = 3394, posY = 11006, posZ = 0 }, -- small house, north, no fence, near farmland 
      { posX = 3567, posY = 10898, posZ = 0 }, -- diner, kitchen
   },

   electrician = {
      { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
      { posX = 3536, posY = 11047, posZ = 0 }, -- small house, south central, wodden fence, large property
      { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
      { posX = 3579, posY = 11111, posZ = 0 }, -- medium house, south, no fence, garden toys
      { posX = 3485, posY = 10981, posZ = 0 }, -- 2-story house, central, wooden patio
   },

   engineer = {
     { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
     { posX = 3578, posY = 11167, posZ = 0 }, -- medium house, south, near graveyard 
     { posX = 3515, posY = 10980, posZ = 0 }, -- medium house, south central, wooden fence, partioned property 
     { posX = 3460, posY = 11047, posZ = 0 }, -- 2-story house, north central, no fence, blue table garden
     { posX = 3747, posY = 10996, posZ = 0 }, -- 2-story house, far south, white fence
   },

   metalworker = {    
      { posX = 3494, posY = 10883, posZ = 0 }, -- trailer, center east, painting, wooden table garden  
      { posX = 3536, posY = 11047, posZ = 0 }, -- small house, south central, wodden fence, large property
      { posX = 3579, posY = 11111, posZ = 0 }, -- medium house, south, no fence, garden toys
      { posX = 3485, posY = 10981, posZ = 0 }, -- 2-story house, central, wooden patio
      { posX = 3680, posY = 10957, posZ = 0 }, -- small 2-story house, far south, no fence
   },

   -- no blacksmith definitions

   mechanics = {
      { posX = 3529, posY = 10910, posZ = 0 }, -- trailer, south, large us falg
      { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
      { posX = 3536, posY = 11047, posZ = 0 }, -- small house, south central, wodden fence, large property
      { posX = 3580, posY = 10978, posZ = 0 }, -- medium house, south, metal&wooden fence, wooden floor
      { posX = 3674, posY = 10893, posZ = 0 }, -- auto repair
   },

   tailor = {
     { posX = 3461, posY = 10908, posZ = 0 }, -- black trailer
     { posX = 3544, posY = 11006, posZ = 0 }, -- medium house, central, purple walls, toy garden
     { posX = 3433, posY = 11007, posZ = 0 }, -- medium house, north, scarecrow
     { posX = 3579, posY = 11111, posZ = 0 }, -- medium house, south, no fence, garden toys 
     { posX = 3680, posY = 10957, posZ = 0 }, -- small 2-story house, far south, no fence
   },


--------------------------- modded professions

  rasteacher = {
    { posX = 3580, posY = 11135, posZ = 0 }, -- small house, south, metal fence, painting
    { posX = 3544, posY = 11006, posZ = 0 }, -- medium house, central, purple walls, toy garden
    { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
    { posX = 3747, posY = 10996, posZ = 0 }, -- 2-story house, far south, white fence
    { posX = 3463, posY = 10979, posZ = 0 }, -- 2-story house, north central, fancy walls, near construction side
  },

  rasbotanist = {
    { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
    { posX = 3433, posY = 11007, posZ = 0 }, -- medium house, north, scarecrow
    { posX = 3570, posY = 11314, posZ = 0 }, -- medium house, far west, wooden entrance 
    { posX = 3578, posY = 11167, posZ = 0 }, -- medium house, south, near graveyard 
    { posX = 3485, posY = 10981, posZ = 0 }, -- 2-story house, central, wooden patio
  },

  raswastecollector = {
    { posX = 3511, posY = 10903, posZ = 0 }, -- trailer, south west, wooden entrance, no flag
    { posX = 3425, posY = 10882, posZ = 0 }, -- trailer, north, small us flag
    { posX = 3394, posY = 11006, posZ = 0 }, -- small house, north, no fence, near farmland
    { posX = 3579, posY = 11111, posZ = 0 }, -- medium house, south, no fence, garden toys
    { posX = 3710, posY = 10956, posZ = 0 }, -- medium house, far south, near auto repair, metal fence, garage
  },

  rasstudent = {
    { posX = 3580, posY = 11135, posZ = 0 }, -- small house, south, metal fence, painting
    { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
    { posX = 3744, posY = 11062, posZ = 0 }, -- medium house, far south, near wooden shack
    { posX = 3485, posY = 10981, posZ = 0 }, -- 2-story house, central, wooden patio
    { posX = 3395, posY = 11075, posZ = 0 }, -- large 2-story house, north west
  },

  rasdeliverydriver = {
    { posX = 3494, posY = 10883, posZ = 0 }, -- trailer, center east, painting, wooden table garden
    { posX = 3425, posY = 10910, posZ = 0 }, -- trailer, north west, wooden entrance
    { posX = 3461, posY = 11008, posZ = 0 }, -- small house, north central, metal fence, garage, little dirty
    { posX = 3394, posY = 11006, posZ = 0 }, -- small house, north, no fence, near farmland 
    { posX = 3579, posY = 11111, posZ = 0 }, -- medium house, south, no fence, garden toys
  },

  raslibrarian = {
    { posX = 3580, posY = 11135, posZ = 0 }, -- small house, south, metal fence, painting
    { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
    { posX = 3544, posY = 11006, posZ = 0 }, -- medium house, central, purple walls, toy garden
    { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
    { posX = 3460, posY = 11047, posZ = 0 }, -- 2-story house, north central, no fence, blue table garden
  },

  raspriest = {
    { posX = 3536, posY = 11047, posZ = 0 }, -- small house, south central, wodden fence, large property
    { posX = 3578, posY = 11167, posZ = 0 }, -- medium house, south, near graveyard 
    { posX = 3536, posY = 11109, posZ = 0 }, -- medium house, south, partial wooden fence
    { posX = 3747, posY = 10996, posZ = 0 }, -- 2-story house, far south, white fence
    { posX = 3539, posY = 11216, posZ = 0 }, -- building near church
  },

  rasitprof = {
    { posX = 3461, posY = 10908, posZ = 0 }, -- black trailer
    { posX = 3461, posY = 11008, posZ = 0 }, -- small house, north central, metal fence, garage, little dirty
    { posX = 3580, posY = 10978, posZ = 0 }, -- medium house, south, metal&wooden fence, wooden floor
    { posX = 3537, posY = 11138, posZ = 0 }, -- 2-story house, south, fence, garage, little dirty, near church
    { posX = 3689, posY = 10896, posZ = 1 }, -- auto repair, office 
  },

  rasarchitect = {
    { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
    { posX = 3536, posY = 11109, posZ = 0 }, -- medium house, south, partial wooden fence
    { posX = 3515, posY = 10980, posZ = 0 }, -- medium house, south central, wooden fence, partioned property 
    { posX = 3463, posY = 10979, posZ = 0 }, -- 2-story house, north central, fancy walls, near construction side
    { posX = 3395, posY = 11075, posZ = 0 }, -- large 2-story house, north west
  },

  rasveterinarian = {
    { posX = 3580, posY = 11135, posZ = 0 }, -- small house, south, metal fence, painting
    { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
    { posX = 3580, posY = 10978, posZ = 0 }, -- medium house, south, metal&wooden fence, wooden floor
    { posX = 3747, posY = 10996, posZ = 0 }, -- 2-story house, far south, white fence  
    { posX = 3485, posY = 10981, posZ = 0 }, -- 2-story house, central, wooden patio 
  },

  rasofficeemployee = {
    { posX = 3579, posY = 11111, posZ = 0 }, -- medium house, south, no fence, garden toys
    { posX = 3544, posY = 11006, posZ = 0 }, -- medium house, central, purple walls, toy garden
    { posX = 3680, posY = 10957, posZ = 0 }, -- small 2-story house, far south, no fence
    { posX = 3460, posY = 11047, posZ = 0 }, -- 2-story house, north central, no fence, blue table garden
    { posX = 3689, posY = 10896, posZ = 1 }, -- auto repair, office 
  },

  rasartist = {
    { posX = 3461, posY = 10908, posZ = 0 }, -- black trailer
    { posX = 3580, posY = 11135, posZ = 0 }, -- small house, south, metal fence, painting
    { posX = 3570, posY = 11314, posZ = 0 }, -- medium house, far west, wooden entrance
    { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
    { posX = 3463, posY = 10979, posZ = 0 }, -- 2-story house, north central, fancy walls, near construction side
  },

  rashomeless = {
    { posX = 3442, posY = 10883, posZ = 0 }, -- abandoned trailer
    { posX = 3515, posY = 11009, posZ = 0 }, -- abandoned house, central
  },

  rasgangmember = {
    { posX = 3442, posY = 10901, posZ = 0 }, -- trailer, north, little dirty, garden shack
    { posX = 3477, posY = 10875, posZ = 0 }, -- trailer, center, boxes
    { posX = 3461, posY = 11008, posZ = 0 }, -- small house, north central, metal fence, garage, little dirty
    { posX = 3394, posY = 11006, posZ = 0 }, -- small house, north, no fence, near farmland
    { posX = 3580, posY = 10978, posZ = 0 }, -- medium house, south, metal&wooden fence, wooden floor
  },

  rasmailcarrier = {
    { posX = 3425, posY = 10910, posZ = 0 }, -- trailer, north west, wooden entrance
    { posX = 3580, posY = 11135, posZ = 0 }, -- small house, south, metal fence, painting
    { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
    { posX = 3544, posY = 11006, posZ = 0 }, -- medium house, central, purple walls, toy garden
    { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
  },

  raspharmacist = {
    { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
    { posX = 3578, posY = 11167, posZ = 0 }, -- medium house, south, near graveyard 
    { posX = 3515, posY = 10980, posZ = 0 }, -- medium house, south central, wooden fence, partioned property 
    { posX = 3744, posY = 11062, posZ = 0 }, -- medium house, far south, near wooden shack
    { posX = 3460, posY = 11047, posZ = 0 }, -- 2-story house, north central, no fence, blue table garden
  },

  rasretired = {
    { posX = 3752, posY = 10954, posZ = 0 }, -- small house, far south, wooden entrance, wooden fence, scarecrow
    { posX = 3580, posY = 11135, posZ = 0 }, -- small house, south, metal fence, painting
    { posX = 3392, posY = 10973, posZ = 0 }, -- medium house, north, wooden entrance, no fence
    { posX = 3580, posY = 10978, posZ = 0 }, -- medium house, south, metal&wooden fence, wooden floor
    { posX = 3485, posY = 10981, posZ = 0 }, -- 2-story house, central, wooden patio
  },

}


