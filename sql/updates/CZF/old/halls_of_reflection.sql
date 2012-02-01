-- quel delar HOR SAI
delete from smart_scripts where entryorguid=29611;
Insert into smart_scripts values 
(29611, 0, 0, 0, 0, 0, 100, 0, 10000, 20000, 10000, 20000, 11, 67541, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Bladestorm'),
(29611, 0, 0, 0, 0, 0, 100, 0, 5000, 10000, 5000, 10000, 11, 29426, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'heroic strike'),
(29611, 0, 0, 0, 0, 0, 100, 0, 10000, 20000, 10000, 20000, 11, 16856, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'mortal strike'),
(29611, 0, 1, 0, 0, 0, 100, 0, 10000, 20000, 10000, 20000, 11, 67716, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'whirlind');
-- Scriptname for Quel Delar
update creature_template set AIname='SmartAI',mechanic_immune_mask=113983487,scriptname='' where entry=37158;

-- SCRIPTS FOR QUEST Thalorien Dawnseeker

-- SCRIPTNAMES for Thalorien Dawnseeker
UPDATE creature_template SET scriptname='thalorien_dawnseeker_remains',minlevel=80,maxlevel=80,npcflag=3 WHERE entry=37552;
UPDATE creature_template SET scriptname='thalorien_dawnseeker',minlevel=80,maxlevel=80 WHERE entry=37205;

-- QUEST UPDATE Thalorien Dawnseeker
update quest_template set reqcreatureorgoid1=37542 where entry=24535;
update quest_template set reqcreatureorgoid1=37542 where entry=24563;

-- CREATURE UPDATE
-- Crypt Raider
UPDATE creature_template SET AIname='SmartAI',minlevel=80,maxlevel=80,faction_A=16,faction_H=16,health_mod='3.5',mindmg=422,maxdmg=586,attackpower=642,dmg_multiplier=1 WHERE entry=37541;
-- Scourge Zombie
UPDATE creature_template SET AIname='SmartAI',minlevel=80,maxlevel=80,faction_A=16,faction_H=16,health_mod='1.8',mindmg=422,maxdmg=586,attackpower=642,dmg_multiplier=1 WHERE entry=37538;
--  Ghoul Invader
UPDATE creature_template SET AIname='SmartAI',minlevel=80,maxlevel=80,faction_A=16,faction_H=16,health_mod='2.9',mindmg=422,maxdmg=586,attackpower=642,dmg_multiplier=1 WHERE entry=37539;
-- Morlen Coldgrip
UPDATE creature_template SET scriptname='morlen_coldgrip',minlevel=80,maxlevel=80,faction_A=16,faction_H=16,health_mod='7',mindmg=422,maxdmg=586,attackpower=642,dmg_multiplier='4.6' WHERE entry=37542;

-- SAI
-- Crypt Raider
delete from smart_scripts where entryorguid=37541;
Insert into smart_scripts values 
(37541, 0, 0, 0, 0, 0, 100, 0, 5000, 9000, 5000, 9000, 11, 31600, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Crypt Scarabs');
-- Scourge Zombie
delete from smart_scripts where entryorguid=37538;
Insert into smart_scripts values 
(37538, 0, 0, 0, 0, 0, 100, 0, 5000, 10000, 5000, 10000, 11, 49861, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Infected Bite');
-- Ghoul Invader
delete from smart_scripts where entryorguid=37539;
Insert into smart_scripts values 
(37539, 0, 0, 0, 0, 0, 100, 0, 5000, 7000, 5000, 7000, 11, 38056, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Flesh Rip');



delete from `spell_scripts` where id = 69922;
insert into `spell_scripts` values
(69922, 0, 3, 15, 69956, 1, 0, 0, 0, 0, 0);