-- Quel'delar
delete from smart_scripts where entryorguid=37158;
Insert into smart_scripts values 
(37158, 0, 0, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 67541, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Bladestorm'),
(37158, 0, 1, 0, 0, 0, 100, 0, 3500, 3500, 3500, 3500, 11, 29426, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Heroic Strike'),
(37158, 0, 2, 0, 0, 0, 100, 0, 6000, 60000, 6000, 6000, 11, 16856, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mortal Strike'),
(37158, 0, 3, 0, 0, 0, 100, 0, 13000, 13000, 13000, 13000, 11, 67716, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Whirlind');

update creature_template set AIname='',mechanic_immune_mask=0,dynamicflags=0,modelid2=20570,faction_A=16,faction_H=16 where entry in (37158);

-- loot 
delete from creature_loot_template where entry=37158;
insert into creature_loot_template values
(37158, 45912, '-100', 1, 0, 1, 1);


-- Quest
DELETE FROM `quest_start_scripts` WHERE `id` in (24480,24561);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(24480, 10, 10, 37158, 60000, '571', 8120.1259, 779.3, 481.87, 5.186),
(24561, 10, 10, 37158, 60000, '571', 8120.1259, 779.3, 481.87, 5.186);

UPDATE `quest_template` SET `StartScript` = 24480 WHERE `entry` in  (24480,24561);




