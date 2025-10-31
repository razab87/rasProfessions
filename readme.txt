


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

- 1.4: better organization of the lua code; updated the mod to B42; changes in B42: new profession "Artist"; some rebalancing of the professions given the new balancing of the vanilla traits; deleted modded "Tailor" 
profession since it is now part of vanilla; several new clothing options and starting items options for some professions; added spawn points for Echo Creek; new spawn system: characters are now manually teleported to their starting point (advantages: no new map folders required, better compatibility with the upcoming b42 multiplayer); added some sandbox otions; special trait for architect: better durability for contructed doors and walls

- 1.4.1: new icons for some professions; changes in b42: fixed sandbox option "overhaul vanilla profession"; fixed compatibility with other professions mods (in some cases, unchecking the sandbox option "overhaul vanilla professions" might be required to avoid to mods changing vanilla professions in an inconsistent way; shouldn't result in technical issues though); fixed a small issue in the random character dress-up during character customisation; fixed spawning in dark rooms without light (can still happen when power shutoff); better removal of zombies in spawn house; tried to make it so that spawn houses are never randomized (i.e. not burnt, not barricaded...) but not 100% sure whether it works due to randomization, requires more testing

- 1.4.2: only in B42: made the decal button visible during character creation (required some small re-arragnement of texture and colot buttons to make it work); a few changes to profession clothing; changed body 
location of some clothing so that they behave correctly and can properly be worn together with other clothes (affects short sleeve police and ranger shirts and crop tops)

- 1.4.3: changed icons for delivery driver and botanist; in B42: fixed issue when digging holes 

- 1.4.4: changed icon for retired profession; changes in B42: fixed sometimes not being able to select a modded profession when creating a new character in an already existing save game; fixed zombies sometimes not removed 
from starter house; fixed 2 spawn locations in Echo Creek (i.e. fixed player sometimes spawning in walls, nothing game-breaking but a small visual glitch); added Korean translation (thanks to various steam users for contributing translations!)

- 1.4.5 (current): only applies to B42: fixed profession icons sometimes not shown in-game after loading a game; fixed sometimes not possible to change to a modded professions ingame when playing in debug mode



------------------------- TECHNICAL/FOR MODDERS/MISC -------------------------


All the coding is my own work (based on The Indie Stone's Project Zomboid code ofc). 

Some of the professions added by this mod can also be found in other mods like "Dub's Profession Mod" or "Bef's Professions and Traits". (Have a look at them in the steam workshop!) The professions in this mod differ quite a lot in features like balancing, clothes, equipment etc.

Vanilla code is not overwritten. In some cases, vanilla functions and data are modified using contructions like

local old_vanillaFunction = vanillaFunction
function vanillaFunction(...)

         -- [[ my new code ]]-- 
 
         old_vanillaFunction(...) -- execute the vanilla function
         
         --[[ my new code ]]--
end
  
The mod also changes the display name of a few clothing items for better interface behavior as well as some body locations. See this mod's file lua/shared/RasProfessionsOnStart.lua for more info.

         
---------------------- LANGUAGES ---------------------------------


English, German Korean. Thanks to various steam users for contributing translations! Additional translations are welcome, in case you would like to make one. Just post them on the mod's steam page in the discussion section "Translations" or ask in the comments if you have any questions!


----------------------- LICENSE -------------------------------


Project Zomboid is owned by The Indie Stone. Except for any restrictions imposed by The Indie Stone's modding policy or any third-party content contained in my mods, I consider all my mods to be open source in the sense that as long as you do not publish a plain copy of them on Steam, you are free to use any element of them, modify to your liking and share the results with the public. Note that some of my mods may contain third-party assets. These are either CC0, CC-BY or owned by The Indie Stone. In the latter case, they can only be used in accordance with The Indie Stone's property rights. In case of CC-BY, my mods contain a file listing the sources. Make sure to comply with the CC-BY license in case you want to re-use them.


-----------------------


by razab, Oct 31, 2025







