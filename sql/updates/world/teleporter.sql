DROP TABLE IF EXISTS `custom_npc_tele_category`;
CREATE TABLE `custom_npc_tele_category` (
  `id` int(6) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `flag` tinyint(3) unsigned NOT NULL default '0',
  `data0` bigint(20) unsigned NOT NULL default '0',
  `data1` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_npc_tele_destination`;
CREATE TABLE `custom_npc_tele_destination` (
  `id` int(6) unsigned NOT NULL auto_increment,
  `name` char(100) NOT NULL default '',
  `pos_X` float NOT NULL default '0',
  `pos_Y` float NOT NULL default '0',
  `pos_Z` float NOT NULL default '0',
  `map` smallint(5) unsigned NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `level` tinyint(3) unsigned NOT NULL default '0',
  `cost` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_npc_tele_association`;
CREATE TABLE `custom_npc_tele_association` (
  `cat_id` int(6) unsigned NOT NULL default '0',
  `dest_id` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`, `dest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `custom_npc_tele_category`;
INSERT INTO `custom_npc_tele_category`
   (`id`, `name`, `flag`, `data0`, `data1`)
VALUES
   (1, 'Cities', 0, 1, 0),
   (2, 'Cities', 0, 2, 0),
   (6, '[Instances Lvl 1-60]', 0, 0, 0),
   (7, '[Instances Lvl 60]', 5, 60, 0),
   (8, '[Instances Lvl 70]', 5, 70, 0),
   (10, '[Instances WOTLK - 5man]', 5, 70, 0),
   (11, '[Instances WOTLK - Raids]', 5, 70, 0);

TRUNCATE `custom_npc_tele_destination`;
INSERT INTO `custom_npc_tele_destination`
   (`id`, `name`, `pos_X`, `pos_Y`, `pos_Z`, `map`, `orientation`, `level`, `cost`)
VALUES
   (1, 'Alterac Valley', 883.187, -489.375, 96.7618, 30, 3.06932, 0, 0),
   (2, 'Alterac Valley', -818.155, -623.043, 54.0884, 30, 2.1, 0, 0),
   (3, 'Arathi Basin', 686.053, 683.165, -12.9149, 529, 0.18, 0, 0),
   (4, 'Arathi Basin', 1308.68, 1306.03, -9.0107, 529, 3.91285, 0, 0),
   (5, 'Black Temple', -3610.72, 324.988, 37.4, 530, 3.28298, 0, 0),
   (6, 'Blackfathom Deeps', 4254.58, 664.74, -29.04, 1, 1.97, 0, 0),
   (7, 'Blackrock Depths', -7301.03, -913.19, 165.37, 0, 0.08, 0, 0),
   (8, 'Blackrock Spire', -7535.43, -1212.04, 285.45, 0, 5.29, 0, 0),
   (9, 'Blackwing Lair', -7665.55, -1102.49, 400.679, 469, 0, 0, 0),
   (10, 'Caverns of Time', -8173.66, -4746.36, 33.8423, 1, 4.93989, 0, 0),
   (11, 'Circle of Blood', 2839.44, 5930.17, 11.1002, 530, 3.16284, 0, 0),
   (12, 'Coilfang Reservoir', 517.288, 6976.28, 32.0072, 530, 0, 0, 0),
   (13, 'Darnassus', 9947.52, 2482.73, 1316.21, 1, 0, 0, 0),
   (14, 'Dire Maul', -3982.47, 1127.79, 161.02, 1, 0.05, 0, 0),
   (15, 'Exodar', -4073.03, -12020.4, -1.47, 530, 0, 0, 0),
   (16, 'Eye of the Storm', 2487.72, 1609.12, 1224.64, 566, 3.35671, 0, 0),
   (17, 'Eye of the Storm', 1843.73, 1529.77, 1224.43, 566, 0.297579, 0, 0),
   (18, 'Goldshire', -9464, 62, 56, 0, 0, 0, 0),
   (19, 'Gruul\'s Lair', 3539.01, 5082.36, 1.69107, 530, 0, 0, 0),
   (20, 'Gurubashi', -13261.3, 168.294, 35.0792, 0, 1.00688, 0, 0),
   (21, 'Hellfire Citadel', -305.816, 3056.4, -2.47318, 530, 2.01, 0, 0),
   (22, 'Ironforge', -4924.07, -951.95, 501.55, 0, 5.4, 0, 0),
   (23, 'Isle Of Quel\'Danas', 12947.4, -6893.31, 5.68398, 530, 3.09154, 0, 0),
   (24, 'Karazhan', -11118.8, -2010.84, 47.0807, 0, 0, 0, 0),
   (25, 'Maraudon', -1433.33, 2955.34, 96.21, 1, 4.82, 0, 0),
   (26, 'Molten Core', 1121.45, -454.317, -101.33, 230, 3.5, 0, 0),
   (27, 'Naxxramas', 3125.18, -3748.02, 136.049, 0, 0, 0, 0),
   (28, 'Onyxia\'s Lair', -4707.44, -3726.82, 54.6723, 1, 3.8, 0, 0),
   (29, 'Orgrimmar', 1552.5, -4420.66, 8.94802, 1, 0, 0, 0),
   (30, 'Razor Hill', 315.721, -4743.4, 10.4867, 1, 0, 0, 0),
   (31, 'Razorfen Downs', -4645.08, -2470.85, 85.53, 1, 4.39, 0, 0),
   (32, 'Razorfen Kraul', -4484.04, -1739.4, 86.47, 1, 1.23, 0, 0),
   (33, 'Ring of Trials', -1999.94, 6581.71, 11.32, 530, 2.3, 0, 0),
   (34, 'Ruins of Ahn\'Qiraj', -8409.03, 1498.83, 27.3615, 1, 2.49757, 0, 0),
   (35, 'Scholomance', 1219.01, -2604.66, 85.61, 0, 0.5, 0, 0),
   (36, 'Shadowfang Keep', -254.47, 1524.68, 76.89, 0, 1.56, 0, 0),
   (37, 'Shattrath City', -1850.21, 5435.82, -10.9614, 530, 3.40391, 0, 0),
   (38, 'Silvermoon', 9338.74, -7277.27, 13.7895, 530, 0, 0, 0),
   (39, 'Stormwind', -8960.14, 516.266, 96.3568, 0, 0, 0, 0),
   (40, 'Stratholme', 3263.54, -3379.46, 143.59, 0, 0, 0, 0),
   (41, 'Tempest Keep', 3089.58, 1399.05, 187.653, 530, 4.79407, 0, 0),
   (42, 'Temple of Ahn\'Qiraj', -8245.84, 1983.74, 129.072, 1, 0.936195, 0, 0),
   (43, 'The Deadmines', -11212, 1658.58, 25.67, 0, 1.45, 0, 0),
   (44, 'The Maul', -3761.49, 1133.43, 132.083, 1, 4.57259, 0, 0),
   (45, 'The Scarlet Monastery', 2843.89, -693.74, 139.32, 0, 5.11, 0, 0),
   (46, 'The Sunken Temple', -10346.9, -3851.9, -43.41, 0, 6.09, 0, 0),
   (47, 'The Wailing Caverns', -722.53, -2226.3, 16.94, 1, 2.71, 0, 0),
   (48, 'Thunder Bluff', -1290, 147.034, 129.682, 1, 4.919, 0, 0),
   (49, 'Uldaman', -6119.7, -2957.3, 204.11, 0, 0.03, 0, 0),
   (50, 'Undercity', 1819.71, 238.79, 60.5321, 0, 0, 0, 0),
   (51, 'Warsong Gulch', 930.851, 1431.57, 345.537, 489, 0.015704, 0, 0),
   (52, 'Warsong Gulch', 1525.95, 1481.66, 352.001, 489, 3.20756, 0, 0),
   (53, 'Zul\'Aman', 6846.95, -7954.5, 170.028, 530, 4.61501, 0, 0),
   (54, 'Zul\'Farrak', -6839.39, -2911.03, 8.87, 1, 0.41, 0, 0),
   (55, 'Zul\'Gurub', -11916.7, -1212.82, 92.2868, 0, 4.6095, 0, 0),
   (56, 'Ile des MJ', 16254, 16276.9, 14.5082, 1, 1.70269, 0, 0),
   (57, 'Utgarde', 1259.33, -4852.02, 215.763, 571, 3.48293, 0, 0),
   (58, 'The Nexus', 3781.81, 6953.65, 104.82, 571, 0.467432, 0, 0),
   (59, 'Pit of Narjun', 3707.86, 2150.23, 36.76, 571, 3.22, 0, 0),
   (60, 'DrakTharon Keep', 4774.6, -2032.92, 229.15, 571, 1.59, 0, 0),
   (61, 'Gundrak', 6898.72, -4584.94, 451.12, 571, 2.34455, 0, 0),
   (62, 'Halls of Stone/Lightning', 9049.37, -1282.35, 1060.19, 571, 5.8395, 0, 0),
   (63, 'Culling of Stratholme', -8671.37, -4398.26, -207.01, 1, 3.44, 0, 0),
   (64, 'Halls of Reflection', 5635.06, 2052.08, 798.05, 571, 4.68, 0, 0),
   (65, 'Naxxramas', 3668.72, -1262.46, 243.622, 571, 4.785, 0, 0),
   (66, 'Eye of Eternity', 3857.17, 6990.71, 152.10, 571, 5.87, 0, 0),
   (67, 'The Obsidian Sanctuary', 3516.08, 269.89, -114.035, 571, 3.23, 0, 0),
   (68, 'Onyxias Lair', -4708.27, -3727.64,54.5589, 1, 3.72786, 0, 0),
   (69, 'Ulduar', 9049.37, -1282.35,1060.19, 571, 5.8395, 0, 0),
   (70, 'Ruby Sanctum', 3598.44, 198.52,-110.85, 571, 2.22, 0, 0),
   (71, 'Icecrown Citadel', 5873.82, 2110.98,636.011, 571, 3.5523, 0, 0);

TRUNCATE `custom_npc_tele_association`;
INSERT INTO `custom_npc_tele_association`
  (`cat_id`, `dest_id`)
VALUES
  (1, 13), (1, 15), (1, 18), (1, 22), (1, 23), (1, 37), (1, 39), (2, 23), (2, 29), (2, 30), (2, 37), (2, 38), (2, 48), (2, 50), (3, 1), (3, 4), (3, 16), (3, 52), (4, 2), (4, 3), (4, 17), (4, 51), (5, 11), (5, 20), (5, 33), (5, 44), (6, 6), (6, 7), (6, 8), (6, 14), (6, 25), (6, 31), (6, 32), (6, 35), (6, 36), (6, 40), (6, 43), (6, 45), (6, 46), (6, 47), (6, 49), (6, 54), (7, 9), (7, 26), (7, 27), (7, 28), (7, 34), (7, 42), (7, 55), (8, 5), (8, 10), (8, 12), (8, 19), (8, 21), (8, 24), (8, 41), (8, 53), (9, 56), (10,57), (10,58), (10,59), (10,60), (10,61), (10,62), (10,63), (10,64), (11,65), (11,66), (11,67), (11,68), (11,69), (11,70), (11,71);

-- `npc_text`
REPLACE INTO `npc_text` (`ID`, `text0_0`) VALUES
   (100000, 'Choose your Category.'),
   (100001, 'Choose your Destination.');

-- `creature_template`
INSERT INTO `creature_template` VALUES (100000, 0, 0, 0, 0, 0, 26502, 0, 0, 0, 'Teleporter', '', '', 0, 83, 83, 0, 35, 35, 1, 1, 1.14286, 2, 1, 509, 683, 0, 805, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 371, 535, 135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 'npc_teleport', 1);
