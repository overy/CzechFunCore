
-- ========================
--  world_Ahnkahet.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

-- set some target entrys
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (59465,56312,60342);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) 
VALUES
(13, 59465, 18, 1, 30178),
(13, 56312, 18, 1, 29310),
(13, 60342, 18, 1, 29310);

-- remove mini by potent fungus
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (57055, 56648);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) 
VALUES
(57055, -56648, 1, 'Amanitar: Remove Potent Fungus'),
(56648, -57055, 1, 'Amanitar: Remove Mini');

-- mushroom scale
UPDATE `creature_template` SET `scale` = 1 WHERE `entry` IN (31461, 31462);

-- boss melee dmg
UPDATE `creature_template` SET `dmg_multiplier` = 20, `flags_extra` = `flags_extra`|1 WHERE `entry` IN (31456,31463,31464,31465,31469);

-- player clones melee dmg
UPDATE `creature_template` SET `dmg_multiplier` = 0.75 WHERE `entry` = 30625;
UPDATE `creature_template` SET `dmg_multiplier` = 1.5 WHERE `entry` = 31480;

-- triumph marken zu heldentum
UPDATE `creature_loot_template` SET `item` = 40752 WHERE `entry` IN (31456,31463,31464,31465,31469) AND `item` = 47241;

-- imunnitys
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (29308,29309,29310,29311,30385,30114,31456,31463,31464,31465,31469,31474,31473);

-- jedoga disarmable
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` &~ 4 WHERE `entry` IN (29310,31465);

UPDATE `creature_template` SET `unit_flags`=32832 WHERE `entry`=29308;
UPDATE `creature_template` SET `unit_flags`=32832 WHERE `entry`=31469;

-- ========================
--  world_AzjolNerub.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

UPDATE `creature_template` SET `ScriptName`='npc_krikthir_watcher' WHERE `entry`=28729;
UPDATE `creature_template` SET `ScriptName`='npc_krikthir_watcher' WHERE `entry`=28730;
UPDATE `creature_template` SET `ScriptName`='npc_krikthir_watcher' WHERE `entry`=28731;
UPDATE `creature_template` SET `ScriptName`='npc_web_wrap' WHERE `entry`=28619;
UPDATE `creature_template` SET `ScriptName`='npc_anubar_crusher' WHERE `entry`=28922;

-- ========================
--  world_BlackTemple.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

-- ++++ Prequest ++++
-- Title ID
update quest_template set CharTitleId = 64 where entry = 10985;
-- Einige Anpassungen
UPDATE `creature_template` SET scriptname = 'npc_xiri' where entry = 18528;

-- ***********
-- ++++ Trashmobs++++
-- ***********
update creature_template set scriptname = 'npc_black_temple' where entry = 22878;
UPDATE `creature_template` SET `mechanic_immune_mask` = 648249343 WHERE `entry` = 22878;
update creature_template set scriptname = 'npc_black_temple' where entry = 22883;
update creature_template set scriptname = 'npc_black_temple' where entry = 22873;
UPDATE `creature_template` SET `mechanic_immune_mask` = 111362047 WHERE `entry` = 22873;
update creature_template set scriptname = 'npc_black_temple' where entry = 22877;
update creature_template set scriptname = 'npc_black_temple' where entry = 22884;
update creature_template set scriptname = 'npc_black_temple' where entry = 22875;
UPDATE `creature_template` SET `mechanic_immune_mask` = 33561923 WHERE `entry` = 22875;
update creature_template set minlevel = 73  , maxlevel = 73  , faction_A = 1813  , faction_H = 1813  , unit_flags = 33554434, scriptname = 'mob_coilskar_geyser' where entry = 23080;
update creature_template set scriptname = 'npc_black_temple' where entry = 22876;
update creature_template set scriptname = 'npc_black_temple' where entry = 22885;
update creature_template set scriptname = 'npc_black_temple' where entry = 22874;
update creature_template set scriptname = 'npc_black_temple' where entry = 23028;
update creature_template set scriptname = 'npc_black_temple' where entry = 22963;
update creature_template set scriptname = 'npc_black_temple' where entry = 23030;
update creature_template set scriptname = 'npc_black_temple' where entry = 23330;
update creature_template set scriptname = 'npc_black_temple' where entry = 22960;
UPDATE `creature_template` SET `mechanic_immune_mask` = 614678523 WHERE `entry` = 22960;
update creature_template set scriptname = 'npc_black_temple' where entry = 22954;
update creature_template set scriptname = 'npc_black_temple' where entry = 22855;
update creature_template set scriptname = 'npc_black_temple' where entry = 22844;
update creature_template set scriptname = 'npc_black_temple' where entry = 22849;
update creature_template set scriptname = 'npc_black_temple' where entry = 22847;
update creature_template set scriptname = 'npc_black_temple' where entry = 22845;
update creature_template set scriptname = 'npc_black_temple' where entry = 22896;
update creature_template set scriptname = 'npc_black_temple' where entry = 22894;
update creature_template set scriptname = 'npc_black_temple' where entry = 23374;
update creature_template set scriptname = 'npc_black_temple' where entry = 22846;
update creature_template set scriptname = 'npc_black_temple' where entry = 22848;
update creature_template set scriptname = 'npc_black_temple' where entry = 23337;
update creature_template set scriptname = 'npc_black_temple' where entry = 22853;
UPDATE `creature_template` SET `mechanic_immune_mask` = 33554689 WHERE `entry` = 22853;
update creature_template set scriptname = 'npc_black_temple' where entry = 23339;
update creature_template set scriptname = 'npc_black_temple' where entry = 22869;
update creature_template set scriptname = "npc_black_temple" where entry = 22957;
update `creature_template` SET `minlevel` = 72  , `maxlevel` = 72  , `faction_A` = 1813  , `faction_H` = 1813 WHERE `entry` = 23436;
update creature_template set scriptname = "npc_black_temple" where entry = 22962;
update creature_template set scriptname = 'npc_black_temple' where entry = 22956;
update creature_template set scriptname = 'npc_black_temple' where entry = 22964;
update creature_template set scriptname = 'npc_black_temple' where entry = 22955;
update creature_template set scriptname = 'npc_black_temple' where entry = 22939;
update creature_template set scriptname = 'npc_black_temple' where entry = 22965;
update creature_template set scriptname = 'npc_black_temple' where entry = 22959;

update creature_template set scriptname = 'npc_black_temple' where entry = 23399;
update creature_template set scriptname = 'npc_black_temple' where entry = 23398;
update creature_template set scriptname = 'npc_black_temple' where entry = 23401;

update creature_template set scriptname = 'npc_black_temple' where entry = 23402;
update creature_template set scriptname = 'npc_black_temple' where entry = 23397;
update creature_template set scriptname = 'npc_black_temple' where entry = 23403;
update creature_template set scriptname = 'npc_black_temple' where entry = 23400;
update creature_template set scriptname = 'npc_black_temple' where entry = 23394;
update creature_template set scriptname = 'npc_black_temple' where entry = 23429;
update `creature_template` SET `minlevel` = 72  , `maxlevel` = 72  , `faction_A` = 16  , `faction_H` = 16, `unit_flags` = 33554818 WHERE `entry` = 23429;

update creature_template set scriptname = 'npc_black_temple' where entry = 23172;
update creature_template set scriptname = 'npc_black_temple' where entry = 22945;
update creature_template set scriptname = 'npc_black_temple' where entry = 23047;
update creature_template set scriptname = 'npc_black_temple' where entry = 22879;
update spell_proc_event set procFlags = 131072, procEx = 0 where entry = 41034;
update creature_template set scriptname = 'npc_black_temple' where entry = 22882;
update creature_template set scriptname = 'npc_black_temple' where entry = 22880;
update creature_template set scriptname = 'npc_black_temple' where entry = 23369;
update `creature_template` SET `minlevel` = 72  , `maxlevel` = 72  , `faction_A` = 1813  , `faction_H` = 1813 WHERE `entry` = 23436;
update creature_template set scriptname = 'npc_black_temple' where entry = 23018;
update creature_template set scriptname = 'npc_black_temple' where entry = 23083;
update creature_template set scriptname = 'npc_black_temple' where entry = 22953;
update creature_template set scriptname = 'npc_black_temple' where entry = 23049;
delete from creature_loot_template where item in (32609,32592,32591,32590,32589,32526) and entry = 23147;
update creature_template set scriptname = 'npc_black_temple' where entry = 23196;
delete from spell_scripts where id = 41213;
insert into spell_scripts (id,delay,command,datalong) values (41213,0,15,41214);
update creature_template set scriptname = 'npc_black_temple' where entry = 23236;
update creature_template set scriptname = 'npc_black_temple' where entry = 23235;
update creature_template set scriptname = 'npc_black_temple' where entry = 23237;
update creature_template set scriptname = 'npc_black_temple' where entry = 23232;
update creature_template set scriptname = 'npc_black_temple' where entry = 23222;
update creature_template set scriptname = 'npc_black_temple' where entry = 23239;
update creature_template set scriptname = 'npc_black_temple' where entry = 23223;

-- Scriptnames
update creature_template set scriptname = 'blade_of_azzinoth' where entry = 22996;
UPDATE `creature_template` SET `ScriptName`='npc_fel_geyser' WHERE `entry`=23254;

-- ========================
--  world_cc.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

-- ----------------------------
-- Table structure for `city_capture_bosses`
-- ----------------------------
DROP TABLE IF EXISTS `city_capture_bosses`;
CREATE TABLE `city_capture_bosses` (
  `city_id` int(11) NOT NULL default '0',
  `boss_entry_A` int(11) default NULL,
  `boss_entry_H` int(11) default NULL,
  `spawner_entry` int(11) default NULL,
  `spawn_timer` int(11) default NULL,
  PRIMARY KEY  (`city_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of city_capture_bosses
-- ----------------------------
INSERT INTO `city_capture_bosses` VALUES ('1', '150001', '150002', '150000', '1');

-- ----------------------------
-- Table structure for `city_capture_cities`
-- ----------------------------
DROP TABLE IF EXISTS `city_capture_cities`;
CREATE TABLE `city_capture_cities` (
  `id` int(11) NOT NULL default '0',
  `minlevel` int(11) default NULL,
  `maxlevel` int(11) default NULL,
  `name` text,
  `controlled` tinyint(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of city_capture_cities
-- ----------------------------
INSERT INTO `city_capture_cities` VALUES ('1', '1', '80', 'GM Island', '1');

-- ----------------------------
-- Table structure for `city_capture_creatures`
-- ----------------------------
DROP TABLE IF EXISTS `city_capture_creatures`;
CREATE TABLE `city_capture_creatures` (
  `city_id` int(11) default NULL,
  `entry` int(11) NOT NULL default '0',
  `faction_A` int(11) default NULL,
  `faction_H` int(11) default NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of city_capture_creatures
-- ----------------------------
INSERT INTO `city_capture_creatures` VALUES ('1', '150003', '210', '83');
INSERT INTO `city_capture_creatures` VALUES ('1', '150004', '210', '83');

-- ----------------------------
-- Table structure for `city_capture_ports`
-- ----------------------------
DROP TABLE IF EXISTS `city_capture_ports`;
CREATE TABLE `city_capture_ports` (
  `city_id` int(11) NOT NULL default '0',
  `side` int(11) NOT NULL default '0',
  `x` float default NULL,
  `y` float default NULL,
  `z` float default NULL,
  `o` float default NULL,
  `map` int(11) default NULL,
  PRIMARY KEY  (`city_id`,`side`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of city_capture_ports
-- ----------------------------
INSERT INTO `city_capture_ports` VALUES ('1', '0', '16255.1', '16289.2', '21', '3.26', '1');
INSERT INTO `city_capture_ports` VALUES ('1', '1', '16221.3', '16246.5', '12', '1.47', '1');

-- ----------------------------
-- Table structure for `city_capture_progress`
-- ----------------------------
DROP TABLE IF EXISTS `city_capture_progress`;
CREATE TABLE `city_capture_progress` (
  `city_id` int(11) NOT NULL default '0',
  `time` int(11) default NULL,
  PRIMARY KEY  (`city_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of city_capture_progress
-- ----------------------------
INSERT INTO `city_capture_progress` VALUES ('1', '1274630992');
INSERT INTO `city_capture_progress` VALUES ('5', '1274628002');
INSERT INTO `city_capture_progress` VALUES ('10', '1274628031');
INSERT INTO `city_capture_progress` VALUES ('7', '1274628034');
INSERT INTO `city_capture_progress` VALUES ('12', '1274628356');
INSERT INTO `city_capture_progress` VALUES ('4', '1274628349');
INSERT INTO `city_capture_progress` VALUES ('9', '1274628352');
INSERT INTO `city_capture_progress` VALUES ('2', '1274628366');

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (150000, 0, 0, 0, 0, 0, 328, 0, 328, 0, 'CQ: Boss Spawning Bunny GM ISLAND', '', '', 0, 82, 82, 0, 35, 35, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2000, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 43, 1, 0, 0, 130, 'city_conquest_spawner', 0);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (150001, 0, 0, 0, 0, 0, 19543, 0, 19543, 0, 'Alliance Commander', NULL, NULL, 0, 52, 52, 0, 210, 210, 0, 1.125, 1.14286, 1, 0, 571, 571, 0, 137, 1, 1400, 1900, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'city_conquest_boss', 0);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (150002, 0, 0, 0, 0, 0, 1735, 0, 1735, 0, 'Horde Commander', NULL, NULL, 0, 80, 80, 0, 29, 29, 2, 1.1, 1.14286, 1, 1, 953, 1089, 0, 245, 1, 2000, 0, 2, 4608, 0, 0, 0, 0, 0, 0, 58.872, 80.949, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1115, 0, 0, 'city_conquest_boss', 0);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (150003, 0, 0, 0, 0, 0, 103, 0, 103, 0, 'GM Island Creature 1', NULL, NULL, 0, 40, 50, 0, 83, 83, 0, 1.125, 1.14286, 1, 0, 19, 23, 0, 5, 1, 1400, 1900, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 'city_conquest_generic', 0);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (150004, 0, 0, 0, 0, 0, 146, 0, 146, 0, 'GM Island Ghost 1', NULL, NULL, 0, 15, 15, 0, 83, 83, 0, 0.99, 1.14286, 1, 0, 35, 40, 0, 9, 1, 1860, 2046, 2, 0, 0, 0, 0, 0, 0, 0, 24.552, 33.759, 100, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 57, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 8388624, 2, 'city_conquest_generic', 0);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (150005, 0, 0, 0, 0, 0, 26501, 0, 26501, 0, 'City Conquest', 'Portal & Manager', 'Interact', 0, 1, 1, 0, 35, 35, 1, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 'city_conquest_portal', 0);

INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150000, 1, 1, 1, 0, 0, 16224.1, 16279.3, 20.885, 4.52855, 300, 0, 0, 4518, 4169, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150003, 1, 1, 1, 0, 0, 16225.4, 16271.1, 12.9997, 4.54034, 300, 0, 0, 1226, 1283, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150003, 1, 1, 1, 0, 0, 16230.3, 16295.1, 13.1757, 2.63968, 300, 0, 0, 1321, 1381, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150003, 1, 1, 1, 0, 0, 16235.2, 16301.1, 13.1757, 5.10582, 300, 0, 0, 1226, 1283, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150003, 1, 1, 1, 0, 0, 16226.1, 16317.2, 20.8459, 4.85056, 300, 0, 0, 1772, 1807, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150004, 1, 1, 1, 0, 0, 16220.7, 16271.6, 12.9754, 4.63851, 300, 0, 0, 301, 326, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150004, 1, 1, 1, 0, 0, 16224.1, 16284.6, 13.1756, 4.58746, 300, 0, 0, 301, 326, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150004, 1, 1, 1, 0, 0, 16221.3, 16298.9, 13.1756, 5.14117, 300, 0, 0, 301, 326, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150004, 1, 1, 1, 0, 0, 16234.9, 16299.6, 20.8456, 1.4812, 300, 0, 0, 301, 326, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150004, 1, 1, 1, 0, 0, 16217.7, 16284.2, 20.8895, 4.45001, 300, 0, 0, 301, 326, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150005, 1, 1, 1, 0, 0, 16228.4, 16244.6, 12.2895, 2.02771, 300, 0, 0, 41, 60, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150005, 530, 1, 1, 0, 0, -2047.61, 6658.8, 13.0538, 0.698243, 300, 0, 0, 41, 60, 0, 0);


-- ========================
--  world_CoS.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

-- set some target entrys
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (52480, 58825);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) 
VALUES
(13, 52480, 18, 1, 27733),
(13, 58825, 18, 1, 27733);

-- spawn some mobs
DELETE FROM `creature` WHERE `id` IN (27737,27729,27734,27736,28199,28200,28201,28249,28409,32273);

INSERT IGNORE INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
('28409','595','2','1','0','0','2338.47','1280.28','133.323','3.58524','30','0','0','8982','0','0','0','0','0','0'),
('32273','595','2','1','0','1839','2335.1','1278.2','132.885','3.43131','86400','0','0','417911','0','0','0','0','0','0'),

('27737','595','3','1','25543','0','2319.89','1285.78','131.407','1.72169','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','10979','0','2308.12','1304.21','127.601','4.39662','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','25542','0','2335.47','1262.04','132.921','1.42079','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','25543','0','2297.73','1338.75','124.622','2.5574','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','10979','0','2322.65','1265.39','133.033','5.6524','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','10973','0','2277.83','1331.92','124.19','3.48045','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','25543','0','2294.18','1316.93','125.672','6.05649','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','10973','0','2310.56','1369','128.372','5.03364','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','10979','0','2306.15','1322.85','125.708','4.99133','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','10973','0','2320.14','1297.48','129.694','1.35248','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','25542','0','2291.57','1327.27','124.545','5.32358','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','25542','0','2308.04','1352.65','126.907','5.83741','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','10979','0','2329.44','1281.11','132.636','2.25207','60','10','0','630','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2407.32','1423.8','131.522','6.24743','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2417.26','1428.41','131.652','6.20423','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2420.48','1419.99','130.716','0.0977616','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2426.63','1413.41','130.464','0.404064','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2430.46','1417.6','130.557','0.125247','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2433.94','1427.03','131.18','0.0584885','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2446.5','1428.37','131.013','6.10606','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2449.49','1423.35','130.588','5.77619','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2441.92','1424.41','130.606','6.07857','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2450.6','1438.61','132.213','4.74889','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2460.17','1436.46','131.501','4.73711','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2444.68','1421.68','130.324','6.01338','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2456.87','1419.07','130.488','5.39763','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2464.27','1422.15','130.976','5.22092','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2468.21','1403.06','130.39','5.6364','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2460.88','1406.8','130.508','5.96234','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2485.77','1398.35','130.795','4.71591','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2485.79','1380.46','130.15','5.02928','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2475.77','1396.31','130.124','4.84079','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2476.92','1387.21','129.401','5.05128','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2483.24','1389.37','130.123','4.74104','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2480.2','1370.15','129.533','5.79583','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2481.54','1375.11','129.642','5.4644','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2489.44','1359.42','131.233','5.378','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2486.59','1356.19','131.876','5.7275','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2495.53','1348.61','133.072','5.52722','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2504.48','1349.65','132.856','5.11881','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2493.11','1380.29','130.24','4.93189','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2487.18','1392.64','130.512','4.93818','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2506.49','1336.89','132.794','5.19343','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2518.2','1306.39','130.623','4.81723','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2513.4','1299.67','130.868','4.4206','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2511.45','1291.47','130.808','5.00729','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2518.56','1292.32','130.528','5.16438','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2515.49','1279.85','129.214','5.28847','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2514.37','1285.92','129.934','5.70473','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2522.65','1274.29','128.576','5.44634','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2535.38','1275.77','127.42','5.49817','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2537.59','1273.1','127.05','5.02693','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2547.49','1261.7','126.44','4.78425','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2534.36','1261.06','127.125','4.3994','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2532.69','1251.44','127.452','5.4479','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2551.84','1252.35','125.455','5.04342','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2536.1','1244','126.928','5.16515','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2543.63','1247.23','126.131','5.19735','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2554.21','1238.95','125.475','4.64836','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2548.89','1227.37','126.375','5.31517','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2560.46','1225.4','125.496','4.85335','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2555.11','1218.55','125.944','5.11646','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2561.91','1211.56','125.38','5.5877','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2568.67','1202.96','125.509','4.96095','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2571.93','1193.48','125.619','5.07641','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2577.77','1180.88','125.562','4.64522','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2574.2','1166.63','126.089','4.44966','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2564.78','1166.82','127.092','4.2266','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2577.56','1158.41','126.385','4.07738','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2567.93','1176.56','126.2','4.7489','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2559.28','1189.46','126.642','4.73319','60','10','0','756','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2554.14','1213.37','126.599','5.13845','60','10','0','706','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2560.58','1218.48','125.281','4.97351','60','10','0','730','0','0','1','0','0','0'),
('27737','595','3','1','0','0','2570.2','1170.58','126.311','4.64365','60','10','0','756','0','0','1','0','0','0'),

('27729','595','3','1','0','0','2496.57','1354.66','132.217','5.13691','120','5','0','63000','0','0','1','0','0','0'),
('27729','595','3','1','0','0','2494.22','1365.17','130.812','5.15654','120','5','0','63000','0','0','1','0','0','0'),
('27729','595','3','1','0','0','2440.41','1434.46','131.456','5.69372','120','5','0','63000','0','0','1','0','0','0'),
('27729','595','3','1','0','0','2433.18','1421.13','130.644','0.046706','120','5','0','63000','0','0','1','0','0','0'),
('27734','595','3','1','0','0','2546.07','1239.17','125.945','5.07801','120','5','0','63000','0','0','1','0','0','0'),
('27734','595','3','1','0','0','2458.58','1426.22','131.056','5.42984','120','5','0','63000','0','0','1','0','0','0'),
('27736','595','3','1','0','0','2488.11','1364.91','130.402','5.35524','120','5','0','130330','0','0','1','0','0','0'),
('28199','595','3','1','0','0','2527.63','1267.59','128.168','5.12906','120','5','0','63000','0','0','1','0','0','0'),
('28199','595','3','1','0','0','2528.06','1284.34','128.877','5.14869','120','5','0','63000','0','0','1','0','0','0'),
('28199','595','3','1','0','0','2466.27','1414.57','130.977','5.18637','120','5','0','63000','0','0','1','0','0','0'),
('28200','595','3','1','0','0','2570.51','1181.4','125.809','4.61855','120','5','0','50400','44070','0','1','0','0','0'),
('28200','595','3','1','0','0','2560.45','1202.05','126.031','4.85417','120','5','0','50400','44070','0','1','0','0','0'),
('28200','595','3','1','0','0','2487.85','1373.29','130.236','5.078','120','5','0','50400','44070','0','1','0','0','0'),
('28200','595','3','1','0','0','2416.7','1416.52','130.379','0.191224','120','5','0','50400','44070','0','1','0','0','0'),
('28200','595','3','1','0','0','2424.42','1422.68','130.868','0.25327','120','5','0','50400','44070','0','1','0','0','0'),
('28201','595','3','1','0','0','2540.67','1254.82','126.274','4.97198','120','5','0','130330','0','0','1','0','0','0'),
('28201','595','3','1','0','0','2410.03','1417.19','130.577','0.191229','120','5','0','130330','0','0','1','0','0','0'),
('28249','595','3','1','0','0','2562.66','1177.9','126.716','4.77171','120','5','0','63000','0','0','1','0','0','0'),
('28249','595','3','1','0','0','2566.72','1190.41','125.837','4.7992','120','5','0','63000','0','0','1','0','0','0'),
('28249','595','3','1','0','0','2472.34','1404.76','130.752','5.20601','120','5','0','63000','0','0','1','0','0','0'),
('28249','595','3','1','0','0','2460.59','1413.26','130.46','5.4377','120','5','0','63000','0','0','1','0','0','0'),
('28249','595','3','1','0','0','2415.04','1423.52','131.111','0.214785','120','5','0','63000','0','0','1','0','0','0');

-- immunitys
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (26529,26530,26532,26533,31211,31212,31215,31217,32313);

-- boss melee dmg
UPDATE `creature_template` SET `dmg_multiplier` = 20 WHERE `entry` IN (31211,31212,31215,31217,32313);


-- malganis-kisten respawn
UPDATE `gameobject` SET `spawntimesecs` = 86400 WHERE `id` IN (190663,193597);

-- try to fix infinite hunter spam some cast
UPDATE `creature_ai_scripts` SET `event_param3` = 10, `event_param4` = 10 WHERE `id` IN (2774302,2774303);

-- make a trigger not visible
UPDATE `creature_template` SET `flags_extra` = `flags_extra`|128 WHERE `entry` = 20562;

-- ?
UPDATE `creature` SET `spawnMask` = 3 WHERE `id` IN (27915,30997);

-- Scriptnames
UPDATE `creature_template` SET `ScriptName`='npc_cos_chromie' WHERE `entry`=26527;
UPDATE `creature_template` SET `ScriptName`='npc_cos_chromie' WHERE `entry`=27915;
UPDATE `creature_template` SET `ScriptName`='npc_cos_arcane_disruptor_target' WHERE `entry`=30996;

-- ========================
--  world_deepfreeze.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

DELETE FROM `playercreateinfo_spell` WHERE `Spell` IN ('71761'); 
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) VALUES 
('1','8','71761','Deep Freeze Immunity State'), 
('5','8','71761','Deep Freeze Immunity State'), 
('7','8','71761','Deep Freeze Immunity State'), 
('8','8','71761','Deep Freeze Immunity State'), 
('10','8','71761','Deep Freeze Immunity State'),
('11','8','71761','Deep Freeze Immunity State');

DELETE FROM `spell_bonus_data` WHERE `entry` IN ('71757'); 
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES 
('71757','2.143','0','0','0','Mage - Deep Freeze');
DELETE FROM `spell_proc_event` WHERE `entry` IN ('71761'); 
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
('71761','0','3','0','1048576','0','0','256','0','0','0'); -- Deep Freeze Immunity State 

-- ========================
--  world_divinestorm.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

DELETE FROM `spell_bonus_data` WHERE `entry` IN ('54172');
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
('54172','0','0','0','0','Paladin - Divine Storm');
	
DELETE FROM `spell_dbc` WHERE `Id` IN ('199997');
INSERT INTO `spell_dbc` (`Id`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `Stances`, `StancesNot`, `Targets`, `CastingTimeIndex`, `AuraInterruptFlags`, `ProcFlags`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `RangeIndex`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect1`, `Effect2`, `Effect3`, `EffectDieSides1`, `EffectDieSides2`, `EffectDieSides3`, `EffectRealPointsPerLevel1`, `EffectRealPointsPerLevel2`, `EffectRealPointsPerLevel3`, `EffectBasePoints1`, `EffectBasePoints2`, `EffectBasePoints3`, `EffectMechanic1`, `EffectMechanic2`, `EffectMechanic3`, `EffectImplicitTargetA1`, `EffectImplicitTargetA2`, `EffectImplicitTargetA3`, `EffectImplicitTargetB1`, `EffectImplicitTargetB2`, `EffectImplicitTargetB3`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectRadiusIndex3`, `EffectApplyAuraName1`, `EffectApplyAuraName2`, `EffectApplyAuraName3`, `EffectAmplitude1`, `EffectAmplitude2`, `EffectAmplitude3`, `EffectMultipleValue1`, `EffectMultipleValue2`, `EffectMultipleValue3`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectMiscValue3`, `EffectMiscValueB1`, `EffectMiscValueB2`, `EffectMiscValueB3`, `EffectTriggerSpell1`, `EffectTriggerSpell2`, `EffectTriggerSpell3`, `EffectSpellClassMaskA1`, `EffectSpellClassMaskA2`, `EffectSpellClassMaskA3`, `EffectSpellClassMaskB1`, `EffectSpellClassMaskB2`, `EffectSpellClassMaskB3`, `EffectSpellClassMaskC1`, `EffectSpellClassMaskC2`, `EffectSpellClassMaskC3`, `MaxTargetLevel`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `MaxAffectedTargets`, `DmgClass`, `PreventionType`, `DmgMultiplier1`, `DmgMultiplier2`, `DmgMultiplier3`, `AreaGroupId`, `SchoolMask`, `Comment`) VALUES
('199997','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','0','-1','0','0','6','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','10','0','0','0','0','0','0','0','0','0','0','0','Divine Storm Helper (SERVERSIDE)');
	
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
('199997','0','10','0','131072','0','16','0','0','100','0');

-- ========================
--  world_DTK.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

UPDATE creature_template SET unit_flags = unit_flags | 2 WHERE entry IN (26620,31339);
UPDATE `creature_template` SET `unit_flags`=64 WHERE `entry`=26638;
UPDATE `creature_template` SET `unit_flags`=64 WHERE `entry`=31351;

-- ========================
--  world_Envenom.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

DELETE FROM `spell_bonus_data` WHERE `entry` IN ('32645');
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
('32645','0','0','0','0','Rogue - Envenom');

-- ========================
--  world_Gundrak.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================


-- modify some factions
update `creature_template` set `faction_A` = '16', `faction_H` = '16' where `entry` in ('29573','31367','29680','29713','30940','30943');
update `creature_template` set `faction_A` = '7', `faction_H` = '7' where `entry` = '29932';

-- db spawn eck (serverdown issues)
delete from `creature` where `id` = '29932';
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) values ('29932','604','2','1','26644','0','1640.008423','931.781738','107.357620','0.668432','86400','0','0','431392','0','0','0');

-- dont spawn drakkari colossus related living mojo, remove respawn links
update `creature` set `spawnMask` = '0' where `guid` in ('127071','127072','127073','127074','127075');

-- scriptname galdarah summon
update `creature_template` set `ScriptName` = 'mob_rhino_spirit' where `entry` = '29791';

-- experimental vehicle id for http://www.wowhead.com/spell=54958
update `creature_template` set `VehicleId` = '169' where `entry` in ('29306','31368');

-- trigger eck residue
delete from `spell_linked_spell` where `spell_trigger` = '55814';
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values ('55814','55817','1','Eck Spit - Apply Eck Residue');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (59452, 'spell_mojo_volley_targeting');

/*** gundrak script text data (sd2) ***/
-- clear
delete from `script_texts` where `entry` between '-1604030' and '-1604000';
-- -1 604 000 GUNDRAK
INSERT INTO script_texts (npc_entry,entry,content_default,sound,type,language,emote,comment) VALUES
(29304,-1604000,'Drakkari gonna kill anybody who trespass on these lands!',14443,1,0,0,'sladran SAY_AGGRO'),
(29304,-1604001,'Minions of the scale, heed my call!',14444,1,0,0,'sladran SAY_SUMMON_SNAKE'),
(29304,-1604002,'Our thousand fangs gonna rend your flesh! ',14445,1,0,0,'sladran SAY_SUMMON_CONSTRICTOR'),
(29304,-1604003,'Ye not breathin\'! Good.',14446,1,0,0,'sladran SAY_SLAY_1'),
(29304,-1604004,'You scared now?',14447,1,0,0,'sladran SAY_SLAY_2'),
(29304,-1604005,'I\'ll eat you next, mon!',14448,1,0,0,'sladran SAY_SLAY_3'),
(29304,-1604006,'I sssee now... Ssscourge wasss not... our greatessst enemy...',14449,1,0,0,'sladran SAY_DEATH'),
(29304,-1604007,'%s begins to cast Poison Nova!',0,3,0,0,'sladran EMOTE_NOVA'),

(29307,-1604008,'%s surges forward!',0,2,0,0,'colossus EMOTE_SURGE'),
(29307,-1604009,'%s seep into the ground.',0,2,0,0,'colossus EMOTE_SEEP'),
(29307,-1604010,'%s begins to glow faintly.',0,2,0,0,'colossus EMOTE_GLOW'),

(29305,-1604011,'We fought back da Scourge. What chance joo be thinkin\' JOO got?',14721,1,0,0,'moorabi SAY_AGGRO'),
(29305,-1604012,'Da ground gonna swallow you up! ',14723,1,0,0,'moorabi SAY_QUAKE'),
(29305,-1604013,'Get ready for somethin\'... much... BIGGAH!',14722,1,0,0,'moorabi SAY_TRANSFORM'),
(29305,-1604014,'I crush you, cockroaches!',14725,1,0,0,'moorabi SAY_SLAY_1'),
(29305,-1604015,'Who gonna stop me; you?',14726,1,0,0,'moorabi SAY_SLAY_2'),
(29305,-1604016,'Not so tough now.',14727,1,0,0,'moorabi SAY_SLAY_3'),
(29305,-1604017,'If our gods can die... den so can we...',14728,1,0,0,'moorabi SAY_DEATH'),
(29305,-1604018,'%s begins to transform!',0,3,0,0,'moorabi EMOTE_TRANSFORM'),

(29306,-1604019,'I\'m gonna spill your guts, mon!',14430,1,0,0,'galdarah SAY_AGGRO'),
(29306,-1604020,'Ain\'t gonna be nottin\' left after this!',14431,1,0,0,'galdarah SAY_TRANSFORM_1'),
(29306,-1604021,'You wanna see power? I\'m gonna show you power!',14432,1,0,0,'galdarah SAY_TRANSFORM_2'),
(29306,-1604022,'Gut them! Impale them!',14433,1,0,0,'galdarah SAY_SUMMON_1'),
(29306,-1604023,'Kill them all!',14434,1,0,0,'galdarah SAY_SUMMON_2'),
(29306,-1604024,'Say hello to my BIG friend!',14435,1,0,0,'galdarah SAY_SUMMON_3'),
(29306,-1604025,'What a rush!',14436,1,0,0,'galdarah SAY_SLAY_1'),
(29306,-1604026,'Who needs gods, when WE ARE GODS!',14437,1,0,0,'galdarah SAY_SLAY_2'),
(29306,-1604027,'I told ya so!',14438,1,0,0,'galdarah SAY_SLAY_3'),
(29306,-1604028,'Even the mighty... can fall.',14439,1,0,0,'galdarah SAY_DEATH'),

(29305,-1604029,'%s transforms into a Mammoth!',14724,2,0,0,'moorabi EMOTE_TRANSFORMED');

-- disable rep for drakkari colossus
delete from `creature_onkill_reputation` where `creature_id` in ('29307','31365');

-- swap emblem of triumph <-> heroism
update `creature_loot_template` set `item` = '40752' where `entry` in ('31370','30530','31368','29932') and `item` = '47241';
update `reference_loot_template` set `item` = '40752' where `entry` = '35040' and `item` = '47241';

/*** immunities ***/
-- all
update `creature_template` set `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 where `entry` in (29304,31370,29307,31365,29573,31367,29306,31368,29932,29305,30530);

-- moorabi
update `creature_template` set `mechanic_immune_mask` = `mechanic_immune_mask` &~ 256 &~ 2048 &~ 33554432 where `entry` in (29305,30530); 

update `creature_template` set `mechanic_immune_mask` = `mechanic_immune_mask` &~ 2097152 where `entry` in (29304,31370,29307,31365,29573,31367,29306,31368,29932,29305,30530);

-- modify snake wrap faction
update `creature_template` set `faction_A` = '16', `faction_H` = '16' where `entry` in ('29742','32218');

-- set snake wrap scriptname
update `creature_template` set `ScriptName` = 'mob_snake_wrap' where `entry` = '29742';

-- adjust rhino spirit npclevel
update `creature_template` set `minlevel` = '78', `maxlevel` = '82' where `entry` = '29791';

-- change spitting cobra events
delete from `creature_ai_scripts` where `creature_id` = '29774';
insert into `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) values('2977401','29774','4','0','100','2','0','0','0','0','11','55700','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit on Aggro');
insert into `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) values('2977402','29774','4','0','100','4','0','0','0','0','11','59019','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit on Aggro');
insert into `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) values('2977403','29774','9','0','100','3','5','30','2300','5000','11','55700','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit');
insert into `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) values('2977404','29774','9','0','100','5','5','30','2300','5000','11','59019','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit');
insert into `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) values('2977405','29774','9','0','100','3','0','5','5000','9000','11','55703','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Cobra Strike');
insert into `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) values('2977406','29774','9','0','100','5','0','5','5000','9000','11','59020','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Cobra Strike');

-- add selfheal to drakkari medicine man
delete from `creature_ai_scripts` where `id` in ('2982607','2982608');
insert into `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) values('2982607','29826','2','0','100','3','75','0','10000','16000','11','55597','0','0','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Normal) - Cast Healing Wave on Self');
insert into `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) values('2982608','29826','2','0','100','5','75','0','10000','16000','11','58980','0','0','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Heroic) - Cast Healing Wave on Self');

-- update melee damage
UPDATE `creature_template` SET `dmg_multiplier` = 17 WHERE `entry` IN (30936,30925,31370,31367,30942,30941,30932,30927,30930,30938,30929,30926,30933,30939);
UPDATE `creature_template` SET `dmg_multiplier` = 22 WHERE `entry` IN (29932,31368);
UPDATE `creature_template` SET `dmg_multiplier` = 30 WHERE `entry` = 31365;
UPDATE `creature_template` SET `baseattacktime` = 1000 WHERE `entry` IN (29305,30530);
UPDATE `creature_template` SET `baseattacktime` = 3500 WHERE `entry` IN (29307,31365);

-- ========================
--  world_HallsofReflection.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

set names utf8;

delete from `gameobject` where `map` = 668;
delete from `creature` where `map` = 668;

REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES 
('13', '70464', '18', '1', '36881'),
('13', '69708', '18', '1', '37226'),
('13', '70194', '18', '1', '37226'),
('13', '69784', '18', '1', '37014'),
('13', '70224', '18', '1', '37014'),
('13', '70225', '18', '1', '37014'),
('13', '69431', '18', '1', '37497'),
('13', '69431', '18', '1', '37496'),
('13', '69431', '18', '1', '37588'),
('13', '69431', '18', '1', '37584'),
('13', '69431', '18', '1', '37587');

insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5314.98','2013.36','717.077','0.909173','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5311.79','1997.99','717.652','4.97445','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5300.16','2005.76','719.293','3.21137','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5300.33','2009.9','713.591','2.77885','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5315.18','2013.65','715.128','0.90371','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37704','668','3','1','17612','0','5309.26','2006.39','718.047','3.97935','86400','0','0','12600','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('14881','668','3','1','1160','0','5337.6','2012.14','707.695','3.52509','86400','0','0','8','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5302.93','1998.54','718.959','3.98555','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5310.47','2016.02','712.831','1.46876','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37779','668','3','1','30687','0','5232.69','1931.52','707.778','0.820305','86400','0','0','75600','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5307.8','2003.13','709.424','0.715585','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('14881','668','3','1','2536','0','5268.91','1969.17','707.696','0.321519','86400','0','0','8','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5320.61','2009.12','715.901','0.267618','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5310.23','1998.1','716.838','4.82407','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5303.75','1999.49','715.482','4.01671','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5315.09','2013.38','721.067','0.886024','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37226','668','3','1','30721','0','5362.46','2062.69','707.778','3.94444','86400','0','0','27890000','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5300.25','2003.97','714.337','3.39532','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5304.45','2014.65','712.542','2.13851','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('14881','668','3','1','1160','0','5386.99','2080.5','707.695','4.67797','86400','0','0','8','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5319','2002.85','715.96','5.92525','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5310.21','1996.31','716.042','4.77527','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5312.31','2016.24','711.687','1.37907','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37223','668','3','1','28213','0','5236.67','1929.91','707.778','0.837758','86400','0','0','6972500','85160','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5312.98','2013.87','721.169','1.10885','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5316.66','2013.38','711.619','0.982927','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37906','668','3','1','11686','0','5312.64','2013.21','711.998','1.76884','86400','0','0','42','0','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('37704','668','3','1','17612','0','5309.14','2006.21','715.783','3.9619','86400','0','0','12600','0','0','0','0','0','0');

insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('202302','668','3','1','5309.36','2006.55','709.341','-2.33874','0','0','0','1','6000','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('197342','668','3','1','5520.77','2229.04','733.04','0.810935','0','0','-0.370856','0.928691','6000','100','0');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('197343','668','3','1','5582.81','2230.62','733.04','-0.75986','0','0','-0.370856','0.928691','6000','100','0');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('202236','668','3','1','5309.34','2006.52','709.316','-0.75986','0','0','-0.370856','0.928691','6000','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('201747','668','3','1','5231.04','1923.79','707.044','0.810935','0','0','-0.370856','0.928691','6000','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('201756','668','3','1','5231.04','1923.79','707.044','0.810935','0','0','-0.370856','0.928691','6000','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('201976','668','3','1','5264.61','1959.44','707.724','0.810935','0','0','-0.370856','0.928691','6000','100','0');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('197341','668','3','1','5358.96','2058.75','707.724','0.810935','0','0','-0.370856','0.928691','6000','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('190236','668','3','1','4926.09','1554.96','163.292','-2.26562','0','0','0.999999','-0.001655','6000','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('201596','668','3','1','5275.91','1693.72','786.151','4.05956','0','0','0.896503','-0.443037','25','0','0');


-- Halls of Reflection
-- Creature Templates 
UPDATE `creature_template` SET `speed_walk`='1.5', `speed_run`='2.0' WHERE `entry` in (36954, 37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRintro' WHERE `entry` in (37221, 37223);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_falric' WHERE `entry`=38112;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_marwyn' WHERE `entry`=38113;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_lich_king_hr' WHERE `entry`=36954;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_hor' WHERE `entry`=37226;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRextro' WHERE `entry` in (36955, 37554);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_raging_gnoul' WHERE `entry`=36940;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_risen_witch_doctor' WHERE `entry`=36941;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_abon' WHERE `entry`=37069;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_ghostly_priest' WHERE `entry`=38175;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_phantom_mage' WHERE `entry`=38172;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_phantom_hallucination' WHERE `entry`=38567;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_shadowy_mercenary' WHERE `entry`=38177;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_spectral_footman' WHERE `entry`=38173;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_ghostly_priest' WHERE `entry`=38176;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_frostworn_general' WHERE `entry`=36723;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_tortured_rifleman' WHERE `entry`=38176;

UPDATE `creature_template` SET `scale`='0.8', `equipment_id`='1221' WHERE `entry` in (37221, 36955);
UPDATE `creature_template` SET `equipment_id`='1290' WHERE `entry` in (37223, 37554);
UPDATE `creature_template` SET `equipment_id`='0' WHERE `entry`=36954;
UPDATE `creature_template` SET `scale`='1' WHERE `entry`=37223;
UPDATE `creature_template` SET `scale`='0.8' WHERE `entry` in (36658, 37225, 37223, 37226, 37554);
UPDATE `creature_template` SET `unit_flags`='768', `type_flags`='268435564' WHERE `entry` in (38177, 38176, 38173, 38172, 38567, 38175);
UPDATE `creature_template` set `scale`='1' where `entry` in (37223);
UPDATE `instance_template` SET `script` = 'instance_hall_of_reflection' WHERE map=668;
UPDATE `gameobject_template` SET `faction`='1375' WHERE `entry` in (197341, 202302, 201385, 201596);
UPDATE `creature` SET `phaseMask` = 128 WHERE `id` = 36993; 
UPDATE `creature` SET `phaseMask` = 64 WHERE `id` = 36990; 
UPDATE `instance_template` SET `script` = 'instance_halls_of_reflection' WHERE map=668;
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1594540 AND -1594430;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(-1594473, '<need translate>', '?????? ????????! ??? ???? ?? ????? ????? ????! ?????? ?? ???? ???????, ?????? ?????? ? ???? ????????!', 17229,1,0,0, '67234'),
(-1594474, '<need translate>', '? ?? ??????? ??????? ??????, ????????. ?? ???? ??? ???? ?? ????????. ?? ?? ????????? ????? ??????? ? ?????? ???? ???? ?????? ????????!', 17228,1,0,0, '67234'),
-- SCENE - Hall Of Reflection (Extro) - PreEscape
(-1594477, 'Your allies have arrived, Jaina, just as you promised. You will all become powerful agents of the Scourge.', '???? ???????? ???????, ??????! ??? ?? ? ???????... ??-??-??-??... ??? ?? ??????? ???????? ????????? ?????...', 17212,1,0,0, '67234'),
(-1594478, 'I will not make the same mistake again, Sylvanas. This time there will be no escape. You will all serve me in death!', '? ?? ??????? ??????? ??????, ????????! ?? ???? ??? ???? ?? ????????. ?? ??? ?????? ??????? ??? ????? ??????...', 17213,1,0,0, '67234'),
(-1594479, 'He is too powerful, we must leave this place at once! My magic will hold him in place for only a short time! Come quickly, heroes!', '?? ??????? ?????. ?? ?????? ????????? ?? ???? ??? ????? ??????. ??? ????? ???????? ??? ?????????, ??????? ?????...', 16644,0,0,1, '67234'),
(-1594480, 'He\'s too powerful! Heroes, quickly, come to me! We must leave this place immediately! I will do what I can do hold him in place while we flee.', '?? ??????? ?????. ????? ??????, ?? ????. ?? ?????? ????????? ?????? ??????????. ? ?????????? ??? ?????????, ???? ?? ????? ???????.', 17058,0,0,1, '67234'),
-- SCENE - Hall Of Reflection (Extro) - Escape
(-1594481, 'Death\'s cold embrace awaits.', '?????? ???????????? ??????? ???????!', 17221,1,0,0, '67234'),
(-1594482, 'Rise minions, do not left them us!', '?????????? ???????????, ?? ????? ?? ???????!', 17216,1,0,0, '67234'),
(-1594483, 'Minions sees them. Bring their corpses back to me!', '???????? ??! ????????? ??? ?? ????!', 17222,1,0,0, '67234'),
(-1594484, 'No...', '??????? ???!', 17214,1,0,0, '67234'),
(-1594485, 'All is lost!', '??????? ? ???????.', 17215,1,0,0, '67234'),
(-1594486, 'There is no escape!', '?????? ??????!', 17217,1,0,0, '67234'),
(-1594487, 'I will destroy this barrier. You must hold the undead back!', '? ??????? ??? ????????, ? ?? ??????????? ?????? ?? ??????????!', 16607,1,0,0, '67234'),
(-1594488, 'No wall can hold the Banshee Queen! Keep the undead at bay, heroes! I will tear this barrier down!', '??????? ????? ?? ??????? ???????? ??????. ??????? ?????? ?? ??????????, ? ??????? ??? ????????.', 17029,1,0,0, '67234'),
(-1594489, 'Another ice wall! Keep the undead from interrupting my incantation so that I may bring this wall down!', '????? ??????? ?????... ? ??????? ??, ?????? ?? ????? ?????? ???????? ??? ??????????...', 16608,1,0,0, '67234'),
(-1594490, 'Another barrier? Stand strong, champions! I will bring the wall down!', '??? ???? ????????. ????????? ?????! ? ??????? ??? ?????!', 17030,1,0,0, '67234'),
(-1594491, 'Succumb to the chill of the grave.', '?????????? ????????? ??????!', 17218,1,0,0, '67234'),
(-1594492, 'Another dead end.', '?? ? ???????!', 17219,1,0,0, '67234'),
(-1594493, 'How long can you fight it?', '??? ????? ?? ??????? ???????????????', 17220,1,0,0, '67234'),
(-1594494, '<need translate>', '?? ? ???? ??????. ?  ?????? ??? ??? ?????? ????? ??? ??????????? ?? ?????!', 16609,0,0,0, '67234'),
(-1594495, 'Your barriers can\'t hold us back much longer, monster. I will shatter them all!', '???? ???????? ?????? ?? ???????? ???, ????????. ? ????? ?? ? ????!', 16610,1,0,0, '67234'),
(-1594496, 'I grow tired of these games, Arthas! Your walls can\'t stop me!', '? ?????? ?? ???? ??? ?????. ???? ????? ?? ????????? ????!', 17031,1,0,0, '67234'),
(-1594497, 'You won\'t impede our escape, fiend. Keep the undead off me while I bring this barrier down!', '?? ?? ????????? ??? ????, ??????. ??????????? ??????, ? ? ???????? ??? ????????.', 17032,1,0,0, '67234'),
(-1594498, 'There\'s an opening up ahead. GO NOW!', '? ???? ?????, ??????!', 16645,1,0,0, '67234'),
(-1594499, 'We\'re almost there... Don\'t give up!', '?? ????? ?????????, ?? ??????????!', 16646,1,0,0, '67234'),
(-1594500, 'There\'s an opening up ahead. GO NOW!', '? ???? ?????, ??????!', 17059,1,0,0, '67234'),
(-1594501, 'We\'re almost there! Don\'t give up!', '?? ????? ?????????, ?? ??????????!', 17060,1,0,0, '67234'),
(-1594502, 'It... It\'s a dead end. We have no choice but to fight. Steel yourself heroes, for this is our last stand!', '?????? ?????? ??????. ?????? ??? ???????? ?????????. ??? ???? ????????? ?????!', 16647,1,0,0, '67234'),
(-1594503, 'BLASTED DEAD END! So this is how it ends. Prepare yourselves, heroes, for today we make our final stand!', '????????? ?????, ?????? ??? ?????????? ?????. ?????????? ?????, ??? ???? ????????? ?????.', 17061,1,0,0, '67234'),
(-1594504, 'Nowhere to run! You\'re mine now...', '??-??-??... ?????? ??????. ?????? ?? ???!', 17223,1,0,0, '67234'),
(-1594505, 'Soldiers of Lordaeron, rise to meet your master\'s call!', '??????? ?????????, ?????????? ?? ???? ?????????!', 16714,1,0,0, '67234'),
(-1594506, 'The master surveyed his kingdom and found it... lacking. His judgement was swift and without mercy. Death to all!', '???????? ???????? ???? ??????????? ? ??????? ??? ????????! ??? ??? ??? ??????? ? ??????? - ??????? ???? ??????!', 16738,1,0,0, '67234'),
-- FrostWorn General
(-1594519, 'You are not worthy to face the Lich King!', '?? ?????????? ????????? ????? ??????? - ?????!', 16921,1,0,0, '67234'),
(-1594520, 'Master, I have failed...', '????????... ? ?????? ???...', 16922,1,0,0, '67234');

-- Waipoints to escort event on Halls of reflection

DELETE FROM script_waypoint WHERE entry IN (36955,37226,37554);
INSERT INTO script_waypoint VALUES
-- Jaina

   (36955, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (36955, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (36955, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (36955, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'), 
   (36955, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (36955, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (36955, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (36955, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (36955, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (36955, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (36955, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (36955, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (36955, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (36955, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (36955, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (36955, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (36955, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (36955, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (36955, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (36955, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (36955, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (36955, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Sylvana

   (37554, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (37554, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (37554, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (37554, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'), 
   (37554, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (37554, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (37554, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (37554, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (37554, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (37554, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (37554, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (37554, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (37554, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (37554, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (37554, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (37554, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (37554, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (37554, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (37554, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (37554, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (37554, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (37554, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Lich King

   (37226, 0, 5577.187,2236.003,733.012, 0, 'WP1'),
   (37226, 1, 5587.682,2228.586,733.011, 0, 'WP2'),
   (37226, 2, 5600.715,2209.058,731.618, 0, 'WP3'),
   (37226, 3, 5606.417,2193.029,731.129, 0, 'WP4'),
   (37226, 4, 5598.562,2167.806,730.918, 0, 'WP5'), 
   (37226, 5, 5559.218,2106.802,731.229, 0, 'WP6'),
   (37226, 6, 5543.498,2071.234,731.702, 0, 'WP7'),
   (37226, 7, 5528.969,2036.121,731.407, 0, 'WP8'),
   (37226, 8, 5512.045,1996.702,735.122, 0, 'WP9'),
   (37226, 9, 5504.490,1988.789,735.886, 0, 'WP10'),
   (37226, 10, 5489.645,1966.389,737.653, 0, 'WP10'),
   (37226, 11, 5475.517,1943.176,741.146, 0, 'WP11'),
   (37226, 12, 5466.930,1926.049,743.536, 0, 'WP12'),
   (37226, 13, 5445.157,1894.955,748.757, 0, 'WP13'),
   (37226, 14, 5425.907,1869.708,753.237, 0, 'WP14'),
   (37226, 15, 5405.118,1833.937,757.486, 0, 'WP15'),
   (37226, 16, 5370.324,1799.375,761.007, 0, 'WP16'),
   (37226, 17, 5335.422,1766.951,767.635, 0, 'WP17'),
   (37226, 18, 5311.438,1739.390,774.165, 0, 'WP18'),
   (37226, 19, 5283.589,1703.755,784.176, 0, 'WP19'),
   (37226, 20, 5278.694,1697.912,785.692, 0, 'WP20'),
   (37226, 21, 5283.589,1703.755,784.176, 0, 'WP19');
   
-- Fixed Halls of Reflection
DELETE FROM `gameobject_template` WHERE `entry` = 500001;
INSERT INTO `gameobject_template` VALUES ('500001', '0', '9214', 'Ice Wall', '', '', '', '1375', '0', '2.5', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '1'); 
DELETE FROM `creature` WHERE `id` IN (38112,37223,37221,36723,36955,37158,38113,37554,37226) AND `map` = 668;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`)
VALUES 
('38112', '668', '3', '1', '0', '0', '5276.81', '2037.45', '709.32', '5.58779', '604800', '0', '0', '377468', '0', '0', '0', '0', '0', '0'),
('37223', '668', '3', '64', '0', '0', '5266.78', '1953.42', '707.697', '0.740877', '7200', '0', '0', '6972500', '85160', '0', '0', '0', '0', '0'),
('37221', '668', '3', '128', '0', '0', '5266.78', '1953.42', '707.697', '0.740877', '7200', '0', '0', '5040000', '881400', '0', '0', '0', '0', '0'),
('36723', '668', '3', '1', '0', '0', '5413.84', '2116.44', '707.695', '3.88117', '7200', '0', '0', '315000', '0', '0', '0', '0', '0', '0'),
('36955', '668', '3', '128', '0', '0', '5547.27', '2256.95', '733.011', '0.835987', '7200', '0', '0', '252000', '881400', '0', '0', '0', '0', '0'),
('37158', '668', '3', '2', '0', '0', '5304.5', '2001.35', '709.341', '4.15073', '7200', '0', '0', '214200', '0', '0', '0', '0', '0', '0'),
('38113', '668', '3', '1', '0', '0', '5341.72', '1975.74', '709.32', '2.40694', '604800', '0', '0', '539240', '0', '0', '0', '0', '0', '0'),
('37554', '668', '3', '64', '0', '0', '5547.27', '2256.95', '733.011', '0.835987', '7200', '0', '0', '252000', '881400', '0', '0', '0', '0', '0'),
('37226', '668', '3', '1', '0', '0', '5551.29', '2261.33', '733.012', '4.0452', '604800', '0', '0', '27890000', '0', '0', '0', '0', '0', '0');
DELETE FROM `gameobject` WHERE `id` IN (202302,202236,201596,500001,196391,196392,202396,201885,197341,201976,197342,197343,201385,202212,201710,202337,202336,202079) AND `map`=668;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`)
VALUES 
('202302', '668', '3', '1', '5309.51', '2006.64', '709.341', '5.50041', '0', '0', '0.381473', '-0.92438', '604800', '100', '1'),
('202236', '668', '3', '1', '5309.51', '2006.64', '709.341', '5.53575', '0', '0', '0.365077', '-0.930977', '604800', '100', '1'),
('201596', '668', '3', '1', '5275.28', '1694.23', '786.147', '0.981225', '0', '0', '0.471166', '0.882044', '25', '0', '1'),
('500001', '668', '3', '1', '5323.61', '1755.85', '770.305', '0.784186', '0', '0', '0.382124', '0.924111', '604800', '100', '1'),
('196391', '668', '3', '1', '5232.31', '1925.57', '707.695', '0.815481', '0', '0', '0.396536', '0.918019', '300', '0', '1'),
('196392', '668', '3', '1', '5232.31', '1925.57', '707.695', '0.815481', '0', '0', '0.396536', '0.918019', '300', '0', '1'),
('202396', '668', '3', '1', '5434.27', '1881.12', '751.303', '0.923328', '0', '0', '0.445439', '0.895312', '604800', '100', '1'),
('201885', '668', '3', '1', '5494.3', '1978.27', '736.689', '1.0885', '0', '0', '0.517777', '0.855516', '604800', '100', '1'),
('197341', '668', '3', '1', '5359.24', '2058.35', '707.695', '3.96022', '0', '0', '0.917394', '-0.397981', '300', '100', '1'),
('201976', '668', '3', '1', '5264.6', '1959.55', '707.695', '0.736951', '0', '0', '0.360194', '0.932877', '300', '100', '0'),
('197342', '668', '3', '1', '5520.72', '2228.89', '733.011', '0.778581', '0', '0', '0.379532', '0.925179', '300', '100', '1'),
('197343', '668', '3', '1', '5582.96', '2230.59', '733.011', '5.49098', '0', '0', '0.385827', '-0.922571', '300', '100', '1'),
('201385', '668', '3', '1', '5540.39', '2086.48', '731.066', '1.00057', '0', '0', '0.479677', '0.877445', '604800', '100', '1'),
('202212', '668', '1', '65535', '5241.05', '1663.44', '784.295', '0.54', '0', '0', '0', '0', '-604800', '100', '1'),
('201710', '668', '1', '65535', '5241.05', '1663.44', '784.295', '0.54', '0', '0', '0', '0', '-604800', '100', '1'),
('202337', '668', '2', '65535', '5241.05', '1663.44', '784.295', '0.54', '0', '0', '0', '0', '-604800', '100', '1'),
('202336', '668', '2', '65535', '5241.05', '1663.44', '784.295', '0.54', '0', '0', '0', '0', '-604800', '100', '1'),
('202079', '668', '3', '1', '5250.96', '1639.36', '784.302', '0', '0', '0', '0', '0', '-604800', '100', '1');

-- Wrong flags

UPDATE `creature_template` SET `unit_flags`=576 WHERE `entry`=38177;
UPDATE `creature_template` SET `unit_flags`=576 WHERE `entry`=38564;
UPDATE `creature_template` SET `unit_flags`=576 WHERE `entry`=38172;
UPDATE `creature_template` SET `unit_flags`=576 WHERE `entry`=38524;
UPDATE `creature_template` SET `unit_flags`=576 WHERE `entry`=38176;
UPDATE `creature_template` SET `unit_flags`=576 WHERE `entry`=38544;


-- ========================
--  world_jail_command.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

/* World Command English */
DELETE FROM `command` WHERE name IN ('jail','jailinfo','unjail','jailreload');
INSERT INTO `command` (name, security, help) VALUES
('jail', 1, 'Syntax: .jail character hours reason\nJailed the \'character\' for \'hours\' with the \'reason\'.'),
('jailinfo', 0, 'Syntax: .jailinfo\nShows your jail status.'),
('unjail', 1, 'Syntax: .unjail character\nRealeases the \'character\' out of the jail.'),
('jailreload', 3, 'Syntax: .jailreload\nLoads the jail config new.');

-- ========================
--  world_jail_trinity_string.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

/* World trinity_string */
SET NAMES 'utf8';
DELETE FROM trinity_string WHERE `entry` IN (950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 962, 963, 964, 965, 966, 967, 968, 969, 970, 971, 972, 973, 974, 975, 976, 977, 978, 979, 980, 981, 982, 983);

INSERT INTO `trinity_string` VALUES 
('950', 'You are jailed by \'%s\' for %u hour(s)!', null, 'Vous tes emprisonn par \'%s\' pour %u heures!', 'Du wurdest von \'%s\' f�r %u Stunde(n) eingebuchtet!', null, null, null, null, null),
('951', '\'%s\' wrote this as reason: \'%s\'', null, '%s a crit ceci comme tant la raison de votre emprisonnement: %s.', '\'%s\' gab dies als Grund an: \'%s\'', null, null, null, null, null),
('952', '\'%s\' was jailed by you for %u hour(s).', null, 'Vous avez emprisonn %s pour %u heures!', '\'%s\' wurde von dir f�r %u Stunde(n) eingebuchtet.', null, null, null, null, null),
('953', 'You was released out of the jail by %s.', null, 'Vous avez t liber de la prison par %s.', '\'%s\' hat dich aus dem Knast entlassen.', null, null, null, null, null),
('954', 'You have released %s out of the jail.', null, 'Vous avez liber \'%s\' de la prison.', 'Du hast \'%s\' aus dem Knast geholt.', null, null, null, null, null),
('955', 'No reason given or reason is < %u chars!', null, 'Aucune raison d\\\'emprisonnement donne ou la raison est < %u personnages.', 'Du hast keinen Grund angegeben, oder der Grund ist < %u Zeichen!', null, null, null, null, null),
('956', 'No name given!', null, 'Aucun nom donn!', 'Du hast keinen Namen angegeben!', null, null, null, null, null),
('957', 'No time given!', null, 'Aucun temps donn!', 'Du hast keine Zeit angegeben!', null, null, null, null, null),
('958', 'The jailtime must be between 1 and %u hours!', null, 'Le temps d\\\'emprisonnement est situ entre 1 et %u heures!', 'Die Jail-Zeit muss zwischen 1 und %u Std. liegen!', null, null, null, null, null),
('959', 'The character \'%s\' is not jailed!', null, '\'%s\' n\\\'est pas emprisonn!', 'Der Charakter \'%s\' ist �berhaupt nicht im Knast!', null, null, null, null, null),
('960', 'Command forbidden for jailed characters!', null, 'Commandes interdites pour les personnages emprisons!', 'Sorry, aber das d?rfen Gefangene nicht!', null, null, null, null, null),
('961', 'You have %u hour(s) left in the jail.', null, 'Vous avez %u heures  attendre avant de quitter la prison.', 'Du musst noch %u Stunde(n) absitzen.', null, null, null, null, null),
('962', 'You have %u minute(s) left in the jail.', null, 'Vous avez %u minutes attendre avant de quitter la prison.', 'Du musst noch %u Minute(n) absitzen.', null, null, null, null, null),
('963', 'You\'re a free like a bird! ;-)', null, 'Vous tes libre.', 'Du bist frei wie ein Vogel! ;-)', null, null, null, null, null),
('964', '%s was %u times jailed and has %u minute(s) left. Last time jailed by %s. Last reason was: \'%s\'', null, '%s a t librde prison, il avait t emprisonn pour %u et a t libr au aprs %u minutes. Il avait t emprisonn par %s, pour la raison suivante: %s', '\'%s\' war bis jetzt %u mal im Knast, und hat noch %u Minute(n) abzusitzen.\n Zuletzt eingebuchtet von: \'%s\'\nLetzter Grund: %s', null, null, null, null, null),
('965', '\'%s\' was never jailed.', null, '\'%s\' n\\\'a jamais t emprisonn.', '\'%s\' hat eine wei�e Weste.', null, null, null, null, null),
('966', 'You can\'t jail yourself!', null, 'Vous ne pouvez pas vous emprisonner vous-m me!', 'Du kannst dich nicht selber einbuchten!', null, null, null, null, null),
('967', 'You can\'t unjail yourself!', null, 'Vous ne pouvez pas vous librer vous m me!', 'So weit kommt es noch, da� Knastbruder sich selber befreien! :-(', null, null, null, null, null),
('968', '|cffff0000[!!! ATTENTION - IMPORTANT - WARNING !!!\r\n You were already %u times in prison. If you are in Jail for a total of  %u times, your character will be deleted\r\n|cffff0000!!! ATTENTION - IMPORTANT - WARNING !!!]', null, '|cffff0000[!!!ATTENTION - ATTENTION - ATTENTION!!!\r\n Vous �tiez d�j� %u fois en prison en %u fois, votre personnage supprim�\r\n|cffff0000!!! ATTENTION - ATTENTION - ATTENTION !!!]', '|cffff0000[!!! ACHTUNG - WICHTIG - WARNUNG !!!\r\n Du warst schon %u mal in Knast beim %u mal wird dein Charakter gel�scht\r\n|cffff0000!!! ACHTUNG - WICHTIG - WARNUNG !!!]', null, null, null, null, null),
('969', 'The character \'', null, 'Le personnage ', 'Der Charakter \'', null, null, null, null, null),
('970', '\' was jailed for ', null, ' a t emprisonn pour ', '\' wurde f�r ', null, null, null, null, null),
('971', ' hour(s) by the GM character \'', null, ' heure(s) par le MJ ', ' Stunde(n) von dem GM-Charakter \'', null, null, null, null, null),
('972', '\'. The reason is: ', null, '. La raison est: ', '\' eingebuchtet. Der Grund ist: ', null, null, null, null, null),
('973', 'The jail configuration was reloaded.', null, 'La configuration de jail a t recharge.', 'Die Gef�ngnis-Konfiguration wurde neu geladen.', null, null, null, null, null),
('974', '>> Trinity Jail config loaded.', null, '>> Configuration du jail charge.', '>> Gef�ngnis-Konfiguration geladen.', null, null, null, null, null),
('975', 'Can\'t load jail config! Table empty or missed! Use characters_jail.sql!', null, 'Impossible de charger la configuration du jail! Table vide ou innexistante! Appliquez characters_jail.sql!', 'Fehler beim laden der Gef?ngnis-Konfiguration! Der Table \'jail_conf\' ist leer oder nicht vorhanden! Nutze die \'characters_jail.sql\'!', null, null, null, null, null),
('976', 'Set all jail config settings to default...', null, 'Placez tous les param tres de configuration de prison par d faut.', 'Setze die Konfiguration des Gef?ngnisses auf Standardwerte...', null, null, null, null, null),
('977', 'The Character \'%s\'  is jailed and teleportet into the jail.', null, 'Le personnage \'%s\'  est emprisonn et t leport dans la prison.', 'Der Charakter \'%s\'  ist ein Knastbruder und wird in den Knast teleportiert.', null, null, null, null, null),
('978', 'The Character \'%s\'  was released out of the jail.', null, 'Le personnage %s  est liber  de prison.', 'Der Charakter \'%s\'  wurde aus dem Knast entlassen.', null, null, null, null, null),
('979', 'A character with this name doesn\'t exists!', null, 'Il n\'y a aucun personnage portant ce nom.', 'Ein Charakter mit diesem Namen gibt es nicht!', null, null, null, null, null),
('980', '|cffff0000[!!! ATTENTION - IMPORTANT - WARNING !!!\r\n You were already %u times in prison. If you are in Jail for a total of  %u times, your account  will be banned!\r\n|cffff0000!!! ATTENTION - IMPORTANT - WARNING !!!]', null, '|cffff0000[!!!ATTENTION - ATTENTION - ATTENTION!!!\r\n Vous avez %u fois en prison en %u fois votre compte sera banni\r\n|cffff0000!!! ATTENTION - ATTENTION - ATTENTION !!!]', '|cffff0000[!!! ACHTUNG - WICHTIG - WARNUNG !!!\r\n Du hast %u mal in Knast beim %u mal wird dein Account gebannt\r\n|cffff0000!!! ACHTUNG - WICHTIG - WARNUNG !!!]', null, null, null, null, null),
('981', 'Max. jailtimes reached!', null, 'Nombre maximum d\'Jails atteint!', 'Maximale Anzahl an Jails erreicht!', null, null, null, null, null),
('982', 'Robotron', null, 'Robotron', 'Robotron', null, null, null, null, null),
('983', 'Your Jail status was reset to 0 ', null, 'Votre statut a �t� Jail � 0 ', 'Dein Jail status wurde auf 0 zur�ck gesatzt', null, null, null, null, null);



-- ========================
--  world_ruby_sanctum.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

-- Ruby sanctum
UPDATE `instance_template` SET `Script`='instance_ruby_sanctum' WHERE `map`=724;
-- Halion
UPDATE `creature_template` SET `ScriptName`='boss_halion_real', `AIName` ='' WHERE `entry`=39863;
UPDATE `creature_template` SET `ScriptName`='boss_halion_twilight', `AIName` ='' WHERE `entry`=40142;
UPDATE `creature_template` SET `ScriptName`='mob_halion_meteor', `AIName` ='' WHERE `entry` = 40029;
UPDATE `creature_template` SET `ScriptName`='mob_halion_flame', `AIName` ='' WHERE `entry` IN (40041);
UPDATE `creature_template` SET `ScriptName`='mob_halion_control', `AIName` ='' WHERE `entry` IN (40146);
UPDATE `creature_template` SET `ScriptName`='mob_halion_orb', `AIName` ='' WHERE `entry` IN (40083,40100);
UPDATE `creature_template` SET `ScriptName`='mob_orb_rotation_focus', `AIName` ='' WHERE `entry` = 40091;
UPDATE `creature_template` SET `ScriptName`='mob_orb_carrier', `AIName` ='' WHERE `entry` = 40081;
UPDATE `creature_template` SET `ScriptName`='mob_fiery_combustion', `AIName` ='' WHERE `entry` = 40001;
UPDATE `creature_template` SET `ScriptName`='mob_soul_consumption', `AIName` ='' WHERE `entry` = 40135;
UPDATE `creature_template` SET `ScriptName`='', `AIName` ='' WHERE `entry` IN (40143, 40144, 40145);

-- spell_halion_fiery_combustion 74562
DELETE FROM `spell_script_names` WHERE `spell_id`=74562 AND `ScriptName`='spell_halion_fiery_combustion';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (74562,'spell_halion_fiery_combustion');

-- spell_halion_soul_consumption 74792
DELETE FROM `spell_script_names` WHERE `spell_id`=74792 AND `ScriptName`='spell_halion_soul_consumption';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (74792,'spell_halion_soul_consumption');


UPDATE `gameobject_template` SET `data10` = 74807, `faction` = '0', `ScriptName` = 'go_halion_portal_twilight' WHERE `gameobject_template`.`entry` IN (202794,202795);
UPDATE `gameobject_template` SET `faction` = '0', `ScriptName` = 'go_halion_portal_real' WHERE `gameobject_template`.`entry` IN (202796);

-- Baltharus
UPDATE `creature_template` SET `ScriptName`='boss_baltharus', `AIName` ='', `dmg_multiplier` = 80  WHERE `entry`=39751;
UPDATE `creature_template` SET `ScriptName`='mob_baltharus_clone', `AIName` ='', `dmg_multiplier` = 80  WHERE `entry`=39899;

-- zarithrian
UPDATE `creature_template` SET `ScriptName`='boss_zarithrian', `AIName` ='' WHERE `entry`=39746;
UPDATE `creature` SET `position_x` = '3008.552734',`position_y` = '530.471680',`position_z` = '89.195290',`orientation` = '6.16' WHERE `id` = 39746;
UPDATE `creature_template` SET `ScriptName`='mob_flamecaller_ruby', `AIName` ='' WHERE `entry`=39814;

-- Saviana Ragefire
UPDATE `creature_template` SET `ScriptName`='boss_ragefire', `AIName` ='' WHERE `entry`=39747;
DELETE FROM `conditions` WHERE `SourceEntry`=74455;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
(13,0,74455,0,18,1,39747,0,0, '', 'Ragefire - Conflagration');

-- Xerestrasza
UPDATE `creature_template` SET `ScriptName`='mob_xerestrasza', `AIName` ='' WHERE `entry`=40429;

-- fix Halion spawn
DELETE FROM `creature` WHERE `id` = 39863;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(39863, 724, 15, 1, 0, 0, 3144.93, 527.233, 72.8887, 0.110395, 300, 0, 0, 11156000, 0, 0, 0, 0, 0, 0);

-- sound / text
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1666406 AND -1666000;

-- xerestrasza
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-1666000','Help! I am trapped within this tree! I require aid!','???????! ? ??? ???? ???????. ??? ????? ??????!','17490','6','0','0','SAY_XERESTRASZA_YELL_1'),
('-1666001','Thank you! I could have not held out for much longer. A terrible thing has happened here.','???????! ??? ??? ? ?? ????? ?? ????????????... ????? ????????? ???????? ???????...','17491','0','0','0','SAY_XERESTRASZA_YELL_2'),
('-1666002','We believed that the Sanctum was well fortified, but we were not prepareted for the nature of this assault.','????????? ????????? ????????????, ?? ?? ??? ??? ??? ?? ???????????? ?????? ??????...','17492','0','0','0','SAY_XERESTRASZA_SAY_1'),
('-1666003','The Black Dragonkin materialized from thin air, and set upon us before we could react.','?????? ??????? ??????? ?? ????????. ?? ???? ?? ?????? ?????? ??? ??????????...','17493','0','0','0','SAY_XERESTRASZA_SAY_2'),
('-1666004','We did not stand a chance. As my brethren perished around me, I managed to retreat hear and bar the entrance.','???? ???? ???????, ??? ?????? ????? ???? ?? ??????. ? ? ?????????? ????? ? ?????????? ????.','17494','0','0','0','SAY_XERESTRASZA_SAY_3'),
('-1666005','They slaughtered us with cold efficiency, but the true focus of their interest seemed to be the eggs kept here in the sanctum.','??? ??????? ? ??????????? ???????????, ?? ???????? ????? ????? ???? ?????? ??? ? ?????????.','17495','0','0','0','SAY_XERESTRASZA_SAY_4'),
('-1666006','The commander of the forces on the ground here is a cruel brute named Zarithrian. But I fear there are greater powers at work.',' ?????? ????????? ??????????? ?????????, ??, ?????, ??? ???????? ? ????? ?????????????? ???.','17496','0','0','0','SAY_XERESTRASZA_SAY_5'),
('-1666007','In their initial assault I caught a glimpse of their true leader, a fearsome full-grown Twilight Dragon.','? ????? ?????? ? ??????? ??????????? ?? ?????????? ?????? - ????????? ??????????? ???????.','17497','0','0','0','SAY_XERESTRASZA_SAY_6'),
('-1666008','I know not the extent of their plans heroes, but I know this: they cannot be allowed to succeed!','?????, ??? ?? ?????? ???? ?????????? ??? ??????????. ???? ? ???? ????? - ?? ????? ??????????!','17498','0','0','0','SAY_XERESTRASZA_SAY_7'),

-- Halion
('-1666100','Meddlesome insects, you\'re too late! The Ruby Sanctum is lost.','?????????? ???????! ?? ????????. ????????? ????????? ????!','17499','6','0','0','SAY_HALION_SPAWN'),
('-1666101','Your world teeters on the brink of annihilation. You will all bear witness to the coming of a new age of destruction!','???? ??? ???-??? ??????????? ? ??????. ??? ?????? ????? ?????? ?????? ??? ??????????!','17500','6','0','0','SAY_HALION_AGGRO'),
('-1666102','Another hero falls.','??????? ??? ????? ???????','17501','6','0','0','SAY_HALION_SLAY_1'),
('-1666103','Ha Ha Ha!','','17502','6','0','0','SAY_HALION_SLAY_2'),
('-1666104','Relish this victory mortals, for it will be your last. This world will burn with the Master\'s return!','??? ???? ????????? ??????. ??????????? ?????? ?? ??????. ??? ????? ???????? ??? ????????, ???? ??? ?????? ? ????!','17503','6','0','0','SAY_HALION_DEATH'),
('-1666105','Not good enough!','???????!','17504','6','0','0','SAY_HALION_BERSERK'),
('-1666106','The heavens burn!','?????? ? ????!','17505','6','0','0','SAY_HALION_SPECIAL_1'),
('-1666107','Beware the shadow!','','17506','6','0','0','SAY_HALION_SPECIAL_2'),
('-1666108','You will find only suffering within the realm of Twilight. Enter if you dare.','?? ??????? ?????? ???? ? ???? ???????. ???????, ???? ????????.','17507','6','0','0','SAY_HALION_PHASE_2'),
('-1666109','I am the light AND the darkness! Cower mortals before the Herald of Deathwing!','? ???? ???? ? ? ???? ????! ?????????, ?????????, ????? ??????????? ???????????!','17508','6','0','0','SAY_HALION_PHASE_3'),
('-1666110','<need translate>','?? ??????????? ?????? ?????????? ?????? ???????!','0','3','0','0',''),
('-1666111','<need translate>','???? ???????? ??????????? ??????? ?????? ? ?????????? ???!','0','3','0','0',''),
('-1666112','<need translate>','???? ???????? ??????????? ??????? ?????? ? ???????? ???!','0','3','0','0',''),
('-1666113','<need translate>','???????? ? ????? ? ????? ?? ?????, ?????? ??????????????? ????????? ????.','0','3','0','0',''),

-- Zarthrian
('-1666200','Alexstrasza has chosen capable allies. A pity that I must end you!','?????????? ??????? ????????? ?????????... ????, ??? ???????? ?????????? ???!','17512','6','0','0','SAY_ZARITHRIAN_AGGRO'),
('-1666201','You thought you stood a chance?','????? ???? ? ?????????!','17513','6','0','0','SAY_ZARITHRIAN_SLAY_1'),
('-1666202','It\'s for the best.','??? ?????? ? ???????!','17514','6','0','0','SAY_ZARITHRIAN_SLAY_2'),
('-1666203','Halion! I\'m...aah!','??????! ?...','17515','6','0','0','SAY_ZARITHRIAN_DEATH'),
('-1666204','Turn them to ash, minions!','?????! ???????? ?? ? ?????!','17516','6','0','0','SAY_ZARITHRIAN_SPECIAL_1'),

-- baltharus
('-1666300','Ah, the entertainment has arrived...','?-?-?, ???? ???????.','17520','6','0','0','SAY_BALTHARUS_AGGRO'),
('-1666301','Baltharus leaves no survivors!','?????? ?? ????????? ?????!','17521','6','0','0','SAY_BALTHARUS_SLAY_1'),
('-1666302','This world has enough heroes!','? ???? ??????? ?????? ? ??? ????...','17522','6','0','0','SAY_BALTHARUS_SLAY_2'),
('-1666303','I...didn\'t see that coming...','???� ??? ????? ??????????..','17523','1','0','0','SAY_BALTHARUS_DEATH'),
('-1666304','Twice the pain and half the fun!','????? ??????? ?????????.','17524','6','0','0','SAY_BALTHARUS_SPECIAL_1'),
('-1666305','Your power wanes, ancient one! Soon, you will join your friends!','???? ???? ?? ??????, ??????????! ????? ?? ?????????????? ? ????? ???????!','17525','6','0','0','SAY_BALTHARUS_YELL'),

-- saviana
('-1666400','You will suffer for this intrusion...','???-?-?? ???? ?-c????? ?????? ?? ??? ?????????!','17528','6','0','0','SAY_SAVIANA_AGGRO'),
('-1666401','As it should be!','??? ? ?????? ????!','17529','6','0','0','SAY_SAVIANA_SLAY_1'),
('-1666402','Halion will be pleased...','?????? ????? ???????!','17530','6','0','0','SAY_SAVIANA_SLAY_2'),
('-1666403','<screaming>','?...','17531','6','0','0','SAY_SAVIANA_DEATH'),
('-1666404','Burn in the master\'s flame!','?????? ? ???? ???????!','17532','6','0','0','SAY_SAVIANA_SPECIAL_1'),
('-1666405','<need translate>','|3-3(%s) ??????? ? ???????????!','0','3','0','0','');

-- ========================
--  world_script_texts_icc.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36612, -1631009, 'THE MASTER\'S RAGE COURSES THROUGH ME!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ??? ?????? ?????? ?????????!', 16945, 1, 0, 0, 'SAY_BERSERK');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36612, -1631010, 'Lord Marrowgar creates a whirling storm of bone!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???? ?????? ???????????, ? ??? ????? ???????? ?????????', 0, 3, 0, 0, 'SAY_BONE_STORM_EMOTE');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36612, -1631006, 'More bones for the offering!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????, ??? ????????????????!', 16942, 1, 0, 0, 'SAY_KILL_1');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36612, -1631007, 'Languish in damnation!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ? ?????? ?????!', 16943, 1, 0, 0, 'SAY_KILL_2');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36612, -1631008, 'I see... only darkness...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '? ????... ???? ????', 16944, 1, 0, 0, 'SAY_DEATH');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36612, -1631003, 'Bound by bone!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ??????!', 16947, 1, 0, 0, 'SAY_BONESPIKE_1');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36612, -1631004, 'Stick Around!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????-?? ???!', 16948, 1, 0, 0, 'SAY_BONESPIKE_2');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36612, -1631005, 'The only escape is death!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????????? ????? - ??? ??????!', 16949, 1, 0, 0, 'SAY_BONESPIKE_3');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36612, -1631001, 'The Scourge will wash over this world as a swarm of death and destruction!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ??????? ???? ??? ?????? ?????? ? ??????????!', 16941, 1, 0, 0, 'SAY_AGGRO');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36612, -1631002, 'BONE STORM!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ??????!', 16946, 1, 0, 0, 'SAY_BONE_STORM');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36612, -1631000, 'This is the beginning AND the end, mortals. None may enter the master\'s sanctum!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????, ??? ???? ?????????? ??? ? ?? ?????????! ????? ?? ????? ???????  ? ??????? ?????????!', 16950, 1, 0, 0, 'SAY_ENTER_ZONE');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631016, 'Through our Master, all things are possible. His power is without limit, and his will unbending.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??? ?????? ????????? ??? ?????? ????????????, ??? ???? ?? ????? ??????, ????? ?? ????? ??????? ??? ????!', 17270, 1, 0, 0, 'SAY_INTRO_6');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631017, 'Those who oppose him will be destroyed utterly, and those who serve -- who serve wholly, unquestioningly, with utter devotion of mind and soul -- elevated to heights beyond your ken.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???, ??? ????????? ???????????? ????? ?????????. ??? ??, ??? ????? ??????? ??? ????? ? ???????, ????????? ????? ?????, ? ??????? ?? ?? ? ????? ???? ?????????!', 17271, 1, 0, 0, 'SAY_INTRO_7');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631015, 'The sooner you come to accept your condition as a defect, the sooner you will find yourselves in a position to transcend it.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??? ?????? ?? ????????? ??????????? ??????????, ??? ?????? ???????? ???? ????!', 17269, 1, 0, 0, 'SAY_INTRO_5');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631013, 'Fix your eyes upon your crude hands: the sinew, the soft meat, the dark blood coursing within.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ?? ???? ????, ??????????? ??? ?????????? ?? ????????!', 16878, 1, 0, 0, 'SAY_INTRO_3');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631014, 'It is a weakness; a crippling flaw.... A joke played by the Creators upon their own creations.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????, ???????, ?????, ??? ?????????? ? ?????, ??? ??? ??????? ? ????? ?? ????????????, ????? ?????????. ????????? ??????? ???????? ??? ????!', 17268, 1, 0, 0, 'SAY_INTRO_4');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631011, 'You have found your way here, because you are among the few gifted with true vision in a world cursed with blindness.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ????? ??????, ??? ???????? ?????? ???????: ?? ?????????, ??? ?? ??? ???? ????????? ???????!', 17272, 1, 0, 0, 'SAY_INTRO_1');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631012, 'You can see through the fog that hangs over this world like a shroud, and grasp where true power lies.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??? ??????? ?????? ?????? ??? ?????????? ???????? ??????? ????!', 17273, 1, 0, 0, 'SAY_INTRO_2');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631018, 'What is this disturbance?! You dare trespass upon this hallowed ground? This shall be your final resting place.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??? ?? ?????? ??????? ? ??? ????????? ?????, ??? ????? ?????? ????? ???????!', 16868, 1, 0, 0, 'SAY_AGGRO');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631019, 'Enough! I see I must take matters into my own hands!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????! ?????? ???? ????? ??? ? ???? ????!', 16877, 1, 0, 0, 'SAY_PHASE_2');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631020, 'Lady Deathwhisper\'s Mana Barrier shimmers and fades away!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 0, 0, 'SAY_PHASE_2_EMOTE');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631021, 'You are weak, powerless to resist my will!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ?? ? ????? ?????????? ???? ????!', 16876, 1, 0, 0, 'SAY_DOMINATE_MIND');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631022, 'Take this blessing and show these intruders a taste of our master\'s power.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ??? ????????????? ? ?????? ??????? ???? ?????? ?????????!', 16873, 1, 0, 0, 'SAY_DARK_EMPOWERMENT');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631023, 'I release you from the curse of flesh!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '? ?????????? ???? ?? ????????? ?????, ??? ?????? ?????!', 16874, 1, 0, 0, 'SAY_DARK_TRANSFORMATION');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631024, 'Arise and exult in your pure form!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ? ?????? ???????? ?????!', 16875, 1, 0, 0, 'SAY_ANIMATE_DEAD');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631025, 'Do you yet grasp of the futility of your actions?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ???????? ??????????????? ????? ?????????', 16869, 1, 0, 0, 'SAY_KILL_1');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631026, 'Embrace the darkness... Darkness eternal!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ?? ????... ?????? ????!', 16870, 1, 0, 0, 'SAY_KILL_2');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631027, 'This charade has gone on long enough.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??? ?????? ???? ????!', 16872, 1, 0, 0, 'SAY_BERSERK');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36855, -1631028, 'All part of the masters plan! Your end is... inevitable!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ??? ???? ?????????...???? ?????? ?????????...', 16871, 1, 0, 0, 'SAY_DEATH');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36626, -1631078, 'NOOOO! You kill Stinky! You pay!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???! ?? ????? ???????! ?????? ????????!', 16907, 1, 0, 0, 'SAY_STINKY_DEAD');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36626, -1631079, 'Fun time!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????????', 16901, 1, 0, 0, 'SAY_AGGRO');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36626, -1631081, 'Festergut farts.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16911, 2, 0, 0, 'EMOTE_GAS_SPORE');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36626, -1631082, 'Festergut releases Gas Spores!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 0, 0, 'EMOTE_WARN_GAS_SPORE');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36626, -1631083, 'Gyah! Uhhh, I not feel so good...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???-?? ??? ????????...', 16906, 1, 0, 0, 'SAY_PUNGENT_BLIGHT');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36626, -1631084, 'Festergut begins to cast |cFFFF7F00Pungent Blight!|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 0, 0, 'EMOTE_WARN_PUNGENT_BLIGHT');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36626, -1631085, 'Festergut vomits.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, 'EMOTE_PUNGENT_BLIGHT');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36626, -1631086, 'Daddy, I did it!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????! ? ???? ??????????!', 16902, 1, 0, 0, 'SAY_KILL_1');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36626, -1631087, 'Dead, dead, dead!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???-????, ???-????, ???-????!', 16903, 1, 0, 0, 'SAY_KILL_2');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36626, -1631088, 'Fun time over!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ?????!', 16905, 1, 0, 0, 'SAY_BERSERK');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36626, -1631089, 'Da ... Ddy...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??-??...', 16904, 1, 0, 0, 'SAY_DEATH');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36627, -1631094, 'What? Precious? Noooooooooo!!!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???? ????????? ???????????????!!!', 16993, 1, 0, 0, 'SAY_PRECIOUS_DIES');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36627, -1631095, 'WEEEEEE!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????!', 16986, 1, 0, 0, 'SAY_AGGRO');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36627, -1631096, '%s begins to cast Slime Spray!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 0, 0, 'EMOTE_SLIME_SPRAY');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36627, -1631097, 'Icky sticky.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16991, 1, 0, 0, 'SAY_SLIME_SPRAY');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36627, -1631098, '|TInterfaceIconsspell_shadow_unstableaffliction_2.blp:16|t%s begins to cast |cFFFF0000Unstable Ooze Explosion!|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 0, 0, 'EMOTE_UNSTABLE_EXPLOSION');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36627, -1631099, 'I think I made an angry poo-poo. It gonna blow!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '? ?????? ????? ???? ????! ?????? ?????????!', 16992, 1, 0, 0, 'SAY_UNSTABLE_EXPLOSION');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36627, -1631100, 'Daddy make toys out of you!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ??????? ????? ??????? ?? ???!', 16988, 1, 0, 0, 'SAY_KILL_1');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36627, -1631101, 'I brokes-ded it...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '? ??? ???????...', 16987, 1, 0, 0, 'SAY_KILL_2');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36627, -1631102, 'Sleepy Time!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16990, 1, 0, 0, 'SAY_BERSERK');
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (36627, -1631103, 'Bad news daddy...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????, ?? ?????????�', 16989, 1, 0, 0, 'SAY_DEATH');

-- ========================
--  world_scriptnames.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

UPDATE `gameobject_template` SET `ScriptName`='go_blackened_urn' WHERE `entry`=194092;
update creature_template set scriptname = 'npc_duke_hydraxis' where entry in(13278);
update gameobject_template set scriptname = 'go_wind_stone' where entry in (180502,180529,180534,180456,180461,180466,180518,180539,180544,180549,180554,180559,180564);


-- ========================
--  world_startup_error_fix.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

/*Playerbot*/
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (60000, 0, 0, 0, 0, 0, 169, 0, 169, 0, 'Recruitment Officer', '', '', 0, 80, 80, 0, 35, 35, 1, 1.4, 1.14286, 1, 0, 228, 298, 0, 1837, 1, 2000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'script_bot_giver', 0);

/*HoR loot*/
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 50308, 0, 1, 2, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 50305, 0, 1, 2, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 50304, 0, 1, 2, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 50306, 0, 1, 2, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 50314, 0, 1, 2, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 50309, 0, 1, 2, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 50311, 0, 1, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 50310, 0, 1, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 50312, 0, 1, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 50313, 0, 1, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 50302, 0, 1, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 50303, 0, 1, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 43102, 100, 1, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27993, 47241, 100, 1, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 47241, 100, 1, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 49842, 0, 1, 2, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 49847, 0, 1, 2, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 49843, 0, 1, 2, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 49848, 0, 1, 2, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 49851, 0, 1, 2, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 49841, 0, 1, 2, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 49849, 0, 1, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 49844, 0, 1, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 49840, 0, 1, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 49845, 0, 1, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 49839, 0, 1, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (27985, 49846, 0, 1, 1, 1, 1);

/*Gundrak respawn*/
DELETE FROM `linked_respawn` WHERE `guid`=127074 AND `linkType`=0;
DELETE FROM `linked_respawn` WHERE `guid`=127071 AND `linkType`=0;
DELETE FROM `linked_respawn` WHERE `guid`=127073 AND `linkType`=0;
DELETE FROM `linked_respawn` WHERE `guid`=127075 AND `linkType`=0;
DELETE FROM `linked_respawn` WHERE `guid`=127072 AND `linkType`=0;

-- ========================
--  world_SWP.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25367;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25363;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25371;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25370;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25369;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25867;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25368;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25507;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25372;

update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25484;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25506;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25483;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25373;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25486;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25837;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25485;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25508;

update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25593;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25599;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25595;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25592;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25948;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25597;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25591;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25509;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25851;
update creature_template set scriptname = 'mob_sunwell_plateau_tash' where entry = 25598;
update creature_template set scriptname = 'mob_volatile_felfire_fiend' where entry=25598;

-- ========================
--  world_TOC5.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

-- Template updates (TDB)
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`baseattacktime`=2000,`unit_flags`=`unit_flags`|33587456,`speed_run`=1.38571 WHERE `entry`=35637; -- Marshal Jacob Alerius' Mount
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`baseattacktime`=2000,`unit_flags`=`unit_flags`|33587456,`speed_run`=1.38571 WHERE `entry`=35633; -- Ambrose Boltspark's Mount
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`baseattacktime`=2000,`unit_flags`=`unit_flags`|33587456,`speed_run`=1.38571 WHERE `entry`=35768; -- Colosos' Mount
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`baseattacktime`=2000,`unit_flags`=`unit_flags`|33587456,`speed_run`=1.38571 WHERE `entry`=34658; -- Jaelyne Evensong's Mount
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`baseattacktime`=2000,`unit_flags`=`unit_flags`|33587456,`speed_run`=1.38571 WHERE `entry`=35636; -- Lana Stouthammer's Mount
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`baseattacktime`=2000,`unit_flags`=`unit_flags`|33587456,`speed_run`=1.38571 WHERE `entry`=35638; -- Mokra the Skullcrusher's Mount
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`baseattacktime`=2000,`unit_flags`=`unit_flags`|33587456,`speed_run`=1.38571,`VehicleId`=480 WHERE `entry`=35635; -- Eressea Dawnsinger's Mount
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`baseattacktime`=2000,`unit_flags`=`unit_flags`|33587456,`speed_run`=1.38571 WHERE `entry`=35640; -- Runok Wildmane's Mount
UPDATE `creature_template` SET `faction_A`=126,`faction_H`=126,`baseattacktime`=2000,`unit_flags`=`unit_flags`|33587456,`speed_run`=1.38571,`VehicleId`=485 WHERE `entry`=35641; -- Zul'tore's Mount
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`baseattacktime`=2000,`unit_flags`=`unit_flags`|33587456,`speed_run`=1.28968 WHERE `entry`=35634; -- Deathstalker Visceri's Mount
-- Addon data (TDB)
DELETE FROM `creature_template_addon` WHERE `entry` IN (35637,35633,35768,34658,35636,35638,35635,35640,35641,35634);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(35637,0,0,1,0, '67870 0'), -- Marshal Jacob Alerius' Mount, Auras: Trample
(35633,0,0,1,0, '67870 0'), -- Ambrose Boltspark's Mount
(35768,0,0,1,0, '67870 0'), -- Colosos' Mount
(34658,0,0,1,0, '67870 0'), -- Jaelyne Evensong's Mount
(35636,0,0,1,0, '67870 0'), -- Lana Stouthammer's Mount
(35638,0,0,1,0, '67870 0'), -- Mokra the Skullcrusher's Mount
(35635,0,0,1,0, '67870 0'), -- Eressea Dawnsinger's Mount
(35640,0,0,1,0, '67870 0'), -- Runok Wildmane's Mount
(35641,0,0,1,0, '67870 0'), -- Zul'tore's Mount
(35634,0,0,1,0, '67870 0'); -- Deathstalker Visceri's Mount
-- Spellclick (TDB)
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (35637,35633,35768,34658,35636,35638,35635,35640,35641,35634);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(35637,46598,0,0,0,1,0,0,0), -- Marshal Jacob Alerius' Mount - Ride Vehicle Hardcoded
(35633,46598,0,0,0,1,0,0,0), -- Ambrose Boltspark's Mount - Ride Vehicle Hardcoded
(35768,46598,0,0,0,1,0,0,0), -- Colosos' Mount - Ride Vehicle Hardcoded
(34658,46598,0,0,0,1,0,0,0), -- Jaelyne Evensong's Mount - Ride Vehicle Hardcoded
(35636,46598,0,0,0,1,0,0,0), -- Lana Stouthammer's Evensong's Mount - Ride Vehicle Hardcoded
(35638,46598,0,0,0,1,0,0,0), --  Mokra the Skullcrusher's Mount - Ride Vehicle Hardcoded
(35635,46598,0,0,0,1,0,0,0), -- Eressea Dawnsinger's Mount - Ride Vehicle Hardcoded
(35640,46598,0,0,0,1,0,0,0), -- Runok Wildmane's Mount - Ride Vehicle Hardcoded
(35641,46598,0,0,0,1,0,0,0), -- Zul'tore's Mount - Ride Vehicle Hardcoded
(35634,46598,0,0,0,1,0,0,0); -- Deathstalker Visceri's Mount - Ride Vehicle Hardcoded
-- Model data (TDB)
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=1,`gender`=0 WHERE `modelid`=29255; -- Colosos' Mount
UPDATE `creature_model_info` SET `bounding_radius`=0.525,`combat_reach`=2.25,`gender`=0 WHERE `modelid`=9991; -- Jaelyne Evensong's Mount
UPDATE `creature_model_info` SET `bounding_radius`=0.35,`combat_reach`=2,`gender`=0 WHERE `modelid`=2787; -- Lana Stouthammer's Mount
UPDATE `creature_model_info` SET `bounding_radius`=0.35,`combat_reach`=1.5,`gender`=2 WHERE `modelid`=29879; -- Mokra the Skullcrusher's Mount
UPDATE `creature_model_info` SET `bounding_radius`=1,`combat_reach`=1,`gender`=2 WHERE `modelid`=28607; -- Eressea Dawnsinger's Mount
UPDATE `creature_model_info` SET `bounding_radius`=0.34,`combat_reach`=1.5,`gender`=2 WHERE `modelid`=29880; -- Runok Wildmane's Mount
UPDATE `creature_model_info` SET `bounding_radius`=0.35,`combat_reach`=1.5,`gender`=2 WHERE `modelid`=10718; -- Deathstalker Visceri's Mount
-- Vehicles (TDB) 
DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (35637,35633,35768,34658,35636,35638,35635,35640,35641,35634);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(35637, 34705, 0, 0, 'Marshal Jacob Alerius'' Mount', 6, 30000),
(35633, 34702, 0, 0, 'Ambrose Boltspark''s Mount', 6, 30000),
(35768, 34701, 0, 0, 'Colosos'' Mount', 6, 30000),
(34658, 34657, 0, 0, 'Jaelyne Evensong''s Mount', 6, 30000),
(35636, 34703, 0, 0, 'Lana Stouthammer''s Mount', 6, 30000),
(35638, 35572, 0, 0, 'Mokra the Skullcrusher''s Mount', 6, 30000),
(35635, 35569, 0, 0, 'Eressea Dawnsinger''s Mount', 6, 30000),
(35640, 35571, 0, 0, 'Runok Wildmane''s Mount', 6, 30000),
(35641, 35570, 0, 0, 'Zul''tore''s Mount', 6, 30000),
(35634, 35617, 0, 0, 'Deathstalker Visceri''s Mount', 6, 30000);

-- Trial of the champion
-- Faction of Argent Warhorse and Argent Battleworg
UPDATE `creature_template` SET `faction_H`=16 WHERE `entry`=35644;
UPDATE `creature_template` SET `faction_A`=16 WHERE `entry`=36558;
-- Unit flags Battleworg
UPDATE `creature_template` SET `unit_flags`=256 WHERE `entry`=36558;
-- Spells for Battleworg
UPDATE `creature_template` SET `spell1`=68505, `spell2`=62575, `spell3`=68282, `spell4`=66482 WHERE `entry`=36558;
-- Vehicleid of Warhorse
UPDATE `creature_template` SET `VehicleId`=486 WHERE `entry`=35644;
-- Speeds
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry` IN (36558, 35644);
-- Attacktime
UPDATE `creature_template` SET `baseattacktime`=0 WHERE `entry` IN (36558, 35644);
-- Vehicle template accessory for minions
DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (33321, 33323, 33320, 33322, 33316, 33317, 33324, 33217, 33318, 33319);
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`) VALUES
(33321,35323,0,1, 'Darkspear Raptor'),
(33323,35326,0,1, 'Silvermoon Hawkstrider'),
(33320,35314,0,1, 'Orgrimmar Wolf'),
(33322,35325,0,1, 'Thunder Bluff Kodo'),
(33316,35329,0,1, 'Ironforge Ram'),
(33317,35331,0,1, 'Gnomeregan Mechanostrider'),
(33324,35327,0,1, 'Forsaken Warhorse'),
(33217,35328,0,1, 'Stormwind Steed'),
(33318,35330,0,1, 'Exodar Elekk'),
(33319,35332,0,1, 'Darnassian Nightsaber');
-- Equipements ids 
UPDATE `creature_template` SET `equipment_id`=2049 WHERE `entry` in (35314,35326,35327,35325,35323,35331,35330,35329,35328,35332);
UPDATE `creature_template` SET `equipment_id`=2025 WHERE `entry` in (35571,36090);
UPDATE `creature_template` SET `equipment_id`=2021 WHERE `entry` in (35569,36085);
UPDATE `creature_template` SET `equipment_id`=2018 WHERE `entry` in (35572,36089);
UPDATE `creature_template` SET `equipment_id`=2020 WHERE `entry` in (35617,36084);
UPDATE `creature_template` SET `equipment_id`=2019 WHERE `entry` in (35570,36091);
UPDATE `creature_template` SET `equipment_id`=2096 WHERE `entry` in (34701,36803);
UPDATE `creature_template` SET `equipment_id`=2093 WHERE `entry` in (34703,36087);
UPDATE `creature_template` SET `equipment_id`=2095 WHERE `entry` in (34657,36086);
UPDATE `creature_template` SET `equipment_id`=2092 WHERE `entry` in (34705,36088);
UPDATE `creature_template` SET `equipment_id`=834 WHERE `entry` in (35119,35518);
UPDATE `creature_template` SET `equipment_id`=235 WHERE `entry` in (34928,35517);
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry` in (35451,35490);

-- Scriptname, hp, damage, level
UPDATE `creature_template` SET `ScriptName`='generic_vehicleAI_toc5', `minlevel`='80', `maxlevel`='80', `rank`='1', `mindmg`='420', `maxdmg`='630', `attackpower`='157', `Health_mod`='5.95238' WHERE `entry` IN (33324, 33321, 33322, 33320, 33323, 33319, 33318, 33317, 33316, 33324);

-- Hp, damage and level.. 
UPDATE `creature_template` SET `unit_flags`=0 , `minlevel`='80', `maxlevel`='80', `mindmg`='420', `rank`='1', `maxdmg`='630', `attackpower`='157', `Health_mod`='15' WHERE `entry` IN (35635, 35640, 35634, 35638, 35641, 34658, 35633, 35768, 35636, 35637);

-- Npcs on vehicle should be passive and untargettable 
-- (not blizzlike, but only way to make the event works. On offy players must kill the champions not the vehicles..)
UPDATE `creature_template` SET `AIName`='PassiveAI', `unit_flags`=33554434 WHERE `entry` IN (SELECT `accessory_entry` FROM `vehicle_template_accessory` WHERE `entry` IN (33324, 33321, 33322, 33320, 33323, 33319, 33318, 33317, 33316, 33324));

-- scale of mokra mount
UPDATE `creature_template` SET `scale`=1.5 WHERE `entry`=35638;

-- Revert PassiveAI for champions on mount
UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (SELECT `accessory_entry` FROM `vehicle_template_accessory` WHERE `entry` IN (33324, 33321, 33322, 33320, 33323, 33319, 33318, 33317, 33316, 33324));

-- Template update of all Memories of boss "Argent Confessor Paletress"
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16, `rank`=1, `minlevel`=82, `maxlevel`=82, `exp`=2 WHERE `name` LIKE 'Memory of %';

-- Faction of vehicles
UPDATE `creature_template` SET `Faction_A`=16, `Faction_H`=16 WHERE `entry` IN (33324, 33321, 33322, 33320, 33323, 33319, 33318, 33317, 33316, 33324);

-- Scriptname of all Memories of boss "Argent Confessor Paletress"
UPDATE `creature_template` SET `scriptname`='npc_memory' WHERE `name` LIKE 'Memory of %';

-- Vehicle for black knight
DELETE FROM `vehicle_template_accessory` WHERE `entry` = 35491;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`) VALUES
(35491,35451,0,0, 'Trial of the Champion - Black Knight on his gryphon');

-- Black Knight Gryphon
UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35, `mindmg`=0, `maxdmg`=0, `attackpower`=0, `dmg_multiplier`=0, `baseattacktime`=0, `unit_flags`=33554432, `dynamicflags`=0, `minrangedmg`=0, `maxrangedmg`=0, `rangedattackpower`=0, `VehicleId`=486 WHERE `entry`=35491;

-- Boss immune mask
UPDATE `creature_template` SET `mechanic_immune_mask`=805257215 WHERE `entry` IN (35490,35451,35518,35517);

-- Spellids fix for mounts 
UPDATE `creature_template` SET `spell1`=62544, `spell3`=63010 WHERE `entry`IN(35644,36558);

-- Black Knight gryphon
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`= 35491;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(35491,46598,0,0,0,0,0,0,0);

-- Script texts
DELETE FROM `script_texts` WHERE `entry` <= -1999926 and `entry` >= -1999970;
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1999926, 'Coming out of the gate Grand Champions other faction.  ' ,0,0,0,1, 'SAY_START' ),
(0,-1999927, 'Good work! You can get your award from Crusader\'s Coliseum chest!.  ' ,0,1,0,1, 'Win' ),
(0,-1999928, 'You spoiled my grand entrance. Rat.' ,16256,1,0,5, 'SAY_AGGRO' ),
(0,-1999929, 'Did you honestly think an agent if the Kich King would be bested on the field of your pathetic little tournament?' ,16257,1,0,5, 'SAY_AGGRO_1' ),
(0,-1999930, 'I have come to finish my task ' ,16258,1,0,5, 'SAY_AGGRO_2' ),
(0,-1999931, 'This farce ends here!' ,16259,1,0,5, 'SAY_AGGRO_3' ),
(0,-1999932, '[Zombie]Brains.... .... ....' ,0,1,0,5, 'SAY_SLAY' ),
(0,-1999933, 'My roting flash was just getting in the way!' ,16262,1,0,5, 'SAY_DEATH_1' ),
(0,-1999934, 'I have no need for bones to best you!' ,16263,1,0,5, 'SAY_DEATH_2' ),
(0,-1999935, 'No! I must not fail...again...' ,16264,1,0,5, 'SAY_DEATH_3' ),
(0,-1999936, 'What\'s that. up near the rafters ?' ,0,1,0,5, 'detected' ),
(0,-1999937, 'Please change your weapon! Next battle will be start now!' ,0,3,0,5, 'nx' ),
(0,-1999939, 'Excellent work!' ,0,1,0,1, 'work' ),
(0,-1999940, 'Coming out of the gate Crusader\'s Coliseum Champion.' ,0,0,0,1, 'SAY_START3' ),
(0,-1999941, 'Excellent work! You are win Argent champion!' ,0,3,0,0, 'win' ),
(0,-1999942, 'The Sunreavers are proud to present their representatives in this trial by combat.' ,0,0,0,1, 'an1' ),
(0,-1999943, 'Welcome, champions. Today, before the eyes of your leeders and peers, you will prove youselves worthy combatants.' ,0,0,0,1, 'an2' ),
(0,-1999944, 'Fight well, Horde! Lok\'tar Ogar!' ,0,1,0,5, 'Thrall' ),
(0,-1999945, 'Finally, a fight worth watching.' ,0,1,0,5, 'Garrosh' ),
(0,-1999946, 'I did not come here to watch animals tear at each other senselessly, Tirion' ,0,1,0,5, 'King' ),
(0,-1999947, 'You will first be facing three of the Grand Champions of the Tournament! These fierce contenders have beaten out all others to reach the pinnacle of skill in the joust.' ,0,1,0,5, 'Hightlord' ),
(0,-1999948, 'Will tought! You next challenge comes from the Crusade\'s own ranks. You will be tested against their consederable prowess.' ,0,1,0,5, 'Hightlord2' ),
(0,-1999949, 'You may begin!' ,0,0,0,5, 'text' ),
(0,-1999951, 'Take this time to consider your past deeds.' ,16248,1,0,5, 'palsum' ),
(0,-1999952, 'What is the meaning of this?' ,0,1,0,5, 'dk_hightlord' ),
(0,-1999953, 'No...I\'m still too young' ,0,1,0,5, 'die' ),
(0,-1999954, 'Excellent work! You are win Argent champion!' ,0,3,0,0, 'win' ),
(0,-1999969, 'Pathetic.' ,16260, 1, 0, 0, NULL),
(0,-1999955, 'Well then, let us begin.' ,16247, 1, 0, 0, 'start'),
(0,-1999960, 'Take your rest.' ,16250, 1, 0, 0, NULL),
(0,-1999959, 'Be at ease.' ,16251, 1, 0, 0, NULL),
(0,-1999957, 'You... You need more practice.' ,16137, 1, 0, 0, NULL),
(0,-1999958, 'Nay! Nay! And I say yet again nay! Not good enough!' ,16138, 1, 0, 0, NULL),
(0,-1999961, 'Prepare yourselves!' ,16135, 1, 0, 0, NULL),
(0,-1999962, 'I yield! I submit. Excellent work. May I run away now?' ,16139, 1, 0, 0, NULL),
(0,-1999963, 'Hammer of the Righteous!' ,16136, 1, 0, 0, NULL),
(0,-1999964, 'Are you up to the challenge? I will not hold back.' ,16134, 1, 0, 0, NULL),
(0,-1999965, 'Thank you, good herald. Your words are too kind.' ,16245, 1, 0, 0, NULL),
(0,-1999966, 'May the Light give me strength to provide a worthy challenge.' ,16246, 1, 0, 0, NULL),
(0,-1999967, 'Excellent work!' ,16252, 1, 0, 0, NULL),
(0,-1999968, 'Even the darkest memory fades when confronted.' ,16249, 1, 0, 0, NULL),
(0,-1999970, 'A waste of flesh.' ,16261, 1, 0, 0, NULL);

-- Unused gate
DELETE FROM `gameobject` WHERE `guid`=150077;

-- Despawn old announcer
DELETE FROM `creature` WHERE `guid`=200038;
-- Insert new announcer
DELETE FROM `creature_template` WHERE `entry` in (35591,35592);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES 
(35591, 0, 0, 0, 0, 0, 29894, 0, 0, 0, 'Jaeren Sunsworn', '', '', 0, 75, 75, 2, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 2000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_anstart'),
(35592, 0, 0, 0, 0, 0, 29893, 0, 0, 0, 'Arelas Brightstar', '', '', 0, 75, 75, 2, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_anstart');-- Spawn new announcer
DELETE FROM `creature` WHERE `guid` = 230961;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
(230961, 35591, 650, 3, 1, 0, 0, 746.626, 618.54, 411.09, 4.63158, 86400, 0, 0, 10635, 0, 0, 0);

DELETE FROM `creature` WHERE `guid` = 230961; -- Despwan an_start
DELETE FROM `creature` WHERE `guid` = 200038; -- despwan announcer
INSERT INTO `creature` VALUES (200038, 35004, 650, 3, 1, 0, 0, 748.309, 619.488, 411.172, 4.71239, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0); -- spawn announcer
-- Modify faction for mounts of players
UPDATE `creature_template` SET `faction_A`=84, `faction_H`=84 WHERE `entry`=35644;
UPDATE `creature_template` SET `faction_A`=83, `faction_H`=83 WHERE `entry`=36558;

-- Stormwind steed template 
UPDATE `creature_template` SET `rank`=1, `Health_mod`=5, `faction_A`=16, `faction_H`=16, `ScriptName`='generic_vehicleAI_toc5' WHERE `entry`=33217;
-- Stomwind champion template
UPDATE `creature_template` SET `unit_flags`=33554434, `AIName`='' WHERE `entry`=35328;

DELETE FROM `spell_script_names` WHERE `spell_id` = 66515;
INSERT INTO `spell_script_names` VALUES
('66515', 'spell_gen_reflective_shield');

DELETE FROM `spell_script_names` WHERE `spell_id` = 68504;
INSERT INTO `spell_script_names` VALUES
('68504', 'spell_gen_npcshieldbreaker');

DELETE FROM `spell_script_names` WHERE `spell_id` in (62575, 63010);
INSERT INTO `spell_script_names` VALUES
('62575', 'spell_gen_shieldbreaker'),
('63010', 'spell_gen_atcharge');

-- ========================
--  world_ulduar.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

-- For Achievement Champion/Conqueror of Ulduar
DELETE FROM achievement_criteria_data WHERE `type` = 18 AND criteria_id IN
(10042,10342,10340,10341,10598,10348,10351,10439,
10403,10582,10347,10349,10350,
10352,10355,10353,10354,10599,10357,10363,10719,
10404,10583,10361,10362,10364);

INSERT INTO achievement_criteria_data (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10042,18,0,0,''),
(10342,18,0,0,''),
(10340,18,0,0,''),
(10341,18,0,0,''),
(10598,18,0,0,''),
(10348,18,0,0,''),
(10351,18,0,0,''),
(10439,18,0,0,''),
(10403,18,0,0,''),
(10582,18,0,0,''),
(10347,18,0,0,''),
(10349,18,0,0,''),
(10350,18,0,0,''),
(10352,18,0,0,''),
(10355,18,0,0,''),
(10353,18,0,0,''),
(10354,18,0,0,''),
(10599,18,0,0,''),
(10357,18,0,0,''),
(10363,18,0,0,''),
(10719,18,0,0,''),
(10404,18,0,0,''),
(10583,18,0,0,''),
(10361,18,0,0,''),
(10362,18,0,0,''),
(10364,18,0,0,'');

DELETE FROM disables WHERE sourceType = 4 AND entry IN 
(10042,10342,10340,10341,10598,10348,10351,10439,
10403,10582,10347,10349,10350,
10352,10355,10353,10354,10599,10357,10363,10719,
10404,10583,10361,10362,10364);

-- ##########################################################
-- Ignis
-- ##########################################################
DELETE FROM conditions WHERE SourceEntry IN (62488);
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,62488,0,18,1,33121,0,0,'','Effekt on Constructs');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62343;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,62343,18,1,33121);

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=33121);
DELETE FROM `creature` WHERE `id`=33121;

DELETE FROM `spell_linked_spell` WHERE `spell_effect`=-65667;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(62373,-65667,2, 'Iron Construct - immune to Heat when Molten'),
(62382,-65667,2, 'Iron Construct - immune to Heat when Brittle'),
(67114,-65667,2, 'Iron Construct - immune to Heat when Brittle');

-- ##########################################################
-- Assembly of Iron
-- ##########################################################

-- Loot
DELETE FROM `reference_loot_template` WHERE `entry`=34122 AND `lootmode`=4;
DELETE FROM `creature_loot_template` WHERE `entry`=32867 AND `lootmode`=4;

UPDATE `creature_loot_template` SET `lootmode`=1 WHERE `entry` IN (32867,32927) AND `lootmode`=2;

DELETE FROM `creature_loot_template` WHERE `entry`=32867 AND `groupid`=1;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(32867,45447,0,1,1,1,1),
(32867,45448,0,1,1,1,1),
(32867,45449,0,1,1,1,1),
(32867,45455,0,1,1,1,1),
(32867,45456,0,1,1,1,1);

UPDATE `creature_loot_template` SET `item`=45857, `lootmode`=1 WHERE `entry` IN (33692,33693) AND `lootmode`=2;
UPDATE `creature_loot_template` SET `lootmode`=1 WHERE `entry`=33693 AND `lootmode`=4;

-- Limit Supercharge targets
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=61920;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,61920,18,1,32857),
(13,61920,18,1,32867),
(13,61920,18,1,32927);

-- Lightning Tendrils Visual
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (61887,63486);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(61887,61883,2, 'Lightning Tendrils - Visual'),
(63486,61883,2, 'Lightning Tendrils - Visual');

-- trigger Electrical Charge on Meltdown
DELETE FROM `spell_script_names` WHERE `spell_id`=61889;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(61889, 'spell_meltdown');

-- ##########################################################
-- Kologarn
-- ##########################################################
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (32930);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(32930,46598,0,0,0,1,0,0,0); -- Kologarn - Arm - Ride Vehicle Hardcoded

-- Stone Grip Absorb - target condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (64224,64225);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,64224,18,1,32934),
(13,64225,18,1,32934);

-- ##########################################################
-- Auriaya
-- ##########################################################
UPDATE creature_template SET ScriptName = "boss_auriaya" WHERE Entry = 33515;
UPDATE creature_template SET ScriptName = "mob_feral_defender" WHERE Entry = 34035;
UPDATE creature_template SET ScriptName = "mob_sanctum_sentry" WHERE Entry = 34014;
UPDATE creature_template SET ScriptName = "mob_seeping_essence_stalker" WHERE Entry = 34098;

-- Strength of the Pack
DELETE FROM `spell_script_names` WHERE `spell_id`=64381;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64381, 'spell_strength_of_the_pack');

-- ##########################################################
-- Hodir
-- ##########################################################
-- Hodir
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'boss_hodir' WHERE `entry` = 32845;
UPDATE `creature_template` SET `equipment_id` = 1843, `mechanic_immune_mask` = 650854239, `flags_extra` = 1 WHERE `entry` = 32846;

-- Hodir npcs
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_priest' WHERE `entry` IN (32897, 33326, 32948, 33330);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_shaman' WHERE `entry` IN (33328, 32901, 33332, 32950);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_druid' WHERE `entry` IN (33325, 32900, 32941, 33333);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_mage' WHERE `entry` IN (32893, 33327, 33331, 32946);
UPDATE `creature_template` SET `ScriptName` = 'npc_toasty_fire' WHERE `entry` = 33342;
UPDATE `creature_template` SET `ScriptName` = 'npc_icicle' WHERE `entry` = 33169;
UPDATE `creature_template` SET `ScriptName` = 'npc_icicle_snowdrift' WHERE `entry` = 33173;
UPDATE `creature_template` SET `ScriptName` = 'npc_snowpacked_icicle' WHERE `entry` = 33174;
UPDATE `creature_template` SET `difficulty_entry_1` = 33352, `mechanic_immune_mask` = 612597599, `ScriptName` = 'npc_flash_freeze' WHERE `entry` = 32926;
UPDATE `creature_template` SET `difficulty_entry_1` = 33353, `mechanic_immune_mask` = 612597599, `ScriptName` = 'npc_flash_freeze' WHERE `entry` = 32938;
UPDATE `creature_template` SET `mechanic_immune_mask` = 612597599 WHERE `entry` IN (33352, 33353);
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 194173;

DELETE FROM spell_script_names WHERE spell_id IN (62038,62039);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(62038,'spell_biting_cold'),
(62039,'spell_biting_cold');

-- Cleanup
DELETE FROM `creature` WHERE `id` IN (32950, 32941, 32948, 32946, 32938);

-- ##########################################################
-- Freya
-- ##########################################################
UPDATE creature_template SET ScriptName = "boss_freya" WHERE Entry = 32906;
UPDATE creature_template SET ScriptName = "mob_detonating_lasher" WHERE Entry = 32918;
UPDATE creature_template SET ScriptName = "mob_ancient_water_spirit" WHERE Entry = 33202;
UPDATE creature_template SET ScriptName = "mob_storm_lasher" WHERE Entry = 32919;
UPDATE creature_template SET ScriptName = "mob_snaplasher" WHERE Entry = 32916;
UPDATE creature_template SET ScriptName = "mob_ancient_conservator" WHERE Entry = 33203;
UPDATE creature_template SET ScriptName = "mob_healthy_spore" WHERE Entry = 33215;
UPDATE creature_template SET ScriptName = "mob_elder_brightleaf" WHERE Entry = 32915;
UPDATE creature_template SET ScriptName = "mob_elder_ironbranch" WHERE Entry = 32913;
UPDATE creature_template SET ScriptName = "mob_elder_stonebark" WHERE Entry = 32914;
UPDATE creature_template SET ScriptName = "mob_unstable_sunbeam" WHERE Entry = 33050;
UPDATE creature_template SET ScriptName = "mob_eonars_gift" WHERE Entry = 33228;
UPDATE gameobject_template SET ScriptName = "mob_natural_bomb" WHERE ENTRY = 194902;
UPDATE creature_template SET ScriptName = "mob_iron_roots" WHERE Entry = 33168;
UPDATE creature_template SET ScriptName = "mob_iron_roots" WHERE Entry = 33088;
UPDATE creature_template SET ScriptName = "mob_freya_sunbeam" WHERE Entry = 33170;
UPDATE creature_template SET unit_flags = 4 WHERE ENTRY = 33168;
UPDATE creature_template SET unit_flags = 4 WHERE ENTRY = 33088;
UPDATE creature_template SET faction_A = 16 WHERE Entry = 33168;
UPDATE creature_template SET faction_H = 16 WHERE Entry = 33168;

DELETE FROM spell_script_names WHERE spell_id IN (62623,62872);
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES
(62623, "spell_freya_sunbeam"),
(62872, "spell_freya_sunbeam");
DELETE FROM spell_script_names WHERE spell_id = 64648;
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES (64648,"spell_freya_natural_bomb_spell");
DELETE FROM spell_script_names WHERE spell_id IN (62524,62525,62521);
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES
(62524,"spell_attuned_to_nature_remove"),
(62525,"spell_attuned_to_nature_remove"),
(62521,"spell_attuned_to_nature_remove");
DELETE FROM spell_script_names WHERE spell_id = 62688;
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES (62688,"spell_summon_wave_effect_10mob");

-- ##########################################################
-- Mimiron
-- ##########################################################
-- Mimiron Tram
UPDATE `gameobject_template` SET `flags` = 32, `data2` = 3000, `ScriptName` = 'go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM gameobject WHERE id = '194437';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('194437','603','1','1','2306.87','274.237','424.288','1.52255','0','0','0.689847','0.723956','300','0','1');
DELETE FROM gameobject_template WHERE entry = '194438';
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');
DELETE FROM gameobject WHERE id = '194438';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(194438, 603, 1,1,2306.99, 2589.35, 424.382, 4.71676, 0, 0, 0.705559, -0.708651, 300, 0, 1);

-- Mimiron
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_mimiron' WHERE `entry` = 33350;
-- Leviathan MKII
UPDATE `creature_template` SET `vehicleid` = 370, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk' WHERE `entry` = 33432;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34106;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk_turret' WHERE `entry` = 34071;
DELETE FROM vehicle_template_accessory WHERE entry = 33432;
INSERT INTO vehicle_template_accessory VALUE (33432, 34071, 3, 1, 'Leviathan Mk II turret', 8, 0);
UPDATE creature_template SET ScriptName = 'npc_proximity_mine' WHERE entry = 34362;
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0.5, 7, 2, 0);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (33432,33651);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(33432,46598,0,0,0,1,0,0,0), -- Leviatan MKII - Ride Vehicle Hardcoded
(33651,46598,0,0,0,1,0,0,0); -- VX 001 - Ride Vehicle Hardcoded

-- VX-001
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `vehicleid` = 371, `ScriptName` = 'boss_vx_001' WHERE `entry` = 33651;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34108;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 34050;
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2 WHERE `entry` = 34211;
UPDATE `creature_template` SET `ScriptName` = 'npc_rocket_strike' WHERE `entry` = 34047;

-- Aerial Command Unit
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'boss_aerial_unit', `vehicleid` = 372 WHERE `entry` = 33670;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34109;
UPDATE `creature_template` SET `ScriptName` = 'npc_magnetic_core' WHERE `entry` = 34068;
UPDATE `creature_template` SET `ScriptName` = 'npc_assault_bot' WHERE `entry` = 34057;
UPDATE `creature_template` SET `difficulty_entry_1` = 34148, `ScriptName` = 'npc_emergency_bot' WHERE `entry` = 34147;

-- HardMode
UPDATE `gameobject_template` SET `flags` = 32, `ScriptName` = 'go_not_push_button' WHERE `entry` = 194739;
UPDATE `creature_template` SET `difficulty_entry_1` = 34361, `ScriptName` = 'npc_frost_bomb' WHERE `entry` = 34149;
UPDATE `creature_template` SET `speed_walk` = 0.15, `speed_run` = 0.15, `ScriptName` = 'npc_mimiron_flame_trigger' WHERE `entry` = 34363;
UPDATE `creature_template` SET `ScriptName` = 'npc_mimiron_flame_spread' WHERE `entry` = 34121;
UPDATE `creature_template` SET `ScriptName` = 'npc_mimiron_bomb_bot' WHERE `entry` = 33836;

-- CleanUp
DELETE FROM creature WHERE id IN (34071, 33856);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 34143;

-- ##########################################################
-- Thorim
-- ##########################################################
-- Thorim
UPDATE `creature_template` SET `speed_walk` = 1.66667, `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;
UPDATE `creature_template` SET `speed_walk` = 1.66667, `baseattacktime` = 1500, `equipment_id` = 1844, `mechanic_immune_mask` = 650854239 WHERE `entry` = 33147;
DELETE FROM `creature` WHERE `id`=32865;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(32865, 603, 3, 1, 28977, 0, 2134.967, -298.962, 438.331, 1.57, 604800, 0, 0, 4183500, 425800, 0, 1);
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62042','62470','1','Thorim: Deafening Thunder');

-- Charge Orb
DELETE FROM conditions WHERE SourceEntry = 62016;
INSERT INTO `conditions` VALUES
('13','0','62016','0','18','1','33378','0','0','',NULL);
UPDATE `creature_template` SET `unit_flags` = 33685508 WHERE `entry` = 33378;

-- Gate
DELETE FROM `gameobject_scripts` WHERE `id`=55194;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(55194, 0, 11, 34155, 15, '0', 0, 0, 0, 0);
DELETE FROM `gameobject_template` WHERE `entry`=194265;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194265','1','295','Lever','','','','35','32','3','0','0','0','0','0','0','0','0','6000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0');
UPDATE `gameobject` SET `id` = 194265, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 55194;

-- Cleanup
DELETE FROM `creature` WHERE `id` IN (32885, 32883, 32908, 32907, 32882, 33110, 32886, 32879, 32892, 33140, 33141, 33378, 32874, 32875)
OR guid IN (136694, 136695, 136666, 136706, 136754, 136653, 136756, 136757, 136725, 136718);

-- Pre adds
UPDATE `creature_template` SET `equipment_id` = 1849, `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 33153;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32883;
UPDATE `creature_template` SET `equipment_id` = 1847 WHERE `entry` = 33152;
UPDATE `creature_template` SET `equipment_id` = 1850, `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32908;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 33151;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32907;
UPDATE `creature_template` SET `equipment_id` = 1852 WHERE `entry` = 33150;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32882;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32886;
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0 WHERE `entry`IN (33378, 32892);

-- Thorim Mini bosses
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_runic_colossus' WHERE `entry` = 32872;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_ancient_rune_giant' WHERE `entry` = 32873;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_sif' WHERE `entry` = 33196;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_arena_phase' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875, 33110);
DELETE FROM `creature_addon` WHERE `guid`IN (136059, 136816);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('136059','0','0','0','1','0','40775 0'),
('136816','0','0','0','1','0','40775 0');

-- ##########################################################
-- General Vezax
-- ##########################################################
UPDATE creature_template SET scriptname = 'boss_general_vezax' WHERE entry = 33271;
UPDATE creature_template SET scriptname = 'mob_saronit_varpor' WHERE entry = 33488;
UPDATE creature_template SET scriptname = 'mob_saronit_animus' WHERE entry = 33524;
DELETE FROM spell_script_names WHERE spell_id = 62692;
INSERT INTO spell_script_names VALUE (62692,'spell_general_vezax_aura_of_despair_aura');
DELETE FROM spell_script_names WHERE spell_id = 63276;
INSERT INTO spell_script_names VALUE (63276,'spell_general_vezax_mark_of_the_faceless_aura');
-- DELETE FROM spell_script_names WHERE spell_id = 63278;
-- INSERT INTO spell_script_names VALUE (63278,'spell_general_vezax_mark_of_the_faceless_spell');

-- ##########################################################
-- Yogg-Saron
-- ##########################################################

UPDATE creature_template SET scriptname = 'boss_sara' WHERE entry = 33134;
UPDATE script_texts SET npc_entry = 33134 WHERE npc_entry = 33288 AND entry IN (-1603330,-1603331,-1603332,-1603333);
UPDATE script_texts SET content_default = "Help me! Please get them off me!" WHERE npc_entry = 33134 AND entry = -1603310;
UPDATE script_texts SET content_default = "What do you want from me? Leave me alone!" WHERE npc_entry = 33134 AND entry = -1603311;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` = 33134;
UPDATE creature_template SET scriptname = 'npc_ominous_cloud' WHERE entry = 33292;
UPDATE creature_template SET scriptname = 'npc_guardian_of_yogg_saron' WHERE entry = 33136;
UPDATE creature_template SET scriptname = 'npc_yogg_saron_tentacle' WHERE entry in (33966,33985,33983);
UPDATE creature_template SET scriptname = 'npc_descend_into_madness' WHERE entry = 34072;
UPDATE creature_template SET scriptname = 'npc_brain_of_yogg_saron' WHERE entry = 33890;
UPDATE creature_template SET scriptname = 'boss_yogg_saron' WHERE entry = 33288;
UPDATE creature_template SET scriptname = 'npc_influence_tentacle' WHERE entry in (33716,33720,33719,33717,33433,33567);
UPDATE creature_template SET scriptname = 'npc_immortal_guardian' WHERE entry = 33988;
UPDATE creature_template SET scriptname = 'npc_support_keeper' WHERE entry in (33410,33411,33412,33413);
UPDATE creature_template SET scriptname = 'npc_sanity_well' WHERE entry = 33991;
UPDATE creature_template SET modelid1 = 11686, modelid2 = 11686 WHERE entry = 33991;
UPDATE creature_template SET scriptname = 'npc_death_orb' WHERE entry = 33882;
UPDATE creature_template SET modelid1 = 16946, modelid2 = 16946 WHERE entry = 33882;
UPDATE creature_template SET scriptname = 'npc_death_ray' WHERE entry = 33881;
UPDATE creature_template SET modelid1 = 17612, modelid2 = 17612 WHERE entry = 33881;
UPDATE creature_template SET minlevel = 80, maxlevel = 80, scriptname = 'npc_laughting_skull' WHERE entry = 33990;
UPDATE creature_template SET modelid1 = 15880, modelid2 = 15880 WHERE entry = 33990;
UPDATE creature_template SET scriptname = 'npc_keeper_help' WHERE entry IN(33241,33244,33242,33213);

UPDATE gameobject_template SET scriptname = 'go_flee_to_surface' WHERE entry = 194625;
UPDATE item_template SET scriptname = 'item_unbound_fragments_of_valanyr' WHERE entry = 45896;

UPDATE creature_template SET RegenHealth = 0 WHERE entry IN (33134,34332,33890,33954);

-- Secound Damage Effekt of ShadowNova only on other Guardians or Sara
DELETE FROM conditions WHERE SourceEntry = 65209;
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,65209,0,18,1,33136,0,0,'','Effekt only for Guardian of YoggSaron'),
(13,0,65209,0,18,1,33134,0,0,'','Effekt only for Sara');

DELETE FROM gameobject WHERE id = 194625;
INSERT INTO gameobject 
(guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state)
VALUES 
(603001, 194625, 603, 3, 1, 2001.40, -59.66, 245.07, 0, 0, 0, 0, 0, 60, 100, 1),
(603002, 194625, 603, 3, 1, 1941.61, -25.88, 244.98, 0, 0, 0, 0, 0, 60, 100, 1),
(603003, 194625, 603, 3, 1, 2001.18,  9.409, 245.24, 0, 0, 0, 0, 0, 60, 100, 1);

-- Auren shouldnt hit other friendly NPCs
DELETE FROM spell_script_names WHERE spell_id IN (62670,62671,62702,62650);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(62670,'spell_keeper_support_aura_targeting'),
(62671,'spell_keeper_support_aura_targeting'),
(62702,'spell_keeper_support_aura_targeting'),
(62650,'spell_keeper_support_aura_targeting');

-- Script for Target Faces Caster
DELETE FROM spell_script_names WHERE spell_id IN (64164,64168);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64164,'spell_lunatic_gaze_targeting'),
(64168,'spell_lunatic_gaze_targeting');

-- Trigger Effekt on Near Player with Brain Link 
DELETE FROM spell_script_names WHERE spell_id IN (63802);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(63802,'spell_brain_link_periodic_dummy');

-- Needed for Titanic Storm
-- Script for Target have Weakened Aura
DELETE FROM spell_script_names WHERE spell_id IN (64172);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64172,'spell_titanic_storm_targeting');

-- Condition because NPCs need this else no hit
DELETE FROM conditions WHERE SourceEntry = 64172;
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,64172,0,18,1,33988,0,0,'','Effekt only for Immortal Guardians');

-- Hodir Secound Aura Script
DELETE FROM spell_script_names WHERE spell_id IN (64174);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64174,'spell_hodir_protective_gaze');

-- Insane Death trigger on Remove
DELETE FROM spell_script_names WHERE spell_id IN (63120);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(63120,'spell_insane_death_effekt');

-- Deathray Effekt on Death Orb
DELETE FROM conditions WHERE SourceEntry IN (63882,63886);
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,63882,0,18,1,33882,0,0,'','Effekt on Death Orb'),
(13,0,63886,0,18,1,33882,0,0,'','Effekt on Death Orb');

-- Correct Summon Position of Tentacle
DELETE FROM spell_script_names WHERE spell_id IN (64139,64143,64133);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64139,'spell_summon_tentacle_position'),
(64143,'spell_summon_tentacle_position'),
(64133,'spell_summon_tentacle_position');

-- Heal Trigger for Empowering Shadows
DELETE FROM spell_script_names WHERE spell_id IN (64466);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64466,'spell_empowering_shadows');

-- Create Val'anyr on Yogg-Saron
DELETE FROM conditions WHERE SourceEntry IN (64184);
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,64184,0,18,1,33288,0,0,'','Effekt on YoggSaron');

-- Missing Says Vision
DELETE FROM script_texts WHERE entry BETWEEN -1603360 AND -1603342;
INSERT INTO script_texts (`npc_entry`,`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`)
VALUES
(33436,-1603342,'Bad news sire.',15538,0,0,0,'Garona KingLlaneVision_Say1'),
(33436,-1603343,'The clans are united under Blackhand in this assault. They will stand together until Stormwind has fallen.',15539,0,0,0,'Garona KingLlaneVision_Say2'),
(33436,-1603344,'Gul\'dan is bringing up his warlocks by nightfall. Until then, the Blackrock clan will be trying to take the Eastern Wall.',15540,0,0,0,'Garona KingLlaneVision_Say3'),
(33288,-1603345,'A thousand deaths... or one murder.',15762,0,0,0,'YoggSaron KingLlaneVision_Say1'),
(33288,-1603346,'',15763,0,0,0,'YoggSaron KingLlianeVision_Say2'),
(33437,-1603347,'We will hold until the reinforcements come. As long as men with stout hearts are manning the walls and throne Stormwind will hold.',15585,0,0,0,'KingLlane KingLlaneVision_Say'),
(33436,-1603348,'The orc leaders agree with your assessment.',15541,0,0,0,'Garona KingLlaneVision_Say4'),
(33288,-1603349,'Your petty quarrels only make me stronger!',15764,0,0,0,'YoggSaron KingLlaneVision_Say3'),

(33441,-1603350,'Your resilience is admirable.',15598,0,0,0,'TheLichKing LichKingVision_Say1'),
(33442,-1603351,'Arrrrrrgh!',15470,1,0,0,'ImmolatedChampion LichKingVision_Say1'),
(33442,-1603352,'I\'m not afraid of you!',15471,0,0,0,'ImmolatedChampion LichKingVision_Say2'),
(33441,-1603353,'I will break you as I broke him.',15599,0,0,0,'TheLichKing LichKingVision_Say2'),
(33288,-1603354,'Yrr n\'lyeth... shuul anagg!',15766,0,0,0,'YoggSaron LichKingVision_Say1'),
(33288,-1603355,'He will learn... no king rules forever, only death is eternal!',15767,0,0,0,'YoggSaron LichKingVision_Say2'),

(33523,-1603356,'It is done... All have been given that which must be given. I now seal the Dragon Soul forever...',15631,0,0,0,'Neltharion DragonSoulVision_Say1'),
(33495,-1603357,'That terrible glow... should that be?',15702,0,0,0,'Ysera DragonSoulVision_Say'),
(33523,-1603358,'For it to be as it must, yes.',15632,0,0,0,'Neltharion DragonSoulVision_Say2'),
(33535,-1603359,'It is a weapon like no other. It must be like no other.',15610,0,0,0,'Malygos DragonSoulVision_Say'),
(33288,-1603360,'His brood learned their lesson before too long, you shall soon learn yours!',15765,0,0,0,'YoggSaron DragonSoulVision_Say1');

-- For Achievement In his House he waits dreaming
DELETE FROM achievement_criteria_data WHERE `type` = 18 AND criteria_id IN
(10321,10322,10323,10324,10325,10326);

INSERT INTO achievement_criteria_data (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10321,18,0,0,''),(10322,18,0,0,''),
(10323,18,0,0,''),(10324,18,0,0,''),
(10325,18,0,0,''),(10326,18,0,0,'');

DELETE FROM disables WHERE sourceType = 4 AND entry IN 
(10321,10322,10323,10324,10325,10326);


-- ##########################################################
-- Algalon
-- ##########################################################

-- For Achievement He Feeds on your Tears
DELETE FROM achievement_criteria_data WHERE `type` = 18 AND criteria_id IN
(10568,10570);

INSERT INTO achievement_criteria_data (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10568,18,0,0,''),
(10570,18,0,0,'');

DELETE FROM disables WHERE sourceType = 4 AND entry IN 
(10568,10570);

-- spawn algalon
DELETE FROM `creature` WHERE `id`=32871;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
('302616','32871','603','3','1','0','0','1632.36','-310.093','417.321','1.8445','604800','0','0','34862500','0','0','0','0','0','0');

-- set to friendly by default
UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35, `flags_extra`=1 WHERE `entry` IN (32871,33070);

UPDATE `creature_template` SET `ScriptName`='npc_black_hole' WHERE `entry`=32953;
UPDATE `creature_template` SET `ScriptName`='npc_living_constellation' WHERE `entry`=33052;

-- spawn 'Celestial Planetarium Access'
DELETE FROM `gameobject` WHERE `id`= 194628;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES (400002, 194628, 603, 3, 1, 1649.49, -174.711, 427.257, 1.5708, 0, 0, 0, 0, 180, 0, 1);

UPDATE `gameobject_template` SET `data0`=0, `ScriptName`='go_planetarium_access' WHERE `entry`=194628;

DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN (62169,-64412);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(64417,62169,2, 'Phase Punch - Trigger Black Hole Dot'),
(62168,62169,2, 'Black Hole - Trigger Black Hole Dot'),
(64417,-64412,1, 'Phase Punch - Remove Phase Punch');

UPDATE `gameobject` SET `phaseMask`=17 WHERE `id` IN (194910,194715,194148);

UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14, `unit_flags`=6, `InhabitType`=7, `AIName`='SmartAI', `flags_extra`=130 WHERE `entry`=33104;
UPDATE `creature_template` SET `unit_flags`=512, `flags_extra`=130 WHERE `entry`=33105;

DELETE FROM `smart_scripts` WHERE `entryorguid`=33104;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33104,0,0,0,1,0,100,3,4000,4000,0,0,11,62304,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Algalon Asteroid - Cast Cosmic Smash 10N'),
(33104,0,1,0,1,0,100,5,4000,4000,0,0,11,64597,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Algalon Asteroid - Cast Cosmic Smash 25N');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62304,64597);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13, 62304, 18, 1, 33105),
(13, 64597, 18, 1, 33105);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (62301,64598,62293,62295,62311,64596);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62301, 'spell_cosmic_smash'),
(64598, 'spell_cosmic_smash'),
(62293, 'spell_cosmic_smash_summon_trigger'),
(62295, 'spell_cosmic_smash_summon_target'),
(62311, 'spell_cosmic_smash_dmg'),
(64596, 'spell_cosmic_smash_dmg');

DELETE FROM `spell_script_names` WHERE `spell_id`=64597;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64597, 'spell_cosmic_smash_missile_target');

-- ========================
--  world_wg.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

/*NOTE! Included Cyrillic Fonts - open it in UTF8 coding*/

SET NAMES 'utf8';

DELETE FROM `trinity_string` WHERE entry IN (756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,780,781,782,783);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('756', 'Battle begins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Битва началась'),
('757', '%s has successfully defended the fortress!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s успешно защитил(а) крепость!'),
('758', '%s has taken over the fortress!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s захватил(а) крепость'),
('759', 'The %s siege workshop has been damaged by the %s!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('760', 'The %s siege workshop has been destroyed by the %s!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('761', 'The %s tower has been damaged!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s башня повреждена'),
('762', 'The %s tower has been destroyed!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s башня уничтожена!'),
('763', 'Wintergrasp fortress is under attack!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('764', 'Wintergrasp is now under the control of the %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('765', 'Wintergrasp timer set to %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('766', 'Wintergrasp battle started.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('767', 'Wintergrasp battle finished.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('768', 'Wintergrasp info: %s controlled. Timer: %s. Wartime: %s. Number of Players: (Horde: %u, Alliance: %u)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('769', 'Wintergrasp outdoorPvP is disabled.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('770', 'Wintergrasp outdoorPvP is enabled.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('771', 'You have reached Rank 1: Corporal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы достигли Ранга 1: Капрал'),
('772', 'You have reached Rank 2: First Lieutenant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы достигли Ранга 2: Лейтенант'),
('780', 'Before the Battle of  Wintergrasp left 30 minutes!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'До битвы на  Озере Ледяных Оков осталось 30 минут!'),
('781', 'Before the Battle of  Wintergrasp left 10 minutes! Portal from Dalaran will work at begin of the battle.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'До битвы на  Озере Ледяных Оков осталось 10 минут! Портал с Даларана начнет работу во время боя.'),
('782', 'The battle for Wintergrasp  has stopped! Not enough defenders. Wintergrasp Fortress remains  Attackers.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Битва за Озеро Ледяных Оков Остановлена. Не хватает защитников. Крепость переходит атакующей  стороне.'),
('783', 'The battle for Wintergrasp  has stopped! Not enough attackers. Wintergrasp Fortress remains  Defenders.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Битва за Озеро Ледяных Оков Остановлена. Не хватает нападающих. Крепость остается защитникам.');

DELETE FROM `command` WHERE name IN ('wg','wg enable','wg start','wg status','wg stop','wg switch','wg timer');
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('wg', '3', 'Syntax: .wg $subcommand.'),
('wg enable', '3', 'Syntax: .wg enable [on/off] Enable/Disable Wintergrasp outdoorPvP.'),
('wg start', '3', 'Syntax: .wg start\r\nForce Wintergrasp battle start.'),
('wg status', '3', 'Syntax: .wg status\r\nWintergrasp info, defender, timer, wartime.'),
('wg stop', '3', 'Syntax: .wg stop\r\nForce Wintergrasp battle stop (No rewards).'),
('wg switch', '3', 'Syntax: .wg switch\r\nSwitchs Wintergrasp defender team.'),
('wg timer', '3', 'Syntax: .wg timer $minutes\r\nChange the current timer. Min value = 1, Max value 60 (Wartime), 1440 (Not Wartime)');

/* WG scriptname */
DELETE FROM `outdoorpvp_template` WHERE TypeId=7;
INSERT INTO `outdoorpvp_template` (`TypeId`, `ScriptName`, `comment`) VALUES 
('7', 'outdoorpvp_wg', 'Wintergrasp');

UPDATE `creature_template` SET `ScriptName` = 'npc_demolisher_engineerer' WHERE `entry` IN (30400,30499);

/* Teleport WG SPELLs*/
DELETE FROM `spell_target_position` WHERE id IN ('59096', '58632', '58633');
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
('59096', '571', '5325.06', '2843.36', '409.285', '3.20278'),
('58632', '571', '5097.79', '2180.29', '365.61', '2.41'),
('58633', '571', '5026.80', '3676.69', '362.58', '3.94');

/* Defender's Portal Activate Proper Spell */
DELETE FROM `spell_linked_spell` WHERE spell_trigger=54640;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
('54640','54643','0','Defender\'s Portal Activate Proper Spell');

/* Protect players from catching by Druid Cyclone at graveyard which removes immunity after disappear */
DELETE FROM `spell_linked_spell` WHERE spell_trigger=58729;
INSERT INTO `spell_linked_spell` VALUES (58729, -33786, 2, 'Spiritual Immunity: Protect From Cyclone (now Immune always)');

/* Temp removed gameobject stopping you getting to the relic
* 194323 - [Wintergrasp Keep Collision Wall X:5396.209961 Y:2840.010010 Z:432.268005 MapId:571
* 194162 - [Doodad_WG_Keep_Door01_collision01 X:5397.109863 Y:2841.540039 Z:425.901001 MapId:571]*/
DELETE FROM gameobject WHERE id IN ('194323', '194162');

/* Titan Relic remove */
DELETE FROM `gameobject` WHERE `id`=192829;

/* Towers */
UPDATE `gameobject_template` SET `faction` = 0, `flags` = 6553632 WHERE `entry` IN (190356,190357,190358);

/*Spirit healer FIX */
UPDATE creature_template SET npcflag=npcflag|32768 WHERE entry IN (31841,31842);

/* Creature template */
UPDATE creature_template SET faction_A = '1802', faction_H = '1802' WHERE entry IN (30499,28312,28319);
UPDATE creature_template SET faction_A = '1801', faction_H = '1801' WHERE entry IN (30400,32629,32627);
UPDATE creature_template SET npcflag=npcflag|32768 WHERE entry   IN (31841,31842);

/* spell target for build vehicles */
DELETE FROM `conditions` WHERE ConditionValue2=27852;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 49899, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56575, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56661, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56663, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56665, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56667, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56669, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 61408, 0, 18, 1, 27852, 0, 0, '', NULL);

/* Workshop */
UPDATE `gameobject_template` SET `faction` = 35 WHERE `entry` IN (192028,192029,192030,192031,192032,192033);

/*WG Spell area Data */
/*For wg antifly */
DELETE FROM `spell_area` WHERE spell IN (58730, 57940, 58045);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES
(58730, 4197, 0, 0, 0, 0, 0, 2, 1),
(58730, 4584, 0, 0, 0, 0, 0, 2, 1),
(58730, 4581, 0, 0, 0, 0, 0, 2, 1),
(58730, 4585, 0, 0, 0, 0, 0, 2, 1),
(58730, 4612, 0, 0, 0, 0, 0, 2, 1),
(58730, 4582, 0, 0, 0, 0, 0, 2, 1),
(58730, 4611, 0, 0, 0, 0, 0, 2, 1),
(58730, 4578, 0, 0, 0, 0, 0, 2, 1),
(58730, 4576, 0, 0, 0, 0, 0, 2, 1),
(58730, 4538, 0, 0, 0, 0, 0, 2, 1),
(57940, 65, 0, 0, 0, 0, 0, 2, 1),
(57940, 66, 0, 0, 0, 0, 0, 2, 1),
(57940, 67, 0, 0, 0, 0, 0, 2, 1),
(57940, 206, 0, 0, 0, 0, 0, 2, 1),
(57940, 210, 0, 0, 0, 0, 0, 2, 1),
(57940, 394, 0, 0, 0, 0, 0, 2, 1),
(57940, 395, 0, 0, 0, 0, 0, 2, 1),
(57940, 1196, 0, 0, 0, 0, 0, 2, 1),
(57940, 2817, 0, 0, 0, 0, 0, 2, 1),
(57940, 3456, 0, 0, 0, 0, 0, 2, 1),
(57940, 3477, 0, 0, 0, 0, 0, 2, 1),
(57940, 3537, 0, 0, 0, 0, 0, 2, 1),
(57940, 3711, 0, 0, 0, 0, 0, 2, 1),
(57940, 4100, 0, 0, 0, 0, 0, 2, 1),
(57940, 4196, 0, 0, 0, 0, 0, 2, 1),
(57940, 4228, 0, 0, 0, 0, 0, 2, 1),
(57940, 4264, 0, 0, 0, 0, 0, 2, 1),
(57940, 4265, 0, 0, 0, 0, 0, 2, 1),
(57940, 4272, 0, 0, 0, 0, 0, 2, 1),
(57940, 4273, 0, 0, 0, 0, 0, 2, 1),
(57940, 4395, 0, 0, 0, 0, 0, 2, 1),
(57940, 4415, 0, 0, 0, 0, 0, 2, 1),
(57940, 4416, 0, 0, 0, 0, 0, 2, 1),
(57940, 4493, 0, 0, 0, 0, 0, 2, 1),
(57940, 4494, 0, 0, 0, 0, 0, 2, 1),
(57940, 4603, 0, 0, 0, 0, 0, 2, 1),
(58045, 4197, 0, 0, 0, 0, 0, 2, 1);

/* Portal Dalaran->WG */
DELETE FROM `gameobject` WHERE `id`=193772;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
('', 193772, 571, 1, 64, 5924.11, 573.387, 661.087, 4.43208, 0, 0, 0.798953, -0.601393, 300, 0, 1),
('', 193772, 571, 1, 65535, 5686.57, 772.921, 647.754, 5.62225, 0, 0, 0.324484, -0.945891, 600, 0, 1),
('', 193772, 571, 1, 65535, 5930.82, 548.961, 640.632, 1.88506, 0, 0, 0.809047, 0.587744, 300, 0, 1);


/* Wintergrasp Battle-Mage */
DELETE FROM `creature` WHERE `id`=32170;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
('', 32170, 571, 1, 65535, 27801, 0, 5925.34, 573.71, 661.087, 4.06662, 300, 0, 0, 504000, 440700, 0, 0, 0, 0, 0),
('', 32170, 571, 1, 64, 0, 918, 5932.96, 549.906, 641.595, 2.09189, 300, 0, 0, 504000, 440700, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ScriptName`='npc_wg_ally_battle_mage' WHERE `entry`=32169;
UPDATE `creature_template` SET `ScriptName`='npc_wg_horde_battle_mage' WHERE `entry`=32170;

UPDATE `gameobject_template` SET `type` = 6, `faction` = 0, `data2` = 10, `data3` = 54643, `ScriptName` = 'go_wg_veh_teleporter' WHERE `entry` = 192951;

-- ========================
--  world_wg_bunners.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

DELETE FROM gameobject WHERE 
       id IN (192317,192335,192313,192316,192332,192331,192330,192329,192487,192310,192314,192308,192309,192324,192326,192312,192325,192304,187433,193984,193983,192377,192321,192318,192322,192320,192269,192273,192274,192277,192278,192280,192283,192284,192285,192289,192290,192336,192338,192339,192349,192350,192351,192352,192353,192354,192355,192356,192357,192358,192359,192360,192361,192362,192363,192364,192366,192367,192368,192369,192370,192371,192372,192373,192374,192375,192378,192379,192406,192407,192414,192416,192417,192418,192429,192433,192434,192435,192458,192459,192460,192461,192488,192501,192254,192255,192688,192686,180398,193764,193762,192319,192287,192323,192305,192286,192334,192307,192306,192328,192252,192253,192292,192299,192327,192267,192449,192450) 
          AND map=571;
INSERT INTO `gameobject` VALUES ('', 192317, 571, 1, 385, 5363.39, 2781.28, 435.634, 1.58825, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192335, 571, 1, 385, 5363.72, 2763.25, 445.023, -1.54462, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192313, 571, 1, 1, 5392.65, 3037.11, 433.713, -1.52716, 0, 0, -0.691512, 0.722365, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192316, 571, 1, 385, 5322.01, 2781.13, 435.673, 1.57952, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192332, 571, 1, 1, 5289.46, 2704.68, 435.875, -0.017451, 0, 0, -0.00872539, 0.999962, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192331, 571, 1, 1, 5350.95, 2640.36, 435.408, 1.5708, 0, 0, 0.707108, 0.707106, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192330, 571, 1, 1, 5392.27, 2639.74, 435.331, 1.50971, 0, 0, 0.685183, 0.728371, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192329, 571, 1, 1, 5350.88, 2622.72, 444.686, -1.5708, 0, 0, -0.707108, 0.707106, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192487, 571, 1, 1, 5278.38, 2613.83, 432.721, -1.58825, 0, 0, -0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192487, 571, 1, 1, 5260.82, 2631.8, 433.324, 3.05433, 0, 0, 0.999048, 0.0436174, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192310, 571, 1, 1, 5271.8, 2704.87, 445.183, -3.13286, 0, 0, -0.99999, 0.00436634, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192314, 571, 1, 1, 5236.27, 2739.46, 444.992, -1.59698, 0, 0, -0.716303, 0.697789, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192487, 571, 1, 1, 5163.78, 2729.68, 432.009, -1.58825, 0, 0, -0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192308, 571, 1, 1, 5237.07, 2757.03, 435.796, 1.51844, 0, 0, 0.688356, 0.725373, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192309, 571, 1, 1, 5235.34, 2924.34, 435.04, -1.5708, 0, 0, -0.707108, 0.707106, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192487, 571, 1, 1, 5262.54, 3047.95, 430.979, 3.10665, 0, 0, 0.999847, 0.0174704, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192487, 571, 1, 1, 5163.13, 2952.59, 433.503, 1.53589, 0, 0, 0.694658, 0.71934, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192324, 571, 1, 1, 5235.19, 2942, 443.948, 1.58825, 0, 0, 0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192326, 571, 1, 1, 5272.73, 2976.55, 443.81, 3.12412, 0, 0, 0.999962, 0.00873622, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192312, 571, 1, 1, 5352.37, 3037.09, 435.252, -1.5708, 0, 0, -0.707108, 0.707106, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192325, 571, 1, 1, 5290.35, 2976.56, 435.221, 0.017452, 0, 0, 0.00872589, 0.999962, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192304, 571, 1, 385, 5397.76, 2873.08, 455.321, 3.10665, 0, 0, 0.999847, 0.0174704, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 187433, 571, 1, 1, 2832.84, 6184.45, 84.6827, -2.58308, 0, 0, 0, 0, 300, 100, 1);
INSERT INTO `gameobject` VALUES ('', 187433, 571, 1, 1, 2835.96, 6180.37, 84.6827, 1.50098, 0, 0, 0, 0, 180, 100, 1);
INSERT INTO `gameobject` VALUES ('', 187433, 571, 1, 1, 2830.12, 6188.96, 84.6827, -0.855211, 0, 0, 0, 0, 300, 100, 1);
INSERT INTO `gameobject` VALUES ('', 187433, 571, 1, 1, 2831.88, 6188.72, 84.6827, -1.65806, 0, 0, 0, 0, 300, 100, 1);
INSERT INTO `gameobject` VALUES ('', 193984, 571, 1, 1, 7647.47, 2055.55, 599.399, -0.279252, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 193984, 571, 1, 1, 7647.42, 2065.23, 599.308, 0.279252, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 193984, 571, 1, 1, 7609.86, 2055.53, 599.494, -2.86234, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 193984, 571, 1, 1, 7610.18, 2065.31, 599.426, 2.87979, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 193983, 571, 1, 1, 7906.95, 2053.04, 599.626, -0.296705, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 193983, 571, 1, 1, 7907.01, 2063.02, 599.587, 0.261798, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 193983, 571, 1, 1, 7870.43, 2053.35, 599.669, -2.87979, 0, 0, 0, 0, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 193983, 571, 1, 1, 7870.36, 2063.25, 599.628, 2.86234, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192377, 571, 1, 1, 5414.19, 3069.8, 415.187, 1.64061, 0, 0, 0, 0, 5, 100, 1);
INSERT INTO `gameobject` VALUES ('', 192321, 571, 1, 385, 5288.85, 2861.82, 435.591, 0.026179, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192318, 571, 1, 385, 5322.25, 2898.95, 435.643, -1.57952, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192322, 571, 1, 385, 5322.89, 2917.14, 445.154, 1.56207, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192320, 571, 1, 385, 5289.05, 2820.23, 435.674, 0, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192269, 571, 1, 1, 4526.46, 2810.18, 391.2, -2.99322, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192273, 571, 1, 1, 4417.94, 2324.81, 371.577, 3.08051, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192274, 571, 1, 1, 4424.15, 3286.54, 371.546, 3.12412, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192277, 571, 1, 1, 4572.93, 3475.52, 363.009, 1.42244, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192278, 571, 1, 1, 4433.9, 3534.14, 360.275, -1.85005, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192280, 571, 1, 1, 4857.97, 3335.44, 368.881, -2.94959, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192283, 571, 1, 1, 5006.34, 3280.4, 371.163, 2.22529, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192284, 571, 1, 65, 5372.48, 2862.5, 409.049, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192285, 571, 1, 65, 5371.49, 2820.8, 409.177, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192289, 571, 1, 1, 4778.19, 2438.06, 345.644, -2.94088, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192290, 571, 1, 1, 5024.57, 2532.75, 344.023, -1.93732, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192336, 571, 1, 1, 5154.49, 2862.15, 445.012, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192338, 571, 1, 65, 5397.76, 2873.08, 455.461, 3.10665, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192339, 571, 1, 65, 5397.39, 2809.33, 455.344, 3.10665, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192349, 571, 1, 1, 5155.31, 2820.74, 444.979, -3.13286, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192350, 571, 1, 1, 5270.69, 2861.78, 445.058, -3.11539, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192351, 571, 1, 1, 5271.28, 2820.16, 445.201, -3.13286, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192352, 571, 1, 1, 5173.02, 2820.93, 435.72, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192353, 571, 1, 1, 5172.11, 2862.57, 435.721, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192354, 571, 1, 1, 5288.41, 2861.79, 435.721, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192355, 571, 1, 1, 5288.92, 2820.22, 435.721, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192356, 571, 1, 1, 5237.07, 2757.03, 435.796, 1.51844, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192357, 571, 1, 1, 5235.34, 2924.34, 435.04, -1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192358, 571, 1, 65, 5322.23, 2899.43, 435.808, -1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192359, 571, 1, 65, 5364.35, 2899.4, 435.839, -1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192360, 571, 1, 65, 5352.37, 3037.09, 435.252, -1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192361, 571, 1, 65, 5392.65, 3037.11, 433.713, -1.52716, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192362, 571, 1, 65, 5322.12, 2763.61, 444.974, -1.55334, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192363, 571, 1, 65, 5363.61, 2763.39, 445.024, -1.54462, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192364, 571, 1, 1, 5350.88, 2622.72, 444.686, -1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192366, 571, 1, 1, 5236.27, 2739.46, 444.992, -1.59698, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192367, 571, 1, 1, 5271.8, 2704.87, 445.183, -3.13286, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192368, 571, 1, 65, 5289.46, 2704.68, 435.875, -0.017451, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192369, 571, 1, 1, 5350.95, 2640.36, 435.408, 1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192370, 571, 1, 1, 5392.27, 2639.74, 435.331, 1.50971, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192371, 571, 1, 65, 5364.29, 2916.94, 445.331, 1.57952, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192372, 571, 1, 65, 5322.86, 2916.95, 445.154, 1.56207, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192373, 571, 1, 1, 5290.35, 2976.56, 435.221, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192374, 571, 1, 1, 5272.94, 2976.55, 444.492, 3.12412, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192375, 571, 1, 1, 5235.19, 2941.9, 444.278, 1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192378, 571, 1, 65, 5322.02, 2781.13, 435.811, 1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192379, 571, 1, 65, 5363.42, 2781.03, 435.763, 1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192406, 571, 1, 1, 4438.3, 3361.08, 371.568, -0.017451, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192407, 571, 1, 1, 4448.17, 3235.63, 370.412, -1.56207, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192414, 571, 1, 1, 4387.62, 2719.57, 389.935, -1.54462, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192416, 571, 1, 1, 4408.57, 2422.61, 377.179, 1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192417, 571, 1, 1, 4416.59, 2414.08, 377.196, 0, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192418, 571, 1, 1, 4417.25, 2301.14, 377.214, 0.026179, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192429, 571, 1, 1, 4464.12, 2855.45, 406.111, 0.829032, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192433, 571, 1, 1, 4401.63, 3377.46, 363.365, 1.55334, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192434, 571, 1, 1, 5041.61, 3294.4, 382.15, -1.63188, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192435, 571, 1, 1, 4855.63, 3297.62, 376.739, -3.13286, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192458, 571, 1, 1, 4811.4, 2441.9, 358.207, -2.0333, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192459, 571, 1, 1, 4805.67, 2407.48, 358.191, 1.78023, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192460, 571, 1, 1, 5004.35, 2486.36, 358.449, 2.17294, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192461, 571, 1, 1, 4983.28, 2503.09, 358.177, -0.427603, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 1, 5160.34, 2798.61, 430.769, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 1, 5158.81, 2883.13, 431.618, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 1, 5278.38, 2613.83, 433.409, -1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 1, 5260.82, 2631.8, 433.324, 3.05433, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 1, 5163.13, 2952.59, 433.503, 1.53589, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 1, 5145.11, 2935, 433.386, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 1, 5262.54, 3047.95, 432.055, 3.10665, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 1, 5146.04, 2747.21, 433.584, 3.07177, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 1, 5163.78, 2729.68, 433.394, -1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192501, 571, 1, 1, 4398.82, 2804.7, 429.792, -1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192501, 571, 1, 1, 4416, 2822.67, 429.851, -0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192501, 571, 1, 1, 4559.11, 3606.22, 419.999, -1.48353, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192501, 571, 1, 1, 4539.42, 3622.49, 420.034, -3.07177, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192501, 571, 1, 1, 4555.26, 3641.65, 419.974, 1.67551, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192501, 571, 1, 1, 4574.87, 3625.91, 420.079, 0.087266, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192501, 571, 1, 1, 4466.79, 1960.42, 459.144, 1.15192, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192501, 571, 1, 1, 4475.35, 1937.03, 459.07, -0.436332, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192501, 571, 1, 1, 4451.76, 1928.1, 459.076, -2.00713, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192501, 571, 1, 1, 4442.99, 1951.9, 459.093, 2.74016, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192254, 571, 1, 1, 5154.46, 2828.94, 409.189, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192255, 571, 1, 1, 5154.52, 2853.31, 409.183, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192688, 571, 1, 1, 5916.1, 566.209, 639.625, -2.72271, 0, 0, 0, 1, 180, 100, 1);
INSERT INTO `gameobject` VALUES ('', 192686, 571, 1, 1, 5664.81, 791.002, 653.698, -0.663223, 0, 0, 0, 1, 180, 100, 1);
INSERT INTO `gameobject` VALUES ('', 180398, 571, 1, 1, 5665.02, 790.2, 653.698, -0.610864, 0, 0, 0, 1, 180, 100, 1);
INSERT INTO `gameobject` VALUES ('', 192487, 571, 1, 256, 4855.63, 3297.62, 376.281, -3.13286, 0, 0, -0.99999, 0.00436634, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192290, 571, 1, 256, 4526.46, 2810.18, 391.2, -2.99322, 0, 0, -0.997249, 0.0741182, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192487, 571, 1, 256, 4517.75, 2717.23, 387.812, -1.53589, 0, 0, -0.694658, 0.71934, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 256, 4475.35, 1937.03, 459.07, -0.436332, 0, 0, -0.216439, 0.976296, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 256, 4451.76, 1928.1, 459.076, -2.00713, 0, 0, -0.843392, 0.537299, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 256, 4442.99, 1951.9, 459.093, 2.74016, 0, 0, 0.979924, 0.199371, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 256, 4466.8, 1960.44, 459.841, 1.15192, 0, 0, 0.54464, 0.83867, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192487, 571, 1, 256, 5041.61, 3294.4, 382.15, -1.63188, 0, 0, -0.72837, 0.685184, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192278, 571, 1, 256, 5006.34, 3280.4, 371.163, 2.22529, 0, 0, 0.896872, 0.442291, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192278, 571, 1, 256, 4857.97, 3335.44, 368.881, -2.94959, 0, 0, -0.995395, 0.0958539, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192290, 571, 1, 256, 4433.9, 3534.14, 360.275, -1.85005, 0, 0, -0.798636, 0.601815, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192290, 571, 1, 256, 4572.93, 3475.52, 363.009, 1.42244, 0, 0, 0.652758, 0.757566, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 256, 4555.26, 3641.65, 419.974, 1.67551, 0, 0, 0.743143, 0.669133, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 256, 4574.87, 3625.91, 420.079, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 256, 4559.11, 3606.22, 419.999, -1.48353, 0, 0, -0.67559, 0.737277, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 256, 4539.42, 3622.49, 420.034, -3.07177, 0, 0, -0.999391, 0.0349043, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192290, 571, 1, 256, 4401.63, 3377.46, 363.365, 1.55334, 0, 0, 0.700908, 0.713252, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 256, 4448.17, 3235.63, 370.412, -1.56207, 0, 0, -0.704015, 0.710185, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192488, 571, 1, 256, 4438.3, 3361.08, 371.299, -0.017451, 0, 0, -0.00872539, 0.999962, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192290, 571, 1, 256, 4424.15, 3286.54, 371.546, 3.12412, 0, 0, 0.999962, 0.00873622, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192461, 571, 1, 1, 4416.03, 2822.68, 430.475, -0.017452, 0, 0, -0.00872589, 0.999962, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192461, 571, 1, 1, 4464.12, 2855.45, 406.111, 0.829032, 0, 0, 0.402747, 0.915311, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192461, 571, 1, 1, 4398.82, 2804.7, 429.792, -1.58825, 0, 0, -0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192461, 571, 1, 1, 4408.57, 2422.61, 377.179, 1.58825, 0, 0, 0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192461, 571, 1, 1, 4416.59, 2414.08, 377.13, 0, 0, 0, 0, 1, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192461, 571, 1, 1, 4417.25, 2301.14, 377.214, 0.026179, 0, 0, 0.0130891, 0.999914, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192418, 571, 1, 1, 4805.67, 2407.48, 358.191, 1.78023, 0, 0, 0.777144, 0.629323, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192418, 571, 1, 1, 4811.4, 2441.9, 358.207, -2.0333, 0, 0, -0.85035, 0.526218, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192273, 571, 1, 1, 4778.19, 2438.06, 345.644, -2.94088, 0, 0, -0.994969, 0.100188, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192273, 571, 1, 1, 5024.57, 2532.75, 344.023, -1.93732, 0, 0, -0.824127, 0.566404, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192418, 571, 1, 1, 5004.35, 2486.36, 358.449, 2.17294, 0, 0, 0.884989, 0.465612, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192418, 571, 1, 1, 4983.28, 2503.09, 358.177, -0.427603, 0, 0, -0.212176, 0.977231, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 192290, 571, 1, 1, 4417.94, 2324.81, 371.577, 3.08051, 0, 0, 0.999534, 0.0305366, 300, 0, 1);
INSERT INTO `gameobject` VALUES ('', 193764, 571, 1, 1, 7625.87, 2060.05, 604.27, 0.07854, 0, 0, 0.99999, 0.004363, 180, 255, 1);
INSERT INTO `gameobject` VALUES ('', 193762, 571, 1, 1, 7625.66, 2060.04, 604.195, -3.05428, 0, 0, 0.99999, 0.004363, 180, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192319, 571, 1, 385, 5364.3, 2899.22, 435.691, -1.55334, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192287, 571, 1, 385, 5372.42, 2862.48, 409.366, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192323, 571, 1, 385, 5364.28, 2917.26, 445.332, 1.58825, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192305, 571, 1, 385, 5397.31, 2809.26, 455.102, 3.13286, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192286, 571, 1, 385, 5371.45, 2820.79, 409.427, 3.12412, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192334, 571, 1, 385, 5322.17, 2763.2, 444.974, -1.56207, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192307, 571, 1, 385, 5271.16, 2820.11, 445.109, -3.13286, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192306, 571, 1, 385, 5270.56, 2861.68, 444.917, -3.12412, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192487, 571, 1, 385, 5160.28, 2798.6, 430.604, -3.12412, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192487, 571, 1, 385, 5146.04, 2747.3, 433.527, 3.12412, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192328, 571, 1, 385, 5173.13, 2820.96, 435.658, 0.026179, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192252, 571, 1, 385, 5154.37, 2853.23, 409.183, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192253, 571, 1, 385, 5154.42, 2828.93, 409.189, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192292, 571, 1, 385, 5154.35, 2862.08, 445.01, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192299, 571, 1, 385, 5155.22, 2820.63, 444.979, -3.11539, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192327, 571, 1, 385, 5172.34, 2862.57, 435.658, 0, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192487, 571, 1, 385, 5158.71, 2882.9, 431.274, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192487, 571, 1, 385, 5145.11, 2934.95, 433.255, -3.10665, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192267, 571, 1, 385, 4452.76, 2639.14, 358.444, 1.67552, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192449, 571, 1, 385, 4517.75, 2717.23, 387.812, -1.53589, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES ('', 192450, 571, 1, 385, 4387.59, 2719.9, 390.201, -1.51843, 0, 0, 0, 1, 300, 255, 1);


-- ========================
--  world_Zulaman.sql  IN  E:\trinityCore_new6\sql\ChaosCore\
-- ========================

UPDATE creature_template SET scriptname = 'npc_zulaman_harrison_jones' WHERE entry = 24358;
UPDATE creature_template SET scriptname = 'mob_amanishi_guardian' WHERE entry =23597;
UPDATE creature_template SET scriptname = 'mob_amanishi_wind_walker' WHERE entry =24179;
UPDATE creature_template SET scriptname = 'mob_amanishi_protector' WHERE entry =24180;
UPDATE creature_template SET scriptname = 'mob_amanishi_medicine_man' WHERE entry =23581;
UPDATE creature_template SET scriptname = 'mob_amani_protective_ward' WHERE entry =23822;
UPDATE creature_template SET scriptname = 'mob_amanishi_lookout' WHERE entry =24175;
UPDATE creature_template SET scriptname = 'mob_amanishi_warrior' WHERE entry =24225;
UPDATE creature_template SET scriptname = 'mob_amani_eagle' WHERE entry =24159;
UPDATE creature_template SET scriptname = 'mob_amanishi_tempest' WHERE entry =24549;
UPDATE creature_template SET scriptname = 'mob_amanishi_tribesman' WHERE entry =23582;
UPDATE creature_template SET scriptname = 'mob_amanishi_axe_thrower' WHERE entry =23542;
UPDATE creature_template SET scriptname = 'mob_amanishi_warbringer' WHERE entry =23580;
UPDATE creature_template SET scriptname = 'mob_amani_bear' WHERE entry =23584;
UPDATE creature_template SET scriptname = 'mob_amanishi_scout' WHERE entry =23586;
UPDATE creature_template SET scriptname = 'mob_amanishi_flame_caster' WHERE entry =23596;
UPDATE creature_template SET scriptname = 'mob_amanishi_trainer' WHERE entry =23774;
UPDATE creature_template SET scriptname = 'mob_amani_dragonhawk' WHERE entry =23834;
UPDATE creature_template SET scriptname = 'mob_amanishi_handler' WHERE entry =24065;
UPDATE creature_template SET scriptname = 'mob_amanishi_beast_tamer' WHERE entry =24059;
UPDATE creature_template SET scriptname = 'mob_amani_elder_lynx' WHERE entry =24530;
UPDATE creature_template SET scriptname = 'mob_amani_lynx' WHERE entry =24043;
UPDATE creature_template SET scriptname = 'mob_amani_lynx_cub' WHERE entry =24064;
UPDATE creature_template SET scriptname = 'mob_amani_crocolist' WHERE entry in (24138,24047);
