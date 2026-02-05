-------- spawn points muldraugh
--
--
-- by razab






local rasSharedData = require("RasProfessionsSharedData")

rasSharedData.Spawns.Muldraugh = { 

------- vanilla professions

   
  unemployed = {
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
  },
  
  
  fireofficer = {
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    {worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 34, posX = 62, posY = 47 }, -- small house (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { posX = 10912, posY = 10092, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },
 
  
  policeofficer = {
    { worldX = 35, worldY = 32, posX = 126, posY = 98 }, -- bank (B42)
    { worldX = 35, worldY = 35, posX = 117, posY = 61 }, -- diner (B42)
    { posX = 10640, posY = 10410, posZ = 1  }, -- police station (B42)
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { worldX = 35, worldY = 33, posX = 163, posY = 183 }, -- small house (near school) (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
    { posX = 10912, posY = 10092, posZ = 0 }, -- large house (B42) (B42)
    { worldX = 35, worldY = 33, posX = 255, posY = 16 }, -- large house (B42)
  },
  
  
  parkranger = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42) 
    { posX = 10883, posY = 9404, posZ = 0 }, -- cabin (B42)
    { posX = 10771, posY = 10434, posZ = 0 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 159, posY = 224 }, -- trailer (isolated) (B42)
    { worldX = 36, worldY = 31, posX = 144, posY = 74 }, -- small house (isolated) (B42)
    { worldX = 36, worldY = 31, posX = 22, posY = 112 }, -- small house (wooden living room) (B42)
    { worldX = 35, worldY = 31, posX = 285, posY = 228 }, -- small house (wooden floor) (B42)
    { worldX = 35, worldY = 32, posX = 283, posY = 113 }, -- small house (wooden interior) (B42)
    { posX = 10817, posY = 9749, posZ = 0 }, -- wooden house (fence, chicken coop) (B42)
    { worldX = 35, worldY = 32, posX = 243, posY = 240 }, -- small house (wooden floor) (B42)
    { worldX = 35, worldY = 31, posX = 201, posY = 57 }, -- large house (B42)
    { posX = 10919, posY = 10132, posZ = 0 }, -- large house (B42)
  },
  
 constructionworker = { 
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 35, posX = 117, posY = 61 }, -- diner (B42)
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
  },
  
  securityguard = {
    { worldX = 35, worldY = 32, posX = 200, posY = 225 }, -- self storage (B42)
    { worldX = 35, worldY = 32, posX = 126, posY = 98 }, -- bank (B42)
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 35, posX = 117, posY = 61 }, -- diner (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { posX = 10884, posY = 10159, posZ = 0 },  -- large house (B42)
    { posX = 10912, posY = 10092, posZ = 0 }, -- large house (B42) (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },

  carpenter = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { worldX = 36, worldY = 31, posX = 22, posY = 112 }, -- small house (wooden living room) (B42)
    { worldX = 35, worldY = 31, posX = 285, posY = 228 }, -- small house (wooden floor) (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },
  
  burglar = {
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
  },

 chef = {
    { worldX = 35, worldY = 31, posX = 116, posY = 258 }, -- chicken (B42)
    { posX = 10603, posY = 10114, posZ = 0 }, -- pizza (B42)
    { worldX = 35, worldY = 31, posX = 106, posY = 174 }, -- burger (B42)
    { worldX = 35, worldY = 35, posX = 124, posY = 33 }, -- restaurant (B42)
    { posX = 10607, posY = 9639, posZ = 0 }, -- spiffos (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 34, posX = 62, posY = 47 }, -- small house (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { worldX = 36, worldY = 33, posX = 119, posY = 231 }, -- large house (B42)
  },
  
  repairman = {
    { posX = 10634, posY = 9986, posZ = 0 }, -- school, janitor room (B42)
    { posX = 10911, posY = 9743, posZ = 0 }, -- motel (B42)
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
  },
  
  rancher = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 36, worldY = 30, posX = 24, posY = 72 }, -- north farm (B42)
    { posX = 10477, posY = 10076, posZ = 0 }, -- west farm (B42)
    { posX = 10858, posY = 9742, posZ = 0 }, -- food market (B42)
    { worldX = 35, worldY = 34, posX = 110, posY = 58 } -- greene's grocery (B42)
  },

  farmer = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 36, worldY = 30, posX = 24, posY = 72 }, -- north farm (B42) 
    { posX = 10477, posY = 10076, posZ = 0 }, -- west farm (B42)
    { posX = 10858, posY = 9742, posZ = 0 }, -- food market (B42)
    { worldX = 35, worldY = 34, posX = 110, posY = 58 } -- greene's grocery (B42)
  },
  
  fisherman = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },
  
  
  doctor = {
    { posX = 10862, posY = 10037, posZ = 0 }, -- medical (B42)
    { worldX = 35, worldY = 32, posX = 153, posY = 115 }, -- small house (with garden) (B42)
    { posX = 10717, posY = 9982, posZ = 0 }, -- small house (near school) (B42)
    { worldX = 35, worldY = 32, posX = 279, posY = 279 }, -- small house (with fence) (B42)
    { posX = 10884, posY = 10159, posZ = 0 },  -- large house (B42)
    { posX = 10912, posY = 10092, posZ = 0 }, -- large house (B42) (B42)
    { worldX = 36, worldY = 33, posX = 116, posY = 233 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },
  
  veteran = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 35, posX = 117, posY = 61 }, -- diner (B42)
    { posX = 10771, posY = 10434, posZ = 0 }, -- trailer (B42)
    { worldX = 35, worldY = 34, posX = 248, posY = 207 }, -- trailer (trash inside, trahsy area) (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 35, worldY = 31, posX = 182, posY = 223 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { worldX = 35, worldY = 34, posX = 219, posY = 9 }, -- small house (B42)
  },
  
  nurse = {
    { posX = 10863, posY = 10042, posZ = 0 }, -- medical (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { posX = 10717, posY = 9982, posZ = 0 }, -- small house (near school) (B42)
    { worldX = 35, worldY = 32, posX = 153, posY = 115 }, -- small house (with garden) (B42)
    { worldX = 35, worldY = 32, posX = 284, posY = 233 }, -- small house (wooden floor) (B42)
    { worldX = 35, worldY = 31, posX = 201, posY = 57 }, -- large house (B42) (B42)
    { worldX = 36, worldY = 33, posX = 116, posY = 233 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },
  
  lumberjack = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 35, posX = 117, posY = 61 }, -- diner (B42)
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { worldX = 35, worldY = 32, posX = 153, posY = 115 }, -- small house (with garden) (B42)
    { worldX = 35, worldY = 31, posX = 285, posY = 228 }, -- small house (wooden floor) (B42)
  },
  
  fitnessinstructor = {
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },
  
  burgerflipper = {
    { posX = 10620, posY = 10554, posZ = 0 }, -- diner (B42)
    { worldX = 35, worldY = 31, posX = 106, posY = 174 }, -- burger (B42)
    { posX = 10607, posY = 9639, posZ = 0 }, -- spiffos (B42)
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 34, posX = 62, posY = 47 }, -- small house (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
  },
  
  electrician = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },
  
  
  engineer = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 32, posX = 189, posY = 84 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { worldX = 35, worldY = 33, posX = 217, posY = 6 }, -- small house (near school) (B42)
    { worldX = 35, worldY = 32, posX = 153, posY = 115 }, -- small house (with garden) (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 31, posX = 201, posY = 57 }, -- large house (B42)
    { worldX = 36, worldY = 31, posX = 175, posY = 140 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },
  
  
  metalworker = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },
    
    
  mechanics = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 31, posX = 108, posY = 110 }, -- car repair (B42)
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  }, 
 
  tailor = {
    { posX = 10611, posY = 10376, posZ = 0 }, -- clothing store (B42) 
    { worldX = 35, worldY = 31, posX = 109, posY = 139 }, -- family fashion (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { worldX = 35, worldY = 32, posX = 284, posY = 233 }, -- small house (wooden floor) (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 36, worldY = 33, posX = 119, posY = 232 }, -- large house (B42)
  },



------- new professions

  rasteacher = {
    { posX = 10613, posY = 9979, posZ = 1 }, -- school (B42)
    { worldX = 35, worldY = 33, posX = 163, posY = 183 }, -- small house (near school) (B42)
    { worldX = 35, worldY = 33, posX = 217, posY = 6 }, -- small house (near school) (B42)
    { posX = 10717, posY = 9982, posZ = 0 }, -- small house (near school) (B42)
    { worldX = 36, worldY = 31, posX = 58, posY = 105 }, -- small house (B42)
    { posX = 10840, posY = 10147 , posZ = 0 }, -- large house (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
    { worldX = 35, worldY = 33, posX = 284, posY = 23 }, -- large house (B42)
  },
  
  rasbotanist = {
    { worldX = 35, worldY = 32, posX = 153, posY = 115 }, -- small house (with garden) (B42)
    { worldX = 36, worldY = 31, posX = 144, posY = 74 }, -- small house (isolated) (B42)
    { posX = 10829, posY = 10283, posZ = 0 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { worldX = 36, worldY = 33, posX = 119, posY = 232 }, -- large house (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 36, worldY = 33, posX = 41, posY = 250 }, -- large house (B42)
    { worldX = 35, worldY = 31, posX = 201, posY = 57 }, -- large house (B42)
  },
  
  raswastecollector = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
  },
  
  rasstudent = {
    { posX = 10606, posY = 10107, posZ = 0 }, -- pizza whirled (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173, posZ = 0 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246, posZ = 0 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 54, posY = 294, posZ = 0 }, -- small house (B42)
    { worldX = 35, worldY = 33, posX = 217, posY = 6 }, -- small house (near school) (B42) (near school) (B42)
    { worldX = 36, worldY = 33, posX = 84, posY = 259, posZ = 0 }, -- large house (B42)
    { posX = 10912, posY = 10092, posZ = 0 }, -- large house (B42)
    { worldX = 36, worldY = 33, posX = 116, posY = 233, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },
  
  rasdeliverydriver = {
    { posX = 10606, posY = 10107, posZ = 0 }, -- pizza whirled (B42)
    { posX = 10607, posY = 9650, posZ = 0 }, -- spiffo's (B42)
    { posX = 10621, posY = 9560, posZ = 0 }, -- chicken (B42)
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
  },
  
  raslibrarian = {
    { posX = 10614, posY = 10371, posZ = 0 }, -- bookshop (B42)
    { worldX = 36, worldY = 31, posX = 144, posY = 74 }, -- small house (isolated) (B42)
    { worldX = 35, worldY = 32, posX = 153, posY = 115 }, -- small house (with garden) (B42)
    { posX = 10829, posY = 10283, posZ = 0 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { worldX = 36, worldY = 33, posX = 119, posY = 232 }, -- large house (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 36, worldY = 33, posX = 41, posY = 250 }, -- large house (B42)
    { worldX = 35, worldY = 31, posX = 201, posY = 57 }, -- large house (B42)
  },
  
  raspriest = {
    { posX = 10729, posY = 9719, posZ = 0 }, -- chapel (B42)
    { posX = 10780, posY = 10189, posZ = 0 }, -- church house (B42)
    { posX = 10750, posY = 10272, posZ = 0 }, -- small house near church (B42)
    { worldX = 35, worldY = 33, posX = 260, posY = 182 }, -- small house near church (B42)
    { worldX = 35, worldY = 32, posX = 271, posY = 86 }, -- small house near chapel (B42)
    { posX = 10717, posY = 9983, posZ = 0 }, -- small house (B42)   
    { posX = 10840, posY = 10147 , posZ = 0 }, -- large house (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
    { worldX = 35, worldY = 33, posX = 284, posY = 23 }, -- large house (B42)
  },
    
  rasitprof = {
    { worldX = 35, worldY = 35, posX = 117, posY = 61 }, -- diner (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (wooden floor) (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { worldX = 36, worldY = 33, posX = 3, posY = 173 }, -- small house (B42)
    { posX = 10840, posY = 10147 , posZ = 0 }, -- large house (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },
  
  rasarchitect = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 32, posX = 189, posY = 84 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { posX = 10912, posY = 10092, posZ = 0 }, -- large house (B42)
    { worldX = 35, worldY = 31, posX = 201, posY = 57 }, -- large house (B42)
    { worldX = 36, worldY = 31, posX = 175, posY = 140 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },
  
  rasveterinarian = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 36, worldY = 34, posX = 52, posY = 84 }, -- small house (B42)
    { worldX = 35, worldY = 33, posX = 217, posY = 6 }, -- small house (near school) (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 66 }, -- large house (B42)
    { worldX = 36, worldY = 31, posX = 220, posY = 121 }, -- large house (wooden floor) (B42)
    { worldX = 35, worldY = 31, posX = 201, posY = 57 }, -- large house (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { posX = 10912, posY = 10092, posZ = 0 }, -- large house (B42)
  },
  
  rasofficeemployee = {
    { posX = 10762, posY = 10548, posZ = 0 }, -- bar (B42)
    { worldX = 35, worldY = 33, posX = 150, posY = 29 }, -- cafeteria (B42)
    { worldX = 35, worldY = 33, posX = 127, posY = 233 }, -- office (B42)
    { worldX = 35, worldY = 32, posX = 127, posY = 93, posZ = 1 }, -- office (knox bank) (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
    { worldX = 36, worldY = 33, posX = 119, posY = 232 }, -- large house (B42)
    { posX = 10912, posY = 10092, posZ = 0 }, -- large house (B42)
  },

  rasartist = {
     { worldX = 35, worldY = 31, posX = 206, posY = 120 }, -- small house (B42)
     { worldX = 36, worldY = 33, posX = 13, posY = 137 }, -- small house (B42)
     { worldX = 35, worldY = 32, posX = 153, posY = 115 }, -- small house (with garden) (B42)
     { worldX = 36, worldY = 31, posX = 22, posY = 112 }, -- small house (wooden living room) (B42)
     { worldX = 35, worldY = 33, posX = 291, posY = 172 }, -- medium 2-story house (B42)
     { posX = 10884, posY = 10159, posZ = 0 }, -- large house (B42)
     { worldX = 35, worldY = 31, posX = 201, posY = 57 }, -- large house (B42)
     { worldX = 36, worldY = 33, posX = 119, posY = 231 }, -- large house (B42)
  },

  rashomeless = {
    { worldX = 35, worldY= 34, posX = 251, posY = 245 }, -- abandoned trailer (B42) 
    { posX = 10907, posY = 9648, posZ = 0 },   -- abandoned trailer (B42)
    { worldX = 36, worldY= 33, posX = 111, posY = 116 }, -- abandoned house (B42)
    { worldX = 35, worldY= 33, posX = 294, posY = 85 },  -- abandoned house (B42)
  },
  
  rasgangmember = {
    { worldX = 35, worldY = 31, posX = 110, posY = 176 }, -- burger (B42)
    { posX = 10888, posY = 9681, posZ = 0 }, -- trailer (B42)
    { worldX = 35, worldY = 34, posX = 248, posY = 207 }, -- trailer (trash inside, trahsy area) (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 35, worldY = 31, posX = 182, posY = 223 }, -- small house (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { worldX = 35, worldY = 34, posX = 219, posY = 9 }, -- small house (B42)
    { worldX = 35, worldY = 31, posX = 251, posY = 228 }, -- small house (B42)
  },
  
  rasmailcarrier = {
    { worldX = 35, worldY = 35, posX = 117, posY = 61 }, -- diner (B42)
    { worldX = 36, worldY = 31, posX = 72, posY = 189 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42)
    { worldX = 35, worldY = 34, posX = 248, posY = 207 }, -- trailer (trash inside, trahsy area) (B42)
    { posX = 10855, posY = 9896, posZ =0 }, -- small house (B42)
    { posX = 10911, posY = 9995, posZ = 0 }, -- small house (US flag, trashy garden) (B42)
    { worldX = 35, worldY = 32, posX = 189, posY = 84 }, -- small house (B42)
    { worldX = 36, worldY = 32, posX = 51, posY = 246 }, -- small house (B42)
    { posX = 10717, posY = 9983, posZ = 0 }, -- small house (B42) 
  },
  
  raspharmacist = {
    { worldX = 35, worldY = 31, posX = 206, posY = 120 }, -- small house (B42)
    { worldX = 35, worldY = 32, posX = 153, posY = 115 }, -- small house (with garden) (B42)
    { posX = 10717, posY = 9982, posZ = 0 }, -- small house (near school) (B42)
    { worldX = 35, worldY = 32, posX = 279, posY = 279 }, -- small house (with fence) (B42)
    { posX = 10884, posY = 10159, posZ = 0 },  -- large house (B42)
    { worldX = 36, worldY = 33, posX = 116, posY = 233 }, -- large house (B42)
    { worldX = 35, worldY = 31, posX = 201, posY = 57 }, -- large house (B42)
    { worldX = 35, worldY = 32, posX = 186, posY = 64 }, -- large house (B42)
  },

  rasretired = {
    { worldX = 35, worldY = 35, posX = 117, posY = 61 }, -- diner (B42)
    { worldX = 35, worldY = 34, posX = 251, posY = 221 }, -- trailer (B42)
    { worldX = 36, worldY = 31, posX = 151, posY = 190 }, -- trailer (B42)
    { worldX = 36, worldY = 32, posX = 176, posY = 185 }, -- trailer (B42) 
    { worldX = 36, worldY = 33, posX = 13, posY = 137 }, -- small house (B42)
    { posX = 10887, posY = 9886, posZ = 0 }, -- small house (B42) 
    { worldX = 35, worldY = 33, posX = 163, posY = 183 }, -- small house (near school) (B42)
    { posX = 10717, posY = 9905, posZ = 0 }, -- medium house (B42)
    { posX = 10830, posY = 10283, posZ = 0 }, -- medium house (B42) 
    { worldX = 35, worldY = 33, posX = 291, posY = 172 }, -- medium 2-story house (B42)
  },

  
}








