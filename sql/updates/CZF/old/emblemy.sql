-- world emblemy
delete from gameobject_loot_template where entry in (27081,27498,25192,27086,27074) and item=45624;
delete from creature_loot_template where entry in (33293,32927,32867,33271) and item=45624;
delete from reference_loot_template where entry in (34126,34127) and item=45624;
UPDATE `creature_loot_template` SET `item`=47241 WHERE `item` IN (45624);
UPDATE `gameobject_loot_template` SET `item`=47241 WHERE `item` IN (45624,);
UPDATE `item_loot_template` SET `item`=47241 WHERE `item` IN (45624);
UPDATE `reference_loot_template` SET `item`=47241 WHERE `item` IN (45624);


-- naxxramas HC - triumph 3-5
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (29249,29268,29278,29615,29701,29718,29940,29955,29324,29373,29417,29448,29991,30061);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(29249,47241,100,1,0,3,5), 
(29268,47241,100,1,0,3,5), 
(29278,47241,100,1,0,3,5), 
(29615,47241,100,1,0,3,5),
(29701,47241,100,1,0,3,5), 
(29718,47241,100,1,0,3,5), 
(29940,47241,100,1,0,3,5), 
(29955,47241,100,1,0,3,5), 
(29324,47241,100,1,0,3,5), 
(29373,47241,100,1,0,3,5), 
(29417,47241,100,1,0,3,5), 
(29448,47241,100,1,0,3,5), 
(29991,47241,100,1,0,3,5), 
(30061,47241,100,1,0,3,5);

-- naxxramas - triumph 2-4
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (15956,15953,15952,15954,15936,16011,16061,16060,16028,15931,15932,15928,15989,15990);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(15956,47241,100,1,0,2,4), 
(15953,47241,100,1,0,2,4), 
(15952,47241,100,1,0,2,4), 
(15954,47241,100,1,0,2,4),
(15936,47241,100,1,0,2,4), 
(16011,47241,100,1,0,2,4), 
(16061,47241,100,1,0,2,4), 
(16060,47241,100,1,0,2,4), 
(16028,47241,100,1,0,2,4), 
(15931,47241,100,1,0,2,4), 
(15932,47241,100,1,0,2,4), 
(15928,47241,100,1,0,2,4), 
(15989,47241,100,1,0,2,4), 
(15990,47241,100,1,0,2,4);
	
-- onyxia normal - triumph 4-6 + HC - triumph 6-8
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (10184,36538);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(10184,47241,100,1,0,4,6),  
(36538,47241,100,1,0,6,8);

-- Trial of crusader normal
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (34797,34780,34497,34564);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(34797,47241,100,1,0,6,8),
(34780,47241,100,1,0,6,8),
(34497,47241,100,1,0,6,8),
(34564,47241,100,1,0,6,8);

-- OBS normal
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (30452,30451,30449,28860);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(30452,47241,100,1,0,1,3),
(30451,47241,100,1,0,1,3),
(30449,47241,100,1,0,1,3),
(28860,47241,100,1,0,2,4);

-- OBS HC
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (31311,31535,31520,31534);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(31534,47241,100,1,0,2,4),
(31520,47241,100,1,0,2,4),
(31535,47241,100,1,0,2,4),
(31311,47241,100,1,0,2,4);

-- Champions' Cache
delete from `gameobject_loot_template` where `entry`=27498 and `item` in (45624,49426,40752,47241,40753);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(27498, 47241, 100, 1, 0, 6, 8);


-- HoR HC 
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (38599,38113);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(38599,47241,100,1,0,1,3),
(38113,47241,100,1,0,1,3);
DELETE FROM `gameobject_loot_template` WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (27993);
insert into `gameobject_loot_template` values 
(27993,47241, 100, 1, 0, 1, 3);

-- hor normal
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (38112,38113);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(38112,45624,100,1,0,1,3),
(38113,45624,100,1,0,1,3);


-- PoS HC 
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (37627,37613,36938);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(37627,47241,100,1,0,1,3),
(37613,47241,100,1,0,1,3),
(36938,47241,100,1,0,1,3);

-- FoS HC 
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (36498,37677);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(36498,47241,100,1,0,1,3),
(37677,47241,100,1,0,1,3);

-- ICC normal 
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (36612,36855,36626,36627,36678,37970,37955,36853);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(36612,49426,100,1,0,2,3),
(36855,49426,100,1,0,2,3),
(36626,49426,100,1,0,2,3),
(36627,49426,100,1,0,2,3),
(36678,49426,100,1,0,2,3),
(37970,49426,100,1,0,2,3),
(37955,49426,100,1,0,2,3),
(36853,49426,100,1,0,2,3);
DELETE FROM `gameobject_loot_template` WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (28046);
insert into `gameobject_loot_template` values 
(28046,49426, 100, 1, 0, 1, 3);

-- ICC 10man HC
update creature_loot_template set item=49426 where item=45624 and entry in (36612,36855,36626,36627,36678,37970,37955,37957,37958,37959,37504,37505,37506,38390,38549,38550,38431,38585,38586,38106,38296,38297,38434,38435,38436,38401,38784,38785);
update gameobject_loot_template set item=49426 where item=45624 and entry in (28058,28064);


-- Ruby sanctum
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (39751,39746,39747,39863);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(39751,49426,100,1,0,1,2),
(39746,49426,100,1,0,1,2),
(39747,49426,100,1,0,1,2),
(39863,49426,100,1,0,2,3);


-- ulduar 10man
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (33113,33118,33186,33293,33515,33350,33271,33288);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(33113,47241,100,1,0,4,6), 
(33118,47241,100,1,0,4,6), 
(33186,47241,100,1,0,4,6),
(33293,47241,100,1,0,4,6), 
(33515,47241,100,1,0,4,6), 
(33350,47241,100,1,0,4,6), 
(33271,47241,100,1,0,4,6), 
(33288,47241,100,1,0,4,6);

update creature_loot_template set item=47241 where `item` IN (45624,49426,40752,47241,40753) and entry in (32857,32927,32867);

update gameobject_loot_template set item=47241 where `item` IN (45624,49426,40752,47241,40753) and entry in (195046,194324,194307,194312,194821);

-- VOA 10man
update creature_loot_template set item=47241,maxcount=4 where item IN (45624,49426,40752,47241,40753) and entry in (31125,35013,38433);
update creature_loot_template set item=49426 where item IN (45624,49426,40752,47241,40753) and entry in (33993);

-- VOA 25man
update creature_loot_template set item=47241,maxcount=6 where item IN (45624,49426,40752,47241,40753) and entry in (31722,35360,38462);
update creature_loot_template set item=49426 where item IN (45624,49426,40752,47241,40753) and entry in (33994);

