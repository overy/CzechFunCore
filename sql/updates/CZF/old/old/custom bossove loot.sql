-- bazilisek
update `creature_template` set `lootid`=66660 where `entry`=66660;
delete from `creature_loot_template` where `entry`=66660;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES	
(66660 , 1, 100, 1, 0, -99999, 2),
(66660 , 47241, 99, 1, 0, 5, 5),
(66660 , 500201, 100, 1, 0, 5, 6);
	
delete from `reference_loot_template` where `entry`=99999;	
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES	
(99999, 43952, 0, 1, 1, 1, 1),
(99999, 45801, 0, 1, 1, 1, 1),
(99999, 33809, 0, 1, 1, 1, 1),
(99999, 49912, 0, 1, 1, 1, 1),
(99999, 21176, 0, 1, 1, 1, 1),
(99999, 19902, 0, 1, 1, 1, 1),
(99999, 49287, 0, 1, 1, 1, 1),	
(99999, 56806, 0, 1, 1, 1, 1);	
	
	
-- continental
update `creature_template` set `lootid`=77777 where `entry`=77777;
delete from `creature_loot_template` where `entry`=77777;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES	
(77777 , 1, 100, 1, 0, -99999, 2),
(77777 , 47241, 99, 1, 0, 5, 5),
(77777 , 500201, 100, 1, 0, 5, 6);
	
delete from `reference_loot_template` where `entry`=99999;	
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES	
(99999, 43952, 0, 1, 1, 1, 1),
(99999, 45801, 0, 1, 1, 1, 1),
(99999, 33809, 0, 1, 1, 1, 1),
(99999, 49912, 0, 1, 1, 1, 1),
(99999, 21176, 0, 1, 1, 1, 1),
(99999, 19902, 0, 1, 1, 1, 1),
(99999, 49287, 0, 1, 1, 1, 1),	
(99999, 56806, 0, 1, 1, 1, 1);	
	
	
	
	
-- lava_boost
update `creature_template` set `lootid`=100002 where `entry`=100002;
delete from `creature_loot_template` where `entry`=100002;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES	
(100002 , 1, 100, 1, 0, -99999, 2),
(100002 , 47241, 99, 1, 0, 5, 5),
(100002 , 500201, 100, 1, 0, 5, 6);
	
delete from `reference_loot_template` where `entry`=99999;	
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES	
(99999, 43952, 0, 1, 1, 1, 1),
(99999, 45801, 0, 1, 1, 1, 1),
(99999, 33809, 0, 1, 1, 1, 1),
(99999, 49912, 0, 1, 1, 1, 1),
(99999, 21176, 0, 1, 1, 1, 1),
(99999, 19902, 0, 1, 1, 1, 1),
(99999, 49287, 0, 1, 1, 1, 1),	
(99999, 56806, 0, 1, 1, 1, 1);	
	
	
	
	
-- likantropo
update `creature_template` set `lootid`=100001 where `entry`=100001;
delete from `creature_loot_template` where `entry`=100001;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES	
(100001 , 1, 100, 1, 0, -99999, 2),
(100001 , 47241, 99, 1, 0, 5, 5),
(100001 , 500201, 100, 1, 0, 5, 6);
	
delete from `reference_loot_template` where `entry`=99999;	
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES	
(99999, 43952, 0, 1, 1, 1, 1),
(99999, 45801, 0, 1, 1, 1, 1),
(99999, 33809, 0, 1, 1, 1, 1),
(99999, 49912, 0, 1, 1, 1, 1),
(99999, 21176, 0, 1, 1, 1, 1),
(99999, 19902, 0, 1, 1, 1, 1),
(99999, 49287, 0, 1, 1, 1, 1),	
(99999, 56806, 0, 1, 1, 1, 1);	
	
	
	
-- might_of_sylvanas
update `creature_template` set `lootid`=100004 where `entry`=100004;
delete from `creature_loot_template` where `entry`=100004;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES	
(100004 , 1, 100, 1, 0, -99999, 2),
(100004 , 47241, 99, 1, 0, 5, 5),
(100004 , 500201, 100, 1, 0, 5, 6);
	
delete from `reference_loot_template` where `entry`=99999;	
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES	
(99999, 43952, 0, 1, 1, 1, 1),
(99999, 45801, 0, 1, 1, 1, 1),
(99999, 33809, 0, 1, 1, 1, 1),
(99999, 49912, 0, 1, 1, 1, 1),
(99999, 21176, 0, 1, 1, 1, 1),
(99999, 19902, 0, 1, 1, 1, 1),
(99999, 49287, 0, 1, 1, 1, 1),	
(99999, 56806, 0, 1, 1, 1, 1);	
	
	
	
	
-- quel_nagas
update `creature_template` set `lootid`=100003 where `entry`=100003;
delete from `creature_loot_template` where `entry`=100003;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES	
(100003 , 1, 100, 1, 0, -99999, 1),
(100003 , 47241, 99, 1, 0, 3, 3),
(100003 , 500201, 100, 1, 0, 2, 4);
	
delete from `reference_loot_template` where `entry`=99999;	
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES	
(99999, 43952, 0, 1, 1, 1, 1),
(99999, 45801, 0, 1, 1, 1, 1),
(99999, 33809, 0, 1, 1, 1, 1),
(99999, 49912, 0, 1, 1, 1, 1),
(99999, 21176, 0, 1, 1, 1, 1),
(99999, 19902, 0, 1, 1, 1, 1),
(99999, 49287, 0, 1, 1, 1, 1),	
(99999, 56806, 0, 1, 1, 1, 1);	
	
	
	


