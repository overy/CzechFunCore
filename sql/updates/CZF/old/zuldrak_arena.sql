delete from smart_scripts where entryorguid=30022;
Insert into smart_scripts values 
(30022, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 11, 50689, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Blood presence'),
(30022, 0, 1, 0, 0, 0, 100, 0, 12000, 12000, 12000, 12000, 11, 55977, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Whirlind'),
(30022, 0, 2, 0, 0, 0, 100, 0, 25000, 25000, 25000, 25000, 11, 55975, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hysteria'),
(30022, 0, 3, 0, 0, 0, 100, 0, 40000, 40000, 40000, 40000, 11, 55974, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Blood boil'),
(30022, 0, 4, 0, 0, 0, 100, 0, 13000, 13000, 13000, 13000, 11, 55973, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Blood plague'),
(30022, 0, 5, 0, 0, 0, 100, 0, 30000, 75000, 30000, 75000, 11, 55976, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'spell deflection');

update creature_template set AIname='SmartAI',mechanic_immune_mask=113983487 where entry=30022;

-- DELETE FROM `quest_start_scripts` WHERE `id`=12948;
-- INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
-- (12948, 10, 10, 30022, 180000, '0', 5773.22, -2980.71, 273.027, 5.186);

UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 30022, `ReqCreatureOrGOCount1` = 1, `StartScript` = 12948, `SpecialFlags` = 0 WHERE `entry` = 12948;
