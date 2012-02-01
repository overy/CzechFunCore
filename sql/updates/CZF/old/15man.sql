-- naxxramas
update creature_template set dmg_multiplier=53,Health_mod=713 where entry=30061;
update creature_template set dmg_multiplier=53,Health_mod=618 where entry=29991;
update creature_template set dmg_multiplier=53,Health_mod=1228 where entry=29448;
update creature_template set dmg_multiplier=53,Health_mod=403 where entry=29417;
update creature_template set dmg_multiplier=53,Health_mod=448 where entry=29373;
update creature_template set dmg_multiplier=53,Health_mod=623 where entry=29324;
update creature_template set dmg_multiplier=53,Health_mod=113 where entry=30601;
update creature_template set dmg_multiplier=53,Health_mod=113 where entry=16064;
update creature_template set dmg_multiplier=53,Health_mod=113 where entry=30600;
update creature_template set dmg_multiplier=53,Health_mod=113 where entry=30602;
update creature_template set dmg_multiplier=53,Health_mod=120 where entry=29955;
update creature_template set dmg_multiplier=53,Health_mod=483 where entry=29940;
update creature_template set dmg_multiplier=53,Health_mod=965 where entry=29718;
update creature_template set dmg_multiplier=53,Health_mod=443 where entry=29701;
update creature_template set dmg_multiplier=53,Health_mod=403 where entry=29615;
update creature_template set dmg_multiplier=53,Health_mod=362 where entry=29278;
update creature_template set dmg_multiplier=53,Health_mod=323 where entry=29268;
update creature_template set dmg_multiplier=53,Health_mod=323 where entry=29249;
	
-- OBS
update creature_template set dmg_multiplier=53,Health_mod=115 where entry=31534;
update creature_template set dmg_multiplier=53,Health_mod=115 where entry=31520;
update creature_template set dmg_multiplier=53,Health_mod=115 where entry=31535;
update creature_template set dmg_multiplier=53,Health_mod=365 where entry=31311;
	
-- VOA
update creature_template set dmg_multiplier=53,Health_mod=440 where entry=31722;
update creature_template set dmg_multiplier=53,Health_mod=500 where entry=33994;
update creature_template set dmg_multiplier=53,Health_mod=625 where entry=35360;
update creature_template set dmg_multiplier=53,Health_mod=680 where entry=38462;
update creature_template set dmg_multiplier=53,Health_mod=11 where entry=3845601;
	
-- Onyxia 
update creature_template set dmg_multiplier=53,Health_mod=975 where entry=36538;

-- TOC - 25man normal
-- ################################## gormok ###################################

-- 25 normal
UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '400' WHERE `creature_template`.`entry` =35438;

-- 25 hc
UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '525' WHERE `creature_template`.`entry` =35440;

-- ### Snobold Vassal ###

-- 25 normal
UPDATE `creature_template` SET `dmg_multiplier` = '16.5',`Health_mod` = '25' WHERE `creature_template`.`entry` =35441;

-- 25 hc
UPDATE `creature_template` SET `dmg_multiplier` = '24',`Health_mod` = '42' WHERE `creature_template`.`entry` =35443;


-- ######################## acid ########################

-- 25 normal
UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '225' WHERE `creature_template`.`entry` =35511;

-- 25 hc
UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '300' WHERE `creature_template`.`entry` =35513;

-- ######################## dred ########################

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '225' WHERE `creature_template`.`entry` =35514;

-- 25 hc 

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '300' WHERE `creature_template`.`entry` =35516;

-- ######################## icehowl #####################

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '600' WHERE `creature_template`.`entry` =35447;

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '800' WHERE `creature_template`.`entry` =35449;


-- ######################## lord jar. ###################

-- 25 normal
UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '875' WHERE `creature_template`.`entry` =35216;

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '1140' WHERE `creature_template`.`entry` =35269;

--  ### Felflame Infernal ###

-- 25 normal
UPDATE `creature_template` SET `dmg_multiplier` = '16.5',`Health_mod` = '11' WHERE `creature_template`.`entry` =35262;

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '24',`Health_mod` = '15' WHERE `creature_template`.`entry` =35264;

--  ### Mistress of Pain ###

-- 25 normal
UPDATE `creature_template` SET `dmg_multiplier` = '16.5',`Health_mod` = '47.5' WHERE `creature_template`.`entry` =35270;

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '24',`Health_mod` = '47.5' WHERE `creature_template`.`entry` =35272;




-- #################################  championi #######################################################################

-- ### DK ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '112' WHERE `creature_template`.`entry` IN (35743,35692);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '152' WHERE `creature_template`.`entry` IN (35745,35694);

-- ### balance druid ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '112' WHERE `creature_template`.`entry` IN (35671,35702);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '152' WHERE `creature_template`.`entry` IN (35673,35704);

-- ### resto druid ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '112' WHERE `creature_template`.`entry` IN (35714,35686);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '152' WHERE `creature_template`.`entry` IN (35716,35688);

-- ### hunter ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '112' WHERE `creature_template`.`entry` IN (35662,35724);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '152' WHERE `creature_template`.`entry` IN (35664,35726);

-- ### mage ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '90' WHERE `creature_template`.`entry` IN (35721,35689);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '135' WHERE `creature_template`.`entry` IN (35723,35691);

-- ### holy paladin ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '112' WHERE `creature_template`.`entry` IN (35746,35705);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '152' WHERE `creature_template`.`entry` IN (35748,35707);

-- ### re3 paladin ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '112' WHERE `creature_template`.`entry` IN (35668,35708);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '152' WHERE `creature_template`.`entry` IN (35670,35710);

-- ### disci priest ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '90' WHERE `creature_template`.`entry` IN (35665,35683);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '135' WHERE `creature_template`.`entry` IN (35667,35685);

-- ### shadow priest ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '90' WHERE `creature_template`.`entry` IN (35674,34442);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '135' WHERE `creature_template`.`entry` IN (35676,35749);

-- ### rogue ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '112' WHERE `creature_template`.`entry` IN (35699,35711);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '152' WHERE `creature_template`.`entry` IN (35701,35713);

-- ### enha shaman ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '112' WHERE `creature_template`.`entry` IN (35734,35680);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '152' WHERE `creature_template`.`entry` IN (35736,35682);

-- ### resto shaman ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '112' WHERE `creature_template`.`entry` IN (35728,35740);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '152' WHERE `creature_template`.`entry` IN (35730,35742);

-- ### warlock ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '90' WHERE `creature_template`.`entry` IN (35731,35695);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '135' WHERE `creature_template`.`entry` IN (35733,35697);

-- ### warrior ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '112' WHERE `creature_template`.`entry` IN (35718,35737);

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '152' WHERE `creature_template`.`entry` IN (35720,35739);

-- #########################################      konec championu           ##################################################


-- ### Fjola ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '1217' WHERE `creature_template`.`entry` =35350;

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '1700' WHERE `creature_template`.`entry` =35352;

-- ### Eydis ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '1217' WHERE `creature_template`.`entry` =35347;

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '1700' WHERE `creature_template`.`entry` =35349;

-- ######################################### Anub ########################################

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '95',`Health_mod` = '900' WHERE `creature_template`.`entry` =34566;

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '120',`Health_mod` = '1170' WHERE `creature_template`.`entry` =35616;


-- ### Nerubian Burrower ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '16.5',`Health_mod` = '32' WHERE `creature_template`.`entry` =34648;

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '24',`Health_mod` = '36' WHERE `creature_template`.`entry` =35656;

-- ### Swarm Scarab ###

-- 25 normal

UPDATE `creature_template` SET `dmg_multiplier` = '16.5',`Health_mod` = '5' WHERE `creature_template`.`entry` =34650;

-- 25 hc

UPDATE `creature_template` SET `dmg_multiplier` = '24',`Health_mod` = '7' WHERE `creature_template`.`entry` =35659;


