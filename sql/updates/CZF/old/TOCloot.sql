update `item_template` set `FlagsExtra`=0 where `entry` in (45624,47857,47853,47850,47851,47858,47855,47860,47856,47859,47849,47852,47854,45624,47863,47870,47866,47861,47862,47865,47864,47869,47872,47871,47868,49236,47867,47882,47879,47881,47880,47878,47874,47876,47877,47873,47875,47886,47887,47883,47888,47884,47885,47890,47891,47892,47913,47889,49232,47893,47911,47909,47907,47903,47897,47902,47900,47906,47910,47905,47898,47894,47901,47895,47904,47896,47908,47899);


	
-- icehowl	
delete from `creature_loot_template` where `entry`=34797;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(34797, 1, 100, 1, 0, -34294, 4);

delete from `reference_loot_template` where `entry`=34294;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(34294, 47857, 0, 1, 1, 1, 1),
(34294, 47853, 0, 1, 1, 1, 1),
(34294, 47850, 0, 1, 1, 1, 1),
(34294, 47851, 0, 1, 1, 1, 1),
(34294, 47858, 0, 1, 1, 1, 1),
(34294, 47855, 0, 1, 1, 1, 1),
(34294, 47860, 0, 1, 1, 1, 1),
(34294, 47856, 0, 1, 1, 1, 1),
(34294, 47859, 0, 1, 1, 1, 1),
(34294, 47849, 0, 1, 1, 1, 1),
(34294, 47852, 0, 1, 1, 1, 1),
(34294, 47854, 0, 1, 1, 1, 1);


-- Lord Jaraxxus
delete from `creature_loot_template` where `entry`=34780;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(34780, 1, 100, 1, 0, -34295, 4);

delete from `reference_loot_template` where `entry`=34295;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(34295, 47863, 0, 1, 1, 1, 1),
(34295, 47870, 0, 1, 1, 1, 1),
(34295, 47866, 0, 1, 1, 1, 1),
(34295, 47861, 0, 1, 1, 1, 1),
(34295, 47862, 0, 1, 1, 1, 1),
(34295, 47865, 0, 1, 1, 1, 1),
(34295, 47864, 0, 1, 1, 1, 1),
(34295, 47869, 0, 1, 1, 1, 1),
(34295, 47872, 0, 1, 1, 1, 1),
(34295, 47871, 0, 1, 1, 1, 1),
(34295, 47868, 0, 1, 1, 1, 1),
(34295, 49236, 0, 1, 1, 1, 1),
(34295, 47867, 0, 1, 1, 1, 1);


-- Champions' Cache
delete from `gameobject_loot_template` where `entry`=27498;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(27498, 1, 100, 1, 0, -34305, 4);

DELETE FROM `reference_loot_template` WHERE entry=34305;
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(34305, 47882, 0, 1, 1, 1, 1),
(34305, 47879, 0, 1, 1, 1, 1),
(34305, 47881, 0, 1, 1, 1, 1),
(34305, 47880, 0, 1, 1, 1, 1),
(34305, 47878, 0, 1, 1, 1, 1),
(34305, 47874, 0, 1, 1, 1, 1),
(34305, 47876, 0, 1, 1, 1, 1),
(34305, 47877, 0, 1, 1, 1, 1),
(34305, 47873, 0, 1, 1, 1, 1),

(34305, 47875, 0, 1, 1, 1, 1);


-- Fjola Lightbane
delete from `creature_loot_template` where `entry`=34497;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(34497, 1, 100, 1, 0, -34296, 4);

delete from `reference_loot_template` where `entry`=34296;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(34296, 47886, 0, 1, 1, 1, 1),
(34296, 47887, 0, 1, 1, 1, 1),
(34296, 47883, 0, 1, 1, 1, 1),
(34296, 47888, 0, 1, 1, 1, 1),
(34296, 47884, 0, 1, 1, 1, 1),
(34296, 47885, 0, 1, 1, 1, 1),
(34296, 47890, 0, 1, 1, 1, 1),
(34296, 47891, 0, 1, 1, 1, 1),
(34296, 47892, 0, 1, 1, 1, 1),
(34296, 47913, 0, 1, 1, 1, 1),
(34296, 47889, 0, 1, 1, 1, 1),
(34296, 49232, 0, 1, 1, 1, 1),
(34296, 47893, 0, 1, 1, 1, 1);


delete from `creature_loot_template` where `entry`=34496;


-- anub
delete from `creature_loot_template` where `entry`=34564;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(34564, 1, 100, 1, 0, -34298, 4);

delete from reference_loot_template where entry=34298;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(34298, 47911, 0, 1, 1, 1, 1),
(34298, 47909, 0, 1, 1, 1, 1),
(34298, 47907, 0, 1, 1, 1, 1),
(34298, 47903, 0, 1, 1, 1, 1),
(34298, 47897, 0, 1, 1, 1, 1),
(34298, 47902, 0, 1, 1, 1, 1),
(34298, 47900, 0, 1, 1, 1, 1),
(34298, 47906, 0, 1, 1, 1, 1),
(34298, 47910, 0, 1, 1, 1, 1),
(34298, 47905, 0, 1, 1, 1, 1),
(34298, 47898, 0, 1, 1, 1, 1),
(34298, 47894, 0, 1, 1, 1, 1),
(34298, 47901, 0, 1, 1, 1, 1),
(34298, 47895, 0, 1, 1, 1, 1),
(34298, 47904, 0, 1, 1, 1, 1),
(34298, 47896, 0, 1, 1, 1, 1),
(34298, 47908, 0, 1, 1, 1, 1),
(34298, 47899, 0, 1, 1, 1, 1);
