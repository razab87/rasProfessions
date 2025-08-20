


-------------------- FOR PLAYERS/GENERAL AUDIENCE ---------------------


This mod adds new professions and occupations and makes some changes to the vanilla ones. Each profession may come with special traits, skills, starting equipment, clothing and/or starting positions.

For a detailed description of the mod's content, see the page in the steam workshop: https://steamcommunity.com/sharedfiles/filedetails/?id=2675128168&searchtext=


------------------------- UPDATE NOTES ---------------------------- 


- 1.0: first version

- 1.0.1: changed poster; changed readme file; changed one insignificant line in a spawnpoints.lua file (gives priest an additional spawnpoint which was by accident commented out in earlier version)

- 1.1: three new professions: gang member, mail carrier, pharmacist; ui and icon enhancements; some small balance tweaks; some profession cannot choose inappropriate traits anymore (for example, doctor cannot choose the illiterate trait) 

- 1.1.1: some small balance tweaks; changed two spawnpoints for office employee in West Point

- 1.1.2: some small balance tweaks; changed a lot of code in order to increase compatibility with other mods (without affecting gameplay); as always, the update should be fully save game compatible; the only issue is that the info screen of your current character won't show the profession icon anymore; sorry for that but this was unavoidable due to the necessary changes in the code; the icon will be shown again for your next character

- 1.2: yet another code overhaul to increase stability and compatibility with other mods; vanilla professions are not disabled anymore but just modified; removed some chunks of code which I've taken (and modified) from "Profession Framework" by Fenris_Wolf; corrected some sub-optimal interface stuff; added some new details here and there; seems to be fully save game compatible in single palyer; for some of the professions, their professions icon isn't shown anymore in your current save game although they keep all their stats etc.; the profession icons will be back in your next run; for multiplayer I am not an expert but a server restart is always a good idea in case you have problems after the update

- 1.2.1: fixed a problem related to the colored version of the formal shirt; added german translation; added framework for translations to other languages

- 1.2.2: renamed "office employee" to "office worker"; fixed some professions getting weird clothing combinations when pressing the random button in Character Customisation screen (this problem has been introduced in one of the recent vanilla updates); renamed a few clothing items for better interface behavior during character customisation; made it so that the game doesn't assign inappropriate hair styles to a profession (the hair styles can still be choosen manually if desired); fixed typo in german translation; re-organized coding used for translations; nerfed engineer profession

- 1.2.3: fixed typo in display name of a shirt

- 1.3: added new profession: Retired; small visual improvements for some of the icons; excluded botantist from taking the illiterate trait

- 1.4 (current): better organization of the lua code; updated the mod to B42; in B42: new profession "Artist"; some rebalancing of the professions given the new balancing of the vanilla traits; deleted modded "Tailor" 
profession since it is now part of vanilla; several new clothing options and starting items options for some professions; added spawn points for Echo Creek; new spawn system: characters are now manually teleported to their starting point (advantages: no new map folders required, better compatibility with the upcoming b42 multiplayer); added some sandbox otion; special trait for architect: better durability for contructed doors and walls



------------------------- TECHNICAL/FOR MODDERS/MISC -------------------------


All the coding is my own work (based on The Indie Stone's Project Zomboid code ofc). 

Some of the professions added by this mod can also be found in other mods like "Dub's Profession Mod" or "Bef's Professions and Traits". (Have a look at them in the steam workshop!) The professions in this mod differ quite a lot in features like balancing, clothes, equipment etc.

Vanilla code is not overwritten. In some cases, vanilla functions and data are modified using contructions like

local old_vanillaFunction = vanillaFunction
function vanillaFunction(...)
         old_vanillaFunction(...) -- execute the vanilla function
         
         --[[ my new code ]]--
end
  
The mod also changes the display name of a few clothing items for better interface behavior. See this mod's file lua/shared/RasProfessionsOnStart.lua.

         
---------------------- LANGUAGE AND TRANSLATION ---------------------------------


This mod is available in English and German. Additional translations are welcome, in case you would like to make one. Feel free to ask in the comment section of the mod's workshop page.


----------------------- DISCLAIMER -------------------------------


I consider all my mods to be open source. As long as you do not publish a plain copy of the mod to the steam workshop, feel free to use any element of it, modify to your liking and share with the community! 


-----------------------


by razab, August 20, 2025







