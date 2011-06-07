
-- ========================
--  2011_05_24_17_world_waypoint_data.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

DELETE FROM `waypoint_data` WHERE `id`=0;
SET @NPC := 107626;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=847.8322,`position_y`=-4441.198,`position_z`=159.749 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,838.0903,-4421.268,159.749,0,0,0,100,0),
(@PATH,2,801.8729,-4407.143,179.2211,0,0,0,100,0),
(@PATH,3,782.8507,-4413.701,194.3322,0,0,0,100,0),
(@PATH,4,777.4731,-4419.182,198.0821,0,0,0,100,0),
(@PATH,5,774.1382,-4438.679,206.8877,0,0,0,100,0),
(@PATH,6,814.439,-4462.499,206.8877,0,0,0,100,0),
(@PATH,7,848.4948,-4489.605,206.8877,0,0,0,100,0),
(@PATH,8,876.2105,-4490.642,206.8877,0,0,0,100,0),
(@PATH,9,896.0039,-4450.317,192.8044,0,0,0,100,0),
(@PATH,10,897.2634,-4422.887,179.6656,0,0,0,100,0),
(@PATH,11,907.506,-4392.95,179.6656,0,0,0,100,0),
(@PATH,12,933.834,-4369.785,166.0267,0,0,0,100,0),
(@PATH,13,956.7077,-4379.646,166.0267,0,0,0,100,0),
(@PATH,14,967.011,-4400.757,158.8045,0,0,0,100,0),
(@PATH,15,966.2571,-4425.053,159.749,0,0,0,100,0),
(@PATH,16,932.5647,-4461.108,159.749,0,0,0,100,0),
(@PATH,17,891.5416,-4476.208,159.749,0,0,0,100,0),
(@PATH,18,861.6124,-4460.188,159.749,0,0,0,100,0),
(@PATH,19,847.8322,-4441.198,159.749,0,0,0,100,0);

-- ========================
--  2011_05_24_18_world_script_waypoint.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

DELETE FROM `script_waypoint` WHERE `entry`=27316;

-- ========================
--  2011_05_24_19_world_script_texts.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

-- Remove Script text for Inquisitor Hallard
DELETE FROM `script_texts` WHERE `npc_entry`=27316;

-- ========================
--  2011_05_26_00_world_spell_proc_event.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

DELETE FROM `spell_proc_event` WHERE `entry` = 21084;

-- ========================
--  2011_05_27_00_world_spell_script_names.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `spell_id`=62519;

-- ========================
--  2011_05_27_01_world_creature_template.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|1 WHERE `entry`=38752; -- Green Dragon Combat Trigger

-- ========================
--  2011_05_27_02_world_spell_script_names.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `spell_id` = -48721;
INSERT INTO `spell_script_names` VALUES (-48721,'spell_dk_blood_boil');

-- ========================
--  2011_05_28_00_world_sai.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

-- SAI for Spore
SET @ENTRY := 16286;
SET @SPELL := 29232;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,100,1,0,0,0,0,11,@SPELL,3,0,0,0,0,0,0,0,0,0,0,0,0,'Spore - On Death - Cast Fungal Creep');

-- ========================
--  2011_05_28_01_world_spell_script_names.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `spell_id` = 50524;

-- ========================
--  2011_05_28_02_world_areatrigger_scripts.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

DELETE FROM `areatrigger_scripts` WHERE `entry`=5867;
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(5867, 'at_baltharus_plateau');

-- ========================
--  2011_05_28_02_world_creature_template.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

UPDATE `creature_template` SET `npcflag`=0,`ScriptName`= 'npc_xerestrasza' WHERE `entry`=40429;
UPDATE `creature_template` SET `mindmg`=497,`maxdmg`=676,`attackpower`=795,`dmg_multiplier`=35,`ScriptName`= 'boss_baltharus_the_warborn' WHERE `entry`=39751;
UPDATE `creature_template` SET `exp`=2,`mindmg`=497,`maxdmg`=676,`attackpower`=795,`dmg_multiplier`=70 WHERE `entry`=39920;

-- ========================
--  2011_05_28_02_world_creature_text.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

DELETE FROM `creature_text` WHERE `entry` IN (39751,40429); 
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(39751,0,0, 'Your power wanes, ancient one.... Soon you will join your friends.',14,0,100,0,0,17525, 'Baltharus the Warborn'),
(39751,1,0, 'Ah, the entertainment has arrived.',14,0,100,0,0,17520, 'Baltharus the Warborn'),
(39751,2,0, 'Baltharus leaves no survivors!',14,0,100,0,0,17521, 'Baltharus the Warborn'),
(39751,2,1, 'This world has enough heroes.',14,0,100,0,0,17522, 'Baltharus the Warborn'),
(39751,3,0, 'Twice the pain and half the fun.',14,0,100,0,0,17524, 'Baltharus the Warborn'),
(39751,4,1, 'I... didn''t see that coming....',14,0,100,0,0,17523, 'Baltharus the Warborn'),
(40429,0,0, 'Thank you! I could not have held out for much longer.... A terrible thing has happened here.',14,0,100,5,0,17491, 'Sanctum Guardian Xerestrasza'),
(40429,1,0, 'We believed the Sanctum was well-fortified, but we were not prepared for the nature of this assault.',12,0,100,1,0,17492, 'Sanctum Guardian Xerestrasza'),
(40429,2,0, 'The Black dragonkin materialized from thin air, and set upon us before we could react.',12,0,100,1,0,17493, 'Sanctum Guardian Xerestrasza'),
(40429,3,0, 'We did not stand a chance. As my brethren perished around me, I managed to retreat here and bar the entrance.',12,0,100,1,0,17494, 'Sanctum Guardian Xerestrasza'),
(40429,4,0, 'They slaughtered us with cold efficiency, but the true focus of their interest seemed to be the eggs kept here in the Sanctum.',12,0,100,1,0,17495, 'Sanctum Guardian Xerestrasza'),
(40429,5,0, 'The commander of the forces on the ground here is a cruel brute named Zarithrian, but I fear there are greater powers at work.',12,0,100,1,0,17496, 'Sanctum Guardian Xerestrasza'),
(40429,6,0, 'In their initial assault, I caught a glimpse of their true leader, a fearsome full-grown twilight dragon.',12,0,100,1,0,17497, 'Sanctum Guardian Xerestrasza'),
(40429,7,0, 'I know not the extent of their plans, heroes, but I know this:  They cannot be allowed to succeed!',12,0,100,5,0,17498, 'Sanctum Guardian Xerestrasza'),
(40429,8,0, 'Help! I am trapped within this tree!  I require aid!',14,0,100,5,0,17490, 'Sanctum Guardian Xerestrasza');

-- ========================
--  2011_05_28_02_world_instance_template.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

UPDATE `instance_template` SET `script`= 'instance_ruby_sanctum' WHERE `map`=724;

-- ========================
--  2011_05_28_02_world_sai.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

-- Smart AI for Baltarhus the Warborn Clone
SET @ENTRY   := 39899; -- NPC entry
SET @SPELL1  := 40504;  -- Cleave
SET @SPELL2  := 75125; -- Blade Tempest
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,10000,24000,24000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Baltarhus the Warborn Clone - Combat - Cast Cleave on victim'),
(@ENTRY,0,1,0,0,0,100,0,18000,25000,24000,26000,11,@SPELL2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Baltarhus the Warborn Clone - Cast Blade Tempest on self');

-- ========================
--  2011_05_28_02_world_spell_script_names.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_baltharus_enervating_brand';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(74502, 'spell_baltharus_enervating_brand');

-- ========================
--  2011_05_29_00_world_creature_template.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=40429;

-- ========================
--  2011_05_29_01_world_spell_linked_spell.sql  IN  E:\trinityCore_new6\sql\updates\world\
-- ========================

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (70923,-70923);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(70923,70924,1,'Blood-Queen: Uncontrollable Frenzy damage buff'),
(-70923,-70924,0,'Blood-Queen: Uncontrollable Frenzy remove 10man'),
(-70923,-73015,0,'Blood-Queen: Uncontrollable Frenzy remove 25man');
