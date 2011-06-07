DELETE FROM `creature_template` WHERE `entry` = 51000;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
(51000, 0, 0, 0, 0, 0, 15394, 0, 15394, 0, 'Pepa', 'Supporter', '', 0, 80, 80, 0, 35, 35, 128, 1, 1.14286, 1, 0, 422, 586, 0, 642, 1, 1000, 1000, 1, 0, 8, 0, 0, 0, 0, 0, 345, 509, 103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 677, 617299803, 0, '', 1);

update `item_template` set `BuyPrice`=3000000 where `entry` in (37663,41593,41594,41595);
update `item_template` set `BuyPrice`=20000000 where `entry`=43102;
update `item_template` set `BuyPrice`=1000000 where `entry` in (43016,41596);

DELETE FROM `npc_vendor` WHERE `entry` = 51000;	
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(51000, 0, 2594, 0, 0, 0),
(51000, 0, 5175, 0, 0, 0),
(51000, 0, 5176, 0, 0, 0),
(51000, 0, 5177, 0, 0, 0),
(51000, 0, 5178, 0, 0, 0),
(51000, 0, 6218, 0, 0, 0),
(51000, 0, 6265, 0, 0, 0),
(51000, 0, 6339, 0, 0, 0),
(51000, 0, 10684, 0, 0, 0),
(51000, 0, 11130, 0, 0, 0),
(51000, 0, 11145, 0, 0, 0),
(51000, 0, 16207, 0, 0, 0),
(51000, 0, 17056, 0, 0, 0),
(51000, 0, 17202, 0, 0, 0),
(51000, 0, 21038, 0, 0, 0),
(51000, 0, 21747, 20, 1, 0),
(51000, 0, 22461, 0, 0, 0),
(51000, 0, 22462, 0, 0, 0),
(51000, 0, 22463, 0, 0, 0),
(51000, 0, 23162, 0, 0, 0),
(51000, 0, 23775, 0, 0, 0),
(51000, 0, 24270, 0, 0, 0),
(51000, 0, 25539, 0, 0, 0),
(51000, 0, 32449, 0, 0, 0),
(51000, 0, 33445, 0, 0, 0),
(51000, 0, 33447, 0, 0, 0),
(51000, 0, 33448, 0, 0, 0),
(51000, 0, 34490, 0, 0, 0),
(51000, 0, 35557, 0, 0, 0),
(51000, 0, 37663, 0, 0, 0),
(51000, 0, 38301, 0, 0, 0),
(51000, 0, 38347, 0, 0, 0),
(51000, 0, 39286, 0, 0, 0),
(51000, 0, 41593, 0, 0, 0),
(51000, 0, 41594, 0, 0, 0),
(51000, 0, 41595, 0, 0, 0),
(51000, 0, 41596, 0, 0, 0),
(51000, 0, 41597, 0, 0, 0),
(51000, 0, 41598, 0, 0, 0),
(51000, 0, 42438, 0, 0, 0),
(51000, 0, 43016, 0, 0, 0),
(51000, 0, 43102, 0, 0, 0),
(51000, 0, 44446, 0, 0, 0),
(51000, 0, 44452, 0, 0, 0),
(51000, 0, 44607, 0, 0, 0),
(51000, 0, 44819, 0, 0, 0),
(51000, 0, 45773, 0, 0, 0);
	