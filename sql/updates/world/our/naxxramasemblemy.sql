-- world emblemy
delete from `gameobject_loot_template` where entry=25192 and item=45624; 
UPDATE `creature_loot_template` SET `item`=45624,`mincountorref`=2,`maxcount`=3 WHERE `item` IN (45624,49426,40752,47241,40753);
UPDATE `gameobject_loot_template` SET `item`=45624,`mincountorref`=2,`maxcount`=3 WHERE `item` IN (45624,49426,40752,47241,40753);
UPDATE `item_loot_template` SET `item`=45624,`mincountorref`=2,`maxcount`=3 WHERE `item` IN (45624,49426,40752,47241,40753);
UPDATE `reference_loot_template` SET `item`=45624,`mincountorref`=2,`maxcount`=3 WHERE `item` IN (45624,49426,40752,47241,40753);

-- naxxramas HC - triumph 2-3
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (29249,29268,29278,29615,29701,29718,29940,29955,29324,29373,29417,29448,29991,30061);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(29249,47241,100,1,0,2,3), 
(29268,47241,100,1,0,2,3), 
(29278,47241,100,1,0,2,3), 
(29615,47241,100,1,0,2,3),
(29701,47241,100,1,0,2,3), 
(29718,47241,100,1,0,2,3), 
(29940,47241,100,1,0,2,3), 
(29955,47241,100,1,0,2,3), 
(29324,47241,100,1,0,2,3), 
(29373,47241,100,1,0,2,3), 
(29417,47241,100,1,0,2,3), 
(29448,47241,100,1,0,2,3), 
(29991,47241,100,1,0,2,3), 
(30061,47241,100,1,0,2,3);

-- naxxramas - triumph 1-2
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (15956,15953,15952,15954,15936,16011,16061,16060,16028,15931,15932,15928,15989,15990);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(15956,47241,100,1,0,1,2), 
(15953,47241,100,1,0,1,2), 
(15952,47241,100,1,0,1,2), 
(15954,47241,100,1,0,1,2),
(15936,47241,100,1,0,1,2), 
(16011,47241,100,1,0,1,2), 
(16061,47241,100,1,0,1,2), 
(16060,47241,100,1,0,1,2), 
(16028,47241,100,1,0,1,2), 
(15931,47241,100,1,0,1,2), 
(15932,47241,100,1,0,1,2), 
(15928,47241,100,1,0,1,2), 
(15989,47241,100,1,0,1,2), 
(15990,47241,100,1,0,1,2);
	
-- onyxia normal - triumph 2-3 + HC - triumph 3-4
DELETE FROM `creature_loot_template`  WHERE `item` IN (45624,49426,40752,47241,40753) AND `entry` IN (10184,36538);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(10184,47241,100,1,0,2,3),  
(36538,47241,100,1,0,3,4);