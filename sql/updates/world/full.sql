
-- ========================
--  2011_05_09_02_world_version.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `version` SET `db_version`='TDB 335.11.40' LIMIT 1;

-- ========================
--  2011_05_10_00_world_creature.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Trapdoor Crawler
UPDATE `creature` SET `modelid`=0 WHERE `id`=28221;
UPDATE `creature_model_info` SET `bounding_radius`=2,`combat_reach`=4.6,`gender`=1 WHERE `modelid`=18043;
DELETE FROM `creature_template_addon` WHERE `entry`=28221;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(28221,0,0,1,0, '11959');

-- ========================
--  2011_05_10_01_world_reserved_name.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DROP TABLE IF EXISTS `reserved_name`;

-- ========================
--  2011_05_10_02_world_spell_bonus_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_bonus_data` WHERE `entry` IN (62124, 67485);
INSERT INTO `spell_bonus_data` VALUES
(67485, 0, -1, 0.5, -1, 'Paladin - Hand of Reckoning Triggered');

-- ========================
--  2011_05_10_03_world_spell_bonus_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_bonus_data` SET `direct_bonus` = 0.2143 WHERE `entry` = 6789;

-- ========================
--  2011_05_10_04_world_spell_linked_spell.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = -11129;
INSERT INTO `spell_linked_spell` VALUES (-11129, -28682, 0, 'Combustion');

-- ========================
--  2011_05_11_00_world_trinity_string.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `trinity_string` SET `content_default` = '|cfff00000[GM Announcement by [%s]]: %s|r' WHERE `entry` = 6613;

-- ========================
--  2011_05_11_01_world_trinity_string.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `trinity_string` SET `content_default`='|cfff00000[GM Announcement]: %s|r' WHERE `entry`=6613;

-- ========================
--  2011_05_11_02_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_proc_event` SET `SpellFamilyMask1`=65536 WHERE `entry`=70756;

-- ========================
--  2011_05_11_03_world_spell_bonus_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_bonus_data` WHERE `entry`=64801;
INSERT INTO `spell_bonus_data` VALUES (64801,0.45,0,0,0,'Druid - T8 Restoration 4P Bonus');

-- ========================
--  2011_05_11_04_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_proc_event` SET `SpellFamilyMask0` = 0x00002000, `SpellFamilyMask2` = 0 WHERE `entry` = 64908;

-- ========================
--  2011_05_11_05_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_proc_event` WHERE `entry` = 64568;
UPDATE `spell_proc_event` SET `cooldown` = 10 WHERE `entry` = 64571;

-- ========================
--  2011_05_11_06_world_spell_bonus_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_bonus_data` SET `direct_bonus` = -1 WHERE `entry` = 27243;
DELETE FROM `spell_bonus_data` WHERE `entry` = 27285;
INSERT INTO `spell_bonus_data` VALUES (27285, 0.2129, -1, -1, -1,'Warlock - Seed of Corruption Proc');

-- ========================
--  2011_05_11_07_world_spell_bonus_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_proc_event` WHERE `entry` IN (20335,20336,20337);
INSERT INTO `spell_proc_event` VALUES
(20335,0x00,10,0x00800000,0x00000000,0x00000008,0x00000100,0x00000000,0,100,0),
(20336,0x00,10,0x00800000,0x00000000,0x00000008,0x00000100,0x00000000,0,100,0),
(20337,0x00,10,0x00800000,0x00000000,0x00000008,0x00000100,0x00000000,0,100,0);

-- ========================
--  2011_05_11_08_world_spell_linked_spell.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_linked_spell` SET `type` = 1 WHERE `spell_trigger` = 20066;

-- ========================
--  2011_05_11_09_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_proc_event` SET `SpellFamilyMask1`=`SpellFamilyMask1`|0x00010000 WHERE `entry` IN (44445,44446,44448);

-- ========================
--  2011_05_11_10_world_conditions.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `conditions` WHERE `SourceEntry` = 56453;
INSERT INTO `conditions` VALUES
(17,0,56453,0,11,67544,0,0,0,'','Lock and Load - Lock and Load Marker');

-- ========================
--  2011_05_11_10_world_spell_linked_spell.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 56453;
INSERT INTO `spell_linked_spell` VALUES
(56453,67544,0,'Lock and Load Marker');

-- ========================
--  2011_05_11_11_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_proc_event` SET `procEx` = 0, `ppmRate` = 1 WHERE `entry` = 51123;
UPDATE `spell_proc_event` SET `procEx` = 0, `ppmRate` = 2 WHERE `entry` = 51127;
UPDATE `spell_proc_event` SET `procEx` = 0, `ppmRate` = 3 WHERE `entry` = 51128;
UPDATE `spell_proc_event` SET `procEx` = 0, `ppmRate` = 4 WHERE `entry` = 51129;
UPDATE `spell_proc_event` SET `procEx` = 0, `ppmRate` = 5 WHERE `entry` = 51130;

-- ========================
--  2011_05_11_12_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_proc_event` WHERE `entry` IN (49004,49508,49509);
INSERT INTO `spell_proc_event` VALUES
(49004,0x00,0,0x00000000,0x00000000,0x00000000,0x00000000,0x00000033,0,0,0),
(49508,0x00,0,0x00000000,0x00000000,0x00000000,0x00000000,0x00000033,0,0,0),
(49509,0x00,0,0x00000000,0x00000000,0x00000000,0x00000000,0x00000033,0,0,0);

-- ========================
--  2011_05_11_13_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_proc_event` SET `procEx` = 0x0010000 WHERE `entry` = 16864;

-- ========================
--  2011_05_11_14_world_spell_pet_auras.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_pet_auras` WHERE `spell` IN (34455,34459,34460);
INSERT INTO `spell_pet_auras` VALUES
(34455,0,0,75593),
(34459,0,0,75446),
(34460,0,0,75447);

-- ========================
--  2011_05_11_15_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_proc_event` WHERE `entry` = 46916;

-- ========================
--  2011_05_12_00_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_proc_event` WHERE `entry` = 20784;
INSERT INTO `spell_proc_event` VALUES
(20784,0x00,0,0x00000000,0x00000000,0x00000000,0x00000000,0x00000002,0,0,0);

-- ========================
--  2011_05_12_01_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_proc_event` SET `SpellFamilyMask2`=0x00001000 WHERE `entry` IN (34753,34859,34860);

-- ========================
--  2011_05_12_02_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_proc_event` SET `SpellFamilyMask0`=`SpellFamilyMask0`|0x00000001 WHERE `entry` IN (66192,66191,65661);

-- ========================
--  2011_05_12_03_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_proc_event` SET `procEx`=`procEx`|0x00000030 WHERE `entry` IN (31244,31245);

-- ========================
--  2011_05_12_04_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_proc_event` WHERE `entry` IN (66799,66814,66815,66816,66817);
INSERT INTO `spell_proc_event` VALUES
(66799,0x00,15,0x00400000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0),
(66814,0x00,15,0x00400000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0),
(66815,0x00,15,0x00400000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0),
(66816,0x00,15,0x00400000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0),
(66817,0x00,15,0x00400000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,0);

-- ========================
--  2011_05_12_05_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_proc_event` WHERE `entry` = 31801;

-- ========================
--  2011_05_12_06_world_spell_group.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_group` SET `spell_id` = 14893 WHERE `id` = 1097;
UPDATE `spell_group` SET `spell_id` = 16177 WHERE `id` = 1098;

-- ========================
--  2011_05_12_07_world_spell_group.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_group` WHERE `id` = 1044 OR `spell_id` = -1044;

-- ========================
--  2011_05_12_08_world_spell_bonus_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_bonus_data` SET `direct_bonus` = 0.526 WHERE `entry` = 596;

-- ========================
--  2011_05_12_09_world_spell_bonus_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_bonus_data` WHERE `entry` = 64085;
INSERT INTO `spell_bonus_data` VALUES
(64085,1.2,-1,-1,-1,'Priest - Vampiric Touch (Dispelled)');

-- ========================
--  2011_05_12_10_world_spell_bonus_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_bonus_data` SET `ap_bonus` = 0.06 WHERE `entry` = 48721;
DELETE FROM `spell_bonus_data` WHERE `entry` = 49941;

-- ========================
--  2011_05_12_11_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_proc_event` WHERE `entry` = 54936;

-- ========================
--  2011_05_12_12_world_spell_bonus_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_bonus_data` WHERE `entry` IN (53188,53189,53190,53191,53194,53195);
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.3 WHERE `entry` = 50288;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.13 WHERE `entry` = 50294;

-- ========================
--  2011_05_12_13_world_spell_dbc.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_dbc` WHERE `id` = 100000;
INSERT INTO `spell_dbc` VALUES (100000,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,-1,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,15,0,0,0,0,0,0,0,0,0,0,0,'Bone Shield cooldown - serverside spell');

-- ========================
--  2011_05_12_13_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_proc_event` SET `cooldown` = 2 WHERE `entry` = 49222;

-- ========================
--  2011_05_12_14_world_creature_text.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `script_texts` WHERE `npc_entry` IN (10427,20129);
DELETE FROM `creature_text` WHERE `entry`=18728;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`sound`,`comment`) VALUES
(18728,0,0, 'I remember well the sting of defeat at the conclusion of the Third War. I have waited far too long for my revenge. Now the shadow of the Legion falls over this world. It is only a matter of time until all of your failed creation... is undone.',1,11332,'kazzak SAY_INTRO'),
(18728,1,0, 'The Legion will conquer all!',1,11333,'kazzak SAY_AGGRO1'),
(18728,1,1, 'All mortals will perish!',1,11334,'kazzak SAY_AGGRO2'),
(18728,2,0, 'All life must be eradicated!',1,11335,'kazzak SAY_SURPREME1'),
(18728,2,1, 'I''ll rip the flesh from your bones!',1,11336,'kazzak SAY_SURPREME2'),
(18728,3,0, 'Kirel Narak!',1,11337,'kazzak SAY_KILL1'),
(18728,3,1, 'Contemptible wretch!',1,11338,'kazzak SAY_KILL2'),
(18728,3,2, 'The universe will be remade.',1,11339,'kazzak SAY_KILL3'),
(18728,4,0, 'The Legion... will never... fall.',1,11340,'kazzak SAY_DEATH'),
(18728,5,0, '%s goes into a frenzy!',2,0,'kazzak EMOTE_FRENZY'),
(18728,6,0, 'Invaders, you dangle upon the precipice of oblivion! The Burning Legion comes and with it comes your end.',1,0,'kazzak SAY_RAND1'),
(18728,6,1, 'Impudent whelps, you only delay the inevitable. Where one has fallen, ten shall rise. Such is the will of Kazzak...',1,0,'kazzak SAY_RAND2');

-- ========================
--  2011_05_12_15_world_spell_script_names.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `spell_id`=32960 AND `ScriptName`= 'spell_doomlord_kazzak_mark_of_kazzak';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(32960, 'spell_doomlord_kazzak_mark_of_kazzak');

-- ========================
--  2011_05_12_16_world_spell_script_names.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `spell_id`=32960 AND `ScriptName`= 'spell_doomlord_kazzak_mark_of_kazzak';

-- ========================
--  2011_05_13_00_world_spell_dbc.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_dbc` SET `Id` = 100001 WHERE `Id` = 200000;

-- ========================
--  2011_05_13_01_world_spell_bonus_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_bonus_data` WHERE `entry` IN (467,7294);
INSERT INTO `spell_bonus_data` VALUES
(467,0.033,-1,-1,-1,'Druid - Thorns'),
(7294,0.033,-1,-1,-1,'Paladin - Retribution Aura');

-- ========================
--  2011_05_13_02_world_spell_script_names.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `spell_id`=28441;
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES
(28441, 'spell_item_ashbringer');

-- ========================
--  2011_05_13_03_world_spell_bonus_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_bonus_data` WHERE `entry`=2818;
INSERT INTO `spell_bonus_data` VALUES
(2818,0,0,0,0.03,'Rogue - Deadly Poison All Ranks($AP*0.12 / number of ticks)');

-- ========================
--  2011_05_13_03_world_spell_script_names.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_rog_deadly_poison';
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES
(-2818,'spell_rog_deadly_poison');

-- ========================
--  2011_05_13_04_world_areatrigger_scripts.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `areatrigger_scripts` WHERE `entry` BETWEEN 5616 AND 5618;
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(5616,'at_icc_start_frostwing_gauntlet'),
(5617,'at_icc_start_frostwing_gauntlet'),
(5618,'at_icc_start_frostwing_gauntlet');

-- ========================
--  2011_05_13_04_world_instance_misc.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- delete excessive spawns
DELETE FROM `creature` WHERE `guid` IN (137758,137759);
DELETE FROM `creature_addon` WHERE `guid` IN (137758,137759);
DELETE FROM `linked_respawn` WHERE `guid` IN (137758,137759) AND `linkType`=0;

UPDATE `creature_addon` SET `auras`='70203 71465' WHERE `guid`=137753; -- Sister Svalna

DELETE FROM `creature_text` WHERE `entry` IN (37126,37129,37122,37123,37124,37125);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(37126,0,0, 'You may have once fought beside me, Crok, but now you are nothing more than a traitor. Come, your second death approaches!',1,0,0,0,0,17017, 'Sister Svalna - SAY_EVENT_START'),
(37126,1,0, 'Miserable creatures! Die!',1,0,0,0,0,17018, 'Sister Svalna - SAY_KILL_CAPTAIN'),
(37126,2,0, 'Foolish Crok. You brought my reinforcements with you. Arise, Argent Champions, and serve the Lich King in death!',1,0,0,0,0,17019, 'Sister Svanlna - SAY_RESURRECT_CAPTAINS'),
(37126,3,0, 'Come, Scourgebane. I''ll show the master which of us is truly worthy of the title of \"Champion\"!',1,0,0,0,0,17020, 'Sister Svalna - SAY_AGGRO'),
(37126,4,0, 'What a pitiful choice of an ally, Crok!',1,0,0,0,0,17021, 'Sister Svalna - SAY_KILL'),
(37126,5,0, 'What? They died so easily? No matter.',1,0,0,0,0,17022, 'Sister Svalna - SAY_CAPTAIN_DEATH'),
(37126,6,0, 'Perhaps... you were right, Crok.',1,0,0,0,0,17023, 'Sister Svalna - SAY_DEATH'),
(37126,7,0, '%s has impaled $N!',3,0,0,0,0,0, 'Sister Svalna - EMOTE_SVALNA_IMPALE'),
(37126,8,0, '%s''s Aether Shield has been shattered by $N!',3,0,0,0,0,0, 'Sister Svalna - EMOTE_SVALNA_BROKEN_SHIELD'),
(37129,0,0, 'Ready your arms, my Argent Brothers. The Vrykul will protect the Frost Queen with their lives.',1,0,0,0,0,16819, 'Crok Scourgebane - SAY_CROK_INTRO_1'),
(37129,1,0, 'Enough idle banter! Our champions have arrived - support them as we push our way through the hall!',1,0,0,0,0,16820, 'Crok Scourgebane - SAY_CROK_INTRO_3'),
(37129,2,0, 'Draw them back to us, and we''ll assist you.',1,0,0,0,0,16821, 'Crok Scourgebane - SAY_CROK_COMBAT_WP_0'),
(37129,3,0, 'Quickly, push on!',1,0,0,0,0,16823, 'Crok Scourgebane - SAY_CROK_COMBAT_WP_1'),
(37129,4,0, 'Her reinforcements will arrive shortly, we must bring her down quickly!',1,0,0,0,0,16824, 'Crok Scourgebane - SAY_CROK_FINAL_WP'),
(37129,5,0, 'I''ll draw her attacks. Return our brothers to their graves, then help me bring her down!',1,0,0,15,0,16826, 'Crok Scourgebane - SAY_CROK_COMBAT_SVALNA'),
(37129,6,0, 'I must rest for a moment',1,0,0,0,0,16826, 'Crok Scourgebane - SAY_CROK_WEAKENING_GAUNTLET'),
(37129,7,0, 'Champions, I cannot hold her back any longer!',1,0,0,0,0,16827, 'Crok Scourgebane - SAY_CROK_WEAKENING_SVALNA'),
(37129,8,0, 'Vengeance alone... was not enough!',1,0,0,0,0,16828, 'Crok Scourgebane - SAY_CROK_DEATH'),
(37122,0,0, 'Never... could reach... the top shelf...',1,0,0,0,0,16586, 'Captain Arnath - SAY_ARNATH_DEATH'),
(37122,1,0, 'You miserable fools never did manage to select a decent bat wing.',1,0,0,0,0,16587, 'Captain Arnath - SAY_ARNATH_RESURRECTED'),
(37122,2,0, 'THAT was for bringing me spoiled spider ichor!',1,0,0,0,0,16588, 'Captain Arnath - SAY_ARNATH_KILL'),
(37122,3,0, 'Don''t... let Finklestein use me... for his potions...',1,0,0,0,0,16589, 'Captain Arnath - SAY_ARNATH_SECOND_DEATH'),
(37122,4,0, 'The loss of our comrades was unpreventable. They lived and died in the service of the Argent Crusade.',1,0,0,0,0,16590, 'Captain Arnath - SAY_ARNATH_SURVIVE_TALK'),
(37122,5,0, 'Even dying here beats spending another day collecting reagents for that madman, Finklestein.',1,0,0,0,0,16585, 'Captain Arnath - SAY_ARNATH_INTRO_2'),
(37123,0,0, 'No amount of healing can save me now. Fight on, brothers...',1,0,0,0,0,16810, 'Captain Brandon - SAY_BRANDON_DEATH'),
(37123,1,0, 'What? This strength...? All of the pain is gone! You... must join me in the eternal embrace of death!',1,0,0,0,0,16811, 'Captain Brandon - SAY_BRANDON_RESURRECTED'),
(37123,2,0, 'It doesn''t hurt anymore, does it?',1,0,0,0,0,16812, 'Captain Brandon - SAY_BRANDON_KILL'),
(37123,3,0, 'I''m sorry...',1,0,0,0,0,16813, 'Captain Brandon - SAY_BRANDON_SECOND_DEATH'),
(37123,4,0, 'You have done much in this war against the Scourge. May the light embrace you.',1,0,0,0,0,16815, 'Captain Brandon - SAY_BRANDON_SURVIVE_TALK'),
(37124,0,0, 'Please... burn my remains. Let me live warm in the afterlife...',1,0,0,0,0,16844, 'Captain Grondel - SAY_GRONDEL_DEATH'),
(37124,1,0, 'No! Why was I denied a death by flame? You must all BURN!',1,0,0,0,0,16845, 'Captain Grondel - SAY_GRONDEL_RESURRECTED'),
(37124,2,0, 'Can you feel the burn?',1,0,0,0,0,16846, 'Captain Grondel - SAY_GRONDEL_KILL'),
(37124,3,0, 'What... have I done? No!',1,0,0,0,0,16847, 'Captain Grondel - SAY_GRONDEL_SECOND_DEATH'),
(37124,4,0, 'What can possibly redeem this unholy place? Thank you...',1,0,0,0,0,16849, 'Captain Grondel - SAY_GRONDEL_SURVIVE_TALK'),
(37125,0,0, 'It was... a worthy afterlife.',1,0,0,0,0,16998, 'Captain Rupert - SAY_RUPERT_DEATH'),
(37125,1,0, 'There is no escaping the Lich King''s will. Prepare for an explosive encounter!',1,0,0,0,0,16999, 'Captain Rupert - SAY_RUPERT_RESURRECTED'),
(37125,2,0, 'So that''s what happens when you stand too close to a bomb!',1,0,0,0,0,17000, 'Captain Rupert - SAY_RUPERT_KILL'),
(37125,3,0, 'What an... explosive ending!',1,0,0,0,0,17001, 'Captain Rupert - SAY_RUPERT_SECOND_DEATH'),
(37125,4,0, 'Beware the dangers that lie ahead... and do try to remain in one piece.',1,0,0,0,0,17003, 'Captain Rupert - SAY_RUPERT_SURVIVE_TALK');

DELETE FROM `script_waypoint` WHERE `entry`=37129;
INSERT INTO `script_waypoint` (`entry`,`pointid`,`location_x`,`location_y`,`location_z`,`waittime`,`point_comment`) VALUES
(37129,0,4356.90,2648.00,350.285,0, 'Crok Scourgebane - at first trash pack'),
(37129,1,4357.00,2582.17,351.101,0, 'Crok Scourgebane - at second trash pack'),
(37129,2,4357.21,2555.91,354.478,0, NULL),
(37129,3,4357.09,2547.81,354.766,0, NULL),
(37129,4,4356.88,2512.40,358.436,0, 'Crok Scourgebane - at Sister Svalna');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (70078,70053);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry`=50307;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,70078,0,18,1,37122,0,0, '', 'Sister Svalna - Caress of Death'),
(13,0,70078,0,18,1,37123,0,0, '', 'Sister Svalna - Caress of Death'),
(13,0,70078,0,18,1,37124,0,0, '', 'Sister Svalna - Caress of Death'),
(13,0,70078,0,18,1,37125,0,0, '', 'Sister Svalna - Caress of Death'),
(13,0,70053,0,18,1,37122,0,0, '', 'Sister Svalna - Revive Champion'),
(13,0,70053,0,18,1,37123,0,0, '', 'Sister Svalna - Revive Champion'),
(13,0,70053,0,18,1,37124,0,0, '', 'Sister Svalna - Revive Champion'),
(13,0,70053,0,18,1,37125,0,0, '', 'Sister Svalna - Revive Champion'),
(18,0,50307,0,24,1,37126,0,0, '', 'Infernal Spear- Sister Svalna target');

UPDATE `creature_template` SET `difficulty_entry_1`=38349,`minlevel`=81,`maxlevel`=81,`exp`=2,`faction_A`=2209,`faction_H`=2209,`unit_class`=2,`mindmg`=425,`maxdmg`=602,`attackpower`=670,`baseattacktime`=1500,`minrangedmg`=351,`maxrangedmg`=511,`rangedattackpower`=86,`equipment_id`=2423 WHERE `entry`=37491; -- Captain Arnath (Undead)
UPDATE `creature_template` SET `minlevel`=81,`maxlevel`=81,`exp`=2,`faction_A`=2209,`faction_H`=2209,`unit_class`=2,`mindmg`=425,`maxdmg`=602,`attackpower`=670,`baseattacktime`=1500,`minrangedmg`=351,`maxrangedmg`=511,`dmg_multiplier`=13,`rangedattackpower`=86,`dynamicflags`=8,`equipment_id`=2423 WHERE `entry`=38349; -- Captain Arnath (Undead)
UPDATE `creature_template` SET `difficulty_entry_1`=38350,`minlevel`=81,`maxlevel`=81,`exp`=2,`faction_A`=2209,`faction_H`=2209,`unit_class`=2,`mindmg`=425,`maxdmg`=602,`attackpower`=670,`baseattacktime`=1500,`minrangedmg`=351,`maxrangedmg`=511,`rangedattackpower`=86,`equipment_id`=2424 WHERE `entry`=37493; -- Captain Brandon (Undead)
UPDATE `creature_template` SET `minlevel`=81,`maxlevel`=81,`exp`=2,`faction_A`=2209,`faction_H`=2209,`unit_class`=2,`mindmg`=425,`maxdmg`=602,`attackpower`=670,`baseattacktime`=1500,`minrangedmg`=351,`maxrangedmg`=511,`dmg_multiplier`=13,`rangedattackpower`=86,`dynamicflags`=8,`equipment_id`=2424 WHERE `entry`=38350; -- Captain Brandon (Undead)
UPDATE `creature_template` SET `difficulty_entry_1`=38351,`minlevel`=81,`maxlevel`=81,`exp`=2,`faction_A`=2209,`faction_H`=2209,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`baseattacktime`=1500,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=2425 WHERE `entry`=37494; -- Captain Grondel (Undead)
UPDATE `creature_template` SET `minlevel`=81,`maxlevel`=81,`exp`=2,`faction_A`=2209,`faction_H`=2209,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`baseattacktime`=1500,`minrangedmg`=353,`maxrangedmg`=512,`dmg_multiplier`=13,`rangedattackpower`=112,`dynamicflags`=8,`equipment_id`=2425 WHERE `entry`=38351; -- Captain Grondel (Undead)
UPDATE `creature_template` SET `difficulty_entry_1`=38352,`minlevel`=81,`maxlevel`=81,`exp`=2,`faction_A`=2209,`faction_H`=2209,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`baseattacktime`=1500,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=2426 WHERE `entry`=37495; -- Captain Rupert (Undead)
UPDATE `creature_template` SET `minlevel`=81,`maxlevel`=81,`exp`=2,`faction_A`=2209,`faction_H`=2209,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`baseattacktime`=1500,`minrangedmg`=353,`maxrangedmg`=512,`dmg_multiplier`=13,`rangedattackpower`=112,`dynamicflags`=8,`equipment_id`=2426 WHERE `entry`=38352; -- Captain Rupert (Undead)
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`exp`=2,`faction_A`=2209,`faction_H`=2209,`npcflag`=`npcflag`|16777216,`dynamicflags`=0,`equipment_id`=2364 WHERE `entry`=38248; -- Impaling Spear

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=38248;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(38248,71462,0,0,0,1,0,71443,2); -- Impaling Spear

-- ========================
--  2011_05_13_04_world_scriptname.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `creature_template` SET `ScriptName`='boss_sister_svalna' WHERE `entry`=37126;
UPDATE `creature_template` SET `ScriptName`='npc_crok_scourgebane' WHERE `entry`=37129;
UPDATE `creature_template` SET `ScriptName`='npc_captain_arnath' WHERE `entry`=37122;
UPDATE `creature_template` SET `ScriptName`='npc_captain_brandon' WHERE `entry`=37123;
UPDATE `creature_template` SET `ScriptName`='npc_captain_grondel' WHERE `entry`=37124;
UPDATE `creature_template` SET `ScriptName`='npc_captain_rupert' WHERE `entry`=37125;
UPDATE `creature_template` SET `ScriptName`='npc_frostwing_vrykul' WHERE `entry` IN (37132,38125,37127,37134,37133);
UPDATE `creature_template` SET `ScriptName`='npc_impaling_spear' WHERE `entry`=38248;

-- ========================
--  2011_05_13_04_world_spell_script_names.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_svalna_caress_of_death';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_svalna_revive_champion';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_svalna_remove_spear';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(70078, 'spell_svalna_caress_of_death'),
(70053, 'spell_svalna_revive_champion'),
(71462, 'spell_svalna_remove_spear');

-- ========================
--  2011_05_13_05_world_creature_text.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `script_texts` WHERE `npc_entry` IN (12429);
DELETE FROM `creature_text` WHERE `entry`=18733;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`sound`,`comment`) VALUES
(18733,0,0, 'Do not proceed. You will be eliminated!',1,11344,'doomwalker SAY_AGGRO'),
(18733,1,0, 'Tectonic disruption commencing.',1,11345,'doomwalker SAY_EARTHQUAKE_1'),
(18733,1,1, 'Magnitude set. Release.',1,11346,'doomwalker SAY_EARTHQUAKE_2'),
(18733,2,0, 'Trajectory locked.',1,11347,'doomwalker SAY_OVERRUN_1'),
(18733,2,1, 'Engage maximum speed.',1,11348,'doomwalker SAY_OVERRUN_2'),
(18733,3,0, 'Threat level zero.',1,11349,'doomwalker SAY_SLAY_1'),
(18733,3,1, 'Directive accomplished.',1,11350,'doomwalker SAY_SLAY_2'),
(18733,3,2, 'Target exterminated.',1,11351,'doomwalker SAY_SLAY_3'),
(18733,4,0, 'System failure in five, f-o-u-r...',1,11352,'doomwalker SAY_DEATH');

-- ========================
--  2011_05_13_06_world_creature_text.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Update creature_text to use proper text values
UPDATE `creature_text` SET `type`=12 WHERE `type`=0;
UPDATE `creature_text` SET `type`=14 WHERE `type`=1;
UPDATE `creature_text` SET `type`=16 WHERE `type`=2;
UPDATE `creature_text` SET `type`=41 WHERE `type`=3;
UPDATE `creature_text` SET `type`=15 WHERE `type`=4;
UPDATE `creature_text` SET `type`=42 WHERE `type`=5;

-- ========================
--  2011_05_14_00_world_achievment_criteria_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `disables` WHERE `entry` IN (3368,3369,3370,3371,7623,12578,3684,5529,5512,5530,5531,5532,5533,5534,5535,9165,9166,5536,5537,5538,5539,5540,13254,5541,5542,5543,5544,5545,5546,5547,5548,7573,7574,10619,10620,11497,11498,11500,11501,12178,12179,12181,12182,13255) AND `sourceType`=4;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (3368,3369,3370,3371,7623,12578,3684,5529,5512,5530,5531,5532,5533,5534,5535,9165,9166,5536,5537,5538,5539,5540,13254,5541,5542,5543,5544,5545,5546,5547,5548,7573,7574,10619,10620,11497,11498,11500,11501,12178,12179,12181,12182,13255);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(3368,0,0,0,''), -- Alterac Valley
(3369,0,0,0,''), -- Arathi Basin
(3370,0,0,0,''), -- Eye of the Storm
(3371,0,0,0,''), -- Warsong Gulch
(7623,0,0,0,''), -- Strand of the Ancients
(12578,0,0,0,''), -- Isle of Conquest
(3684,7,23505,0,''), -- Berserking killing blow
(5529,0,0,0,''), -- Total Killing Blows
(5512,20,0,0,''), -- Eastern Kingdoms
(5530,20,1,0,''), -- Kalimdor
(5531,20,530,0,''), -- Burning Crusade Areas
(5532,20,571,0,''), -- Northrend
(5533,20,559,0,''), -- Nagrand Arena
(5534,20,562,0,''), -- Blade's Edge Arena
(5535,20,572,0,''), -- Ruind of Lordaeron
(9165,20,617,0,''), -- Dalaran Sewers
(9166,20,618,0,''), -- Ring of Valor
(5536,20,30,0,''), -- Alterac Valley
(5537,20,529,0,''), -- Arathi Basin
(5538,20,489,0,''), -- Warsong Gulch
(5539,20,566,0,''), -- Eye of the Storm
(5540,20,607,0,''), -- Strand of the Ancients
(13254,20,628,0,''), -- Isle of Conquest
(5541,11,0,0,'achievement_arena_2v2_kills'), -- 2v2 Arena Killing Blows
(5542,11,0,0,'achievement_arena_3v3_kills'), -- 3v3 Arena Killing Blows
(5543,11,0,0,'achievement_arena_5v5_kills'), -- 5v5 Arena Killing Blows
(5544,20,30,0,''), -- Alterac Valley Killing Blows
(5545,20,529,0,''), -- Arathi Basin Killing Blows
(5546,20,489,0,''), -- Warsong Gulch Killing Blows
(5547,20,566,0,''), -- Eye of the Storm Killing Blows
(5548,20,607,0,''), -- Strand of the Ancients Killing Blows
(7573,1,30249,0,''), -- Deliver a killing blow to a Scion of Eternity while riding on a hover disk
(7573,11,0,0,'achievement_denyin_the_scion'), -- Deliver a killing blow to a Scion of Eternity while riding on a hover disk
(7574,1,30249,0,''), -- Deliver a killing blow to a Scion of Eternity while riding on a hover disk
(7574,11,0,0,'achievement_denyin_the_scion'), -- Deliver a killing blow to a Scion of Eternity while riding on a hover disk
(10619,1,33142,0,''), -- Leviathan Turret
(10620,1,33142,0,''), -- Leviathan Turret
(11497,1,35273,0,''), -- Glaive Thrower
(11498,1,34775,0,''), -- Demolisher
(11500,1,34793,0,''), -- Catapult
(11501,1,35069,0,''), -- Siege Engine
(12178,1,34802,0,''), -- Glaive Thrower
(12179,1,34775,0,''), -- Demolisher
(12181,1,34793,0,''), -- Catapult
(12182,1,34776,0,''), -- Siege Engine
(13255,20,628,0,''); -- Isle of Conquest Killing Blows

-- ========================
--  2011_05_14_01_world_achievment_criteria_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `disables` WHERE `entry` IN (7265,7549) AND `sourceType`=4;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (7265,7549) AND `type` IN (0,11);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(7265,11,0,0,'achievement_momma_said_knock_you_out'), -- Momma Said Knock You Out (10 player)
(7549,11,0,0,'achievement_momma_said_knock_you_out'); -- Momma Said Knock You Out (25 player)

-- ========================
--  2011_05_14_02_world_achievment_criteria_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `achievement_criteria_data` SET `type`=5 WHERE `type`=7 AND `criteria_id`=3684;

-- ========================
--  2011_05_14_03_world_gossip_menu.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Add Missing Options to Exodar Paladin Trainer
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7260 AND `id` IN (1,2);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES
(7260,1,2, 'I wish to unlearn my talents',16,16,0,0,0,0,0, ''),
(7260,2,2, 'Purchase a Dual Talent Specialization',18,16,0,0,0,0,10000000, 'Are you sure you wish to purchase a Dual Talent Specialization?');

-- ========================
--  2011_05_14_04_world_gossip_menu.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Add Missing Options to Silvermoon Paladin Trainer
DELETE FROM `gossip_menu_option` WHERE `menu_id`=6647 AND `id` IN (1,2);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES
(6647,1,2, 'I wish to unlearn my talents',16,16,0,0,0,0,0, ''),
(6647,2,2, 'Purchase a Dual Talent Specialization',18,16,0,0,0,0,10000000, 'Are you sure you wish to purchase a Dual Talent Specialization?');

-- ========================
--  2011_05_15_00_world_creature_template.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry` = 4625;

-- ========================
--  2011_05_15_01_world_smart_scripts.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `smart_scripts` WHERE `entryorguid` = 4625 AND `source_type` = 0 AND `id` IN (0,1);
INSERT INTO `smart_scripts` VALUES
(4625,0,0,0,1,0,100,3,0,1100,0,1100,11,7083,2,0,0,0,0,1,0,0,0,0,0,0,0,'Ward Keepers - Cast the Guard Spell'),
(4625,0,1,0,6,0,100,2,0,0,0,0,34,1,1,0,0,0,0,0,0,0,0,0,0,0,0,'Ward Keepers - Send Event on Die');

-- ========================
--  2011_05_15_02_world_spell_script_names.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `spell_id` IN (710,18647);
INSERT INTO `spell_script_names` VALUES (710,"spell_warl_banish"),(18647,"spell_warl_banish");

-- ========================
--  2011_05_16_00_world_creature.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `creature` c LEFT JOIN `creature_template` ct ON c.id=ct.`Entry` SET c.`MovementType`=0,c.`spawndist`=0 WHERE (ct.flags_extra & 128)!=0;

-- ========================
--  2011_05_17_00_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_proc_event` SET `procEx` = 0x00040000 WHERE `entry` IN (56636, 56637, 56638);

-- ========================
--  2011_05_17_01_world_spell_bonus_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_bonus_data` WHERE `entry` IN (69729,69730,69733,69734);
INSERT INTO `spell_bonus_data` VALUES
(69729,-1,0,-1,-1,'Item - Onyxia 10 Caster Trinket - Searing Flames'),
(69730,-1,0,-1,-1,'Item - Onyxia 25 Caster Trinket - Searing Flames'),
(69733,0,-1,-1,-1,'Item - Onyxia 10 Caster Trinket - Cauterizing Heal'),
(69734,0,-1,-1,-1,'Item - Onyxia 25 Caster Trinket - Cauterizing Heal');

-- ========================
--  2011_05_17_01_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_proc_event` WHERE `entry` IN (69739,69755);
INSERT INTO `spell_proc_event` VALUES
(69739,0x00,0,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,45),
(69755,0x00,0,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0,0,45);

-- ========================
--  2011_05_18_00_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `spell_proc_event` SET `ppmRate`=2 WHERE `entry`=51127;
UPDATE `spell_proc_event` SET `ppmRate`=4 WHERE `entry`=51128;
UPDATE `spell_proc_event` SET `ppmRate`=6 WHERE `entry`=51129;
UPDATE `spell_proc_event` SET `ppmRate`=8 WHERE `entry`=51130;

-- ========================
--  2011_05_18_01_world_spell_target_position.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Fix Argent Crusaders Tabard
DELETE FROM `spell_target_position` WHERE `id`=66238;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(66238,571,8480.062,1092.5375,554.4877,0.6014);

-- ========================
--  2011_05_18_02_world_creature_text.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `creature_text` WHERE `entry` IN (18733,17711);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`sound`,`comment`) VALUES
(17711,0,0, 'Do not proceed. You will be eliminated!',1,11344,'doomwalker SAY_AGGRO'),
(17711,1,0, 'Tectonic disruption commencing.',1,11345,'doomwalker SAY_EARTHQUAKE_1'),
(17711,1,1, 'Magnitude set. Release.',1,11346,'doomwalker SAY_EARTHQUAKE_2'),
(17711,2,0, 'Trajectory locked.',1,11347,'doomwalker SAY_OVERRUN_1'),
(17711,2,1, 'Engage maximum speed.',1,11348,'doomwalker SAY_OVERRUN_2'),
(17711,3,0, 'Threat level zero.',1,11349,'doomwalker SAY_SLAY_1'),
(17711,3,1, 'Directive accomplished.',1,11350,'doomwalker SAY_SLAY_2'),
(17711,3,2, 'Target exterminated.',1,11351,'doomwalker SAY_SLAY_3'),
(17711,4,0, 'System failure in five, f-o-u-r...',1,11352,'doomwalker SAY_DEATH');

-- ========================
--  2011_05_18_03_world_creature.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- This creature is only supposed to be summoned.
DELETE FROM `creature` WHERE `id`=4196;
DELETE FROM `creature_addon` WHERE `guid` IN (14343,14342,14341,14340,14339,14338,14337);

-- ========================
--  2011_05_18_04_world_achievements.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Fix achievement criteria for Not In My House
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=7021;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7021;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(7021,6,4572,0, ''), -- check if player is in Warsong Flag Room
(7021,7,23333,0, ''); -- check if victim has a Horde Flag buff
DELETE FROM `disables` WHERE `sourceType`=4 AND  `entry`=7020;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7020;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(7020,6,4571,0, ''), -- check if player is in Silverwing Flag Room
(7020,7,23335,0, ''); -- check if victim has a Alliance Flag buff

-- Fix achievement criteria for Take a Chill Pill
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=3879;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=3879;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(3879,6,3820,0, ''), -- check if player is in Eye of the Storm
(3879,7,23505,0, ''); -- check if victim has a Berserking buff

-- ========================
--  2011_05_18_05_world_waypoints.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Pathing for Dark Rune Warrior Entry: 27960
SET @NPC := 126691;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1090.053,`position_y`=657.417,`position_z`=201.9775 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1094.174,663.0545,202.243,0,0,0,100,0),
(@PATH,2,1093.973,671.6352,202.1839,0,0,0,100,0),
(@PATH,3,1090.33,676.6746,201.9775,0,0,0,100,0),
(@PATH,4,1080.979,677.0645,201.9775,0,0,0,100,0),
(@PATH,5,1077.056,671.3228,202.4617,0,0,0,100,0),
(@PATH,6,1076.541,663.8468,202.5533,0,0,0,100,0),
(@PATH,7,1080.974,657.8231,201.9775,0,0,0,100,0),
(@PATH,8,1090.053,657.417,201.9775,0,0,0,100,0);

-- Pathing for Dark Rune Warrior Entry: 27960
SET @NPC := 126695;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1170.523,`position_y`=645.3429,`position_z`=196.235 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1161.521,639.6048,196.235,0,0,0,100,0),
(@PATH,2,1153.933,638.7031,196.235,0,0,0,100,0),
(@PATH,3,1145.4,639.8294,196.235,0,0,0,100,0),
(@PATH,4,1138.166,644.63,196.235,0,0,0,100,0),
(@PATH,5,1145.4,639.8294,196.235,0,0,0,100,0),
(@PATH,6,1153.933,638.7031,196.235,0,0,0,100,0),
(@PATH,7,1161.521,639.6048,196.235,0,0,0,100,0),
(@PATH,8,1170.523,645.3429,196.235,0,0,0,100,0);

-- Pathing for Dark Rune Warrior Entry: 27960
SET @NPC := 126694;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1008.858,`position_y`=651.2056,`position_z`=201.9775 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1000.427,660.0714,202.4617,0,0,0,100,0),
(@PATH,2,1008.856,651.2029,201.9775,0,0,0,100,0),
(@PATH,3,1017.993,659.7945,202.4206,0,0,0,100,0),
(@PATH,4,1008.858,651.2056,201.9775,0,0,0,100,0);

-- Pathing for Dark Rune Warrior Entry: 27960
SET @NPC := 126689;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1007.622,`position_y`=680.3897,`position_z`=201.9775 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1009.632,678.1111,201.9775,0,0,0,100,0),
(@PATH,2,1011.626,675.8503,201.9775,0,0,0,100,0),
(@PATH,3,1013.619,673.5897,201.9775,0,0,0,100,0),
(@PATH,4,1014.087,673.0586,201.9775,0,0,0,100,0),
(@PATH,5,1012.174,675.2281,201.9775,0,0,0,100,0),
(@PATH,6,1010.179,677.4907,201.9775,0,0,0,100,0),
(@PATH,7,1009.943,677.858,201.9775,0,0,0,100,0),
(@PATH,8,1008.536,677.9459,201.9775,0,0,0,100,0),
(@PATH,9,1006.057,676.2379,201.9775,0,0,0,100,0),
(@PATH,10,1003.621,674.5599,201.9775,0,0,0,100,0),
(@PATH,11,1003.016,674.143,201.9775,0,0,0,100,0),
(@PATH,12,1005.35,675.7533,201.9775,0,0,0,100,0),
(@PATH,13,1007.832,677.4641,201.9775,0,0,0,100,0),
(@PATH,14,1007.622,680.3897,201.9775,0,0,0,100,0);

-- Pathing for Dark Rune Warrior Entry: 27960
SET @NPC := 126688;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1003.653,`position_y`=679.7339,`position_z`=201.9775 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1001.198,678.0424,202.4496,0,0,0,100,0),
(@PATH,2,1000.609,677.6369,202.4617,0,0,0,100,0),
(@PATH,3,1002.948,679.2506,201.9884,0,0,0,100,0),
(@PATH,4,1005.432,680.9628,201.9775,0,0,0,100,0),
(@PATH,5,1010.811,683.1892,201.9775,0,0,0,100,0),
(@PATH,6,1012.803,680.9303,201.9775,0,0,0,100,0),
(@PATH,7,1014.796,678.6695,201.9775,0,0,0,100,0),
(@PATH,8,1016.789,676.4094,202.0681,0,0,0,100,0),
(@PATH,9,1017.27,675.8646,202.2087,0,0,0,100,0),
(@PATH,10,1015.357,678.0338,201.9775,0,0,0,100,0),
(@PATH,11,1013.363,680.2949,201.9775,0,0,0,100,0),
(@PATH,12,1008.611,683.1473,201.9775,0,0,0,100,0),
(@PATH,13,1006.133,681.4426,201.9775,0,0,0,100,0),
(@PATH,14,1003.653,679.7339,201.9775,0,0,0,100,0);

-- Pathing for Dark Rune Warrior Entry: 27960
SET @NPC := 126690;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1125.967,`position_y`=667.0475,`position_z`=196.235 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1126.472,676.8317,196.235,0,0,0,100,0),
(@PATH,2,1131.925,686.5771,196.235,0,0,0,100,0),
(@PATH,3,1126.472,676.8317,196.235,0,0,0,100,0),
(@PATH,4,1125.968,667.053,196.235,0,0,0,100,0),
(@PATH,5,1125.741,658.6804,196.235,0,0,0,100,0),
(@PATH,6,1130.845,649.0156,196.235,0,0,0,100,0),
(@PATH,7,1125.741,658.6804,196.235,0,0,0,100,0),
(@PATH,8,1125.967,667.0475,196.235,0,0,0,100,0);

-- Pathing for Dark Rune Warrior Entry: 27960
SET @NPC := 126696;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1177.753,`position_y`=651.6073,`position_z`=196.235 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1180.727,659.129,196.2331,0,0,0,100,0),
(@PATH,2,1181.298,667.9468,196.2331,0,0,0,100,0),
(@PATH,3,1180.703,675.5833,196.235,0,0,0,100,0),
(@PATH,4,1177.057,683.4843,196.235,0,0,0,100,0),
(@PATH,5,1177.753,651.6073,196.235,0,0,0,100,0);

-- Pathing for Dark Rune Warrior Entry: 27960
SET @NPC := 126687;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1145.315,`position_y`=695.628,`position_z`=196.2341 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1153.682,695.8888,196.2342,0,0,0,100,0),
(@PATH,2,1162.608,695.6946,196.2344,0,0,0,100,0),
(@PATH,3,1170.438,690.9058,196.235,0,0,0,100,0),
(@PATH,4,1162.608,695.6946,196.2344,0,0,0,100,0),
(@PATH,5,1153.682,695.8888,196.2342,0,0,0,100,0),
(@PATH,6,1145.315,695.628,196.2341,0,0,0,100,0),
(@PATH,7,1135.572,689.3916,196.235,0,0,0,100,0),
(@PATH,8,1145.315,695.628,196.2341,0,0,0,100,0);

-- Pathing for Dark Rune Elementalist Entry: 27962
SET @NPC := 126703;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1145.024,`position_y`=642.0187,`position_z`=196.4137 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1150.999,641.2302,196.3704,0,0,0,100,0),
(@PATH,2,1153.455,640.7827,196.235,0,0,0,100,0),
(@PATH,3,1156.446,641.1381,196.3269,0,0,0,100,0),
(@PATH,4,1158.825,640.4028,196.235,0,0,0,100,0),
(@PATH,5,1161.368,642.0229,196.6185,0,0,0,100,0),
(@PATH,6,1163.906,643.6405,196.6111,0,0,0,100,0),
(@PATH,7,1166.443,645.2581,196.6037,0,0,0,100,0),
(@PATH,8,1167.594,645.9916,196.6003,0,0,0,100,0),
(@PATH,9,1165.148,644.4322,196.6075,0,0,0,100,0),
(@PATH,10,1162.606,642.8119,196.6148,0,0,0,100,0),
(@PATH,11,1160.97,641.7167,196.5989,0,0,0,100,0),
(@PATH,12,1157.9,641.3109,196.4085,0,0,0,100,0),
(@PATH,13,1155.433,640.6448,196.235,0,0,0,100,0),
(@PATH,14,1152.448,641.0389,196.2801,0,0,0,100,0),
(@PATH,15,1149.457,641.4337,196.4665,0,0,0,100,0),
(@PATH,16,1147.237,641.1562,196.3355,0,0,0,100,0),
(@PATH,17,1144.726,642.8226,196.6567,0,0,0,100,0),
(@PATH,18,1142.219,644.4866,196.6761,0,0,0,100,0),
(@PATH,19,1141.106,645.2245,196.6847,0,0,0,100,0),
(@PATH,20,1143.517,643.6247,196.666,0,0,0,100,0),
(@PATH,21,1145.024,642.0187,196.4137,0,0,0,100,0);

-- Pathing for Dark Rune Elementalist Entry: 27962
SET @NPC := 126701;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1129.024,`position_y`=657.0057,`position_z`=196.235 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1127.864,658.7399,196.235,0,0,0,100,0),
(@PATH,2,1127.946,661.7473,196.5042,0,0,0,100,0),
(@PATH,3,1128.027,664.7563,196.5429,0,0,0,100,0),
(@PATH,4,1128.126,667.7181,196.5897,0,0,0,100,0),
(@PATH,5,1128.281,670.7305,196.6634,0,0,0,100,0),
(@PATH,6,1128.436,673.7336,196.737,0,0,0,100,0),
(@PATH,7,1128.333,675.8134,196.344,0,0,0,100,0),
(@PATH,8,1129.804,678.4424,196.2552,0,0,0,100,0),
(@PATH,9,1131.276,681.0732,196.235,0,0,0,100,0),
(@PATH,10,1132.74,683.6888,196.235,0,0,0,100,0),
(@PATH,11,1132.74,683.69,196.235,0,0,0,100,0),
(@PATH,12,1131.326,681.163,196.235,0,0,0,100,0),
(@PATH,13,1129.854,678.5325,196.2521,0,0,0,100,0),
(@PATH,14,1128.596,676.8445,196.235,0,0,0,100,0),
(@PATH,15,1128.441,673.8321,196.7393,0,0,0,100,0),
(@PATH,16,1128.286,670.8169,196.6655,0,0,0,100,0),
(@PATH,17,1128.112,667.863,196.5829,0,0,0,100,0),
(@PATH,18,1128.03,664.851,196.5442,0,0,0,100,0),
(@PATH,19,1127.946,661.7473,196.5042,0,0,0,100,0),
(@PATH,20,1128.552,657.9015,196.2763,0,0,0,100,0),
(@PATH,21,1129.957,655.2396,196.235,0,0,0,100,0),
(@PATH,22,1131.364,652.576,196.235,0,0,0,100,0),
(@PATH,23,1131.73,651.8821,196.235,0,0,0,100,0),
(@PATH,24,1130.38,654.4395,196.235,0,0,0,100,0),
(@PATH,25,1129.024,657.0057,196.235,0,0,0,100,0);

-- Pathing for Dark Rune Theurgist Entry: 27963
SET @NPC := 126711;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1015.999,`position_y`=655.0078,`position_z`=201.9775 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1017.901,656.7959,202.3935,0,0,0,100,0),
(@PATH,2,1015.829,654.8475,201.9775,0,0,0,100,0),
(@PATH,3,1013.636,652.786,201.9775,0,0,0,100,0),
(@PATH,4,1008.389,648.621,202.0844,0,0,0,100,0),
(@PATH,5,1006.314,650.805,201.9775,0,0,0,100,0),
(@PATH,6,1004.238,652.9855,201.9775,0,0,0,100,0),
(@PATH,7,1002.176,655.1539,202.1629,0,0,0,100,0),
(@PATH,8,1000.352,657.0724,202.4617,0,0,0,100,0),
(@PATH,9,1002.312,655.0092,202.1233,0,0,0,100,0),
(@PATH,10,1004.39,652.8227,201.9775,0,0,0,100,0),
(@PATH,11,1009.411,648.8157,201.9775,0,0,0,100,0),
(@PATH,12,1011.61,650.8812,201.9775,0,0,0,100,0),
(@PATH,13,1013.805,652.9445,201.9775,0,0,0,100,0),
(@PATH,14,1015.999,655.0078,201.9775,0,0,0,100,0);

-- Pathing for Dark Rune Theurgist Entry: 27963
SET @NPC := 126706;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1000.065,`position_y`=674.6865,`position_z`=202.4617 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1009.652,681.2956,201.9775,0,0,0,100,0),
(@PATH,2,1017.081,672.8705,202.1537,0,0,0,100,0),
(@PATH,3,1009.655,681.2927,201.9776,0,0,0,100,0),
(@PATH,4,1000.065,674.6865,202.4617,0,0,0,100,0);

-- Pathing for Dark Rune Theurgist Entry: 27963
SET @NPC := 126709;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1153.176,`position_y`=763.721,`position_z`=195.9379 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1152.519,749.35,195.3503,0,0,0,100,0),
(@PATH,2,1153.176,763.721,195.9379,0,0,0,100,0),
(@PATH,3,1153.054,777.6341,195.0444,0,0,0,100,0),
(@PATH,4,1153.176,763.721,195.9379,0,0,0,100,0);

-- Pathing for Dark Rune Theurgist Entry: 27963
SET @NPC := 126715;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=986.8647,`position_y`=666.3177,`position_z`=202.871 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1009.195,666.1702,201.9775,0,0,0,100,0),
(@PATH,2,1035.709,665.5925,202.4466,0,0,0,100,0),
(@PATH,3,1009.197,666.1702,201.9775,0,0,0,100,0),
(@PATH,4,986.8647,666.3177,202.871,0,0,0,100,0);

-- Pathing for Dark Rune Theurgist Entry: 27963
SET @NPC := 126710;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1135.301,`position_y`=743.4152,`position_z`=195.3503 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1172.016,743.1987,195.647,0,0,0,100,0),
(@PATH,2,1135.301,743.4152,195.3503,0,0,0,100,0);

-- Pathing for Dark Rune Controller Entry: 27966
SET @NPC := 126732;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=959.431,`position_y`=770.3616,`position_z`=198.8232 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,969.4739,773.4847,199.2813,0,0,0,100,0),
(@PATH,2,967.765,784.1023,197.2568,0,0,0,100,0),
(@PATH,3,961.8073,788.9789,196.0064,0,0,0,100,0),
(@PATH,4,953.1095,795.3681,193.9678,0,0,0,100,0),
(@PATH,5,944.3715,791.49,194.977,0,0,0,100,0),
(@PATH,6,943.6695,784.9597,196.3876,0,0,0,100,0),
(@PATH,7,949.5979,774.4566,198.258,0,0,0,100,0),
(@PATH,8,959.431,770.3616,198.8232,0,0,0,100,0);

-- Pathing for Dark Rune Controller Entry: 27966
SET @NPC := 126728;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=937.8448,`position_y`=816.6932,`position_z`=189.7503 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,956.9082,820.8291,187.6685,0,0,0,100,0),
(@PATH,2,970.3458,829.6348,186.9343,0,0,0,100,0),
(@PATH,3,978.5536,836.1985,186.3881,0,0,0,100,0),
(@PATH,4,970.3458,829.6348,186.9343,0,0,0,100,0),
(@PATH,5,956.9082,820.8291,187.6685,0,0,0,100,0),
(@PATH,6,937.8448,816.6932,189.7503,0,0,0,100,0);

-- Pathing for Dark Rune Giant Entry: 27969
SET @NPC := 126733;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1048.362,`position_y`=627.2144,`position_z`=207.7195 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1048.035,534.076,207.7195,0,0,0,100,0),
(@PATH,2,1048.362,627.2144,207.7195,0,0,0,100,0);

-- Pathing for Dark Rune Giant Entry: 27969
SET @NPC := 126734;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1182.628,`position_y`=642.6927,`position_z`=196.235 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1191.198,663.7195,196.2346,0,0,0,100,0),
(@PATH,2,1182.631,642.6952,196.235,0,0,0,100,0),
(@PATH,3,1169.885,632.327,196.235,0,0,0,100,0),
(@PATH,4,1154.578,627.3207,196.235,0,0,0,100,0),
(@PATH,5,1140.422,631.9984,196.235,0,0,0,100,0),
(@PATH,6,1124.699,645.2076,196.235,0,0,0,100,0),
(@PATH,7,1121.548,657.0721,196.235,0,0,0,100,0),
(@PATH,8,1124.699,645.2076,196.235,0,0,0,100,0),
(@PATH,9,1140.422,631.9984,196.235,0,0,0,100,0),
(@PATH,10,1154.578,627.3207,196.235,0,0,0,100,0),
(@PATH,11,1169.885,632.327,196.235,0,0,0,100,0),
(@PATH,12,1182.628,642.6927,196.235,0,0,0,100,0);

-- Pathing for Dark Rune Giant Entry: 27969
SET @NPC := 126736;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=905.2296,`position_y`=666.2713,`position_z`=196.4107 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,946.57,666.5284,196.1596,0,0,0,100,0),
(@PATH,2,968.8573,666.6479,196.4836,0,0,0,100,0),
(@PATH,3,946.5755,666.5284,196.1597,0,0,0,100,0),
(@PATH,4,905.2296,666.2713,196.4107,0,0,0,100,0);

-- Pathing for Dark Rune Giant Entry: 27969
SET @NPC := 126735;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1124.234,`position_y`=666.6528,`position_z`=196.235 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1122.256,687.0065,196.235,0,0,0,100,0),
(@PATH,2,1133.015,698.6454,196.235,0,0,0,100,0),
(@PATH,3,1148.657,706.8157,196.2355,0,0,0,100,0),
(@PATH,4,1161.399,706.7985,196.2357,0,0,0,100,0),
(@PATH,5,1177.772,696.8011,196.2348,0,0,0,100,0),
(@PATH,6,1186.349,682.7001,196.235,0,0,0,100,0),
(@PATH,7,1177.772,696.8011,196.2348,0,0,0,100,0),
(@PATH,8,1161.399,706.7985,196.2357,0,0,0,100,0),
(@PATH,9,1148.657,706.8157,196.2355,0,0,0,100,0),
(@PATH,10,1133.015,698.6454,196.235,0,0,0,100,0),
(@PATH,11,1122.256,687.0065,196.235,0,0,0,100,0),
(@PATH,12,1124.234,666.6528,196.235,0,0,0,100,0);

-- Pathing for Lightning Construct Entry: 27972
SET @NPC := 126746;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=972.5233,`position_y`=420.2028,`position_z`=205.9943 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,980.9671,415.2457,205.9943,0,0,0,100,0),
(@PATH,2,972.5233,420.2028,205.9943,0,0,0,100,0),
(@PATH,3,961.5862,421.183,205.9943,0,0,0,100,0),
(@PATH,4,952.4949,416.0938,205.9943,0,0,0,100,0),
(@PATH,5,961.5389,421.1565,205.9943,0,0,0,100,0),
(@PATH,6,972.5233,420.2028,205.9943,0,0,0,100,0);

-- Pathing for Lightning Construct Entry: 27972
SET @NPC := 126750;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=967.9682,`position_y`=381.0118,`position_z`=205.9943 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,954.208,382.8831,205.9943,0,0,0,100,0),
(@PATH,2,944.4269,394.0551,205.9943,0,0,0,100,0),
(@PATH,3,946.6729,409.3246,205.9943,0,0,0,100,0),
(@PATH,4,944.4262,394.0558,205.9943,0,0,0,100,0),
(@PATH,5,954.208,382.8831,205.9943,0,0,0,100,0),
(@PATH,6,967.9682,381.0118,205.9943,0,0,0,100,0);

-- Pathing for Lightning Construct Entry: 27972
SET @NPC := 126749;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=983.2661,`position_y`=390.105,`position_z`=205.9943 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,986.5608,402.9213,205.9943,0,0,0,100,0),
(@PATH,2,983.0714,412.1025,205.9943,0,0,0,100,0),
(@PATH,3,986.5522,402.9439,205.9943,0,0,0,100,0),
(@PATH,4,983.2661,390.105,205.9943,0,0,0,100,0),
(@PATH,5,974.4719,382.4703,205.9943,0,0,0,100,0),
(@PATH,6,983.2661,390.105,205.9943,0,0,0,100,0);

-- Pathing for Crystalline Shardling Entry: 27973
SET @NPC := 126787;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=938.4828,`position_y`=813.7618,`position_z`=189.9927 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,942.4637,814.6254,189.3832,0,0,0,100,0),
(@PATH,2,945.379,815.2579,188.9368,0,0,0,100,0),
(@PATH,3,948.2987,815.8914,188.4898,0,0,0,100,0),
(@PATH,4,951.2225,816.5258,188.1479,0,0,0,100,0),
(@PATH,5,954.1625,817.1636,188.069,0,0,0,100,0),
(@PATH,6,957.1072,817.8024,187.99,0,0,0,100,0),
(@PATH,7,960.6969,819.7251,187.7678,0,0,0,100,0),
(@PATH,8,965.7293,823.0229,187.4797,0,0,0,100,0),
(@PATH,9,968.2454,824.6718,187.3356,0,0,0,100,0),
(@PATH,10,970.7648,826.3227,187.1914,0,0,0,100,0),
(@PATH,11,973.4231,828.2544,187.06,0,0,0,100,0),
(@PATH,12,975.7665,830.1284,186.9356,0,0,0,100,0),
(@PATH,13,978.1152,832.0066,186.8109,0,0,0,100,0),
(@PATH,14,980.4257,833.8543,186.6883,0,0,0,100,0),
(@PATH,15,977.209,831.2819,186.8591,0,0,0,100,0),
(@PATH,16,974.8596,829.4031,186.9837,0,0,0,100,0),
(@PATH,17,972.5027,827.5184,187.1088,0,0,0,100,0),
(@PATH,18,969.7669,825.6686,187.2486,0,0,0,100,0),
(@PATH,19,967.2497,824.0191,187.3926,0,0,0,100,0),
(@PATH,20,964.7295,822.3676,187.5369,0,0,0,100,0),
(@PATH,21,962.2039,820.7126,187.6815,0,0,0,100,0),
(@PATH,22,959.684,819.0614,187.8257,0,0,0,100,0),
(@PATH,23,955.9277,817.5466,188.0217,0,0,0,100,0),
(@PATH,24,952.986,816.9084,188.1006,0,0,0,100,0),
(@PATH,25,950.0452,816.2703,188.2224,0,0,0,100,0),
(@PATH,26,947.1313,815.6381,188.6686,0,0,0,100,0),
(@PATH,27,941.3091,814.3749,189.56,0,0,0,100,0),
(@PATH,28,938.4828,813.7618,189.9927,0,0,0,100,0);

-- Pathing for Crystalline Shardling Entry: 27973
SET @NPC := 126788;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=937.2088,`position_y`=819.625,`position_z`=189.5746 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,941.1921,820.4892,188.9586,0,0,0,100,0),
(@PATH,2,944.1083,821.1219,188.5076,0,0,0,100,0),
(@PATH,3,947.0261,821.7549,188.0563,0,0,0,100,0),
(@PATH,4,949.9498,822.3893,187.7245,0,0,0,100,0),
(@PATH,5,952.8904,823.0272,187.5842,0,0,0,100,0),
(@PATH,6,955.8341,823.6659,187.4437,0,0,0,100,0),
(@PATH,7,957.4083,824.7435,187.3226,0,0,0,100,0),
(@PATH,8,962.4407,828.0413,186.9908,0,0,0,100,0),
(@PATH,9,964.958,829.6909,186.8311,0,0,0,100,0),
(@PATH,10,967.4774,831.3419,186.6792,0,0,0,100,0),
(@PATH,11,969.6763,832.9407,186.5558,0,0,0,100,0),
(@PATH,12,972.0192,834.8143,186.4057,0,0,0,100,0),
(@PATH,13,974.3668,836.6917,186.2552,0,0,0,100,0),
(@PATH,14,976.6784,838.5402,186.1071,0,0,0,100,0),
(@PATH,15,973.4617,835.9678,186.3132,0,0,0,100,0),
(@PATH,16,971.1112,834.0882,186.4638,0,0,0,100,0),
(@PATH,17,968.7542,832.2033,186.6149,0,0,0,100,0),
(@PATH,18,966.4784,830.6872,186.7346,0,0,0,100,0),
(@PATH,19,963.961,829.0375,186.8943,0,0,0,100,0),
(@PATH,20,961.4396,827.3853,187.0543,0,0,0,100,0),
(@PATH,21,958.9153,825.7311,187.2144,0,0,0,100,0),
(@PATH,22,956.396,824.0802,187.3987,0,0,0,100,0),
(@PATH,23,954.6556,823.4102,187.5,0,0,0,100,0),
(@PATH,24,951.9318,822.8305,187.6292,0,0,0,100,0),
(@PATH,25,948.8242,822.1456,187.7782,0,0,0,100,0),
(@PATH,26,945.8588,821.5016,188.2368,0,0,0,100,0),
(@PATH,27,940.0389,820.239,189.1369,0,0,0,100,0),
(@PATH,28,937.2088,819.625,189.5746,0,0,0,100,0);

-- ========================
--  2011_05_18_06_world_waypoints.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Drak'Tharon Keep

-- Pathing for Drakkari Guardian Entry: 26620
SET @NPC := 127582;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-342.092,`position_y`=-597.7366,`position_z`=72.60764 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-348.2738,-595.0352,72.60789,0,0,0,100,0),
(@PATH,2,-351.4645,-591.2532,72.60825,0,0,0,100,0),
(@PATH,3,-348.2738,-595.0352,72.60789,0,0,0,100,0),
(@PATH,4,-342.092,-597.7366,72.60764,0,0,0,100,0),
(@PATH,5,-337.3541,-596.457,72.60776,0,0,0,100,0),
(@PATH,6,-332.8021,-593.3668,72.60805,0,0,0,100,0),
(@PATH,7,-330.1274,-590.215,72.60835,0,0,0,100,0),
(@PATH,8,-332.8021,-593.3668,72.60805,0,0,0,100,0),
(@PATH,9,-337.3541,-596.457,72.60776,0,0,0,100,0),
(@PATH,10,-342.092,-597.7366,72.60764,0,0,0,100,0);

-- Remove Drakkari Guardian overspawn
DELETE FROM `creature` WHERE `guid` IN (127581);
DELETE FROM `creature_addon` WHERE `guid` IN (127581);

-- Pathing for Drakkari Bat Entry: 26622
SET @NPC := 127614;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-392.2272,`position_y`=-677.325,`position_z`=26.64196 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-386.9386,-680.3297,28.5735,0,0,0,100,0),
(@PATH,2,-381.2936,-675.7957,28.5735,0,0,0,100,0),
(@PATH,3,-378.735,-666.9066,28.57349,0,0,0,100,0),
(@PATH,4,-386.3628,-662.0511,28.57349,0,0,0,100,0),
(@PATH,5,-392.4187,-664.8582,26.64148,0,0,0,100,0),
(@PATH,6,-395.6666,-671.3341,26.64142,0,0,0,100,0),
(@PATH,7,-392.2272,-677.325,26.64196,0,0,0,100,0);

-- Pathing for Drakkari Bat Entry: 26622
SET @NPC := 127613;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-420.6025,`position_y`=-665.9139,`position_z`=27.26924 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-409.9266,-669.2863,26.64212,0,0,0,100,0),
(@PATH,2,-404.8366,-663.6207,26.64172,0,0,0,100,0),
(@PATH,3,-404.446,-655.531,26.64191,0,0,0,100,0),
(@PATH,4,-411.499,-652.1765,28.57349,0,0,0,100,0),
(@PATH,5,-416.9508,-653.751,28.5738,0,0,0,100,0),
(@PATH,6,-421.7345,-661.5891,28.57359,0,0,0,100,0),
(@PATH,7,-420.6025,-665.9139,27.26924,0,0,0,100,0);

-- Pathing for Drakkari Bat Entry: 26622
SET @NPC := 127615;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-416.4136,`position_y`=-662.1977,`position_z`=26.64302 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-423.1144,-663.6149,28.57369,0,0,0,100,0),
(@PATH,2,-428.976,-668.0037,28.5738,0,0,0,100,0),
(@PATH,3,-428.1159,-675.8496,28.5735,0,0,0,100,0),
(@PATH,4,-420.3534,-679.633,27.94913,0,0,0,100,0),
(@PATH,5,-412.9664,-675.6168,26.64376,0,0,0,100,0),
(@PATH,6,-412.3599,-668.2842,26.64241,0,0,0,100,0),
(@PATH,7,-416.4136,-662.1977,26.64302,0,0,0,100,0);

-- Pathing for Drakkari Bat Entry: 26622
SET @NPC := 127612;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-406.5539,`position_y`=-695.0261,`position_z`=28.57405 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-399.3579,-694.1252,28.5735,0,0,0,100,0),
(@PATH,2,-392.8559,-687.9329,28.57349,0,0,0,100,0),
(@PATH,3,-395.3493,-679.3206,26.64168,0,0,0,100,0),
(@PATH,4,-404.5995,-676.0878,26.63831,0,0,0,100,0),
(@PATH,5,-411.1477,-682.6027,26.64155,0,0,0,100,0),
(@PATH,6,-410.6699,-690.0704,28.57438,0,0,0,100,0),
(@PATH,7,-406.5539,-695.0261,28.57405,0,0,0,100,0);

-- Pathing for Scourge Reanimator Entry: 26626
SET @NPC := 127412;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-410.9426,`position_y`=-603.3857,`position_z`=1.024866 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-404.537,-602.8129,1.024867,0,0,0,100,0),
(@PATH,2,-398.1429,-604.8417,1.02487,0,0,0,100,0),
(@PATH,3,-404.537,-602.8129,1.024867,0,0,0,100,0),
(@PATH,4,-410.9426,-603.3857,1.024866,0,0,0,100,0),
(@PATH,5,-416.6559,-600.7515,1.024868,0,0,0,100,0),
(@PATH,6,-424.4983,-599.7261,1.024869,0,0,0,100,0),
(@PATH,7,-416.6559,-600.7515,1.024868,0,0,0,100,0),
(@PATH,8,-410.9426,-603.3857,1.024866,0,0,0,100,0);

-- Pathing for Scourge Reanimator Entry: 26626
SET @NPC := 127411;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-494.1194,`position_y`=-603.9778,`position_z`=2.072221 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-486.8281,-601.2296,1.144565,0,0,0,100,0),
(@PATH,2,-481.1871,-599.9684,1.024871,0,0,0,100,0),
(@PATH,3,-475.4717,-602.4325,1.820062,0,0,0,100,0),
(@PATH,4,-469.6367,-604.8362,1.044375,0,0,0,100,0),
(@PATH,5,-462.5545,-605.178,1.018675,0,0,0,100,0),
(@PATH,6,-469.5573,-604.8443,1.042719,0,0,0,100,0),
(@PATH,7,-475.4717,-602.4325,1.820062,0,0,0,100,0),
(@PATH,8,-481.1871,-599.9684,1.024871,0,0,0,100,0),
(@PATH,9,-486.8281,-601.2296,1.144565,0,0,0,100,0),
(@PATH,10,-494.1194,-603.9778,2.072221,0,0,0,100,0);

-- Remove Scourge Reanimator overspawn
DELETE FROM `creature` WHERE `guid` IN (127450);
DELETE FROM `creature_addon` WHERE `guid` IN (127450);

-- Pathing for Drakkari Gutripper Entry: 26641
SET @NPC := 127456;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-483.0405,`position_y`=-649.0012,`position_z`=28.58858 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-486.0568,-648.8849,28.58832,0,0,0,100,0),
(@PATH,2,-483.0405,-649.0012,28.58858,0,0,0,100,0),
(@PATH,3,-480.0255,-649.1176,28.58883,0,0,0,100,0),
(@PATH,4,-477.0105,-649.2339,28.58909,0,0,0,100,0),
(@PATH,5,-474.0007,-649.3502,28.59028,0,0,0,100,0),
(@PATH,6,-470.9918,-649.4663,28.59031,0,0,0,100,0),
(@PATH,7,-467.9779,-649.5826,28.59035,0,0,0,100,0),
(@PATH,8,-464.9656,-649.6989,28.55288,0,0,0,100,0),
(@PATH,9,-461.9586,-649.815,28.50968,0,0,0,100,0),
(@PATH,10,-460.1104,-649.8864,28.4215,0,0,0,100,0),
(@PATH,11,-464.2306,-649.7274,28.54232,0,0,0,100,0),
(@PATH,12,-467.2433,-649.611,28.59036,0,0,0,100,0),
(@PATH,13,-470.2549,-649.4948,28.59032,0,0,0,100,0),
(@PATH,14,-473.2637,-649.3786,28.59029,0,0,0,100,0),
(@PATH,15,-476.2737,-649.2624,28.58915,0,0,0,100,0),
(@PATH,16,-479.2837,-649.1462,28.5889,0,0,0,100,0),
(@PATH,17,-483.0405,-649.0012,28.58858,0,0,0,100,0);

-- Pathing for Drakkari Gutripper Entry: 26641
SET @NPC := 127457;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-483.2729,`position_y`=-654.9966,`position_z`=28.59017 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-486.2876,-654.8802,28.58992,0,0,0,100,0),
(@PATH,2,-483.2729,-654.9966,28.59017,0,0,0,100,0),
(@PATH,3,-480.2569,-655.113,28.59199,0,0,0,100,0),
(@PATH,4,-477.2439,-655.2294,28.59203,0,0,0,100,0),
(@PATH,5,-474.2319,-655.3456,28.59206,0,0,0,100,0),
(@PATH,6,-471.2233,-655.4618,28.5921,0,0,0,100,0),
(@PATH,7,-468.2094,-655.5781,28.59213,0,0,0,100,0),
(@PATH,8,-465.1971,-655.6944,28.55799,0,0,0,100,0),
(@PATH,9,-462.19,-655.8105,28.51479,0,0,0,100,0),
(@PATH,10,-460.3419,-655.8818,28.48824,0,0,0,100,0),
(@PATH,11,-464.463,-655.7228,28.54745,0,0,0,100,0),
(@PATH,12,-467.4753,-655.6064,28.59214,0,0,0,100,0),
(@PATH,13,-470.4877,-655.4902,28.59211,0,0,0,100,0),
(@PATH,14,-473.4938,-655.3741,28.59207,0,0,0,100,0),
(@PATH,15,-476.5032,-655.2579,28.59204,0,0,0,100,0),
(@PATH,16,-479.5138,-655.1417,28.592,0,0,0,100,0),
(@PATH,17,-483.2729,-654.9966,28.59017,0,0,0,100,0);

-- Pathing for Darkweb Hatchling Entry: 26674
SET @NPC := 127472;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-283.7295,`position_y`=-731.8323,`position_z`=27.29189 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-270.1169,-730.9915,27.30806,0,0,0,100,0),
(@PATH,2,-266.1129,-727.931,27.30861,0,0,0,100,0),
(@PATH,3,-265.3598,-715.4077,27.29189,0,0,0,100,0),
(@PATH,4,-274.9025,-707.4509,27.29512,0,0,0,100,0),
(@PATH,5,-282.5379,-706.8624,27.29189,0,0,0,100,0),
(@PATH,6,-287.1734,-717.2089,27.72341,0,0,0,100,0),
(@PATH,7,-290.9054,-722.8333,27.29189,0,0,0,100,0),
(@PATH,8,-283.7295,-731.8323,27.29189,0,0,0,100,0);

-- Pathing for Darkweb Hatchling Entry: 26674
SET @NPC := 127473;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-286.7308,`position_y`=-721.9674,`position_z`=27.29189 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-288.534,-727.5106,27.29189,0,0,0,100,0),
(@PATH,2,-280.5279,-726.8649,27.29189,0,0,0,100,0),
(@PATH,3,-270.6854,-727.6488,27.29941,0,0,0,100,0),
(@PATH,4,-270.441,-721.2595,27.29189,0,0,0,100,0),
(@PATH,5,-270.4362,-712.4268,27.29189,0,0,0,100,0),
(@PATH,6,-278.0521,-710.217,27.29605,0,0,0,100,0),
(@PATH,7,-285.8037,-712.8212,27.29603,0,0,0,100,0),
(@PATH,8,-286.7308,-721.9674,27.29189,0,0,0,100,0);

-- Pathing for Darkweb Hatchling Entry: 26674
SET @NPC := 127474;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-249.4208,`position_y`=-717.0651,`position_z`=27.61007 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-259.6944,-717.1452,26.8645,0,0,0,100,0),
(@PATH,2,-265.6481,-718.8099,27.29189,0,0,0,100,0),
(@PATH,3,-264.446,-725.0237,27.30534,0,0,0,100,0),
(@PATH,4,-256.6581,-724.9134,27.43577,0,0,0,100,0),
(@PATH,5,-246.0695,-725.6784,27.36535,0,0,0,100,0),
(@PATH,6,-245.0813,-719.5449,27.53182,0,0,0,100,0),
(@PATH,7,-249.4208,-717.0651,27.61007,0,0,0,100,0);

-- Pathing for Darkweb Hatchling Entry: 26674
SET @NPC := 127475;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-242.1334,`position_y`=-720.1142,`position_z`=27.43355 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-250.4899,-714.759,27.3011,0,0,0,100,0),
(@PATH,2,-266.1705,-713.7017,27.06336,0,0,0,100,0),
(@PATH,3,-270.4176,-721.0847,27.29189,0,0,0,100,0),
(@PATH,4,-266.1248,-728.0099,27.30877,0,0,0,100,0),
(@PATH,5,-253.1003,-728.3563,27.41331,0,0,0,100,0),
(@PATH,6,-244.1609,-728.7698,27.33719,0,0,0,100,0),
(@PATH,7,-242.1334,-720.1142,27.43355,0,0,0,100,0);

-- Pathing for Risen Drakkari Death Knight Entry: 26830
SET @NPC := 127553;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-390.7345,`position_y`=-608.2701,`position_z`=72.60735 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-402.9046,-608.7485,72.6084,0,0,0,100,0),
(@PATH,2,-414.1785,-608.5219,72.60596,0,0,0,100,0),
(@PATH,3,-423.621,-608.1632,72.60622,0,0,0,100,0),
(@PATH,4,-414.1785,-608.5219,72.60596,0,0,0,100,0),
(@PATH,5,-402.9046,-608.7485,72.6084,0,0,0,100,0),
(@PATH,6,-390.7345,-608.2701,72.60735,0,0,0,100,0);

-- Pathing for Risen Drakkari Death Knight Entry: 26830
SET @NPC := 127552;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-282.7542,`position_y`=-699.7166,`position_z`=101.747 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-280.2459,-720.9793,101.7811,0,0,0,100,0),
(@PATH,2,-279.8599,-737.6229,101.7784,0,0,0,100,0),
(@PATH,3,-280.2459,-720.9793,101.7811,0,0,0,100,0),
(@PATH,4,-282.7542,-699.7166,101.747,0,0,0,100,0);

-- Pathing for Drakkari Commander Entry: 27431
SET @NPC := 127471;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-346.2241,`position_y`=-610.9034,`position_z`=72.60129 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-373.7004,-609.6317,72.61194,0,0,0,100,0),
(@PATH,2,-346.2241,-610.9034,72.60129,0,0,0,100,0);

-- Pathing for Cosmetic Drakkari Bat [PH] Entry: 27490
SET @NPC := 127508;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-407.2545,`position_y`=-677.0726,`position_z`=70.22565 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-413.0328,-671.7674,70.14231,0,0,0,100,0),
(@PATH,2,-413.0139,-668.8679,69.94788,0,0,0,100,0),
(@PATH,3,-407.86,-662.8748,70.08675,0,0,0,100,0),
(@PATH,4,-401.7282,-667.11,70.11458,0,0,0,100,0),
(@PATH,5,-401.2929,-673.1425,69.97565,0,0,0,100,0),
(@PATH,6,-407.2545,-677.0726,70.22565,0,0,0,100,0);

-- Pathing for Cosmetic Drakkari Bat [PH] Entry: 27490
SET @NPC := 127509;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-409.4158,`position_y`=-663.9135,`position_z`=62.39258 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-413.1464,-668.7359,61.44815,0,0,0,100,0),
(@PATH,2,-412.7488,-672.1281,61.80927,0,0,0,100,0),
(@PATH,3,-409.5626,-677.9425,62.44814,0,0,0,100,0),
(@PATH,4,-403.616,-679.6837,62.55925,0,0,0,100,0),
(@PATH,5,-398.3275,-677.5518,62.67037,0,0,0,100,0),
(@PATH,6,-396.8555,-671.9451,62.05924,0,0,0,100,0),
(@PATH,7,-398.5243,-664.6963,62.3092,0,0,0,100,0),
(@PATH,8,-404.1799,-662.1304,62.58703,0,0,0,100,0),
(@PATH,9,-409.4158,-663.9135,62.39258,0,0,0,100,0);

-- Pathing for Cosmetic Drakkari Bat [PH] Entry: 27490
SET @NPC := 127510;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-406.932,`position_y`=-676.9556,`position_z`=66.53109 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-411.784,-673.2886,64.19775,0,0,0,100,0),
(@PATH,2,-411.4865,-667.8989,63.86424,0,0,0,100,0),
(@PATH,3,-406.9132,-663.992,65.44756,0,0,0,100,0),
(@PATH,4,-401.3338,-665.2374,64.8922,0,0,0,100,0),
(@PATH,5,-398.546,-669.8902,65.44775,0,0,0,100,0),
(@PATH,6,-400.9965,-675.5491,66.19775,0,0,0,100,0),
(@PATH,7,-406.932,-676.9556,66.53109,0,0,0,100,0);

-- Pathing for Cosmetic Drakkari Bat [PH] Entry: 27490
SET @NPC := 127511;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-410.8573,`position_y`=-673.0195,`position_z`=72.72581 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-405.1031,-679.6655,71.92022,0,0,0,100,0),
(@PATH,2,-398.3365,-677.8955,72.69765,0,0,0,100,0),
(@PATH,3,-396.0217,-670.7278,72.72577,0,0,0,100,0),
(@PATH,4,-401.3752,-666.0843,71.7813,0,0,0,100,0),
(@PATH,5,-409.0014,-667.2194,71.83688,0,0,0,100,0),
(@PATH,6,-410.8573,-673.0195,72.72581,0,0,0,100,0);

-- Pathing for Cosmetic Drakkari Bat [PH] Entry: 27490
SET @NPC := 127512;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-409.2986,`position_y`=-663.4329,`position_z`=58.00312 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-411.9643,-668.5157,58.22538,0,0,0,100,0),
(@PATH,2,-411.5511,-675.1073,57.94757,0,0,0,100,0),
(@PATH,3,-406.8594,-679.2547,57.08646,0,0,0,100,0),
(@PATH,4,-401.6542,-679.5847,58.64199,0,0,0,100,0),
(@PATH,5,-396.0136,-673.5827,59.4198,0,0,0,100,0),
(@PATH,6,-396.2527,-666.631,57.83645,0,0,0,100,0),
(@PATH,7,-400.8469,-661.2967,59.25313,0,0,0,100,0),
(@PATH,8,-409.2986,-663.4329,58.00312,0,0,0,100,0);

-- Pathing for Cosmetic Drakkari Bat [PH] Entry: 27490
SET @NPC := 127513;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-412.7229,`position_y`=-650.8453,`position_z`=38.51792 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-405.5179,-645.0265,36.32347,0,0,0,100,0),
(@PATH,2,-397.6033,-648.0791,36.9068,0,0,0,100,0),
(@PATH,3,-394.8318,-652.9764,38.29573,0,0,0,100,0),
(@PATH,4,-395.8389,-657.9083,37.74015,0,0,0,100,0),
(@PATH,5,-401.2168,-663.5585,39.9346,0,0,0,100,0),
(@PATH,6,-407.9547,-663.297,41.68458,0,0,0,100,0),
(@PATH,7,-413.9172,-658.0521,38.18459,0,0,0,100,0),
(@PATH,8,-412.7229,-650.8453,38.51792,0,0,0,100,0);

-- Remove Cosmetic Drakkari Bat [PH] overspawns
DELETE FROM `creature` WHERE `guid` IN (127514,127515,127516);
DELETE FROM `creature_addon` WHERE `guid` IN (127514,127515,127516);
-- Fix Inhabittype for Cosmetic Drakkari Bat [PH] "No one fixes even the simple shit!"
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=27490;

-- Pathing for Risen Drakkari Handler Entry: 26637
SET @NPC := 127444;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-490.2928,`position_y`=-651.7234,`position_z`=28.58877 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,6469, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-460.2261,-652.8841,28.48568,0,0,0,100,0),
(@PATH,2,-490.2928,-651.7234,28.58877,0,0,0,100,0);

-- ========================
--  2011_05_18_07_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Quest 12291 "The Forgotten Tale"
-- SAI for Forgotten Knight, Forgotten Rifleman, Forgotten Peasant, Forgotten Footman, Orik, & Forgotten Soul
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` IN (27224,27225,27226,27229,27220,27347,27465);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (27224,27225,27226,27229,27220,27347,27465);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (27224,27225,27226,27229,27220,27347,27465);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Forgotten Knight
(27224,0,0,1,62,0,100,0,9544,0,0,0,11,48831,3,0,0,0,0,7,0,0,0,0,0,0,0, 'Forgotten Knight - On gossip option select quest credit'),
(27224,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Forgotten Knight - Close Gossip'),
(27224,0,2,0,23,0,100,0,48143,0,0,0,11,48143,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Knight - Add Forgotten Aura if missing'),
(27224,0,3,4,4,0,100,0,0,0,0,0,11,38556,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Knight - Cast Throw on Aggro'),
(27224,0,4,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Knight - Set Phase 1 on Aggro'),
(27224,0,5,6,0,1,100,0,5,35,2300,3900,11,38556,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Knight - Cast Throw (Phase 1)'),
(27224,0,6,0,61,1,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Knight - Set Ranged Weapon Model (Phase 1)'),
(27224,0,7,8,9,1,100,0,25,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Knight - Start Combat Movement at 25 Yards (Phase 1)'),
(27224,0,8,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Knight - Start Melee at 25 Yards (Phase 1)'),
(27224,0,9,10,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Knight - Start Combat Movement Below 5 Yards (Phase 1)'),
(27224,0,10,11,61,1,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Knight - Set Ranged Weapon Model Below 5 Yards (Phase 1)'),
(27224,0,11,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Knight - Start Melee Below 5 Yards (Phase 1)'),
(27224,0,12,13,9,1,100,0,5,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Knight - Prevent Combat Movement at 15 Yards (Phase 1)'),
(27224,0,13,0,61,1,100,0,0,0,0,0,20,0,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Knight - Prevent Melee at 15 Yards (Phase 1)'),
(27224,0,14,0,7,0,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Knight - Set Melee Weapon Model on Evade'),
-- Forgotten Rifleman
(27225,0,0,1,62,0,100,0,9543,0,0,0,11,48830,3,0,0,0,0,7,0,0,0,0,0,0,0, 'Forgotten Rifleman - On gossip option select quest credit'), 
(27225,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Forgotten Rifleman - Close Gossip'), 
(27225,0,2,3,11,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Prevent Combat Movement on Spawn'),
(27225,0,3,0,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Prevent Melee on Spawn'),
(27225,0,4,0,23,0,100,0,48143,0,0,0,11,48143,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Add Forgotten Aura if missing'),
(27225,0,5,6,4,0,100,0,0,0,0,0,11,15547,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Rifleman - Cast Shoot on Aggro'),
(27225,0,6,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Set Phase 1 on Aggro'),
(27225,0,7,8,0,1,100,0,5,30,2300,3900,11,15547,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Rifleman - Cast Shoot (Phase 1)'),
(27225,0,8,0,61,1,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Set Ranged Weapon Model (Phase 1)'),
(27225,0,9,0,0,1,100,0,9000,12000,9000,14000,11,17174,1,1,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Rifleman - Cast Concussive Shot (Phase 1)'),
(27225,0,10,11,9,1,100,0,25,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Start Combat Movement at 25 Yards (Phase 1)'),
(27225,0,11,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Rifleman - Start Melee at 25 Yards (Phase 1)'),
(27225,0,12,13,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Start Combat Movement Below 5 Yards (Phase 1)'),
(27225,0,13,14,61,1,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Set Ranged Weapon Model Below 5 Yards (Phase 1)'),
(27225,0,14,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Rifleman - Start Melee Below 5 Yards (Phase 1)'),
(27225,0,15,16,9,1,100,0,5,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Prevent Combat Movement at 15 Yards (Phase 1)'),
(27225,0,16,0,61,1,100,0,0,0,0,0,20,0,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Rifleman - Prevent Melee at 15 Yards (Phase 1)'),
(27225,0,17,0,2,1,100,0,0,15,0,0,23,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Set Phase 2 at 15% HP'),
(27225,0,18,19,2,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Start Combat Movement at 15% HP (Phase 2)'),
(27225,0,19,20,61,2,100,0,0,0,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Flee at 15% HP (Phase 2)'),
(27225,0,20,21,61,2,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - Say text0 at 15% HP (Phase 2)'),
(27225,0,21,0,61,2,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Rifleman - set phase 1 at 15% HP (Phase 2)'),
(27225,0,22,0,7,0,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Knight - Set Melee Weapon Model on Evade'),                              
-- Forgotten Peasant
(27226,0,0,1,62,0,100,0,9541,0,0,0,11,48829,3,0,0,0,0,7,0,0,0,0,0,0,0, 'Forgotten Peasant - On gossip option select quest credit'),
(27226,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Forgotten Peasant - Close Gossip'),
(27226,0,2,0,23,0,100,0,48143,0,0,0,11,48143,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Peasant - Add Forgotten Aura if missing'),
(27226,0,3,0,0,0,100,0,0,5,7000,10000,11,51601,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Peasant - Cast Bonk'),
-- Forgotten Footman
(27229,0,0,1,62,0,100,0,9545,0,0,0,11,48832,3,0,0,0,0,7,0,0,0,0,0,0,0, 'Forgotten Footman - On gossip option select quest credit'),
(27229,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Forgotten Footman - Close Gossip'),
(27229,0,2,0,23,0,100,0,48143,0,0,0,11,48143,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Footman - Add Forgotten Aura if missing'),
(27229,0,3,0,0,0,100,0,3000,7000,9000,12000,11,32587,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Forgotten Footman - Cast Shield Block'),
-- Forgotten Captain
(27220,0,0,0,23,0,100,0,48143,0,0,0,11,48143,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Captain - Add Forgotten Aura if missing'),
(27220,0,1,0,0,0,100,0,6000,9000,8000,12000,11,51591,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Forgotten Captain - Cast Stormhammer'),
-- Orik
(27347,0,0,1,62,0,100,0,9542,0,0,0,11,48828,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Orik - On gossip option select create Murkweed Elixir'),
(27347,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Orik - Close Gossip'),
-- Forgotten Soul
(27465,0,0,0,11,0,100,0,0,0,0,0,11,29266,3,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Soul - On aura self');

-- Assign Gossip_id's to creatures
UPDATE `creature_template` SET `gossip_menu_id`=9544 WHERE `entry`=27224; -- Forgotten Knight
UPDATE `creature_template` SET `gossip_menu_id`=9543 WHERE `entry`=27225; -- Forgotten Rifleman
UPDATE `creature_template` SET `gossip_menu_id`=9541 WHERE `entry`=27226; -- Forgotten Peasant
UPDATE `creature_template` SET `gossip_menu_id`=9545 WHERE `entry`=27229; -- Forgotten Footman
UPDATE `creature_template` SET `gossip_menu_id`=9542 WHERE `entry`=27347; -- Orik
-- Add gossip menu items
DELETE FROM `gossip_menu` WHERE `entry`=9544  AND `text_id`=12859;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9544,12859);
DELETE FROM `gossip_menu` WHERE `entry`=9543  AND `text_id`=12858;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9543,12858);
DELETE FROM `gossip_menu` WHERE `entry`=9541  AND `text_id`=12856;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9541,12856);
DELETE FROM `gossip_menu` WHERE `entry`=9545  AND `text_id`=12860;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9545,12860);
DELETE FROM `gossip_menu` WHERE `entry`=9542  AND `text_id`=12857;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9542,12857);

-- Gossip Options
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9544,9543,9541,9545,9542);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9544,0,0,'I must be going now, soldier. Stay vigilant!',1,1,0,0,0,0,0,''), -- Forgotten Knight
(9543,0,0,'I''m sure Arthas will be back any day now, soldier. Keep your chin up!',1,1,0,0,0,0,0,''), -- Forgotten Rifleman
(9541,0,0,'Sorry to have bothered you, friend. Carry on!',1,1,0,0,0,0,0,''), -- Forgotten Peasant
(9545,0,0,'I''m sure everything will work out, footman.',1,1,0,0,0,0,0,''), -- Forgotten Footman
(9542,0,0,'Orik, I need another Murkweed Elixir.',1,1,0,0,0,0,0,''); -- Orik

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (9544,9543,9541,9545,9542);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,9544,0,0,9,12291,0,0,0,'','Show gossip option 0 if player has Quest 12291 "The Forgotten Tale"'),
(15,9543,0,0,9,12291,0,0,0,'','Show gossip option 0 if player has Quest 12291 "The Forgotten Tale"'),
(15,9541,0,0,9,12291,0,0,0,'','Show gossip option 0 if player has Quest 12291 "The Forgotten Tale"'),
(15,9545,0,0,9,12291,0,0,0,'','Show gossip option 0 if player has Quest 12291 "The Forgotten Tale"'),
(15,9542,0,0,9,12291,0,0,0,'','Show gossip option 0 if player has Quest 12291 "The Forgotten Tale"');

-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry` IN (27225);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(27225,0,0, '%s attempts to run away in fear!',2,0,100,0,0,0, 'Forgotten Rifleman');

-- Add spell linking
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (48810,-48809,48143,-48143);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(48810,48809,0,'Cast Binding Life when cast Death''s Door'),
(-48809,-48143,0,'Removing Binding Life removes Forgotten Aura'),
(48143,48357,0,'Aura Wintergarde Invisibility Type B when aura Forgotten Aura'),
(-48143,-48357,0,'Removing Binding Forgotten Aura removes Aura Wintergarde Invisibility Type B');

-- Add See Wintergarde Invisibility Type B Spell to areas in Dragonblight
DELETE FROM `spell_area` WHERE `spell`=48358;
INSERT INTO `spell_area` (`spell`,`area`,`racemask`,`gender`,`autocast`) VALUES
(48358,4151,0,2,1),(48358,4152,0,2,1),(48358,4153,0,2,1),(48358,4154,0,2,1),
(48358,4155,0,2,1),(48358,4156,0,2,1),(48358,4157,0,2,1),(48358,4158,0,2,1),
(48358,4160,0,2,1),(48358,4161,0,2,1),(48358,4162,0,2,1),(48358,4163,0,2,1),
(48358,4164,0,2,1),(48358,4165,0,2,1),(48358,4166,0,2,1),(48358,4167,0,2,1),
(48358,4168,0,2,1),(48358,4169,0,2,1),(48358,4170,0,2,1),(48358,4171,0,2,1),
(48358,4172,0,2,1),(48358,4173,0,2,1),(48358,4174,0,2,1),(48358,4175,0,2,1),
(48358,4176,0,2,1),(48358,4177,0,2,1),(48358,4178,0,2,1),(48358,4179,0,2,1),
(48358,4180,0,2,1),(48358,4181,0,2,1),(48358,4182,0,2,1),(48358,4183,0,2,1),
(48358,4184,0,2,1),(48358,4185,0,2,1),(48358,4186,0,2,1),(48358,4187,0,2,1),
(48358,4188,0,2,1),(48358,4189,0,2,1),(48358,4190,0,2,1),(48358,4191,0,2,1),
(48358,4192,0,2,1),(48358,4193,0,2,1),(48358,4194,0,2,1),(48358,4195,0,2,1),
(48358,4198,0,2,1),(48358,4123,0,2,1),(48358,4124,0,2,1),(48358,4125,0,2,1),
(48358,4127,0,2,1),(48358,4130,0,2,1),(48358,4132,0,2,1),(48358,4133,0,2,1),
(48358,4134,0,2,1),(48358,4141,0,2,1),(48358,4143,0,2,1),(48358,4146,0,2,1),
(48358,4396,0,2,1),(48358,4414,0,2,1),(48358,4478,0,2,1);

-- ========================
--  2011_05_18_08_world_waypoints.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Pathing for Huntress Kima Entry: 18416
SET @NPC := 65808;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2541.65,`position_y`=7323.38,`position_z`=6.99469 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2552.386,7337.846,7.422175,0,0,0,100,0),
(@PATH,2,-2547.391,7352.353,7.047175,0,0,0,100,0),
(@PATH,3,-2544.842,7358.259,7.047175,0,0,0,100,0),
(@PATH,4,-2562.099,7370.443,10.00821,0,0,0,100,0),
(@PATH,5,-2567.579,7369.372,10.27306,0,0,0,100,0),
(@PATH,6,-2566.174,7349.837,9.922175,0,0,0,100,0),
(@PATH,7,-2567.789,7341.593,9.872525,0,0,0,100,0),
(@PATH,8,-2577.995,7329.614,12.45477,0,0,0,100,0),
(@PATH,9,-2585.894,7320.886,13.95477,0,0,0,100,0),
(@PATH,10,-2605.105,7337.934,22.81847,0,0,0,100,0),
(@PATH,11,-2617.94,7333.2,24.0994,0,0,0,100,0),
(@PATH,12,-2619.5,7314.92,24.7855,0,0,0,100,0),
(@PATH,13,-2620.33,7306.87,22.2298,0,0,0,100,0),
(@PATH,14,-2622.22,7295.57,20.8845,0,0,0,100,0),
(@PATH,15,-2634.28,7283.98,22.6251,0,0,0,100,0),
(@PATH,16,-2645.37,7281.6,26.8452,0,0,0,100,0),
(@PATH,17,-2658.313,7277.178,31.34583,0,0,0,100,0),
(@PATH,18,-2656.347,7260.406,27.72301,0,0,0,100,0),
(@PATH,19,-2654.6,7223.491,21.68772,0,0,0,100,0),
(@PATH,20,-2649.212,7219.171,21.31272,0,0,0,100,0),
(@PATH,21,-2639.123,7217.482,21.18772,0,0,0,100,0),
(@PATH,22,-2604.8,7231.363,14.29138,0,0,0,100,0),
(@PATH,23,-2598.992,7233.284,13.06854,0,0,0,100,0),
(@PATH,24,-2589.095,7238.978,13.30505,0,0,0,100,0),
(@PATH,25,-2572.705,7258.197,14.18005,0,0,0,100,0),
(@PATH,26,-2553.04,7268.31,14.8673,0,0,0,100,0),
(@PATH,27,-2549.93,7292.21,13.5737,0,0,0,100,0),
(@PATH,28,-2543.94,7296.78,12.03,0,0,0,100,0),
(@PATH,29,-2528.52,7302.51,7.70912,0,0,0,100,0),
(@PATH,30,-2525.95,7310.64,6.42796,0,0,0,100,0),
(@PATH,31,-2541.65,7323.38,6.99469,0,0,0,100,0);

-- Pathing for Sifreldar Storm Maiden Entry: 29323
SET @NPC := 108767;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=6968.795,`position_y`=-1039.291,`position_z`=804.8483 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,6939.001,-1039.968,810.5756,0,0,0,100,0),
(@PATH,2,6929.729,-1038.428,811.8507,0,0,0,100,0),
(@PATH,3,6921.97,-1037.384,813.6382,0,0,0,100,0),
(@PATH,4,6899.672,-1034.548,804.9947,0,0,0,100,0),
(@PATH,5,6887.367,-1040.131,803.7447,0,0,0,100,0),
(@PATH,6,6879.581,-1055.645,802.1197,0,0,0,100,0),
(@PATH,7,6881.092,-1067.551,802.7026,0,0,0,100,0),
(@PATH,8,6891.585,-1073.036,804.8276,0,0,0,100,0),
(@PATH,9,6904.774,-1076.266,808.0779,0,0,0,100,0),
(@PATH,10,6914.952,-1077.399,813.4417,0,0,0,100,0),
(@PATH,11,6931.681,-1078.594,810.6033,0,0,0,100,0),
(@PATH,12,6953.237,-1080.285,804.8708,0,0,0,100,0),
(@PATH,13,6963.347,-1080.42,804.8613,0,0,0,100,0),
(@PATH,14,6967.195,-1070.248,804.8578,0,0,0,100,0),
(@PATH,15,6967.463,-1053.253,804.8583,0,0,0,100,0),
(@PATH,16,6968.795,-1039.291,804.8483,0,0,0,100,0);

-- Pathing for Sifreldar Storm Maiden Entry: 29323
SET @NPC := 108780;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=6849.583,`position_y`=-1122.161,`position_z`=799.7357 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,6825.424,-1137.925,795.3445,0,0,0,100,0),
(@PATH,2,6823.116,-1152.258,802.8445,0,0,0,100,0),
(@PATH,3,6804.956,-1162.505,810.9695,0,0,0,100,0),
(@PATH,4,6823.116,-1152.258,802.8445,0,0,0,100,0),
(@PATH,5,6825.424,-1137.925,795.3445,0,0,0,100,0),
(@PATH,6,6849.583,-1122.161,799.7357,0,0,0,100,0),
(@PATH,7,6859.529,-1108.683,802.3607,0,0,0,100,0),
(@PATH,8,6869.339,-1099.14,802.9526,0,0,0,100,0),
(@PATH,9,6888.484,-1113.396,802.4324,0,0,0,100,0),
(@PATH,10,6899.414,-1132.413,801.4324,0,0,0,100,0),
(@PATH,11,6888.484,-1113.396,802.4324,0,0,0,100,0),
(@PATH,12,6869.339,-1099.14,802.9526,0,0,0,100,0),
(@PATH,13,6859.529,-1108.683,802.3607,0,0,0,100,0),
(@PATH,14,6849.583,-1122.161,799.7357,0,0,0,100,0);

-- Pathing for Sifreldar Runekeeper Entry: 29331
SET @NPC := 108779;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=29331,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=6824.564,`position_y`=-1140.901,`position_z`=796.8445 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,6819.699,-1158.881,805.9695,0,0,0,100,0),
(@PATH,2,6802.754,-1164.963,811.4695,0,0,0,100,0),
(@PATH,3,6819.699,-1158.881,805.9695,0,0,0,100,0),
(@PATH,4,6824.564,-1140.901,796.8445,0,0,0,100,0),
(@PATH,5,6793.759,-1107.705,773.118,0,0,0,100,0),
(@PATH,6,6824.564,-1140.901,796.8445,0,0,0,100,0);

-- Pathing for Dragonblight Mage Hunter Entry: 26280
SET @NPC := 101640;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3089.834,`position_y`=339.6018,`position_z`=71.35417 WHERE `guid`=@NPC;
DELETE FROM `creature` WHERE `guid`=111762;
DELETE FROM `creature_addon` WHERE `guid`=111762;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3101.223,333.8671,68.35417,0,0,0,100,0),
(@PATH,2,3089.834,339.6018,71.35417,0,0,0,100,0),
(@PATH,3,3074.878,340.6855,74.60417,0,0,0,100,0),
(@PATH,4,3059.406,343.7871,76.1516,0,0,0,100,0),
(@PATH,5,3048.349,347.3151,75.9016,0,0,0,100,0),
(@PATH,6,3059.406,343.7871,76.1516,0,0,0,100,0),
(@PATH,7,3074.878,340.6855,74.60417,0,0,0,100,0),
(@PATH,8,3089.834,339.6018,71.35417,0,0,0,100,0);

-- Pathing for Magnataur Patriarch Entry: 26295
SET @NPC := 113264;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3455.645,`position_y`=450.5741,`position_z`=55.77813 WHERE `guid`=@NPC;
DELETE FROM `creature` WHERE `guid`=131082;
DELETE FROM `creature_addon` WHERE `guid`=131082;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3461.032,458.0605,55.52813,0,0,0,100,0),
(@PATH,2,3459.928,468.002,57.48453,0,0,0,100,0),
(@PATH,3,3461.031,458.0605,55.52813,0,0,0,100,0),
(@PATH,4,3455.645,450.5741,55.77813,0,0,0,100,0),
(@PATH,5,3449.821,447.5877,56.65313,0,0,0,100,0),
(@PATH,6,3444.278,447.4793,57.77813,0,0,0,100,0),
(@PATH,7,3449.821,447.5877,56.65313,0,0,0,100,0),
(@PATH,8,3455.645,450.5741,55.77813,0,0,0,100,0);

-- Pathing for Magnataur Patriarch Entry: 26295
SET @NPC := 113259;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4335.951,`position_y`=-180.1597,`position_z`=80.65488 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4314.526,-194.2564,76.19753,0,0,0,100,0),
(@PATH,2,4310.347,-212.7189,75.1636,0,0,0,100,0),
(@PATH,3,4319.451,-236.1514,78.55873,0,0,0,100,0),
(@PATH,4,4310.347,-212.7189,75.1636,0,0,0,100,0),
(@PATH,5,4314.526,-194.2564,76.19753,0,0,0,100,0),
(@PATH,6,4335.951,-180.1597,80.65488,0,0,0,100,0);

-- Pathing for Anub'ar Cultist Entry: 26319
SET @NPC := 115435;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4063.753,`position_y`=2196.374,`position_z`=151.8217 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4054.478,2188.652,151.9467,0,0,0,100,0),
(@PATH,2,4039.943,2185.158,151.6967,0,0,0,100,0),
(@PATH,3,4054.478,2188.652,151.9467,0,0,0,100,0),
(@PATH,4,4063.753,2196.374,151.8217,0,0,0,100,0),
(@PATH,5,4066.901,2217.657,152.0965,0,0,0,100,0),
(@PATH,6,4060.092,2234.396,151.5342,0,0,0,100,0),
(@PATH,7,4066.901,2217.657,152.0965,0,0,0,100,0),
(@PATH,8,4063.753,2196.374,151.8217,0,0,0,100,0);

-- Pathing for Tempus Wyrm Entry: 32180
SET @NPC := 112957;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4165.901,`position_y`=-407.722,`position_z`=155.0924 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4161.29,-415.327,155.0924,0,0,0,100,0),
(@PATH,2,4157.975,-426.0655,155.0924,0,0,0,100,0),
(@PATH,3,4149.574,-441.3904,155.0924,0,0,0,100,0),
(@PATH,4,4138.248,-453.2982,155.0924,0,0,0,100,0),
(@PATH,5,4125.589,-462.9384,155.0924,0,0,0,100,0),
(@PATH,6,4108.414,-468.0847,155.0925,0,0,0,100,0),
(@PATH,7,4093.35,-469.384,155.0924,0,0,0,100,0),
(@PATH,8,4076.784,-468.8313,155.0924,0,0,0,100,0),
(@PATH,9,4060.223,-464.068,155.0924,0,0,0,100,0),
(@PATH,10,4047.407,-453.0881,155.0924,0,0,0,100,0),
(@PATH,11,4034.705,-434.9922,155.0924,0,0,0,100,0),
(@PATH,12,4028.23,-418.9452,155.0924,0,0,0,100,0),
(@PATH,13,4027.506,-402.0115,155.0925,0,0,0,100,0),
(@PATH,14,4032.801,-387.0902,155.0924,0,0,0,100,0),
(@PATH,15,4040.891,-372.8224,155.0924,0,0,0,100,0),
(@PATH,16,4051.813,-359.7613,155.0924,0,0,0,100,0),
(@PATH,17,4065.439,-349.6774,155.0924,0,0,0,100,0),
(@PATH,18,4080.03,-344.1142,155.0924,0,0,0,100,0),
(@PATH,19,4095.92,-340.0204,155.0924,0,0,0,100,0),
(@PATH,20,4118.203,-337.1474,155.0924,0,0,0,100,0),
(@PATH,21,4146.275,-349.1546,155.0924,0,0,0,100,0),
(@PATH,22,4157.594,-358.4243,155.0924,0,0,0,100,0),
(@PATH,23,4168.311,-372.3049,155.0925,0,0,0,100,0),
(@PATH,24,4170.974,-391.4471,155.0924,0,0,0,100,0),
(@PATH,25,4165.901,-407.722,155.0924,0,0,0,100,0);

-- Pathing for Infinite Eradicator Entry: 32185
SET @NPC := 113438;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4190.591,`position_y`=-350.934,`position_z`=146.6842 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4207.472,-375.1424,146.6842,0,0,0,100,0),
(@PATH,2,4214.245,-404.9322,146.6842,0,0,0,100,0),
(@PATH,3,4209.104,-434.3985,146.6843,0,0,0,100,0),
(@PATH,4,4196.61,-460.4471,146.6842,0,0,0,100,0),
(@PATH,5,4170.492,-477.5867,146.6842,0,0,0,100,0),
(@PATH,6,4139.513,-481.6089,146.6842,0,0,0,100,0),
(@PATH,7,4111.95,-465.5229,146.6842,0,0,0,100,0),
(@PATH,8,4091.976,-440.942,146.6842,0,0,0,100,0),
(@PATH,9,4095.912,-407.7865,146.6842,0,0,0,100,0),
(@PATH,10,4098.527,-380.9193,146.6842,0,0,0,100,0),
(@PATH,11,4091.802,-357.8462,146.6842,0,0,0,100,0),
(@PATH,12,4075.851,-333.6917,146.6842,0,0,0,100,0),
(@PATH,13,4055.005,-351.5806,146.6842,0,0,0,100,0),
(@PATH,14,4051.888,-372.2745,146.6842,0,0,0,100,0),
(@PATH,15,4056.19,-395.6217,146.6842,0,0,0,100,0),
(@PATH,16,4061.398,-417.6198,146.6842,0,0,0,100,0),
(@PATH,17,4062.656,-443.156,146.6842,0,0,0,100,0),
(@PATH,18,4085.277,-457.1473,146.6842,0,0,0,100,0),
(@PATH,19,4107.788,-455.9095,146.6842,0,0,0,100,0),
(@PATH,20,4117.597,-435.8233,146.6842,0,0,0,100,0),
(@PATH,21,4113.671,-413.1419,146.6842,0,0,0,100,0),
(@PATH,22,4105.402,-392.1701,146.6842,0,0,0,100,0),
(@PATH,23,4106.15,-363.3776,146.6842,0,0,0,100,0),
(@PATH,24,4131.285,-341.2223,146.6842,0,0,0,100,0),
(@PATH,25,4162.843,-332.6555,146.6842,0,0,0,100,0),
(@PATH,26,4190.591,-350.934,146.6842,0,0,0,100,0);

-- Pathing for Infinite Eradicator Entry: 32185
SET @NPC := 113436;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4181.173,`position_y`=-369.9417,`position_z`=146.6842 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4191.631,-389.251,146.6842,0,0,0,100,0),
(@PATH,2,4193.926,-411.0253,146.6842,0,0,0,100,0),
(@PATH,3,4187.936,-433.0087,146.6843,0,0,0,100,0),
(@PATH,4,4176.908,-452.5828,146.6842,0,0,0,100,0),
(@PATH,5,4156.808,-461.3777,146.6842,0,0,0,100,0),
(@PATH,6,4135.129,-460.8535,146.6842,0,0,0,100,0),
(@PATH,7,4119.67,-445.7643,146.6842,0,0,0,100,0),
(@PATH,8,4107.466,-426.4492,146.6842,0,0,0,100,0),
(@PATH,9,4117.114,-407.0864,146.6842,0,0,0,100,0),
(@PATH,10,4119.729,-381.6279,146.6842,0,0,0,100,0),
(@PATH,11,4112.734,-354.4067,146.6842,0,0,0,100,0),
(@PATH,12,4093.601,-322.0753,146.6842,0,0,0,100,0),
(@PATH,13,4052.978,-330.4644,146.6842,0,0,0,100,0),
(@PATH,14,4034.263,-360.4702,146.6842,0,0,0,100,0),
(@PATH,15,4035.172,-392.7458,146.6842,0,0,0,100,0),
(@PATH,16,4040.271,-419.5353,146.6842,0,0,0,100,0),
(@PATH,17,4041.469,-444.2213,146.6842,0,0,0,100,0),
(@PATH,18,4071.126,-472.951,146.6842,0,0,0,100,0),
(@PATH,19,4103.979,-476.7779,146.6842,0,0,0,100,0),
(@PATH,20,4129.341,-453.4892,146.6842,0,0,0,100,0),
(@PATH,21,4134.468,-417.3209,146.6842,0,0,0,100,0),
(@PATH,22,4126.431,-389.3766,146.6842,0,0,0,100,0),
(@PATH,23,4127.358,-363.8509,146.6842,0,0,0,100,0),
(@PATH,24,4147.167,-355.2841,146.6842,0,0,0,100,0),
(@PATH,25,4170.109,-352.5856,146.6842,0,0,0,100,0),
(@PATH,26,4181.173,-369.9417,146.6842,0,0,0,100,0);

-- Pathing for Laire Brewgold Entry: 32424
SET @NPC := 111730;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5661.111,`position_y`=726.7043,`position_z`=641.6643 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5656.774,721.9439,641.6959,0,0,0,100,0),
(@PATH,2,5653.122,721.5146,641.6296,0,0,0,100,0),
(@PATH,3,5649.408,722.6322,641.5455,0,0,0,100,0),
(@PATH,4,5645.466,725.3781,641.6395,0,0,0,100,0),
(@PATH,5,5639.154,728.4048,641.61,0,0,0,100,0),
(@PATH,6,5635.932,732.4274,641.7092,5000,0,0,100,0),
(@PATH,7,5639.154,728.4048,641.61,0,0,0,100,0),
(@PATH,8,5645.889,733.0624,641.682,0,0,0,100,0),
(@PATH,9,5655.076,730.4822,641.6819,0,0,0,100,0),
(@PATH,10,5661.111,726.7043,641.6643,0,0,0,100,0);

-- Fixup Injured Soldier Waypoint 01 Set as trigger
UPDATE `creature` SET `modelid`=0 WHERE `id` IN (27792);
UPDATE `creature_template` SET `InhabitType`=3,`flags_extra`=`flags_extra`|128 WHERE `entry` IN (27792);

-- Pathing for Injured Soldier Waypoint 01 Entry: 27792
SET @NPC := 133440;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3687.688,`position_y`=-1131.765,`position_z`=98.09109 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3694.245,-1132.365,97.6494,0,0,0,100,0),
(@PATH,2,3697.133,-1137.371,97.6494,0,0,0,100,0),
(@PATH,3,3707.083,-1140.569,98.09109,0,0,0,100,0),
(@PATH,4,3697.133,-1137.371,97.6494,0,0,0,100,0),
(@PATH,5,3694.245,-1132.365,97.6494,0,0,0,100,0),
(@PATH,6,3687.688,-1131.765,98.09109,0,0,0,100,0);

-- Pathing for Injured Soldier Waypoint 01 Entry: 27792
SET @NPC := 133441;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3639.129,`position_y`=-1245.702,`position_z`=98.09111 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3646.784,-1246.543,98.26001,0,0,0,100,0),
(@PATH,2,3647.515,-1248.791,98.26001,0,0,0,100,0),
(@PATH,3,3655.563,-1252.757,98.09111,0,0,0,100,0),
(@PATH,4,3647.515,-1248.791,98.26001,0,0,0,100,0),
(@PATH,5,3646.784,-1246.543,98.26001,0,0,0,100,0),
(@PATH,6,3639.129,-1245.702,98.09111,0,0,0,100,0),
(@PATH,7,3634.578,-1242.256,98.09111,0,0,0,100,0),
(@PATH,8,3639.129,-1245.702,98.09111,0,0,0,100,0);

-- Pathing for Injured Soldier Waypoint 01 Entry: 27792
SET @NPC := 133439;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3656.245,`position_y`=-1252.887,`position_z`=98.09111 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3634.244,-1242.946,98.09111,0,0,0,100,0),
(@PATH,2,3656.245,-1252.887,98.09111,0,0,0,100,0);

-- Pathing for Injured Soldier Waypoint 01 Entry: 27792
SET @NPC := 133438;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3706.577,`position_y`=-1140.745,`position_z`=98.09109 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3688.351,-1132.398,98.09109,0,0,0,100,0),
(@PATH,2,3706.577,-1140.745,98.09109,0,0,0,100,0);

DELETE FROM `creature` WHERE `guid`=109148;
DELETE FROM `creature_addon` WHERE `guid`=109148;

-- Fixup Injured Soldier Waypoint 02 Set as trigger
UPDATE `creature` SET `modelid`=0 WHERE `id` IN (27793);
UPDATE `creature_template` SET `InhabitType`=3,`flags_extra`=`flags_extra`|128 WHERE `entry` IN (27793);

-- Pathing for Injured Soldier Waypoint 02 Entry: 27793
SET @NPC := 133449;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3662.666,`position_y`=-1239.828,`position_z`=98.09111 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3641.625,-1230.667,98.09111,0,0,0,100,0),
(@PATH,2,3662.666,-1239.828,98.09111,0,0,0,100,0);

-- Pathing for Injured Soldier Waypoint 02 Entry: 27793
SET @NPC := 133450;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3680.119,`position_y`=-1145.329,`position_z`=98.09109 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3688.248,-1146.153,97.6494,0,0,0,100,0),
(@PATH,2,3691.404,-1149.929,97.6494,0,0,0,100,0),
(@PATH,3,3694.596,-1152.75,97.6494,0,0,0,100,0),
(@PATH,4,3700.401,-1152.819,98.09109,0,0,0,100,0),
(@PATH,5,3701.976,-1154.921,98.09109,0,0,0,100,0),
(@PATH,6,3700.401,-1152.819,98.09109,0,0,0,100,0),
(@PATH,7,3694.596,-1152.75,97.6494,0,0,0,100,0),
(@PATH,8,3691.404,-1149.929,97.6494,0,0,0,100,0),
(@PATH,9,3688.248,-1146.153,97.6494,0,0,0,100,0),
(@PATH,10,3680.119,-1145.329,98.09109,0,0,0,100,0);

-- Pathing for Injured Soldier Waypoint 02 Entry: 27793
SET @NPC := 109632;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=27793,`spawndist`=0,`MovementType`=2,`position_x`=3681.213,`position_y`=-1145.856,`position_z`=98.09109 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3699.753,-1153.359,98.09109,0,0,0,100,0),
(@PATH,2,3681.213,-1145.856,98.09109,0,0,0,100,0);

-- Pathing for Injured Soldier Waypoint 02 Entry: 27793
SET @NPC := 109633;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=27793,`spawndist`=0,`MovementType`=2,`position_x`=3640.924,`position_y`=-1231.039,`position_z`=98.09111 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3649.915,-1232.593,98.26001,0,0,0,100,0),
(@PATH,2,3656.266,-1238.324,98.09111,0,0,0,100,0),
(@PATH,3,3660.733,-1237.718,98.09111,0,0,0,100,0),
(@PATH,4,3656.266,-1238.324,98.09111,0,0,0,100,0),
(@PATH,5,3649.915,-1232.593,98.26001,0,0,0,100,0),
(@PATH,6,3640.924,-1231.039,98.09111,0,0,0,100,0);

-- Fixup Injured Soldier Waypoint 03 Set as trigger
UPDATE `creature` SET `modelid`=0 WHERE `id` IN (27794);
UPDATE `creature_template` SET `InhabitType`=3,`flags_extra`=`flags_extra`|128 WHERE `entry` IN (27794);

-- Pathing for Injured Soldier Waypoint 03 Entry: 27794
SET @NPC := 133451;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3661.358,`position_y`=-1221.376,`position_z`=98.09111 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3665.178,-1225.378,98.09111,0,0,0,100,0),
(@PATH,2,3661.358,-1221.376,98.09111,0,0,0,100,0),
(@PATH,3,3654.384,-1216.99,98.09111,0,0,0,100,0),
(@PATH,4,3647.583,-1216.188,98.09111,0,0,0,100,0),
(@PATH,5,3654.384,-1216.99,98.09111,0,0,0,100,0),
(@PATH,6,3661.358,-1221.376,98.09111,0,0,0,100,0);

-- Pathing for Injured Soldier Waypoint 03 Entry: 27794
SET @NPC := 133452;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3668.855,`position_y`=-1225.114,`position_z`=98.09111 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3647.801,-1216.172,98.09111,0,0,0,100,0),
(@PATH,2,3668.855,-1225.114,98.09111,0,0,0,100,0);

-- Pathing for Injured Soldier Waypoint 03 Entry: 27794
SET @NPC := 133453;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3675.706,`position_y`=-1162.181,`position_z`=98.09109 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3693.215,-1169.852,98.09109,0,0,0,100,0),
(@PATH,2,3675.706,-1162.181,98.09109,0,0,0,100,0);

-- Pathing for Injured Soldier Waypoint 03 Entry: 27794
SET @NPC := 133454;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3685.215,`position_y`=-1162.893,`position_z`=97.6494 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3685.235,-1167.974,98.09109,0,0,0,100,0),
(@PATH,2,3694.442,-1170.397,98.09109,0,0,0,100,0),
(@PATH,3,3685.235,-1167.974,98.09109,0,0,0,100,0),
(@PATH,4,3685.316,-1162.941,97.6494,0,0,0,100,0),
(@PATH,5,3675.632,-1164.499,98.09109,0,0,0,100,0),
(@PATH,6,3674.321,-1160.317,98.09109,0,0,0,100,0),
(@PATH,7,3675.632,-1164.499,98.09109,0,0,0,100,0),
(@PATH,8,3685.215,-1162.893,97.6494,0,0,0,100,0);

-- Fixup Injured Soldier Summon Point Set as trigger
UPDATE `creature` SET `modelid`=0 WHERE `id` IN (27795);
UPDATE `creature_template` SET `InhabitType`=3,`flags_extra`=`flags_extra`|128 WHERE `entry` IN (27795);

-- Pathing for Injured Soldier Summon Point Entry: 27795
SET @NPC := 109737;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3635.371,`position_y`=-1260.123,`position_z`=98.09111 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3639.637,-1256.701,98.09111,0,0,0,100,0),
(@PATH,2,3641.038,-1263.186,98.09111,0,0,0,100,0),
(@PATH,3,3645.456,-1260.151,98.09111,0,0,0,100,0),
(@PATH,4,3646.584,-1265.838,98.09111,0,0,0,100,0),
(@PATH,5,3649.356,-1262.853,98.09111,0,0,0,100,0),
(@PATH,6,3650.487,-1267.485,98.09111,0,0,0,100,0),
(@PATH,7,3649.356,-1262.853,98.09111,0,0,0,100,0),
(@PATH,8,3646.584,-1265.838,98.09111,0,0,0,100,0),
(@PATH,9,3645.456,-1260.151,98.09111,0,0,0,100,0),
(@PATH,10,3641.148,-1263.11,98.09111,0,0,0,100,0),
(@PATH,11,3639.637,-1256.701,98.09111,0,0,0,100,0),
(@PATH,12,3635.371,-1260.123,98.09111,0,0,0,100,0),
(@PATH,13,3634.036,-1255.147,98.09111,0,0,0,100,0),
(@PATH,14,3628.426,-1256.89,98.09111,0,0,0,100,0),
(@PATH,15,3634.036,-1255.147,98.09111,0,0,0,100,0),
(@PATH,16,3635.371,-1260.123,98.09111,0,0,0,100,0);

-- Pathing for Injured Soldier Summon Point Entry: 27795
SET @NPC := 133459;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3639.455,`position_y`=-1259.333,`position_z`=98.09111 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3635.177,-1258.972,98.09111,0,0,0,100,0),
(@PATH,2,3628.478,-1255.191,98.09111,0,0,0,100,0),
(@PATH,3,3635.177,-1258.972,98.09111,0,0,0,100,0),
(@PATH,4,3639.455,-1259.333,98.09111,0,0,0,100,0),
(@PATH,5,3649.663,-1265.676,98.09111,0,0,0,100,0),
(@PATH,6,3639.455,-1259.333,98.09111,0,0,0,100,0);

-- Pathing for Injured Soldier Summon Point Entry: 27795
SET @NPC := 133458;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3690.377,`position_y`=-1120.719,`position_z`=98.09109 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3714.914,-1132.499,98.09109,0,0,0,100,0),
(@PATH,2,3690.377,-1120.719,98.09109,0,0,0,100,0);

-- Pathing for Injured Soldier Summon Point Entry: 27795
SET @NPC := 133456;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3704.953,`position_y`=-1125.08,`position_z`=98.09109 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3695.954,-1125.092,98.09109,0,0,0,100,0),
(@PATH,2,3690.822,-1117.956,98.09109,0,0,0,100,0),
(@PATH,3,3695.954,-1125.092,98.09109,0,0,0,100,0),
(@PATH,4,3704.953,-1125.08,98.09109,0,0,0,100,0),
(@PATH,5,3711.798,-1131.639,98.09109,0,0,0,100,0),
(@PATH,6,3704.953,-1125.08,98.09109,0,0,0,100,0);

-- Pathing for Tattered Abomination Entry: 27797
SET @NPC := 133490;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3596.785,`position_y`=-1234.963,`position_z`=89.07387 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3611.023,-1205.49,89.12477,0,0,0,100,0),
(@PATH,2,3596.785,-1234.963,89.07387,0,0,0,100,0);
-- 0xF130006C9505F3CC .go 3611.023 -1205.49 89.12477

-- Pathing for Carrion Condor Entry: 26174
SET @NPC := 101925;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3451.899,`position_y`=3774.349,`position_z`=60.27904 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3448.265,3763.589,58.0846,0,0,0,100,0),
(@PATH,2,3436.357,3758.859,60.27904,0,0,0,100,0),
(@PATH,3,3427.118,3761.404,60.27904,0,0,0,100,0),
(@PATH,4,3424.513,3775.218,58.22348,0,0,0,100,0),
(@PATH,5,3436.752,3781.46,63.00128,0,0,0,100,0),
(@PATH,6,3451.899,3774.349,60.27904,0,0,0,100,0);

-- Pathing for Carrion Condor Entry: 26174
SET @NPC := 101886;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3470.062,`position_y`=3504.777,`position_z`=60.02877 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3489.508,3468.938,55.75098,0,0,0,100,0),
(@PATH,2,3510.609,3460.939,68.02877,0,0,0,100,0),
(@PATH,3,3538.059,3469.108,64.88989,0,0,0,100,0),
(@PATH,4,3555.875,3503.135,68.02877,0,0,0,100,0),
(@PATH,5,3568.626,3532.901,68.02877,0,0,0,100,0),
(@PATH,6,3563.242,3557.899,68.02877,0,0,0,100,0),
(@PATH,7,3527.993,3578.705,68.02877,0,0,0,100,0),
(@PATH,8,3490.05,3549.902,68.02877,0,0,0,100,0),
(@PATH,9,3470.062,3504.777,60.02877,0,0,0,100,0);

-- Pathing for Carrion Condor Entry: 26174
SET @NPC := 101817;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3499.697,`position_y`=3508.944,`position_z`=62.80863 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3496.299,3531.275,62.80864,0,0,0,100,0),
(@PATH,2,3502.673,3553.807,62.08641,0,0,0,100,0),
(@PATH,3,3522.777,3562.911,64.72532,0,0,0,100,0),
(@PATH,4,3549.392,3558.91,58.39198,0,0,0,100,0),
(@PATH,5,3561,3538.082,64.39198,0,0,0,100,0),
(@PATH,6,3554.785,3496.833,60.16974,0,0,0,100,0),
(@PATH,7,3518.356,3475.909,62.80864,0,0,0,100,0),
(@PATH,8,3499.697,3508.944,62.80863,0,0,0,100,0);

-- Pathing for Carrion Condor Entry: 26174
SET @NPC := 101887;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3487.025,`position_y`=3801.495,`position_z`=64.28619 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3508.315,3787.482,64.28619,0,0,0,100,0),
(@PATH,2,3525.658,3795.386,64.28619,0,0,0,100,0),
(@PATH,3,3515.372,3818.548,64.28619,0,0,0,100,0),
(@PATH,4,3510.063,3829.02,64.28619,0,0,0,100,0),
(@PATH,5,3500.235,3840.592,64.28619,0,0,0,100,0),
(@PATH,6,3487.377,3829.144,64.28619,0,0,0,100,0),
(@PATH,7,3487.025,3801.495,64.28619,0,0,0,100,0);

-- Pathing for Carrion Condor Entry: 26174
SET @NPC := 101840;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3525.344,`position_y`=3832.733,`position_z`=69.65799 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3531.916,3820.634,72.24132,0,0,0,100,0),
(@PATH,2,3526.877,3800.81,72.24132,0,0,0,100,0),
(@PATH,3,3515.555,3788.204,72.24132,0,0,0,100,0),
(@PATH,4,3500.742,3787.609,72.24132,0,0,0,100,0),
(@PATH,5,3491.085,3798.095,70.21355,0,0,0,100,0),
(@PATH,6,3493.959,3822.765,75.10243,0,0,0,100,0),
(@PATH,7,3505.338,3836.017,72.24132,0,0,0,100,0),
(@PATH,8,3525.344,3832.733,69.65799,0,0,0,100,0);

-- Pathing for Carrion Condor Entry: 26174
SET @NPC := 101929;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3512.759,`position_y`=3582.701,`position_z`=53.18045 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3535.782,3562.454,57.09711,0,0,0,100,0),
(@PATH,2,3546.515,3533.243,53.18045,0,0,0,100,0),
(@PATH,3,3551.337,3503.115,53.18045,0,0,0,100,0),
(@PATH,4,3538.455,3471.695,53.18045,0,0,0,100,0),
(@PATH,5,3508.635,3459.773,53.18045,0,0,0,100,0),
(@PATH,6,3482.672,3471.235,53.18045,0,0,0,100,0),
(@PATH,7,3466.057,3507.579,53.18045,0,0,0,100,0),
(@PATH,8,3464.838,3544.961,53.18045,0,0,0,100,0),
(@PATH,9,3486.096,3576.008,53.18045,0,0,0,100,0),
(@PATH,10,3512.759,3582.701,53.18045,0,0,0,100,0);

-- Pathing for Carrion Condor Entry: 26174
SET @NPC := 101855;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3561,`position_y`=3538.082,`position_z`=64.39198 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3554.785,3496.833,60.16974,0,0,0,100,0),
(@PATH,2,3518.356,3475.909,62.80864,0,0,0,100,0),
(@PATH,3,3499.697,3508.944,62.80863,0,0,0,100,0),
(@PATH,4,3496.299,3531.275,62.80864,0,0,0,100,0),
(@PATH,5,3502.673,3553.807,62.08641,0,0,0,100,0),
(@PATH,6,3522.777,3562.911,64.72532,0,0,0,100,0),
(@PATH,7,3549.392,3558.91,58.39198,0,0,0,100,0),
(@PATH,8,3561,3538.082,64.39198,0,0,0,100,0);

-- Pathing for Grove Walker Entry: 31228
SET @NPC := 120259;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5767.086,`position_y`=554.6254,`position_z`=159.9334 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5788.306,541.5344,167.8084,0,0,0,100,0),
(@PATH,2,5811.419,543.5833,174.3569,0,0,0,100,0),
(@PATH,3,5820.507,571.3627,171.8876,0,0,0,100,0),
(@PATH,4,5808.849,592.7281,167.2626,0,0,0,100,0),
(@PATH,5,5794.39,615.308,162.3778,0,0,0,100,0),
(@PATH,6,5782.429,599.8776,160.4631,0,0,0,100,0),
(@PATH,7,5772.276,576.5581,158.2131,0,0,0,100,0),
(@PATH,8,5767.086,554.6254,159.9334,0,0,0,100,0);

-- Pathing for Ancient Watcher Entry: 31229
SET @NPC := 120410;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5790.005,`position_y`=419.9462,`position_z`=177.7312 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5825.215,357.9948,189.9353,0,0,0,100,0),
(@PATH,2,5790.005,419.9462,177.7312,0,0,0,100,0),
(@PATH,3,5799.53,427.6059,180.2312,0,0,0,100,0),
(@PATH,4,5802.141,444.2674,181.5455,0,0,0,100,0),
(@PATH,5,5806.649,507.7448,178.8326,0,0,0,100,0),
(@PATH,6,5814.846,560.8038,170.8569,0,0,0,100,0),
(@PATH,7,5781.772,575.9896,160.5881,0,0,0,100,0),
(@PATH,8,5786.224,593.0746,162.2131,0,0,0,100,0),
(@PATH,9,5816.907,596.3663,169.6376,0,0,0,100,0),
(@PATH,10,5786.224,593.0746,162.2131,0,0,0,100,0),
(@PATH,11,5781.772,575.9896,160.5881,0,0,0,100,0),
(@PATH,12,5814.846,560.8038,170.8569,0,0,0,100,0),
(@PATH,13,5806.649,507.7448,178.8326,0,0,0,100,0),
(@PATH,14,5802.141,444.2674,181.5455,0,0,0,100,0),
(@PATH,15,5799.53,427.6059,180.2312,0,0,0,100,0),
(@PATH,16,5790.005,419.9462,177.7312,0,0,0,100,0);

-- Pathing for Northrend Daily Dungeon Image Bunny Entry: 32265
SET @NPC := 97334;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5704.948,`position_y`=584.5382,`position_z`=653.6223 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5703.734,582.9427,653.631,0,0,0,100,0),
(@PATH,2,5701.61,583.4393,653.6489,0,0,0,100,0),
(@PATH,3,5700.888,585.4722,653.6498,0,0,0,100,0),
(@PATH,4,5702.143,586.9913,653.6417,0,0,0,100,0),
(@PATH,5,5704.137,586.5278,653.6327,0,0,0,100,0),
(@PATH,6,5704.948,584.5382,653.6223,0,0,0,100,0);
-- 0xF130007E090099EB .go 5703.734 582.9427 653.631
-- Fixup Northrend Daily Dungeon Image Bunny Set as trigger
UPDATE `creature` SET `modelid`=0 WHERE `id` IN (32265);
UPDATE `creature_template` SET `InhabitType`=7,`flags_extra`=`flags_extra`|128 WHERE `entry` IN (32265);

-- Pathing for Vern Entry: 32435 (RARE)
SET @NPC := 112862;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5856.26,`position_y`=589.199,`position_z`=608.38 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5849.843,581.8642,610.2223,0,0,0,100,0),
(@PATH,2,5856.26,589.199,608.38,0,0,0,100,0),
(@PATH,3,5848.6,611.398,605.308,0,0,0,100,0),
(@PATH,4,5861.108,630.3746,601.8403,0,0,0,100,0),
(@PATH,5,5848.6,611.398,605.308,0,0,0,100,0),
(@PATH,6,5856.26,589.199,608.38,0,0,0,100,0);

-- Pathing for Underbelly Croc Entry: 32441
SET @NPC := 113419;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5894.618,`position_y`=654.9387,`position_z`=615.2944 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5881.377,637.9071,615.1934,0,0,0,100,0),
(@PATH,2,5894.618,654.9387,615.2944,0,0,0,100,0);


-- ========================
--  2011_05_18_09_world_waypoints.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Pathing for Boulderfist Ogre Entry: 2562
SET @NPC := 11694;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1164.584,`position_y`=-2115.625,`position_z`=68.11761 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1156.91,-2120.744,65.86761,0,0,0,100,0),
(@PATH,2,-1151.243,-2126.754,66.36761,0,0,0,100,0),
(@PATH,3,-1147.579,-2132.875,68.11761,0,0,0,100,0),
(@PATH,4,-1154.89,-2124.491,66.11761,0,0,0,100,0),
(@PATH,5,-1161.565,-2118.392,66.36761,0,0,0,100,0),
(@PATH,6,-1170.198,-2117.061,70.99816,0,0,0,100,0),
(@PATH,7,-1164.584,-2115.625,68.11761,0,0,0,100,0);

-- Pathing for Boulderfist Brute Entry: 2566
SET @NPC := 11644;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2039.689,`position_y`=-2809.004,`position_z`=73.84588 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2033.668,-2815.25,74.41247,0,0,0,100,0),
(@PATH,2,-2028.261,-2821.853,74.32455,0,0,0,100,0),
(@PATH,3,-2020.386,-2829.258,74.87946,0,0,0,100,0),
(@PATH,4,-2028.261,-2821.853,74.32455,0,0,0,100,0),
(@PATH,5,-2033.668,-2815.25,74.41247,0,0,0,100,0),
(@PATH,6,-2039.689,-2809.004,73.84588,0,0,0,100,0),
(@PATH,7,-2044.486,-2802.611,72.68762,0,0,0,100,0),
(@PATH,8,-2039.689,-2809.004,73.84588,0,0,0,100,0);

-- Pathing for Boulderfist Mauler Entry: 2569
SET @NPC := 14642;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1642.37,`position_y`=-1744.458,`position_z`=67.69829 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1627.052,-1744.242,67.56577,0,0,0,100,0),
(@PATH,2,-1616.662,-1744.105,67.56577,0,0,0,100,0),
(@PATH,3,-1608.299,-1743.981,67.44077,0,0,0,100,0),
(@PATH,4,-1616.662,-1744.105,67.56577,0,0,0,100,0),
(@PATH,5,-1627.052,-1744.242,67.56577,0,0,0,100,0),
(@PATH,6,-1642.37,-1744.458,67.69829,0,0,0,100,0),
(@PATH,7,-1664.298,-1744.454,67.44829,0,0,0,100,0),
(@PATH,8,-1676.667,-1743.748,65.34362,0,0,0,100,0),
(@PATH,9,-1691.087,-1741.401,59.84362,0,0,0,100,0),
(@PATH,10,-1706.169,-1741.839,54.79599,0,0,0,100,0),
(@PATH,11,-1718.415,-1734.593,52.29599,0,0,0,100,0),
(@PATH,12,-1706.169,-1741.839,54.79599,0,0,0,100,0),
(@PATH,13,-1691.087,-1741.401,59.84362,0,0,0,100,0),
(@PATH,14,-1676.667,-1743.748,65.34362,0,0,0,100,0),
(@PATH,15,-1664.298,-1744.454,67.44829,0,0,0,100,0),
(@PATH,16,-1642.37,-1744.458,67.69829,0,0,0,100,0);

-- Pathing for Dabyrie Militia Entry: 2581
SET @NPC := 11725;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1000.796,`position_y`=-2923.265,`position_z`=62.16119 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-974.3457,-2905.903,65.16662,0,0,0,100,0),
(@PATH,2,-971.5711,-2893.533,64.60294,0,0,0,100,0),
(@PATH,3,-974.319,-2879.502,64.35294,0,0,0,100,0),
(@PATH,4,-971.5711,-2893.533,64.60294,0,0,0,100,0),
(@PATH,5,-974.3457,-2905.903,65.16662,0,0,0,100,0),
(@PATH,6,-1000.796,-2923.265,62.16119,0,0,0,100,0),
(@PATH,7,-1017.62,-2925.441,56.91119,0,0,0,100,0),
(@PATH,8,-1034.279,-2926.776,52.40142,0,0,0,100,0),
(@PATH,9,-1040.623,-2924.862,49.40142,0,0,0,100,0),
(@PATH,10,-1034.279,-2926.776,52.40142,0,0,0,100,0),
(@PATH,11,-1017.62,-2925.441,56.91119,0,0,0,100,0),
(@PATH,12,-1000.796,-2923.265,62.16119,0,0,0,100,0);

-- Pathing for Dabyrie Militia Entry: 2581
SET @NPC := 12050;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1110.044,`position_y`=-2911.982,`position_z`=41.67108 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1111.091,-2921.517,42.92108,0,0,0,100,0),
(@PATH,2,-1107.97,-2932.903,44.67108,0,0,0,100,0),
(@PATH,3,-1099.177,-2943.237,45.82201,0,0,0,100,0),
(@PATH,4,-1084.851,-2946.95,46.07201,0,0,0,100,0),
(@PATH,5,-1072.699,-2945.52,46.19701,0,0,0,100,0),
(@PATH,6,-1062.084,-2941.41,46.44701,0,0,0,100,0),
(@PATH,7,-1058.887,-2930.384,42.52642,0,0,0,100,0),
(@PATH,8,-1057.631,-2918.993,42.52642,0,0,0,100,0),
(@PATH,9,-1058.887,-2930.384,42.52642,0,0,0,100,0),
(@PATH,10,-1062.084,-2941.41,46.44701,0,0,0,100,0),
(@PATH,11,-1072.699,-2945.52,46.19701,0,0,0,100,0),
(@PATH,12,-1084.851,-2946.95,46.07201,0,0,0,100,0),
(@PATH,13,-1099.177,-2943.237,45.82201,0,0,0,100,0),
(@PATH,14,-1107.97,-2932.903,44.67108,0,0,0,100,0),
(@PATH,15,-1111.091,-2921.517,42.92108,0,0,0,100,0),
(@PATH,16,-1110.044,-2911.982,41.67108,0,0,0,100,0);

-- Pathing for Dabyrie Militia Entry: 2581
SET @NPC := 12045;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1101.002,`position_y`=-2927.062,`position_z`=42.29608 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1095.116,-2939.863,44.40173,0,0,0,100,0),
(@PATH,2,-1070.158,-2937.697,43.07201,0,0,0,100,0),
(@PATH,3,-1067.749,-2926.622,42.23072,0,0,0,100,0),
(@PATH,4,-1070.943,-2917.517,42.23072,0,0,0,100,0),
(@PATH,5,-1067.804,-2909.401,42.23072,0,0,0,100,0),
(@PATH,6,-1061.041,-2901.267,42.15142,0,0,0,100,0),
(@PATH,7,-1067.804,-2909.401,42.23072,0,0,0,100,0),
(@PATH,8,-1070.943,-2917.517,42.23072,0,0,0,100,0),
(@PATH,9,-1067.749,-2926.622,42.23072,0,0,0,100,0),
(@PATH,10,-1070.158,-2937.697,43.07201,0,0,0,100,0),
(@PATH,11,-1095.116,-2939.863,44.40173,0,0,0,100,0),
(@PATH,12,-1101.002,-2927.062,42.29608,0,0,0,100,0);

-- Pathing for Dabyrie Militia Entry: 2581
SET @NPC := 12055;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1113.975,`position_y`=-2819.176,`position_z`=41.96498 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1103.284,-2808.888,41.96498,0,0,0,100,0),
(@PATH,2,-1113.975,-2819.176,41.96498,0,0,0,100,0),
(@PATH,3,-1125.615,-2831.386,42.21498,0,0,0,100,0),
(@PATH,4,-1139.012,-2847.163,42.1853,0,0,0,100,0),
(@PATH,5,-1148.732,-2862.114,43.1853,0,0,0,100,0),
(@PATH,6,-1144.571,-2874.899,43.38471,0,0,0,100,0),
(@PATH,7,-1148.732,-2862.114,43.1853,0,0,0,100,0),
(@PATH,8,-1139.012,-2847.163,42.1853,0,0,0,100,0),
(@PATH,9,-1125.615,-2831.386,42.21498,0,0,0,100,0),
(@PATH,10,-1113.975,-2819.176,41.96498,0,0,0,100,0);

-- Pathing for Dabyrie Militia Entry: 2581
SET @NPC := 11923;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1036.477,`position_y`=-2794.085,`position_z`=48.5377 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1048.086,-2781.703,44.5377,0,0,0,100,0),
(@PATH,2,-1036.477,-2794.085,48.5377,0,0,0,100,0),
(@PATH,3,-1028.531,-2805.323,50.21591,0,0,0,100,0),
(@PATH,4,-1021.207,-2818.615,49.09091,0,0,0,100,0),
(@PATH,5,-1013.592,-2827.916,50.59091,0,0,0,100,0),
(@PATH,6,-1003.065,-2836.799,53.32201,0,0,0,100,0),
(@PATH,7,-1013.592,-2827.916,50.59091,0,0,0,100,0),
(@PATH,8,-1021.207,-2818.615,49.09091,0,0,0,100,0),
(@PATH,9,-1028.531,-2805.323,50.21591,0,0,0,100,0),
(@PATH,10,-1036.477,-2794.085,48.5377,0,0,0,100,0);

-- Pathing for Dabyrie Militia Entry: 2581
SET @NPC := 12048;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1046.511,`position_y`=-2789.321,`position_z`=46.4127 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1034.046,-2803.35,49.23941,0,0,0,100,0),
(@PATH,2,-1023.659,-2814.771,49.34091,0,0,0,100,0),
(@PATH,3,-1020.099,-2823.633,48.84091,0,0,0,100,0),
(@PATH,4,-1023.659,-2814.771,49.34091,0,0,0,100,0),
(@PATH,5,-1034.046,-2803.35,49.23941,0,0,0,100,0),
(@PATH,6,-1046.511,-2789.321,46.4127,0,0,0,100,0),
(@PATH,7,-1058.17,-2780.757,42.1627,0,0,0,100,0),
(@PATH,8,-1066.657,-2782.932,41.6627,0,0,0,100,0),
(@PATH,9,-1074.936,-2784.309,41.6549,0,0,0,100,0),
(@PATH,10,-1066.657,-2782.932,41.6627,0,0,0,100,0),
(@PATH,11,-1058.17,-2780.757,42.1627,0,0,0,100,0),
(@PATH,12,-1046.511,-2789.321,46.4127,0,0,0,100,0);

-- Pathing for Dabyrie Militia Entry: 2581
SET @NPC := 11727;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1037.064,`position_y`=-2861.966,`position_z`=45.77301 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1027.88,-2866.237,50.07201,0,0,0,100,0),
(@PATH,2,-1018.745,-2873.388,56.6381,0,0,0,100,0),
(@PATH,3,-1015.589,-2882.479,62.2631,0,0,0,100,0),
(@PATH,4,-1018.745,-2873.388,56.6381,0,0,0,100,0),
(@PATH,5,-1027.88,-2866.237,50.07201,0,0,0,100,0),
(@PATH,6,-1037.064,-2861.966,45.77301,0,0,0,100,0),
(@PATH,7,-1050.203,-2856.651,42.64801,0,0,0,100,0),
(@PATH,8,-1037.064,-2861.966,45.77301,0,0,0,100,0);

-- Pathing for Dabyrie Militia Entry: 2581
SET @NPC := 11913;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1005.879,`position_y`=-2919.226,`position_z`=62.16119 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1014.416,-2918.99,59.66119,0,0,0,100,0),
(@PATH,2,-1027.294,-2926.176,54.03619,0,0,0,100,0),
(@PATH,3,-1036.633,-2924.023,50.40142,0,0,0,100,0),
(@PATH,4,-1027.294,-2926.176,54.03619,0,0,0,100,0),
(@PATH,5,-1014.416,-2918.99,59.66119,0,0,0,100,0),
(@PATH,6,-1005.879,-2919.226,62.16119,0,0,0,100,0),
(@PATH,7,-992.6738,-2920.178,63.91662,0,0,0,100,0),
(@PATH,8,-978.0767,-2906.091,65.04162,0,0,0,100,0),
(@PATH,9,-973.4244,-2891.938,64.47794,0,0,0,100,0),
(@PATH,10,-980.814,-2881.132,62.97793,0,0,0,100,0),
(@PATH,11,-973.4244,-2891.938,64.47794,0,0,0,100,0),
(@PATH,12,-978.0767,-2906.091,65.04162,0,0,0,100,0),
(@PATH,13,-992.6738,-2920.178,63.91662,0,0,0,100,0),
(@PATH,14,-1005.879,-2919.226,62.16119,0,0,0,100,0);

-- Pathing for Stromgarde Defender Entry: 2584
SET @NPC := 14606;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1633.213,`position_y`=-1708.567,`position_z`=68.46696 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1630.359,-1698.095,67.98904,0,0,0,100,0),
(@PATH,2,-1625.632,-1692.093,67.36404,0,0,0,100,0),
(@PATH,3,-1620.249,-1685.949,66.98904,0,0,0,100,0),
(@PATH,4,-1614.795,-1681.662,66.61404,0,0,0,100,0),
(@PATH,5,-1607.163,-1682.663,66.23904,0,0,0,100,0),
(@PATH,6,-1600.319,-1683.514,66.11404,0,0,0,100,0),
(@PATH,7,-1591.644,-1685.499,66.56465,0,0,0,100,0),
(@PATH,8,-1586.838,-1688.491,66.31465,0,0,0,100,0),
(@PATH,9,-1584.61,-1705.238,66.83134,0,0,0,100,0),
(@PATH,10,-1584.281,-1713.021,67.08134,0,0,0,100,0),
(@PATH,11,-1584.61,-1705.238,66.83134,0,0,0,100,0),
(@PATH,12,-1586.838,-1688.491,66.31465,0,0,0,100,0),
(@PATH,13,-1591.644,-1685.499,66.56465,0,0,0,100,0),
(@PATH,14,-1600.319,-1683.514,66.11404,0,0,0,100,0),
(@PATH,15,-1607.163,-1682.663,66.23904,0,0,0,100,0),
(@PATH,16,-1614.795,-1681.662,66.61404,0,0,0,100,0),
(@PATH,17,-1620.249,-1685.949,66.98904,0,0,0,100,0),
(@PATH,18,-1625.632,-1692.093,67.36404,0,0,0,100,0),
(@PATH,19,-1630.359,-1698.095,67.98904,0,0,0,100,0),
(@PATH,20,-1633.213,-1708.567,68.46696,0,0,0,100,0);

-- Pathing for Stromgarde Defender Entry: 2584
SET @NPC := 14615;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1519.433,`position_y`=-1708.847,`position_z`=67.71825 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1531.711,-1721.789,66.21825,0,0,0,100,0),
(@PATH,2,-1545.423,-1709.557,66.34925,0,0,0,100,0),
(@PATH,3,-1552.171,-1704.832,66.22425,0,0,0,100,0),
(@PATH,4,-1565.341,-1699.044,66.47332,0,0,0,100,0),
(@PATH,5,-1572.903,-1693.114,66.06465,0,0,0,100,0),
(@PATH,6,-1569.563,-1686.402,66.56465,0,0,0,100,0),
(@PATH,7,-1559.232,-1677.78,67.59832,0,0,0,100,0),
(@PATH,8,-1555.363,-1669.783,68.71778,0,0,0,100,0),
(@PATH,9,-1559.232,-1677.78,67.59832,0,0,0,100,0),
(@PATH,10,-1569.563,-1686.402,66.56465,0,0,0,100,0),
(@PATH,11,-1572.903,-1693.114,66.06465,0,0,0,100,0),
(@PATH,12,-1565.341,-1699.044,66.47332,0,0,0,100,0),
(@PATH,13,-1552.171,-1704.832,66.22425,0,0,0,100,0),
(@PATH,14,-1545.423,-1709.557,66.34925,0,0,0,100,0),
(@PATH,15,-1531.711,-1721.789,66.21825,0,0,0,100,0),
(@PATH,16,-1519.433,-1708.847,67.71825,0,0,0,100,0),
(@PATH,17,-1514.467,-1705.977,67.84325,0,0,0,100,0),
(@PATH,18,-1519.433,-1708.847,67.71825,0,0,0,100,0);

-- Pathing for Stromgarde Defender Entry: 2584
SET @NPC := 12007;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1544.397,`position_y`=-1859.491,`position_z`=67.10917 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1537.813,-1856.054,67.48417,0,0,0,100,0),
(@PATH,2,-1529.115,-1852.296,67.62733,0,0,0,100,0),
(@PATH,3,-1528.478,-1844.241,67.87733,0,0,0,100,0),
(@PATH,4,-1528.312,-1836.913,68.00233,0,0,0,100,0),
(@PATH,5,-1528.36,-1830.106,68.05283,0,0,0,100,0),
(@PATH,6,-1528.312,-1836.913,68.00233,0,0,0,100,0),
(@PATH,7,-1528.478,-1844.241,67.87733,0,0,0,100,0),
(@PATH,8,-1529.115,-1852.296,67.62733,0,0,0,100,0),
(@PATH,9,-1537.813,-1856.054,67.48417,0,0,0,100,0),
(@PATH,10,-1544.397,-1859.491,67.10917,0,0,0,100,0),
(@PATH,11,-1548.986,-1865.27,67.48417,0,0,0,100,0),
(@PATH,12,-1549.157,-1871.896,67.49586,0,0,0,100,0),
(@PATH,13,-1549.705,-1878.791,67.74586,0,0,0,100,0),
(@PATH,14,-1549.717,-1887.33,67.74586,0,0,0,100,0),
(@PATH,15,-1549.696,-1894.195,67.74586,0,0,0,100,0),
(@PATH,16,-1549.325,-1901.269,67.93284,0,0,0,100,0),
(@PATH,17,-1549.696,-1894.195,67.74586,0,0,0,100,0),
(@PATH,18,-1549.717,-1887.33,67.74586,0,0,0,100,0),
(@PATH,19,-1549.705,-1878.791,67.74586,0,0,0,100,0),
(@PATH,20,-1549.157,-1871.896,67.49586,0,0,0,100,0),
(@PATH,21,-1548.986,-1865.27,67.48417,0,0,0,100,0),
(@PATH,22,-1544.397,-1859.491,67.10917,0,0,0,100,0);

-- Pathing for Syndicate Thief Entry: 24477
SET @NPC := 14539;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1624.479,`position_y`=-1790.601,`position_z`=80.69153 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1625.772,-1791.6,80.56653,0,0,0,100,0),
(@PATH,2,-1627.317,-1788.699,80.44153,0,0,0,100,0),
(@PATH,3,-1628.756,-1790.13,80.44153,0,0,0,100,0),
(@PATH,4,-1630.531,-1795.319,80.31653,0,0,0,100,0),
(@PATH,5,-1629.169,-1800.798,80.44154,0,0,0,100,0),
(@PATH,6,-1628.847,-1805.854,80.44154,0,0,0,100,0),
(@PATH,7,-1630.837,-1808.302,80.56654,0,0,0,100,0),
(@PATH,8,-1627.526,-1806.178,80.31654,0,0,0,100,0),
(@PATH,9,-1625.446,-1799.11,80.19153,0,0,0,100,0),
(@PATH,10,-1624.479,-1790.601,80.69153,0,0,0,100,0);

-- Pathing for Syndicate Thief Entry: 24477
SET @NPC := 14553;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1644.376,`position_y`=-1822.682,`position_z`=79.18237 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1645.642,-1834.04,79.18812,0,0,0,100,0),
(@PATH,2,-1643.131,-1842.017,79.43812,0,0,0,100,0),
(@PATH,3,-1640.613,-1848.469,80.43812,0,0,0,100,0),
(@PATH,4,-1637.512,-1850.404,81.18812,0,0,0,100,0),
(@PATH,5,-1633.946,-1850.41,81.31312,0,0,0,100,0),
(@PATH,6,-1639.898,-1849.684,80.56312,0,0,0,100,0),
(@PATH,7,-1644.877,-1844.75,79.31312,0,0,0,100,0),
(@PATH,8,-1645.747,-1834.646,79.18812,0,0,0,100,0),
(@PATH,9,-1645.052,-1828.025,79.18237,0,0,0,100,0),
(@PATH,10,-1643.223,-1818.971,79.30737,0,0,0,100,0),
(@PATH,11,-1644.376,-1822.682,79.18237,0,0,0,100,0);

-- Pathing for Moa'ki Turtle Rider Entry: 29953
SET @NPC := 95649;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2868.272,`position_y`=887.7991,`position_z`=21.40061 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2862.907,892.681,20.7901,0,0,0,100,0),
(@PATH,2,2848.469,913.8572,23.00146,0,0,0,100,0),
(@PATH,3,2833.101,934.5399,24.24998,0,0,0,100,0),
(@PATH,4,2816.723,939.347,24.24998,0,0,0,100,0),
(@PATH,5,2811.684,954.9929,25.12498,0,0,0,100,0),
(@PATH,6,2816.165,964.7363,25.74998,0,0,0,100,0),
(@PATH,7,2811.684,954.9929,25.12498,0,0,0,100,0),
(@PATH,8,2816.723,939.347,24.24998,0,0,0,100,0),
(@PATH,9,2833.101,934.5399,24.24998,0,0,0,100,0),
(@PATH,10,2848.469,913.8572,23.00146,0,0,0,100,0),
(@PATH,11,2862.907,892.681,20.7901,0,0,0,100,0),
(@PATH,12,2868.272,887.7991,21.40061,0,0,0,100,0),
(@PATH,13,2884.556,888.7734,24.77561,0,0,0,100,0),
(@PATH,14,2868.272,887.7991,21.40061,0,0,0,100,0);

-- Pathing for Lead Cannoneer Zierhut Entry: 27235
SET @NPC := 86564;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2675.015,`position_y`=-487.5652,`position_z`=51.04063 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2669.011,-499.4489,52.04063,0,0,0,100,0),
(@PATH,2,2675.087,-486.52,50.91563,0,0,0,100,0),
(@PATH,3,2667.463,-474.6441,50.16563,0,0,0,100,0),
(@PATH,4,2659.346,-462.439,50.30303,0,0,0,100,0),
(@PATH,5,2654.616,-463.2926,50.80303,0,0,0,100,0),
(@PATH,6,2659.842,-462.3456,50.30303,0,0,0,100,0),
(@PATH,7,2666.731,-473.5312,50.29063,0,0,0,100,0),
(@PATH,8,2675.015,-487.5652,51.04063,0,0,0,100,0);

-- Pathing for Onslaught Deckhand Entry: 27233
SET @NPC := 85522;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2521.783,`position_y`=-357.7691,`position_z`=1.422231 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2533.675,-353.2017,1.422232,0,0,0,100,0),
(@PATH,2,2527.141,-356.3441,1.422231,0,0,0,100,0),
(@PATH,3,2518.232,-364.3784,1.422231,0,0,0,100,0),
(@PATH,4,2521.783,-357.7691,1.422231,0,0,0,100,0);

-- Pathing for Onslaught Deckhand Entry: 27233
SET @NPC := 86418;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2543.606,`position_y`=-393.4823,`position_z`=1.700949 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2552.594,-394.0088,2.575949,0,0,0,100,0),
(@PATH,2,2559.711,-390.4853,3.325949,0,0,0,100,0),
(@PATH,3,2543.606,-393.4823,1.700949,0,0,0,100,0);

-- Pathing for Onslaught Raven Archon Entry: 27357
SET @NPC := 117137;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4635.632,`position_y`=-532.24,`position_z`=166.6355 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4640.689,-524.028,166.8855,0,0,0,100,0),
(@PATH,2,4649.752,-526.5829,167.0105,0,0,0,100,0),
(@PATH,3,4640.689,-524.028,166.8855,0,0,0,100,0),
(@PATH,4,4635.632,-532.24,166.6355,0,0,0,100,0),
(@PATH,5,4623.326,-542.4513,162.3702,0,0,0,100,0),
(@PATH,6,4635.632,-532.24,166.6355,0,0,0,100,0);

-- Pathing for Onslaught Scout Entry: 27332
SET @NPC := 114378;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3980.014,`position_y`=-1332.863,`position_z`=161.5169 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3990.759,-1351.73,159.0279,0,0,0,100,0),
(@PATH,2,3994.687,-1363.344,153.2065,0,0,0,100,0),
(@PATH,3,4011.793,-1367.36,152.8956,0,0,0,100,0),
(@PATH,4,3994.687,-1363.344,153.2065,0,0,0,100,0),
(@PATH,5,3990.759,-1351.73,159.0279,0,0,0,100,0),
(@PATH,6,3980.014,-1332.863,161.5169,0,0,0,100,0),
(@PATH,7,3974.264,-1324.517,161.7669,0,0,0,100,0),
(@PATH,8,3978.401,-1310.471,160.7669,0,0,0,100,0),
(@PATH,9,3977.106,-1290.647,160.65019,0,0,0,100,0),
(@PATH,10,3966.973,-1274.031,160.47357,0,0,0,100,0),
(@PATH,11,3977.106,-1290.647,160.65019,0,0,0,100,0),
(@PATH,12,3978.401,-1310.471,160.7669,0,0,0,100,0),
(@PATH,13,3974.264,-1324.517,161.7669,0,0,0,100,0),
(@PATH,14,3980.014,-1332.863,161.5169,0,0,0,100,0);

-- Pathing for Onslaught Scout Entry: 27332
SET @NPC := 114421;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4089.484,`position_y`=-1355.243,`position_z`=164.416 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4070.284,-1351.355,160.041,0,0,0,100,0),
(@PATH,2,4055.511,-1349.968,160.5553,0,0,0,100,0),
(@PATH,3,4041.178,-1359.764,161.0553,0,0,0,100,0),
(@PATH,4,4055.511,-1349.968,160.5553,0,0,0,100,0),
(@PATH,5,4070.284,-1351.355,160.041,0,0,0,100,0),
(@PATH,6,4089.484,-1355.243,164.416,0,0,0,100,0),
(@PATH,7,4100.766,-1344.072,166.8451,0,0,0,100,0),
(@PATH,8,4089.484,-1355.243,164.416,0,0,0,100,0);

-- Pathing for Onslaught Infantry Entry: 27330
SET @NPC := 114258;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4125.635,`position_y`=-1190.833,`position_z`=134.1967 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4115.98,-1192.384,132.3217,0,0,0,100,0),
(@PATH,2,4125.635,-1190.833,134.1967,0,0,0,100,0),
(@PATH,3,4130.558,-1193.161,135.4467,0,0,0,100,0),
(@PATH,4,4139.23,-1195.387,137.6378,0,0,0,100,0),
(@PATH,5,4156.964,-1196.051,142.0128,0,0,0,100,0),
(@PATH,6,4161.722,-1192.395,143.3878,0,0,0,100,0),
(@PATH,7,4167.034,-1193.434,144.6433,0,0,0,100,0),
(@PATH,8,4173.272,-1181.968,146.1433,0,0,0,100,0),
(@PATH,9,4180.184,-1177.931,146.7683,0,0,0,100,0),
(@PATH,10,4183.93,-1166.589,147.3667,0,0,0,100,0),
(@PATH,11,4185.767,-1154.182,148.3667,0,0,0,100,0),
(@PATH,12,4183.852,-1147.802,149.3667,0,0,0,100,0),
(@PATH,13,4185.767,-1154.182,148.3667,0,0,0,100,0),
(@PATH,14,4183.93,-1166.589,147.3667,0,0,0,100,0),
(@PATH,15,4180.184,-1177.931,146.7683,0,0,0,100,0),
(@PATH,16,4173.272,-1181.968,146.1433,0,0,0,100,0),
(@PATH,17,4167.034,-1193.434,144.6433,0,0,0,100,0),
(@PATH,18,4161.722,-1192.395,143.3878,0,0,0,100,0),
(@PATH,19,4156.964,-1196.051,142.0128,0,0,0,100,0),
(@PATH,20,4139.23,-1195.387,137.6378,0,0,0,100,0),
(@PATH,21,4130.558,-1193.161,135.4467,0,0,0,100,0),
(@PATH,22,4125.635,-1190.833,134.1967,0,0,0,100,0);

-- Pathing for Onslaught Infantry Entry: 27330
SET @NPC := 114260;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4143.703,`position_y`=-1263.341,`position_z`=165.6449 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4134.463,-1269.558,165.5816,0,0,0,100,0),
(@PATH,2,4130.955,-1277.715,165.5688,0,0,0,100,0),
(@PATH,3,4129.98,-1283.602,165.6149,0,0,0,100,0),
(@PATH,4,4135.784,-1294.637,165.6562,0,0,0,100,0),
(@PATH,5,4148.329,-1300.336,165.6449,0,0,0,100,0),
(@PATH,6,4162.814,-1289.61,165.6205,0,0,0,100,0),
(@PATH,7,4165.03,-1281.913,165.5997,0,0,0,100,0),
(@PATH,8,4162.265,-1272.911,165.5582,0,0,0,100,0),
(@PATH,9,4155.306,-1266.831,165.5407,0,0,0,100,0),
(@PATH,10,4143.703,-1263.341,165.6449,0,0,0,100,0);

-- Pathing for Onslaught Infantry Entry: 27330
SET @NPC := 114255;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4212.084,`position_y`=-1224.978,`position_z`=148.6749 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4201.98,-1211.429,148.0499,0,0,0,100,0),
(@PATH,2,4212.084,-1224.978,148.6749,0,0,0,100,0),
(@PATH,3,4213.772,-1244.515,149.1375,0,0,0,100,0),
(@PATH,4,4211.135,-1253.016,149.6375,0,0,0,100,0),
(@PATH,5,4217.994,-1271.88,150.8474,0,0,0,100,0),
(@PATH,6,4211.135,-1253.016,149.6375,0,0,0,100,0),
(@PATH,7,4213.772,-1244.515,149.1375,0,0,0,100,0),
(@PATH,8,4212.084,-1224.978,148.6749,0,0,0,100,0);

-- Pathing for Onslaught Bloodhound Entry: 27329
SET @NPC := 114155;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4004.03,`position_y`=-1318.242,`position_z`=136.0096 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4009.201,-1294.716,134.5134,0,0,0,100,0),
(@PATH,2,4009.412,-1263,133.4096,0,0,0,100,0),
(@PATH,3,4009.201,-1294.716,134.5134,0,0,0,100,0),
(@PATH,4,4004.03,-1318.242,136.0096,0,0,0,100,0);

-- Pathing for Onslaught Bloodhound Entry: 27329
SET @NPC := 114152;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4203.102,`position_y`=-1174.582,`position_z`=150.138 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4197.586,-1148.387,151.2417,0,0,0,100,0),
(@PATH,2,4203.102,-1174.582,150.138,0,0,0,100,0),
(@PATH,3,4209.215,-1197.404,149.513,0,0,0,100,0),
(@PATH,4,4225.328,-1218.085,148.7999,0,0,0,100,0),
(@PATH,5,4209.215,-1197.404,149.513,0,0,0,100,0),
(@PATH,6,4203.102,-1174.582,150.138,0,0,0,100,0);

-- Pathing for Onslaught Bloodhound Entry: 27329
SET @NPC := 114147;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4088.284,`position_y`=-1154.735,`position_z`=131.2158 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4080.528,-1173.253,131.2181,0,0,0,100,0),
(@PATH,2,4124.581,-1178.971,134.3217,0,0,0,100,0),
(@PATH,3,4080.528,-1173.253,131.2181,0,0,0,100,0),
(@PATH,4,4088.284,-1154.735,131.2158,0,0,0,100,0),
(@PATH,5,4101.193,-1137.309,132.9601,0,0,0,100,0),
(@PATH,6,4088.284,-1154.735,131.2158,0,0,0,100,0);

-- Pathing for Onslaught Bloodhound Entry: 27329
SET @NPC := 114145;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4120.572,`position_y`=-1305.189,`position_z`=167.5825 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4114.463,-1321.061,170.5825,0,0,0,100,0),
(@PATH,2,4123.832,-1345.334,163.4701,0,0,0,100,0),
(@PATH,3,4114.428,-1321.131,170.5825,0,0,0,100,0),
(@PATH,4,4120.572,-1305.189,167.5825,0,0,0,100,0),
(@PATH,5,4147.363,-1322.658,163.5784,0,0,0,100,0),
(@PATH,6,4120.572,-1305.189,167.5825,0,0,0,100,0);

-- Pathing for Onslaught Bloodhound Entry: 27329
SET @NPC := 114146;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4180.144,`position_y`=-1285.187,`position_z`=163.3783 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4184.505,-1291.101,163.2533,0,0,0,100,0),
(@PATH,2,4180.144,-1285.187,163.3783,0,0,0,100,0),
(@PATH,3,4180.722,-1266.006,162.8794,0,0,0,100,0),
(@PATH,4,4177.455,-1244.869,162.6294,0,0,0,100,0),
(@PATH,5,4158.622,-1249.703,162.3087,0,0,0,100,0),
(@PATH,6,4177.455,-1244.869,162.6294,0,0,0,100,0),
(@PATH,7,4180.722,-1266.006,162.8794,0,0,0,100,0),
(@PATH,8,4180.144,-1285.187,163.3783,0,0,0,100,0);

-- Pathing for Onslaught Bloodhound Entry: 27329
SET @NPC := 114151;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4035.906,`position_y`=-1141.726,`position_z`=131.4514 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4050.707,-1135.682,131.7014,0,0,0,100,0),
(@PATH,2,4062.477,-1131.132,132.621,0,0,0,100,0),
(@PATH,3,4050.707,-1135.682,131.7014,0,0,0,100,0),
(@PATH,4,4035.906,-1141.726,131.4514,0,0,0,100,0),
(@PATH,5,4030.492,-1128.27,134.7465,0,0,0,100,0),
(@PATH,6,4028.401,-1118.301,136.3715,0,0,0,100,0),
(@PATH,7,4030.492,-1128.27,134.7465,0,0,0,100,0),
(@PATH,8,4035.906,-1141.726,131.4514,0,0,0,100,0);

-- Pathing for Onslaught Bloodhound Entry: 27329
SET @NPC := 114150;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4037.262,`position_y`=-1222.826,`position_z`=133.6355 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4039.188,-1202.071,132.2605,0,0,0,100,0),
(@PATH,2,4039.754,-1179.579,131.7407,0,0,0,100,0),
(@PATH,3,4039.977,-1167.872,131.8657,0,0,0,100,0),
(@PATH,4,4039.754,-1179.579,131.7407,0,0,0,100,0),
(@PATH,5,4039.188,-1202.071,132.2605,0,0,0,100,0),
(@PATH,6,4037.262,-1222.826,133.6355,0,0,0,100,0);

-- Pathing for Deathbringer Revenant Entry: 27382
SET @NPC := 119071;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4824.659,`position_y`=-580.9394,`position_z`=165.2337 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4814.773,-582.5805,163.8048,0,0,0,100,0),
(@PATH,2,4824.659,-580.9394,165.2337,0,0,0,100,0),
(@PATH,3,4831.233,-586.6505,164.223,0,0,0,100,0),
(@PATH,4,4830.003,-600.0768,163.3118,0,0,0,100,0),
(@PATH,5,4813.818,-592.593,163.793,0,0,0,100,0),
(@PATH,6,4830.003,-600.0768,163.3118,0,0,0,100,0),
(@PATH,7,4831.233,-586.6505,164.223,0,0,0,100,0),
(@PATH,8,4824.659,-580.9394,165.2337,0,0,0,100,0);

-- Pathing for Deathbringer Revenant Entry: 27382
SET @NPC := 119072;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4720.807,`position_y`=-557.7733,`position_z`=167.2897 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4742.271,-559.9733,167.2543,0,0,0,100,0),
(@PATH,2,4720.807,-557.7733,167.2897,0,0,0,100,0),
(@PATH,3,4700.919,-556.6257,166.9408,0,0,0,100,0),
(@PATH,4,4720.807,-557.7733,167.2897,0,0,0,100,0);

-- Pathing for Deathbringer Revenant Entry: 27382
SET @NPC := 119068;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4844.053,`position_y`=-584.225,`position_z`=160.64 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4838.941,-567.2607,162.6483,0,0,0,100,0),
(@PATH,2,4813.387,-553.0447,163.3354,0,0,0,100,0),
(@PATH,3,4794.94,-559.1481,163.3595,0,0,0,100,0),
(@PATH,4,4784.595,-577.4869,162.5643,0,0,0,100,0),
(@PATH,5,4786.519,-598.1761,162.0602,0,0,0,100,0),
(@PATH,6,4803.322,-615.4664,160.5656,0,0,0,100,0),
(@PATH,7,4818.432,-629.1903,159.2296,0,0,0,100,0),
(@PATH,8,4839.938,-628.5002,158.5843,0,0,0,100,0),
(@PATH,9,4850.498,-601.7881,158.2996,0,0,0,100,0),
(@PATH,10,4844.053,-584.225,160.64,0,0,0,100,0);

-- Pathing for Fordragon Medic Entry: 27543
SET @NPC := 133503;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4579.435,`position_y`=1424.634,`position_z`=189.2658 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4579.879,1428.706,189.2658,0,0,0,100,0),
(@PATH,2,4579.435,1424.634,189.2658,0,0,0,100,0),
(@PATH,3,4579.449,1423.632,189.2658,0,0,0,100,0),
(@PATH,4,4579.435,1424.634,189.2658,0,0,0,100,0),
(@PATH,5,4574.768,1424.38,189.2658,0,0,0,100,0),
(@PATH,6,4571.274,1424.491,189.2658,0,0,0,100,0),
(@PATH,7,4564.26,1424.634,189.3568,0,0,0,100,0),
(@PATH,8,4571.274,1424.491,189.2658,0,0,0,100,0),
(@PATH,9,4574.768,1424.38,189.2658,0,0,0,100,0),
(@PATH,10,4579.435,1424.634,189.2658,0,0,0,100,0);

-- Wounded Fordragon Soldier should not have random movement
UPDATE `creature` SET `modelid`=0,`spawndist`=0,`MovementType`=0 WHERE `id`=27517;
-- Remove random movement from some creatures
UPDATE `creature` SET `modelid`=0,`spawndist`=0,`MovementType`=0 WHERE `guid` IN (133427,133428,133429,133165,133166,133167,133168,133169);
-- Fix some flying creatures
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (26575,26577,26578,31269);

-- Pathing for Wastes Taskmaster Entry: 26493
SET @NPC := 88212;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4377.677,`position_y`=748.6854,`position_z`=57.76371 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4352.628,751.0374,64.04988,0,0,0,100,0),
(@PATH,2,4377.531,748.6934,57.76371,0,0,0,100,0),
(@PATH,3,4400.995,733.3605,54.01371,0,0,0,100,0),
(@PATH,4,4419.966,710.4111,54.01371,0,0,0,100,0),
(@PATH,5,4429.461,692.8457,57.15271,0,0,0,100,0),
(@PATH,6,4433.255,674.6249,64.52771,0,0,0,100,0),
(@PATH,7,4429.461,692.8457,57.15271,0,0,0,100,0),
(@PATH,8,4419.966,710.4111,54.01371,0,0,0,100,0),
(@PATH,9,4400.995,733.3605,54.01371,0,0,0,100,0),
(@PATH,10,4377.677,748.6854,57.76371,0,0,0,100,0);
-- Remove dup spawns
DELETE FROM `creature` WHERE `guid` IN (88206,88209);
DELETE FROM `creature_addon` WHERE `guid` IN (88206,88209);

-- Pathing for Wastes Taskmaster Entry: 26493
SET @NPC := 88207;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4359.022,`position_y`=312.2534,`position_z`=46.33416 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4342.439,323.4258,54.45916,0,0,0,100,0),
(@PATH,2,4326.469,330.6508,59.02667,0,0,0,100,0),
(@PATH,3,4342.379,323.4586,54.45916,0,0,0,100,0),
(@PATH,4,4359.022,312.2534,46.33416,0,0,0,100,0),
(@PATH,5,4381.802,307.3024,45.51707,0,0,0,100,0),
(@PATH,6,4404.153,309.183,44.67593,0,0,0,100,0),
(@PATH,7,4424.143,326.160,43.69754,0,0,0,100,0),
(@PATH,8,4437.828,371.522,50.92235,0,0,0,100,0),
(@PATH,9,4424.143,326.160,43.69754,0,0,0,100,0),
(@PATH,10,4404.153,309.183,44.67593,0,0,0,100,0),
(@PATH,11,4381.802,307.3024,45.51707,0,0,0,100,0),
(@PATH,12,4359.022,312.2534,46.33416,0,0,0,100,0);

-- Pathing for Wastes Taskmaster Entry: 26493
SET @NPC := 107422;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4583.09,`position_y`=449.509,`position_z`=85.0521 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4597.782,464.2024,87.99337,0,0,0,100,0),
(@PATH,2,4598.326,484.3582,89.57731,0,0,0,100,0),
(@PATH,3,4576.441,508.5522,86.93581,0,0,0,100,0),
(@PATH,4,4552.492,508.0537,83.60313,0,0,0,100,0),
(@PATH,5,4530.917,495.7092,75.07985,0,0,0,100,0),
(@PATH,6,4516.025,475.0746,66.82504,0,0,0,100,0),
(@PATH,7,4531.256,470.2323,65.82985,0,0,0,100,0),
(@PATH,8,4548.098,470.0200,65.83256,0,0,0,100,0),
(@PATH,9,4563.167,479.6988,65.98953,0,0,0,100,0),
(@PATH,10,4573.489,472.9183,65.94758,0,0,0,100,0),
(@PATH,11,4562.96,464.848,65.7068,0,0,0,100,0),
(@PATH,12,4542.92,458.159,65.6769,0,0,0,100,0),
(@PATH,13,4518.58,445.425,66.5737,0,0,0,100,0),
(@PATH,14,4525.28,425.042,71.7196,0,0,0,100,0),
(@PATH,15,4543.76,430.092,77.0235,0,0,0,100,0),
(@PATH,16,4566.25,441.529,81.8306,0,0,0,100,0),
(@PATH,17,4583.09,449.509,85.0521,0,0,0,100,0);
-- Remove dup spawns
DELETE FROM `creature` WHERE `guid` IN (107423);
DELETE FROM `creature_addon` WHERE `guid` IN (107423);

-- Xink's Shreeder should not be spawned
DELETE FROM `creature` WHERE `guid` IN (113110);
DELETE FROM `creature_addon` WHERE `guid` IN (113110);

-- Pathing for Jormungar Tunneler Entry: 26467
SET @NPC := 104791;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4612.315,`position_y`=636.7607,`position_z`=100.5706 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4640.815,634.1915,106.7286,0,0,0,100,0),
(@PATH,2,4612.315,636.7607,100.5706,0,0,0,100,0),
(@PATH,3,4593.722,640.6462,98.23782,0,0,0,100,0),
(@PATH,4,4580.929,641.9921,96.11282,0,0,0,100,0),
(@PATH,5,4573.083,641.0912,94.36282,0,0,0,100,0),
(@PATH,6,4580.929,641.9921,96.11282,0,0,0,100,0),
(@PATH,7,4593.722,640.6462,98.23782,0,0,0,100,0),
(@PATH,8,4612.315,636.7607,100.5706,0,0,0,100,0);

-- Pathing for Jormungar Tunneler Entry: 26467
SET @NPC := 104769;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4769.156,`position_y`=901.4236,`position_z`=125.8586 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4771.51,911.3878,128.7336,0,0,0,100,0),
(@PATH,2,4769.156,901.4236,125.8586,0,0,0,100,0),
(@PATH,3,4767.545,890.4188,126.1252,0,0,0,100,0),
(@PATH,4,4756.109,884.761,122.0654,0,0,0,100,0),
(@PATH,5,4746.342,886.1551,121.5654,0,0,0,100,0),
(@PATH,6,4740.95,894.7586,123.6904,0,0,0,100,0),
(@PATH,7,4736.5,900.9068,126.8635,0,0,0,100,0),
(@PATH,8,4729.145,903.9944,131.2424,0,0,0,100,0),
(@PATH,9,4722.184,906.6729,133.8674,0,0,0,100,0),
(@PATH,10,4712.984,911.3162,133.2424,0,0,0,100,0),
(@PATH,11,4705.177,917.8481,131.6174,0,0,0,100,0),
(@PATH,12,4712.984,911.3162,133.2424,0,0,0,100,0),
(@PATH,13,4722.184,906.6729,133.8674,0,0,0,100,0),
(@PATH,14,4729.145,903.9944,131.2424,0,0,0,100,0),
(@PATH,15,4736.5,900.9068,126.8635,0,0,0,100,0),
(@PATH,16,4740.95,894.7586,123.6904,0,0,0,100,0),
(@PATH,17,4746.262,886.2822,121.5654,0,0,0,100,0),
(@PATH,18,4756.109,884.761,122.0654,0,0,0,100,0),
(@PATH,19,4767.545,890.4188,126.1252,0,0,0,100,0),
(@PATH,20,4769.156,901.4236,125.8586,0,0,0,100,0);

-- Pathing for Jormungar Tunneler Entry: 26467
SET @NPC := 104790;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4619.419,`position_y`=679.2484,`position_z`=99.87684 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4624.186,669.2997,101.106,0,0,0,100,0),
(@PATH,2,4609.159,667.6816,98.85598,0,0,0,100,0),
(@PATH,3,4592.208,667.7223,96.80053,0,0,0,100,0),
(@PATH,4,4577.215,663.3645,95.11282,0,0,0,100,0),
(@PATH,5,4592.208,667.7223,96.80053,0,0,0,100,0),
(@PATH,6,4609.159,667.6816,98.85598,0,0,0,100,0),
(@PATH,7,4624.186,669.2997,101.106,0,0,0,100,0),
(@PATH,8,4619.419,679.2484,99.87684,0,0,0,100,0),
(@PATH,9,4627.18,691.6667,101.8855,0,0,0,100,0),
(@PATH,10,4619.419,679.2484,99.87684,0,0,0,100,0);

-- Pathing for Ice Heart Jormungar Spawn Entry: 26359
SET @NPC := 119285;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4823.363,`position_y`=740.2496,`position_z`=115.1009 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4828.03,734.9659,116.659,0,0,0,100,0),
(@PATH,2,4828.03,734.9659,116.659,0,0,0,100,0), -- turn to 1.134464
(@PATH,3,4823.363,740.2496,115.1009,0,0,0,100,0);

-- Pathing for Ice Heart Jormungar Spawn Entry: 26359
SET @NPC := 119366;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4917.949,`position_y`=648.9772,`position_z`=135.0675 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4912.365,652.8351,133.7414,0,0,0,100,0),
(@PATH,2,4917.949,648.9772,135.0675,2000,0,0,100,0);

-- Pathing for Ice Heart Jormungar Spawn Entry: 26359
SET @NPC := 119311;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4913.726,`position_y`=658.164,`position_z`=133.4067 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4921.075,667.6257,134.4295,0,0,0,100,0),
(@PATH,2,4910.775,675.0512,132.6329,2000,0,0,100,0),
(@PATH,3,4915.398,658.9547,133.7801,0,0,0,100,0),
(@PATH,4,4913.726,658.164,133.4067,0,0,0,100,0);

-- Pathing for Ice Heart Jormungar Feeder Entry: 26358
SET @NPC := 119094;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4948.506,`position_y`=690.6748,`position_z`=136.1326 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4948.392,691.1043,136.0691,0,0,0,100,0),
(@PATH,2,4946.161,690.3124,136.0534,0,0,0,100,0),
(@PATH,3,4944.864,687.5475,136.2153,0,0,0,100,0),
(@PATH,4,4946.129,685.3868,136.4649,0,0,0,100,0),
(@PATH,5,4948.506,690.6748,136.1326,0,0,0,100,0);

-- Pathing for Ice Heart Jormungar Feeder Entry: 26358
SET @NPC := 119086;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4801.301,`position_y`=529.4807,`position_z`=120.2881 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4828.505,492.8211,117.4465,0,0,0,100,0),
(@PATH,2,4801.301,529.4807,120.2881,0,0,0,100,0);

-- Pathing for Crystalline Ice Elemental Entry: 26316
SET @NPC := 115063;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4781.875,`position_y`=634.5107,`position_z`=167.1951 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4794.498,643.2051,165.9451,0,0,0,100,0),
(@PATH,2,4803.139,643.8461,164.8874,0,0,0,100,0),
(@PATH,3,4811.448,646.0357,163.7624,0,0,0,100,0),
(@PATH,4,4823.744,650.6309,162.2624,0,0,0,100,0),
(@PATH,5,4835.242,658.0538,161.2733,0,0,0,100,0),
(@PATH,6,4823.744,650.6309,162.2624,0,0,0,100,0),
(@PATH,7,4811.569,646.0859,163.6374,0,0,0,100,0),
(@PATH,8,4803.139,643.8461,164.8874,0,0,0,100,0),
(@PATH,9,4794.498,643.2051,165.9451,0,0,0,100,0),
(@PATH,10,4781.875,634.5107,167.1951,0,0,0,100,0),
(@PATH,11,4785.588,644.8525,166.9451,0,0,0,100,0),
(@PATH,12,4791.44,654.8226,166.3201,0,0,0,100,0),
(@PATH,13,4797.857,660.5208,165.0701,0,0,0,100,0),
(@PATH,14,4799.611,674.8367,164.5891,0,0,0,100,0),
(@PATH,15,4813.303,674.3536,163.0113,0,0,0,100,0),
(@PATH,16,4799.611,674.8367,164.5891,0,0,0,100,0),
(@PATH,17,4797.857,660.5208,165.0701,0,0,0,100,0),
(@PATH,18,4791.44,654.8226,166.3201,0,0,0,100,0),
(@PATH,19,4785.588,644.8525,166.9451,0,0,0,100,0),
(@PATH,20,4781.875,634.5107,167.1951,0,0,0,100,0);

-- Pathing for Crystalline Ice Elemental Entry: 26316
SET @NPC := 115075;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4854.134,`position_y`=748.6946,`position_z`=163.425 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4861.722,749.3528,162.425,0,0,0,100,0),
(@PATH,2,4854.134,748.6946,163.425,0,0,0,100,0),
(@PATH,3,4844.537,755.6428,164.675,0,0,0,100,0),
(@PATH,4,4841.066,750.5629,164.55,0,0,0,100,0),
(@PATH,5,4835.392,745.4681,165.175,0,0,0,100,0),
(@PATH,6,4833.364,738.6474,164.925,0,0,0,100,0),
(@PATH,7,4826.768,735.8594,165.7997,0,0,0,100,0),
(@PATH,8,4823.78,731.0496,166.0925,0,0,0,100,0),
(@PATH,9,4830.218,721.9979,164.4675,0,0,0,100,0),
(@PATH,10,4832.163,711.6559,163.8425,0,0,0,100,0),
(@PATH,11,4830.218,721.9979,164.4675,0,0,0,100,0),
(@PATH,12,4823.78,731.0496,166.0925,0,0,0,100,0),
(@PATH,13,4826.768,735.8594,165.7997,0,0,0,100,0),
(@PATH,14,4833.364,738.6474,164.925,0,0,0,100,0),
(@PATH,15,4835.392,745.4681,165.175,0,0,0,100,0),
(@PATH,16,4841.066,750.5629,164.55,0,0,0,100,0),
(@PATH,17,4844.537,755.6428,164.675,0,0,0,100,0),
(@PATH,18,4854.134,748.6946,163.425,0,0,0,100,0);

-- Pathing for Copperpot Goon Entry: 32476
SET @NPC := 88134;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=8872.63,`position_y`=-1333.161,`position_z`=1031.999 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,8871.958,-1327.431,1031.499,0,0,0,100,0),
(@PATH,2,8872.63,-1333.161,1031.999,0,0,0,100,0),
(@PATH,3,8879.247,-1338.27,1032.157,0,0,0,100,0),
(@PATH,4,8889.885,-1346.926,1032.782,0,0,0,100,0),
(@PATH,5,8891.149,-1356.145,1033.532,0,0,0,100,0),
(@PATH,6,8887.743,-1365.031,1033.782,0,0,0,100,0),
(@PATH,7,8892.104,-1370.989,1034.088,0,0,0,100,0),
(@PATH,8,8887.743,-1365.031,1033.782,0,0,0,100,0),
(@PATH,9,8891.149,-1356.145,1033.532,0,0,0,100,0),
(@PATH,10,8889.885,-1346.926,1032.782,0,0,0,100,0),
(@PATH,11,8879.247,-1338.27,1032.157,0,0,0,100,0),
(@PATH,12,8872.63,-1333.161,1031.999,0,0,0,100,0);

-- Pathing for Ice Steppe Bull Entry: 30445
SET @NPC := 118284;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7376.002,`position_y`=-1355.971,`position_z`=909.9191 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7352.206,-1351.045,906.9864,0,0,0,100,0),
(@PATH,2,7340.969,-1338.953,905.1114,0,0,0,100,0),
(@PATH,3,7351.564,-1328.227,905.5369,0,0,0,100,0),
(@PATH,4,7340.969,-1338.953,905.1114,0,0,0,100,0),
(@PATH,5,7352.206,-1351.045,906.9864,0,0,0,100,0),
(@PATH,6,7376.002,-1355.971,909.9191,0,0,0,100,0),
(@PATH,7,7382.768,-1386.229,913.2452,0,0,0,100,0),
(@PATH,8,7372.836,-1405.384,912.6314,0,0,0,100,0),
(@PATH,9,7352.176,-1410.842,913.0703,0,0,0,100,0),
(@PATH,10,7326.558,-1392.288,910.4369,0,0,0,100,0),
(@PATH,11,7352.176,-1410.842,913.0703,0,0,0,100,0),
(@PATH,12,7372.836,-1405.384,912.6314,0,0,0,100,0),
(@PATH,13,7382.768,-1386.229,913.2452,0,0,0,100,0),
(@PATH,14,7376.002,-1355.971,909.9191,0,0,0,100,0);

-- Pathing for Ice Steppe Bull Entry: 30445
SET @NPC := 98793;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7260.412,`position_y`=-1475.838,`position_z`=916.7933 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7286.341,-1473.51,915.4174,0,0,0,100,0),
(@PATH,2,7336.023,-1439.56,914.6334,0,0,0,100,0),
(@PATH,3,7343.61,-1416.112,912.5703,0,0,0,100,0),
(@PATH,4,7341.59,-1382.241,910.0731,0,0,0,100,0),
(@PATH,5,7338.099,-1366.292,908.6114,0,0,0,100,0),
(@PATH,6,7303.811,-1338.705,905.0057,0,0,0,100,0),
(@PATH,7,7292.695,-1337.109,907.5106,0,0,0,100,0),
(@PATH,8,7276.847,-1343.511,910.2606,0,0,0,100,0),
(@PATH,9,7260.892,-1356.204,911.0975,0,0,0,100,0),
(@PATH,10,7240.93,-1370.671,914.7305,0,0,0,100,0),
(@PATH,11,7213.619,-1399.302,914.2002,0,0,0,100,0),
(@PATH,12,7189.655,-1425.595,918.1469,0,0,0,100,0),
(@PATH,13,7191.982,-1465.112,919.457,0,0,0,100,0),
(@PATH,14,7198.586,-1486.591,921.3929,0,0,0,100,0),
(@PATH,15,7218.635,-1503.999,920.0897,0,0,0,100,0),
(@PATH,16,7260.412,-1475.838,916.7933,0,0,0,100,0);

-- Pathing for Son of Hodir Entry: 30262
SET @NPC := 29809;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7416.563,`position_y`=-2664.562,`position_z`=809.4573 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7403.721,-2655.579,811.2039,0,0,0,100,0),
(@PATH,2,7386.667,-2636.872,814.9755,0,0,0,100,0),
(@PATH,3,7354.603,-2629.654,814.959,0,0,0,100,0),
(@PATH,4,7316.168,-2635.257,814.9688,0,0,0,100,0),
(@PATH,5,7280.421,-2633.477,814.9333,0,0,0,100,0),
(@PATH,6,7239.193,-2639.471,814.0367,0,0,0,100,0),
(@PATH,7,7237.307,-2637.684,814.1631,3000,0,0,100,0),
(@PATH,8,7263.692,-2629.174,814.8972,0,0,0,100,0),
(@PATH,9,7303.066,-2634.208,814.9536,0,0,0,100,0),
(@PATH,10,7351.103,-2626.177,814.9425,0,0,0,100,0),
(@PATH,11,7397.674,-2644.868,813.0914,0,0,0,100,0),
(@PATH,12,7416.563,-2664.562,809.4573,3000,0,0,100,0);

-- Pathing for Son of Hodir Entry: 30262
SET @NPC := 106336;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7273.659,`position_y`=-2895.491,`position_z`=824.0071 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7234.047,-2884.384,824.7147,4000,0,0,100,0),
(@PATH,2,7345.53,-2901.831,821.7584,0,0,0,100,0),
(@PATH,3,7353.463,-2889.021,816.0681,0,0,0,100,0),
(@PATH,4,7352.824,-2881.323,812.3181,4000,0,0,100,0),
(@PATH,5,7349.912,-2903.916,821.2584,0,0,0,100,0),
(@PATH,6,7322.363,-2904.707,823.4943,0,0,0,100,0),
(@PATH,7,7273.659,-2895.491,824.0071,0,0,0,100,0);

-- Pathing for Son of Hodir Entry: 30262
SET @NPC := 106501;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7266.733,`position_y`=-2802.21,`position_z`=777.0706 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7234.09,-2801.132,778.1149,0,0,0,100,0),
(@PATH,2,7213.235,-2780.434,777.3621,0,0,0,100,0),
(@PATH,3,7201.17,-2765.837,777.0167,0,0,0,100,0),
(@PATH,4,7200.926,-2751.148,777.5167,4000,0,0,100,0),
(@PATH,5,7201.17,-2765.837,777.0167,0,0,0,100,0),
(@PATH,6,7213.235,-2780.434,777.3621,0,0,0,100,0),
(@PATH,7,7234.09,-2801.132,778.1149,0,0,0,100,0),
(@PATH,8,7266.733,-2802.21,777.0706,0,0,0,100,0),
(@PATH,9,7300.729,-2792.09,775.1332,0,0,0,100,0),
(@PATH,10,7335.957,-2783.621,771.6161,0,0,0,100,0),
(@PATH,11,7344.21,-2777.575,769.3661,0,0,0,100,0),
(@PATH,12,7345.448,-2762.184,762.9899,4000,0,0,100,0),
(@PATH,13,7344.21,-2777.575,769.3661,0,0,0,100,0),
(@PATH,14,7335.957,-2783.621,771.6161,0,0,0,100,0),
(@PATH,15,7300.729,-2792.09,775.1332,0,0,0,100,0),
(@PATH,16,7266.733,-2802.21,777.0706,0,0,0,100,0);

-- Pathing for Son of Hodir Entry: 30262
SET @NPC := 111687;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7278.651,`position_y`=-2512.9,`position_z`=753.4233 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7275.243,-2493.013,753.7523,0,0,0,100,0),
(@PATH,2,7282.448,-2460.509,755.7845,0,0,0,100,0),
(@PATH,3,7295.972,-2445.3,755.5345,0,0,0,100,0),
(@PATH,4,7311.224,-2441.711,753.3485,0,0,0,100,0),
(@PATH,5,7331.502,-2463.935,750.0985,0,0,0,100,0),
(@PATH,6,7331.37,-2495.4,749.5884,0,0,0,100,0),
(@PATH,7,7322.564,-2524.512,748.8254,0,0,0,100,0),
(@PATH,8,7278.651,-2512.9,753.4233,0,0,0,100,0);

-- Pathing for Ice Steppe Rhino Entry: 29469
SET @NPC := 98744;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7336.483,`position_y`=-1382.206,`position_z`=910.1981 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7328.273,-1361.54,908.5057,0,0,0,100,0),
(@PATH,2,7288.939,-1354.943,907.3856,0,0,0,100,0),
(@PATH,3,7275.758,-1365.668,908.6356,0,0,0,100,0),
(@PATH,4,7261.542,-1402.325,908.8148,0,0,0,100,0),
(@PATH,5,7263.854,-1436.428,908.1765,0,0,0,100,0),
(@PATH,6,7317.999,-1436.262,913.4809,0,0,0,100,0),
(@PATH,7,7328.042,-1416.983,912.5723,0,0,0,100,0),
(@PATH,8,7336.483,-1382.206,910.1981,0,0,0,100,0);

-- Pathing for Lightning Sentry Entry: 26407
SET @NPC := 99648;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3591.459,`position_y`=-5050.063,`position_z`=194.8281 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3585.034,-5056.352,197.2041,0,0,0,100,0),
(@PATH,2,3580.897,-5060.692,199.5894,0,0,0,100,0),
(@PATH,3,3576.53,-5065.725,201.8281,0,0,0,100,0),
(@PATH,4,3572.318,-5073.984,206.2946,0,0,0,100,0),
(@PATH,5,3565.477,-5083.276,213,0,0,0,100,0),
(@PATH,6,3557.625,-5093.315,221.125,0,0,0,100,0),
(@PATH,7,3548.768,-5098.572,226.25,0,0,0,100,0),
(@PATH,8,3540.006,-5105.695,231.7135,0,0,0,100,0),
(@PATH,9,3548.768,-5098.572,226.25,0,0,0,100,0),
(@PATH,10,3557.371,-5093.475,221.125,0,0,0,100,0),
(@PATH,11,3565.477,-5083.276,213,0,0,0,100,0),
(@PATH,12,3572.318,-5073.984,206.2946,0,0,0,100,0),
(@PATH,13,3576.404,-5065.969,201.8281,0,0,0,100,0),
(@PATH,14,3580.897,-5060.692,199.5894,0,0,0,100,0),
(@PATH,15,3585.034,-5056.352,197.2041,0,0,0,100,0),
(@PATH,16,3591.459,-5050.063,194.8281,0,0,0,100,0),
(@PATH,17,3600.07,-5043.59,191.0811,0,0,0,100,0),
(@PATH,18,3606.279,-5038.049,188.7061,0,0,0,100,0),
(@PATH,19,3600.07,-5043.59,191.0811,0,0,0,100,0),
(@PATH,20,3591.459,-5050.063,194.8281,0,0,0,100,0);

-- Pathing for Lightning Sentry Entry: 26407
SET @NPC := 99651;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3637.915,`position_y`=-5093.193,`position_z`=164.6507 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3643.601,-5084.117,165.9007,0,0,0,100,0),
(@PATH,2,3645.005,-5066.616,169.8634,0,0,0,100,0),
(@PATH,3,3643.956,-5055.742,171.2384,0,0,0,100,0),
(@PATH,4,3643.148,-5049.692,173.2223,0,0,0,100,0),
(@PATH,5,3641.873,-5041.596,176.0178,0,0,0,100,0),
(@PATH,6,3640.804,-5034.935,177.3634,0,0,0,100,0),
(@PATH,7,3641.873,-5041.596,176.0178,0,0,0,100,0),
(@PATH,8,3643.148,-5049.692,173.2223,0,0,0,100,0),
(@PATH,9,3643.956,-5055.742,171.2384,0,0,0,100,0),
(@PATH,10,3644.994,-5066.334,169.8634,0,0,0,100,0),
(@PATH,11,3643.601,-5084.117,165.9007,0,0,0,100,0),
(@PATH,12,3637.915,-5093.193,164.6507,0,0,0,100,0),
(@PATH,13,3629.779,-5100.097,164.2347,0,0,0,100,0),
(@PATH,14,3637.915,-5093.193,164.6507,0,0,0,100,0);

-- Pathing for Lightning Sentry Entry: 26407
SET @NPC := 99650;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3395.451,`position_y`=-4982.203,`position_z`=297.409 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3383.966,-4977.569,299.784,0,0,0,100,0),
(@PATH,2,3369.488,-4976.631,303.159,0,0,0,100,0),
(@PATH,3,3362.556,-4977.602,305.1951,0,0,0,100,0),
(@PATH,4,3369.488,-4976.631,303.159,0,0,0,100,0),
(@PATH,5,3383.966,-4977.569,299.784,0,0,0,100,0),
(@PATH,6,3395.451,-4982.203,297.409,0,0,0,100,0),
(@PATH,7,3403.15,-4986.861,293.829,0,0,0,100,0),
(@PATH,8,3411.484,-4994.711,287.954,0,0,0,100,0),
(@PATH,9,3418.514,-5001.556,284.4171,0,0,0,100,0),
(@PATH,10,3411.484,-4994.711,287.954,0,0,0,100,0),
(@PATH,11,3403.156,-4986.87,293.829,0,0,0,100,0),
(@PATH,12,3395.451,-4982.203,297.409,0,0,0,100,0);

-- Pathing for Lightning Sentry Entry: 26407
SET @NPC := 99647;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3420.094,`position_y`=-5029.398,`position_z`=274.1862 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3421.023,-5019.445,278.1671,0,0,0,100,0),
(@PATH,2,3420.552,-5009.417,281.4171,0,0,0,100,0),
(@PATH,3,3421.138,-5019.164,278.1671,0,0,0,100,0),
(@PATH,4,3420.094,-5029.398,274.1862,0,0,0,100,0),
(@PATH,5,3420.084,-5037.778,270.3445,0,0,0,100,0),
(@PATH,6,3419.255,-5044.619,266.5906,0,0,0,100,0),
(@PATH,7,3420.822,-5054.514,261.6499,0,0,0,100,0),
(@PATH,8,3428.125,-5062.5,255.7156,0,0,0,100,0),
(@PATH,9,3434.531,-5067.101,251.4685,0,0,0,100,0),
(@PATH,10,3439.543,-5070.784,248.7806,0,0,0,100,0),
(@PATH,11,3444.791,-5075,244.9685,0,0,0,100,0),
(@PATH,12,3439.543,-5070.784,248.7806,0,0,0,100,0),
(@PATH,13,3434.531,-5067.101,251.4685,0,0,0,100,0),
(@PATH,14,3428.488,-5062.811,255.3406,0,0,0,100,0),
(@PATH,15,3420.822,-5054.514,261.6499,0,0,0,100,0),
(@PATH,16,3419.23,-5044.755,266.5906,0,0,0,100,0),
(@PATH,17,3420.288,-5038.148,270.1729,0,0,0,100,0),
(@PATH,18,3420.094,-5029.398,274.1862,0,0,0,100,0);

-- Pathing for Lightning Sentry Entry: 26407
SET @NPC := 99646;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3473.127,`position_y`=-5198.451,`position_z`=259.2329 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3482.563,-5200.125,254.2606,0,0,0,100,0),
(@PATH,2,3493.555,-5203.917,248.3856,0,0,0,100,0),
(@PATH,3,3502.439,-5207.417,245.2693,0,0,0,100,0),
(@PATH,4,3508.02,-5201.552,243.3943,0,0,0,100,0),
(@PATH,5,3512.727,-5193.701,240.5535,0,0,0,100,0),
(@PATH,6,3514.849,-5184.214,238.6785,0,0,0,100,0),
(@PATH,7,3515.547,-5176.61,237.4285,0,0,0,100,0),
(@PATH,8,3517.042,-5166.507,235.8108,0,0,0,100,0),
(@PATH,9,3518.691,-5155.448,235.0608,0,0,0,100,0),
(@PATH,10,3517.042,-5166.507,235.8108,0,0,0,100,0),
(@PATH,11,3515.547,-5176.61,237.4285,0,0,0,100,0),
(@PATH,12,3514.849,-5184.214,238.6785,0,0,0,100,0),
(@PATH,13,3512.727,-5193.701,240.5535,0,0,0,100,0),
(@PATH,14,3508.095,-5201.418,243.3943,0,0,0,100,0),
(@PATH,15,3502.439,-5207.417,245.2693,0,0,0,100,0),
(@PATH,16,3493.555,-5203.917,248.3856,0,0,0,100,0),
(@PATH,17,3482.563,-5200.125,254.2606,0,0,0,100,0),
(@PATH,18,3473.304,-5198.499,259.2329,0,0,0,100,0),
(@PATH,19,3460.635,-5194.872,265.9657,0,0,0,100,0),
(@PATH,20,3473.127,-5198.451,259.2329,0,0,0,100,0);

-- Pathing for Lightning Sentry Entry: 26407
SET @NPC := 99641;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3387.242,`position_y`=-5145.025,`position_z`=325.077 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3389.308,-5129.32,326.8031,0,0,0,100,0),
(@PATH,2,3386.938,-5121.034,326.8031,0,0,0,100,0),
(@PATH,3,3392.412,-5115.183,326.4281,0,0,0,100,0),
(@PATH,4,3396.002,-5105.536,325.4281,0,0,0,100,0),
(@PATH,5,3392.412,-5115.183,326.4281,0,0,0,100,0),
(@PATH,6,3386.938,-5121.034,326.8031,0,0,0,100,0),
(@PATH,7,3389.308,-5129.32,326.8031,0,0,0,100,0),
(@PATH,8,3387.242,-5145.025,325.077,0,0,0,100,0),
(@PATH,9,3386.143,-5164.068,324.577,0,0,0,100,0),
(@PATH,10,3380.827,-5178.86,326.6648,0,0,0,100,0),
(@PATH,11,3372.493,-5186.028,328.6648,0,0,0,100,0),
(@PATH,12,3380.827,-5178.86,326.6648,0,0,0,100,0),
(@PATH,13,3386.143,-5164.068,324.577,0,0,0,100,0),
(@PATH,14,3387.242,-5145.025,325.077,0,0,0,100,0);

-- Pathing for Runic War Golem Entry: 26347
SET @NPC := 118166;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3320.65,`position_y`=-5113.277,`position_z`=322.6168 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3322.563,-5122.774,322.6173,0,0,0,100,0),
(@PATH,2,3320.975,-5130.612,322.6162,0,0,0,100,0),
(@PATH,3,3314.87,-5139.458,322.6167,0,0,0,100,0),
(@PATH,4,3301.187,-5142.882,322.617,0,0,0,100,0),
(@PATH,5,3293.289,-5139.383,322.6163,0,0,0,100,0),
(@PATH,6,3287.069,-5133.253,322.6165,0,0,0,100,0),
(@PATH,7,3284.455,-5126.468,322.617,0,0,0,100,0),
(@PATH,8,3284.432,-5120.679,322.6172,0,0,0,100,0),
(@PATH,9,3288.142,-5115.017,322.6172,0,0,0,100,0),
(@PATH,10,3293.354,-5109.261,322.6165,0,0,0,100,0),
(@PATH,11,3301.061,-5106.675,322.6162,0,0,0,100,0),
(@PATH,12,3311.905,-5106.819,322.6147,0,0,0,100,0),
(@PATH,13,3320.65,-5113.277,322.6168,0,0,0,100,0);

-- Pathing for Runic War Golem Entry: 26347
SET @NPC := 118164;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3646.954,`position_y`=-5101.169,`position_z`=165.0127 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3645.989,-5127.884,165.5127,0,0,0,100,0),
(@PATH,2,3636.442,-5141.369,163.8923,0,0,0,100,0),
(@PATH,3,3627.73,-5146.558,164.2464,0,0,0,100,0),
(@PATH,4,3636.442,-5141.369,163.8923,0,0,0,100,0),
(@PATH,5,3645.989,-5127.884,165.5127,0,0,0,100,0),
(@PATH,6,3646.954,-5101.169,165.0127,0,0,0,100,0),
(@PATH,7,3645.203,-5068.576,169.4007,0,0,0,100,0),
(@PATH,8,3640.716,-5039.022,176.9444,0,0,0,100,0),
(@PATH,9,3645.203,-5068.576,169.4007,0,0,0,100,0),
(@PATH,10,3646.954,-5101.169,165.0127,0,0,0,100,0);

-- Pathing for Runic War Golem Entry: 26347
SET @NPC := 118157;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3359.965,`position_y`=-5051.063,`position_z`=324.4915 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3357.555,-5029.944,319.8653,0,0,0,100,0),
(@PATH,2,3356.47,-5017.849,316.0019,0,0,0,100,0),
(@PATH,3,3357.187,-5010.518,314.4818,0,0,0,100,0),
(@PATH,4,3357.542,-5001.491,312.6571,0,0,0,100,0),
(@PATH,5,3358.298,-4992.609,309.518,0,0,0,100,0),
(@PATH,6,3359.164,-4979.575,306.3201,0,0,0,100,0),
(@PATH,7,3358.098,-4968.287,305.3201,0,0,0,100,0),
(@PATH,8,3359.164,-4979.575,306.3201,0,0,0,100,0),
(@PATH,9,3358.298,-4992.609,309.518,0,0,0,100,0),
(@PATH,10,3357.542,-5001.491,312.6571,0,0,0,100,0),
(@PATH,11,3357.187,-5010.518,314.4818,0,0,0,100,0),
(@PATH,12,3356.47,-5017.849,316.0019,0,0,0,100,0),
(@PATH,13,3357.555,-5029.944,319.8653,0,0,0,100,0),
(@PATH,14,3357.853,-5040.213,321.8856,0,0,0,100,0),
(@PATH,15,3359.965,-5051.063,324.4915,0,0,0,100,0);

-- Pathing for Runic War Golem Entry: 26347
SET @NPC := 109948;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=26347,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=3332.511,`position_y`=-5175.127,`position_z`=331.7538 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3327.189,-5173.438,331.7485,0,0,0,100,0),
(@PATH,2,3332.511,-5175.127,331.7538,0,0,0,100,0),
(@PATH,3,3335.935,-5171.569,336.5016,0,0,0,100,0),
(@PATH,4,3339.744,-5168.044,340.9769,0,0,0,100,0),
(@PATH,5,3343.647,-5163.103,340.9769,0,0,0,100,0),
(@PATH,6,3339.817,-5158.081,340.9769,0,0,0,100,0),
(@PATH,7,3332.336,-5149.312,340.9769,0,0,0,100,0),
(@PATH,8,3339.817,-5158.081,340.9769,0,0,0,100,0),
(@PATH,9,3343.647,-5163.103,340.9769,0,0,0,100,0),
(@PATH,10,3339.744,-5168.044,340.9769,0,0,0,100,0),
(@PATH,11,3335.935,-5171.569,336.5016,0,0,0,100,0),
(@PATH,12,3332.511,-5175.127,331.7538,0,0,0,100,0);

-- Pathing for Runic War Golem Entry: 26347
SET @NPC := 109945;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=26347,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=3268.374,`position_y`=-5079.969,`position_z`=340.9769 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3280.72,-5085.368,340.9769,0,0,0,100,0),
(@PATH,2,3285.413,-5090.898,340.9769,0,0,0,100,0),
(@PATH,3,3280.72,-5085.368,340.9769,0,0,0,100,0),
(@PATH,4,3274.152,-5077.005,340.9769,0,0,0,100,0),
(@PATH,5,3268.374,-5079.969,340.9769,0,0,0,100,0);

-- Pathing for Rune Reaver Entry: 26268
SET @NPC := 110571;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4943.383,`position_y`=-4628.32,`position_z`=219.8363 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4953.392,-4639.618,219.5298,0,0,0,100,0),
(@PATH,2,4943.383,-4628.32,219.8363,0,0,0,100,0),
(@PATH,3,4937.893,-4627.585,220.6231,0,0,0,100,0),
(@PATH,4,4930.792,-4625.509,220.5757,0,0,0,100,0),
(@PATH,5,4918.872,-4620.807,219.5784,0,0,0,100,0),
(@PATH,6,4911.864,-4618.355,219.4935,0,0,0,100,0),
(@PATH,7,4904.523,-4611.126,219.5222,0,0,0,100,0),
(@PATH,8,4905.18,-4599.718,219.6071,0,0,0,100,0),
(@PATH,9,4908.717,-4580.935,219.6839,0,0,0,100,0),
(@PATH,10,4913.14,-4560.027,219.5673,0,0,0,100,0),
(@PATH,11,4908.717,-4580.935,219.6839,0,0,0,100,0),
(@PATH,12,4905.18,-4599.718,219.6071,0,0,0,100,0),
(@PATH,13,4904.523,-4611.126,219.5222,0,0,0,100,0),
(@PATH,14,4911.864,-4618.355,219.4935,0,0,0,100,0),
(@PATH,15,4918.872,-4620.807,219.5784,0,0,0,100,0),
(@PATH,16,4930.792,-4625.509,220.5757,0,0,0,100,0),
(@PATH,17,4937.893,-4627.585,220.6231,0,0,0,100,0),
(@PATH,18,4943.383,-4628.32,219.8363,0,0,0,100,0);

-- Pathing for Rune Reaver Entry: 26268
SET @NPC := 110573;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4855.043,`position_y`=-4537.645,`position_z`=204.8494 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4849.041,-4535.425,204.8447,0,0,0,100,0),
(@PATH,2,4855.043,-4537.645,204.8494,0,0,0,100,0),
(@PATH,3,4866.675,-4541.856,204.8586,0,0,0,100,0),
(@PATH,4,4874.014,-4544.58,204.8644,0,0,0,100,0),
(@PATH,5,4884.994,-4548.653,208.6604,0,0,0,100,0),
(@PATH,6,4894.294,-4552.636,215.3105,0,0,0,100,0),
(@PATH,7,4899.979,-4554.877,219.4517,0,0,0,100,0),
(@PATH,8,4894.294,-4552.636,215.3105,0,0,0,100,0),
(@PATH,9,4884.994,-4548.653,208.6604,0,0,0,100,0),
(@PATH,10,4874.014,-4544.58,204.8644,0,0,0,100,0),
(@PATH,11,4866.675,-4541.856,204.8586,0,0,0,100,0),
(@PATH,12,4855.043,-4537.645,204.8494,0,0,0,100,0);

-- Pathing for Rune Reaver Entry: 26268
SET @NPC := 110572;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4937.893,`position_y`=-4627.585,`position_z`=220.6231 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4943.383,-4628.32,219.8363,0,0,0,100,0),
(@PATH,2,4937.893,-4627.585,220.6231,0,0,0,100,0),
(@PATH,3,4930.792,-4625.509,220.5757,0,0,0,100,0),
(@PATH,4,4918.872,-4620.807,219.5784,0,0,0,100,0),
(@PATH,5,4911.864,-4618.355,219.4935,0,0,0,100,0),
(@PATH,6,4904.523,-4611.126,219.5222,0,0,0,100,0),
(@PATH,7,4905.18,-4599.718,219.6071,0,0,0,100,0),
(@PATH,8,4908.717,-4580.935,219.6839,0,0,0,100,0),
(@PATH,9,4913.14,-4560.027,219.5673,0,0,0,100,0),
(@PATH,10,4908.717,-4580.935,219.6839,0,0,0,100,0),
(@PATH,11,4905.18,-4599.718,219.6071,0,0,0,100,0),
(@PATH,12,4904.523,-4611.126,219.5222,0,0,0,100,0),
(@PATH,13,4911.864,-4618.355,219.4935,0,0,0,100,0),
(@PATH,14,4918.872,-4620.807,219.5784,0,0,0,100,0),
(@PATH,15,4930.792,-4625.509,220.5757,0,0,0,100,0),
(@PATH,16,4937.893,-4627.585,220.6231,0,0,0,100,0);

-- Pathing for Niffelem Forefather Entry: 29974
SET @NPC := 203040;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7709.27,`position_y`=-3164.7,`position_z`=868.8315 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7693.262,-3168.185,868.2753,0,0,0,100,0),
(@PATH,2,7709.27,-3164.7,868.8315,0,0,0,100,0),
(@PATH,3,7727.441,-3152.349,867.8315,0,0,0,100,0),
(@PATH,4,7757.799,-3144.588,868.1001,0,0,0,100,0),
(@PATH,5,7783.903,-3146.267,868.2236,0,0,0,100,0),
(@PATH,6,7757.799,-3144.588,868.1001,0,0,0,100,0),
(@PATH,7,7727.441,-3152.349,867.8315,0,0,0,100,0),
(@PATH,8,7709.27,-3164.7,868.8315,0,0,0,100,0);

-- Pathing for Niffelem Forefather Entry: 29974
SET @NPC := 203041;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7742.933,`position_y`=-3233.286,`position_z`=862.2076 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7727.288,-3235.9,861.9932,0,0,0,100,0),
(@PATH,2,7713.503,-3235.01,863.4932,0,0,0,100,0),
(@PATH,3,7727.288,-3235.9,861.9932,0,0,0,100,0),
(@PATH,4,7742.933,-3233.286,862.2076,0,0,0,100,0),
(@PATH,5,7752.816,-3221.191,862.9576,0,0,0,100,0),
(@PATH,6,7762.07,-3204.258,863.3326,0,0,0,100,0),
(@PATH,7,7764.636,-3193.307,863.6109,0,0,0,100,0),
(@PATH,8,7762.07,-3204.258,863.3326,0,0,0,100,0),
(@PATH,9,7752.816,-3221.191,862.9576,0,0,0,100,0),
(@PATH,10,7742.933,-3233.286,862.2076,0,0,0,100,0);

-- Pathing for Niffelem Forefather Entry: 29974
SET @NPC := 203042;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7785.011,`position_y`=-3298.777,`position_z`=864.6912 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7802.621,-3290.984,860.9608,0,0,0,100,0),
(@PATH,2,7823.592,-3295.113,860.8358,0,0,0,100,0),
(@PATH,3,7838.511,-3308.602,860.8699,0,0,0,100,0),
(@PATH,4,7850.641,-3319.998,859.9949,0,0,0,100,0),
(@PATH,5,7838.511,-3308.602,860.8699,0,0,0,100,0),
(@PATH,6,7823.592,-3295.113,860.8358,0,0,0,100,0),
(@PATH,7,7802.621,-3290.984,860.9608,0,0,0,100,0),
(@PATH,8,7785.011,-3298.777,864.6912,0,0,0,100,0);

-- Pathing for Niffelem Forefather Entry: 29974
SET @NPC := 203043;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7812.378,`position_y`=-3226.627,`position_z`=858.0397 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7824.979,-3215.046,858.6647,0,0,0,100,0),
(@PATH,2,7831.885,-3203.466,858.1647,0,0,0,100,0),
(@PATH,3,7824.135,-3194.195,859.362,0,0,0,100,0),
(@PATH,4,7814.883,-3180.783,861.112,0,0,0,100,0),
(@PATH,5,7824.135,-3194.195,859.362,0,0,0,100,0),
(@PATH,6,7831.885,-3203.466,858.1647,0,0,0,100,0),
(@PATH,7,7824.979,-3215.046,858.6647,0,0,0,100,0),
(@PATH,8,7812.378,-3226.627,858.0397,0,0,0,100,0),
(@PATH,9,7800.624,-3238.984,859.4147,0,0,0,100,0),
(@PATH,10,7804.482,-3266.558,859.9147,0,0,0,100,0),
(@PATH,11,7800.624,-3238.984,859.4147,0,0,0,100,0),
(@PATH,12,7812.378,-3226.627,858.0397,0,0,0,100,0);

-- Pathing for Niffelem Forefather Entry: 29974
SET @NPC := 203045;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7751.154,`position_y`=-3282.728,`position_z`=864.8948 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7753.893,-3290.935,865.2698,0,0,0,100,0),
(@PATH,2,7753.763,-3301.661,864.6334,0,0,0,100,0),
(@PATH,3,7749.471,-3308.78,865.0084,0,0,0,100,0),
(@PATH,4,7733.761,-3302.855,864.6334,0,0,0,100,0),
(@PATH,5,7724.081,-3302.346,865.238,0,0,0,100,0),
(@PATH,6,7733.761,-3302.855,864.6334,0,0,0,100,0),
(@PATH,7,7749.471,-3308.78,865.0084,0,0,0,100,0),
(@PATH,8,7753.763,-3301.661,864.6334,0,0,0,100,0),
(@PATH,9,7753.893,-3290.935,865.2698,0,0,0,100,0),
(@PATH,10,7751.154,-3282.728,864.8948,0,0,0,100,0),
(@PATH,11,7740.746,-3275.625,863.0198,0,0,0,100,0),
(@PATH,12,7751.154,-3282.728,864.8948,0,0,0,100,0);

-- Add random movement to other 6 Niffelem Forefathers
UPDATE `creature` SET `spawndist`=25,`MovementType`=1 WHERE `id`=29974 AND `MovementType`=0;

-- Add random movement to Frostborn Ghost & Frostborn Warriors 
UPDATE `creature` SET `spawndist`=25,`MovementType`=1 WHERE `id` IN (30144,30135);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 116656;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=27229,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2717.958,`position_y`=-852.0486,`position_z`=-17.81084 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2698.013,-840.5762,-18.87237,0,0,0,100,0),
(@PATH,2,2717.958,-852.0486,-17.81084,0,0,0,100,0),
(@PATH,3,2747.685,-835.9616,-18.52517,0,0,0,100,0),
(@PATH,4,2736.963,-824.5544,-18.11758,0,0,0,100,0),
(@PATH,5,2747.685,-835.9616,-18.52517,0,0,0,100,0),
(@PATH,6,2717.958,-852.0486,-17.81084,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104255;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2804.868,`position_y`=-1251.195,`position_z`=1.766804 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2791.833,-1244.833,1.159086,0,0,0,100,0),
(@PATH,2,2776.921,-1251.052,1.034086,0,0,0,100,0),
(@PATH,3,2750.998,-1267.749,1.621623,0,0,0,100,0),
(@PATH,4,2747.293,-1287.059,3.621623,0,0,0,100,0),
(@PATH,5,2776.598,-1286.028,2.856715,0,0,0,100,0),
(@PATH,6,2790.336,-1281.491,2.856715,0,0,0,100,0),
(@PATH,7,2806.178,-1269.708,1.748952,0,0,0,100,0),
(@PATH,8,2810.145,-1259.655,1.391804,0,0,0,100,0),
(@PATH,9,2804.868,-1251.195,1.766804,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104300;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2905.596,`position_y`=-951.8702,`position_z`=3.332973 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2899.221,-961.7573,0.6871157,0,0,0,100,0),
(@PATH,2,2905.652,-975.7508,0.5727639,0,0,0,100,0),
(@PATH,3,2911.825,-995.7515,0.5727639,0,0,0,100,0),
(@PATH,4,2919.04,-996.2648,2.072764,0,0,0,100,0),
(@PATH,5,2936.101,-978.8578,5.70028,0,0,0,100,0),
(@PATH,6,2935.195,-972.1996,5.70028,0,0,0,100,0),
(@PATH,7,2937.132,-963.5467,6.505372,0,0,0,100,0),
(@PATH,8,2942.209,-959.0795,7.380372,0,0,0,100,0),
(@PATH,9,2936.745,-951.6036,7.255372,0,0,0,100,0),
(@PATH,10,2925.32,-946.2381,5.957973,0,0,0,100,0),
(@PATH,11,2914.287,-943.9521,4.832973,0,0,0,100,0),
(@PATH,12,2905.596,-951.8702,3.332973,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104302;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2821.752,`position_y`=-874.8417,`position_z`=-14.74422 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2847.016,-880.9863,-1.761606,0,0,0,100,0),
(@PATH,2,2859.862,-879.0374,3.863394,0,0,0,100,0),
(@PATH,3,2872.061,-881.687,7.820289,0,0,0,100,0),
(@PATH,4,2859.862,-879.0374,3.863394,0,0,0,100,0),
(@PATH,5,2847.285,-881.0474,-1.761606,0,0,0,100,0),
(@PATH,6,2821.752,-874.8417,-14.74422,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104312;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2943.969,`position_y`=-1048.965,`position_z`=5.101302 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2941.843,-1039.475,5.726302,0,0,0,100,0),
(@PATH,2,2949.843,-1030.536,7.24691,0,0,0,100,0),
(@PATH,3,2956.156,-1021.9,6.74691,0,0,0,100,0),
(@PATH,4,2953.461,-1003.218,5.12191,0,0,0,100,0),
(@PATH,5,2948.249,-991.8906,6.32528,0,0,0,100,0),
(@PATH,6,2938.315,-992.0608,5.45028,0,0,0,100,0),
(@PATH,7,2923.623,-998.5035,2.697764,0,0,0,100,0),
(@PATH,8,2917.823,-1008.725,1.368839,0,0,0,100,0),
(@PATH,9,2924.897,-1030.634,1.368839,0,0,0,100,0),
(@PATH,10,2927.607,-1053.356,1.400305,0,0,0,100,0),
(@PATH,11,2932.153,-1063.109,2.775305,0,0,0,100,0),
(@PATH,12,2947.777,-1060.567,5.476302,0,0,0,100,0),
(@PATH,13,2943.969,-1048.965,5.101302,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104299;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2878.691,`position_y`=-918.3934,`position_z`=3.037135 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2881.817,-906.0959,6.162135,0,0,0,100,0),
(@PATH,2,2877.402,-902.8173,6.162135,0,0,0,100,0),
(@PATH,3,2869.271,-905.7285,3.787135,0,0,0,100,0),
(@PATH,4,2860.845,-913.6956,0.9171581,0,0,0,100,0),
(@PATH,5,2855.832,-904.1615,1.042158,0,0,0,100,0),
(@PATH,6,2855.849,-900.3548,1.167158,0,0,0,100,0),
(@PATH,7,2866.709,-902.1387,3.787135,0,0,0,100,0),
(@PATH,8,2874.706,-897.7801,6.570289,0,0,0,100,0),
(@PATH,9,2882.54,-901.2561,7.287135,0,0,0,100,0),
(@PATH,10,2886.823,-908.6275,6.412135,0,0,0,100,0),
(@PATH,11,2892.139,-921.2299,4.412135,0,0,0,100,0),
(@PATH,12,2894.74,-929.5193,3.412135,0,0,0,100,0),
(@PATH,13,2889.814,-938.6491,1.062116,0,0,0,100,0),
(@PATH,14,2883.413,-931.7945,0.9121351,0,0,0,100,0),
(@PATH,15,2874.375,-924.762,0.7871351,0,0,0,100,0),
(@PATH,16,2878.691,-918.3934,3.037135,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104303;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2862.517,`position_y`=-849.3773,`position_z`=16.0366 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2850.917,-839.008,16.6616,0,0,0,100,0),
(@PATH,2,2834.721,-821.3724,16.35888,0,0,0,100,0),
(@PATH,3,2829.143,-812.616,16.75702,0,0,0,100,0),
(@PATH,4,2833.205,-809.7637,16.75702,0,0,0,100,0),
(@PATH,5,2849.156,-826.3764,17.10888,0,0,0,100,0),
(@PATH,6,2867.899,-845.172,13.44489,0,0,0,100,0),
(@PATH,7,2874.827,-850.2648,8.319893,0,0,0,100,0),
(@PATH,8,2881.642,-855.6507,7.069893,0,0,0,100,0),
(@PATH,9,2876.659,-862.6102,6.069893,0,0,0,100,0),
(@PATH,10,2870.918,-857.8684,8.819893,0,0,0,100,0),
(@PATH,11,2862.517,-849.3773,16.0366,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104289;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2859.201,`position_y`=-1110.844,`position_z`=-7.820363 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2838.448,-1100.916,-10.32036,0,0,0,100,0),
(@PATH,2,2821.981,-1100.407,-10.52881,0,0,0,100,0),
(@PATH,3,2859.201,-1110.844,-7.820363,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104288;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2961.971,`position_y`=-1206.705,`position_z`=5.116786 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2960.254,-1191.745,5.178555,0,0,0,100,0),
(@PATH,2,2944.208,-1185.239,6.678555,0,0,0,100,0),
(@PATH,3,2936.293,-1195.067,7.053555,0,0,0,100,0),
(@PATH,4,2914.819,-1193.023,6.254488,0,0,0,100,0),
(@PATH,5,2904.133,-1179.803,4.629488,0,0,0,100,0),
(@PATH,6,2895.289,-1198.563,4.908248,0,0,0,100,0),
(@PATH,7,2895.378,-1223.209,3.29712,0,0,0,100,0),
(@PATH,8,2910.218,-1232.834,1.698269,0,0,0,100,0),
(@PATH,9,2923.046,-1223.271,1.823269,0,0,0,100,0),
(@PATH,10,2935.214,-1209.845,3.866786,0,0,0,100,0),
(@PATH,11,2940.961,-1203.404,5.241786,0,0,0,100,0),
(@PATH,12,2961.971,-1206.705,5.116786,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104282;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2873.173,`position_y`=-1172.022,`position_z`=1.283248 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2855.471,-1183.277,0.8133984,0,0,0,100,0),
(@PATH,2,2840.394,-1190.353,0.5633984,0,0,0,100,0),
(@PATH,3,2828.198,-1197.965,0.545311,0,0,0,100,0),
(@PATH,4,2823.18,-1207.752,0.5932741,0,0,0,100,0),
(@PATH,5,2826.128,-1215.542,0.5932741,0,0,0,100,0),
(@PATH,6,2850.605,-1227.658,1.475805,0,0,0,100,0),
(@PATH,7,2885.619,-1237.069,1.082685,0,0,0,100,0),
(@PATH,8,2896.538,-1218.785,3.92212,0,0,0,100,0),
(@PATH,9,2894.448,-1191.228,4.408248,0,0,0,100,0),
(@PATH,10,2881.56,-1176.025,2.783248,0,0,0,100,0),
(@PATH,11,2873.173,-1172.022,1.283248,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104313;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2866.15,`position_y`=-1042.753,`position_z`=-4.842813 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2892.274,-1021.913,-4.426641,0,0,0,100,0),
(@PATH,2,2908.712,-1010.955,-0.7561612,0,0,0,100,0),
(@PATH,3,2916.6,-1006.593,0.9938388,0,0,0,100,0),
(@PATH,4,2931.316,-999.233,3.697764,0,0,0,100,0),
(@PATH,5,2916.6,-1006.593,0.9938388,0,0,0,100,0),
(@PATH,6,2908.712,-1010.955,-0.7561612,0,0,0,100,0),
(@PATH,7,2892.274,-1021.913,-4.426641,0,0,0,100,0),
(@PATH,8,2866.15,-1042.753,-4.842813,0,0,0,100,0),
(@PATH,9,2843.705,-1044.362,-10.84281,0,0,0,100,0),
(@PATH,10,2866.15,-1042.753,-4.842813,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104285;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2826.858,`position_y`=-1187.9,`position_z`=-0.829689 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2807.957,-1196.852,-0.829689,0,0,0,100,0),
(@PATH,2,2790.929,-1196.677,-4.436954,0,0,0,100,0),
(@PATH,3,2859.056,-1191.648,4.188398,0,0,0,100,0),
(@PATH,4,2826.858,-1187.9,-0.829689,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104294;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2837.888,`position_y`=-1022.804,`position_z`=-15.48377 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2825.521,-1027.604,-17.81549,0,0,0,100,0),
(@PATH,2,2822.49,-1036.64,-14.97614,0,0,0,100,0),
(@PATH,3,2842.205,-1029.125,-10.13129,0,0,0,100,0),
(@PATH,4,2849.388,-1021.512,-4.991766,0,0,0,100,0),
(@PATH,5,2842.463,-1029.043,-9.916177,0,0,0,100,0),
(@PATH,6,2834.086,-1032.984,-12.02614,0,0,0,100,0),
(@PATH,7,2822.49,-1036.64,-14.97614,0,0,0,100,0),
(@PATH,8,2850.019,-1019.803,-5.240389,0,0,0,100,0),
(@PATH,9,2837.888,-1022.804,-15.48377,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104291;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2912.86,`position_y`=-1084.628,`position_z`=1.902801 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2919.425,-1075.065,2.277801,0,0,0,100,0),
(@PATH,2,2945.871,-1074.501,6.231542,0,0,0,100,0),
(@PATH,3,2962.812,-1101.852,5.404822,0,0,0,100,0),
(@PATH,4,2971.769,-1111.746,5.353806,0,0,0,100,0),
(@PATH,5,2958.454,-1131.615,6.279822,0,0,0,100,0),
(@PATH,6,2923.928,-1129.304,3.166746,0,0,0,100,0),
(@PATH,7,2905.813,-1109.318,1.916746,0,0,0,100,0),
(@PATH,8,2911.473,-1096.334,2.527801,0,0,0,100,0),
(@PATH,9,2912.86,-1084.628,1.902801,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104292;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2962.194,`position_y`=-904.453,`position_z`=8.116007 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2956.887,-874.8527,7.38236,0,0,0,100,0),
(@PATH,2,2935.122,-866.2645,8.769132,0,0,0,100,0),
(@PATH,3,2914.541,-880.2153,10.14801,0,0,0,100,0),
(@PATH,4,2925.265,-901.0575,10.33249,0,0,0,100,0),
(@PATH,5,2922.499,-912.9219,9.332486,0,0,0,100,0),
(@PATH,6,2924.213,-921.9735,8.207486,0,0,0,100,0),
(@PATH,7,2929.018,-929.4181,7.832486,0,0,0,100,0),
(@PATH,8,2957.894,-937.6589,8.130371,0,0,0,100,0),
(@PATH,9,2962.194,-904.453,8.116007,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104293;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2895.921,`position_y`=-1134.2,`position_z`=1.798322 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2930.059,-1134.693,3.973824,0,0,0,100,0),
(@PATH,2,2951.594,-1140.05,5.859762,0,0,0,100,0),
(@PATH,3,2961.647,-1161.825,5.359762,0,0,0,100,0),
(@PATH,4,2927.842,-1163.731,4.348824,0,0,0,100,0),
(@PATH,5,2914.999,-1156.421,3.098824,0,0,0,100,0),
(@PATH,6,2907.036,-1165.437,3.848824,0,0,0,100,0),
(@PATH,7,2896.543,-1157.753,2.423322,0,0,0,100,0),
(@PATH,8,2892.274,-1152.018,1.798322,0,0,0,100,0),
(@PATH,9,2898.064,-1144.837,2.673322,0,0,0,100,0),
(@PATH,10,2895.921,-1134.2,1.798322,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104298;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2805.589,`position_y`=-1081.377,`position_z`=-17.2577 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2855.113,-1079.183,-10.86029,0,0,0,100,0),
(@PATH,2,2843.607,-1076.875,-12.48529,0,0,0,100,0),
(@PATH,3,2825.508,-1075.496,-12.2577,0,0,0,100,0),
(@PATH,4,2805.589,-1081.377,-17.2577,0,0,0,100,0),
(@PATH,5,2825.508,-1075.496,-12.2577,0,0,0,100,0),
(@PATH,6,2843.607,-1076.875,-12.48529,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104315;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3110.401,`position_y`=-1253.015,`position_z`=13.46371 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3113.668,-1263.064,16.11616,0,0,0,100,0),
(@PATH,2,3110.401,-1253.015,13.46371,0,0,0,100,0),
(@PATH,3,3111.429,-1236.31,11.58871,0,0,0,100,0),
(@PATH,4,3122.498,-1227.572,15.46371,0,0,0,100,0),
(@PATH,5,3133.695,-1219.953,19.40269,0,0,0,100,0),
(@PATH,6,3144.987,-1217.686,21.77769,0,0,0,100,0),
(@PATH,7,3156.936,-1210.385,25.65269,0,0,0,100,0),
(@PATH,8,3144.987,-1217.686,21.77769,0,0,0,100,0),
(@PATH,9,3133.695,-1219.953,19.40269,0,0,0,100,0),
(@PATH,10,3122.498,-1227.572,15.46371,0,0,0,100,0),
(@PATH,11,3111.429,-1236.31,11.58871,0,0,0,100,0),
(@PATH,12,3110.401,-1253.015,13.46371,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104315;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3113.668,`position_y`=-1263.064,`position_z`=16.11616 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3110.401,-1253.015,13.46371,0,0,0,100,0),
(@PATH,2,3111.429,-1236.31,11.58871,0,0,0,100,0),
(@PATH,3,3122.498,-1227.572,15.46371,0,0,0,100,0),
(@PATH,4,3133.695,-1219.953,19.40269,0,0,0,100,0),
(@PATH,5,3144.987,-1217.686,21.77769,0,0,0,100,0),
(@PATH,6,3156.936,-1210.385,25.65269,0,0,0,100,0),
(@PATH,7,3144.987,-1217.686,21.77769,0,0,0,100,0),
(@PATH,8,3133.695,-1219.953,19.40269,0,0,0,100,0),
(@PATH,9,3122.498,-1227.572,15.46371,0,0,0,100,0),
(@PATH,10,3111.429,-1236.31,11.58871,0,0,0,100,0),
(@PATH,11,3110.401,-1253.015,13.46371,0,0,0,100,0),
(@PATH,12,3113.668,-1263.064,16.11616,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104286;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3088.583,`position_y`=-1156.126,`position_z`=17.39679 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3083.364,-1145.739,19.27179,0,0,0,100,0),
(@PATH,2,3082.374,-1140.374,20.52179,0,0,0,100,0),
(@PATH,3,3076.677,-1139.317,20.14679,0,0,0,100,0),
(@PATH,4,3077.877,-1133.612,21.02179,0,0,0,100,0),
(@PATH,5,3088.356,-1118.187,23.05031,0,0,0,100,0),
(@PATH,6,3072.231,-1108.131,21.80031,0,0,0,100,0),
(@PATH,7,3076.281,-1100.623,21.92531,0,0,0,100,0),
(@PATH,8,3086.297,-1103.101,25.05031,0,0,0,100,0),
(@PATH,9,3094.429,-1104.709,24.55031,0,0,0,100,0),
(@PATH,10,3106.847,-1117.23,23.42531,0,0,0,100,0),
(@PATH,11,3115.25,-1125.531,23.92531,0,0,0,100,0),
(@PATH,12,3100.21,-1153.944,20.14997,0,0,0,100,0),
(@PATH,13,3087.017,-1178.354,13.93423,0,0,0,100,0),
(@PATH,14,3082.906,-1175.015,14.30923,0,0,0,100,0),
(@PATH,15,3088.583,-1156.126,17.39679,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104290;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2989.215,`position_y`=-1127.607,`position_z`=6.228806 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3004.259,-1106.531,3.603805,0,0,0,100,0),
(@PATH,2,3033.57,-1102.447,4.356295,0,0,0,100,0),
(@PATH,3,3037.122,-1119.411,5.481295,0,0,0,100,0),
(@PATH,4,3033.48,-1148.527,6.284178,0,0,0,100,0),
(@PATH,5,3009.911,-1156.986,7.97834,0,0,0,100,0),
(@PATH,6,2993.419,-1149.693,7.562151,0,0,0,100,0),
(@PATH,7,2989.215,-1127.607,6.228806,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104287;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3024.798,`position_y`=-1230.706,`position_z`=4.43573 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3025.203,-1243.132,6.22729,0,0,0,100,0),
(@PATH,2,3005.912,-1240.063,2.10229,0,0,0,100,0),
(@PATH,3,2993.987,-1228.242,1.67068,0,0,0,100,0),
(@PATH,4,2985.902,-1209.867,5.42068,0,0,0,100,0),
(@PATH,5,3001.862,-1184.164,6.22842,0,0,0,100,0),
(@PATH,6,3014.546,-1170.865,6.85342,0,0,0,100,0),
(@PATH,7,3032.88,-1172.902,4.72842,0,0,0,100,0),
(@PATH,8,3029.85,-1187.033,4.10342,0,0,0,100,0),
(@PATH,9,3018.071,-1205.466,4.68573,0,0,0,100,0),
(@PATH,10,3024.798,-1230.706,4.43573,0,0,0,100,0);

-- Pathing for Forgotten Footman Entry: 27229
SET @NPC := 104295;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3071.868,`position_y`=-1268.397,`position_z`=12.20938 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3069.674,-1259.386,10.85567,0,0,0,100,0),
(@PATH,2,3068.374,-1255.473,10.73067,0,0,0,100,0),
(@PATH,3,3066.066,-1244.444,11.2446,0,0,0,100,0),
(@PATH,4,3058.969,-1244.361,11.6196,0,0,0,100,0),
(@PATH,5,3052.487,-1247.199,11.4946,0,0,0,100,0),
(@PATH,6,3052.536,-1241.779,11.2446,0,0,0,100,0),
(@PATH,7,3061.56,-1234.533,12.3696,0,0,0,100,0),
(@PATH,8,3083.357,-1235.259,11.98067,0,0,0,100,0),
(@PATH,9,3075.396,-1236.323,12.60567,0,0,0,100,0),
(@PATH,10,3072.659,-1248.836,10.35567,0,0,0,100,0),
(@PATH,11,3077.105,-1272.881,13.58438,0,0,0,100,0),
(@PATH,12,3073.281,-1273.411,13.95938,0,0,0,100,0),
(@PATH,13,3071.868,-1268.397,12.20938,0,0,0,100,0);

-- Pathing for Onslaught Footman Entry: 27203
SET @NPC := 102197;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2959.326,`position_y`=-395.5391,`position_z`=125.0946 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2962.84,-391.6742,126.4696,0,0,0,100,0),
(@PATH,2,2962.84,-387.4278,126.2249,0,0,0,100,0),
(@PATH,3,2962.838,-383.4186,126.0946,6000,0,0,100,0),
(@PATH,4,2964.144,-389.1896,126.4696,0,0,0,100,0),
(@PATH,5,2961.882,-397.0358,125.9696,0,0,0,100,0),
(@PATH,6,2954.763,-397.5117,122.8446,0,0,0,100,0),
(@PATH,7,2948.593,-393.6725,119.4696,0,0,0,100,0),
(@PATH,8,2940.545,-388.0684,115.3446,0,0,0,100,0),
(@PATH,9,2933.778,-384.1037,114.2196,6000,0,0,100,0),
(@PATH,10,2944.897,-392.185,117.8446,0,0,0,100,0),
(@PATH,11,2952.504,-395.6488,121.8446,0,0,0,100,0),
(@PATH,12,2959.326,-395.5391,125.0946,0,0,0,100,0);

-- Pathing for Onslaught Footman Entry: 27203
SET @NPC := 102179;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2758.622,`position_y`=-257.9032,`position_z`=134.5928 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2759.127,-266.1774,133.4678,0,0,0,100,0),
(@PATH,2,2751.539,-271.3302,132.9024,0,0,0,100,0),
(@PATH,3,2760.595,-265.1753,133.4678,0,0,0,100,0),
(@PATH,4,2758.622,-257.9032,134.5928,10000,0,0,100,0);

-- Pathing for Onslaught Footman Entry: 27203
SET @NPC := 102213;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2821.844,`position_y`=-398.2182,`position_z`=118.2002 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2836.377,-413.6715,118.2116,0,0,0,100,0),
(@PATH,2,2847.824,-428.9374,118.2116,0,0,0,100,0),
(@PATH,3,2846.472,-430.4803,118.2116,10000,0,0,100,0),
(@PATH,4,2837.281,-414.4826,118.2116,0,0,0,100,0),
(@PATH,5,2821.844,-398.2182,118.2002,0,0,0,100,0);

-- Pathing for Onslaught Footman Entry: 27203
SET @NPC := 105782;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=27203,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2525.812,`position_y`=-295.1712,`position_z`=2.23228 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2522.335,-293.472,1.60728,0,0,0,100,0),
(@PATH,2,2534.573,-286.8467,1.299124,0,0,0,100,0),
(@PATH,3,2543.025,-290.9288,2.299124,0,0,0,100,0),
(@PATH,4,2541.112,-300.2495,5.017283,0,0,0,100,0),
(@PATH,5,2535.901,-297.6197,5.924125,0,0,0,100,0),
(@PATH,6,2533.984,-309.6661,5.892283,0,0,0,100,0),
(@PATH,7,2529.919,-310.2605,5.837389,0,0,0,100,0),
(@PATH,8,2525.812,-295.1712,2.23228,0,0,0,100,0);

-- Pathing for Onslaught Footman Entry: 27203
SET @NPC := 105756;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=27203,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2586.93,`position_y`=-264.7181,`position_z`=0.8478023 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2583.299,-258.9597,0.8478023,0,0,0,100,0),
(@PATH,2,2586.605,-253.2055,0.9728023,0,0,0,100,0),
(@PATH,3,2588.085,-261.3564,0.8478023,0,0,0,100,0),
(@PATH,4,2594.641,-270.8868,1.282966,0,0,0,100,0),
(@PATH,5,2593.293,-277.7047,3.532966,0,0,0,100,0),
(@PATH,6,2587.672,-279.4316,5.157966,0,0,0,100,0),
(@PATH,7,2583.551,-276.3489,6.657966,4000,0,0,100,0),
(@PATH,8,2589.375,-278.8446,5.032966,0,0,0,100,0),
(@PATH,9,2595.676,-274.804,2.282966,0,0,0,100,0),
(@PATH,10,2594.056,-268.2732,0.6579659,0,0,0,100,0),
(@PATH,11,2586.93,-264.7181,0.8478023,0,0,0,100,0);

-- Pathing for Onslaught Footman Entry: 27203
SET @NPC := 105783;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=27203,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2594.2,`position_y`=-475.536,`position_z`=0.9160237 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2596.819,-478.6579,0.9160237,0,0,0,100,0),
(@PATH,2,2594.2,-475.536,0.9160237,10000,0,0,100,0);

-- Pathing for Onslaught Raven Priest Entry: 27202
SET @NPC := 102075;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2802.188,`position_y`=-345.2823,`position_z`=130.7945 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2796.222,-324.6151,130.5517,0,0,0,100,0),
(@PATH,2,2801.31,-334.3385,131.2945,0,0,0,100,0),
(@PATH,3,2802.188,-345.2823,130.7945,0,0,0,100,0),
(@PATH,4,2800.293,-358.0259,131.0445,0,0,0,100,0),
(@PATH,5,2802.188,-345.2823,130.7945,0,0,0,100,0);

-- Pathing for Onslaught Raven Priest Entry: 27202
SET @NPC := 102083;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2836.686,`position_y`=-327.3926,`position_z`=113.7116 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2803.109,-293.2266,128.4419,0,0,0,100,0),
(@PATH,2,2786.735,-273.9067,131.9504,0,0,0,100,0),
(@PATH,3,2803.03,-293.1732,128.4419,0,0,0,100,0),
(@PATH,4,2836.686,-327.3926,113.7116,0,0,0,100,0),
(@PATH,5,2870.484,-362.9376,112.5865,0,0,0,100,0),
(@PATH,6,2836.686,-327.3926,113.7116,0,0,0,100,0);

-- Pathing for Onslaught Raven Priest Entry: 27202
SET @NPC := 105717;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=27202,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2624.781,`position_y`=-436.3073,`position_z`=40.43311 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2644.508,-439.5879,50.05303,0,0,0,100,0),
(@PATH,2,2677.022,-464.0624,50.80053,2000,0,0,100,0),
(@PATH,3,2667.324,-457.1105,50.42553,0,0,0,100,0),
(@PATH,4,2656.113,-447.4913,50.42803,0,0,0,100,0),
(@PATH,5,2645.126,-440.9579,50.42803,0,0,0,100,0),
(@PATH,6,2626.017,-437.9755,40.80811,0,0,0,100,0),
(@PATH,7,2613.63,-428.6914,36.95987,5000,0,0,100,0),
(@PATH,8,2624.781,-436.3073,40.43311,0,0,0,100,0);

-- Pathing for Onslaught Raven Priest Entry: 27202
SET @NPC := 102097;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2773.949,`position_y`=-310.9596,`position_z`=130.5517 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2758.812,-292.1544,130.6524,0,0,0,100,0),
(@PATH,2,2777.84,-271.9499,131.9504,0,0,0,100,0),
(@PATH,3,2758.812,-292.1544,130.6524,0,0,0,100,0),
(@PATH,4,2773.949,-310.9596,130.5517,0,0,0,100,0),
(@PATH,5,2783.265,-326.0737,130.5517,0,0,0,100,0),
(@PATH,6,2788.654,-341.5617,130.6524,0,0,0,100,0),
(@PATH,7,2787.105,-356.4442,130.6524,0,0,0,100,0),
(@PATH,8,2782.601,-375.6832,130.7486,0,0,0,100,0),
(@PATH,9,2787.105,-356.4442,130.6524,0,0,0,100,0),
(@PATH,10,2788.654,-341.5617,130.6524,0,0,0,100,0),
(@PATH,11,2783.265,-326.0737,130.5517,0,0,0,100,0),
(@PATH,12,2773.949,-310.9596,130.5517,0,0,0,100,0);

-- Pathing for Onslaught Raven Priest Entry: 27202
SET @NPC := 102084;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2801.698,`position_y`=-493.4148,`position_z`=126.8458 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2808.238,-485.9173,126.843,0,0,0,100,0),
(@PATH,2,2817.109,-477.4015,126.8421,0,0,0,100,0),
(@PATH,3,2808.546,-469.1276,126.842,0,0,0,100,0),
(@PATH,4,2802.375,-475.2724,126.8427,0,0,0,100,0),
(@PATH,5,2802.811,-475.7075,126.8424,10000,0,0,100,0),
(@PATH,6,2790.29,-487.0023,126.8426,0,0,0,100,0),
(@PATH,7,2798.458,-496.3188,126.8494,0,0,0,100,0),
(@PATH,8,2801.698,-493.4148,126.8458,0,0,0,100,0),
(@PATH,9,2800.922,-492.7095,126.8448,10000,0,0,100,0);

-- Remove movement from Bjorn Halgurdsson
UPDATE `creature` SET `spawndist`=0,`MovementType`=0 WHERE `guid`=112513;

-- Pathing for Hungering Dead Entry: 27335
SET @NPC := 97722;
SET @PATH := @NPC * 10;
UPDATE `creature_template` SET `faction_A`=1975,`faction_H`=1975 WHERE `entry`=27335;
UPDATE `creature` SET `id`=27335,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=3721.162,`position_y`=-1150.444,`position_z`=119.7043 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3722.571,-1154.455,119.7043,0,0,0,100,0),
(@PATH,2,3728.104,-1159.745,119.734,0,0,0,100,0),
(@PATH,3,3733.444,-1158.61,119.8249,0,0,0,100,0),
(@PATH,4,3738.681,-1154.988,119.9222,0,0,0,100,0),
(@PATH,5,3744.156,-1148.198,119.9499,0,0,0,100,0),
(@PATH,6,3747.033,-1139.943,119.8567,0,0,0,100,0),
(@PATH,7,3744.29,-1135.643,119.879,0,0,0,100,0),
(@PATH,8,3738.536,-1129.126,120.0035,0,0,0,100,0),
(@PATH,9,3731.969,-1131.176,119.8338,0,0,0,100,0),
(@PATH,10,3722.916,-1134.044,119.8925,0,0,0,100,0),
(@PATH,11,3720.009,-1142.116,119.7043,0,0,0,100,0),
(@PATH,12,3721.162,-1150.444,119.7043,0,0,0,100,0);

-- Pathing for Illusia Lune Entry: 27042
SET @NPC := 66177;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3647.948,`position_y`=-717.1948,`position_z`=215.0342 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3648.265,-715.3195,215.0314,0,0,0,100,0),
(@PATH,2,3644.507,-714.7984,214.2407,0,0,0,100,0),
(@PATH,3,3635.043,-713.5746,214.2407,0,0,0,100,0),
(@PATH,4,3644.625,-714.8554,214.2407,0,0,0,100,0),
(@PATH,5,3648.25,-715.2807,215.0314,0,0,0,100,0),
(@PATH,6,3647.977,-717.1859,215.0342,0,0,0,100,0),
(@PATH,7,3655.216,-718.0604,215.0296,0,0,0,100,0),
(@PATH,8,3647.948,-717.1948,215.0342,0,0,0,100,0);

-- Pathing for Mindless Wight Entry: 27287
SET @NPC := 133509;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3765.615,`position_y`=-1098.793,`position_z`=121.8268 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3762.084,-1109.439,121.806,0,0,0,100,0),
(@PATH,2,3752.516,-1126.449,119.7554,0,0,0,100,0),
(@PATH,3,3741.471,-1125.161,119.7554,0,0,0,100,0),
(@PATH,4,3738.396,-1108.291,120.8804,0,0,0,100,0),
(@PATH,5,3740.972,-1086.738,120.0845,0,0,0,100,0),
(@PATH,6,3738.396,-1108.291,120.8804,0,0,0,100,0),
(@PATH,7,3741.471,-1125.161,119.7554,0,0,0,100,0),
(@PATH,8,3752.516,-1126.449,119.7554,0,0,0,100,0),
(@PATH,9,3762.084,-1109.439,121.806,0,0,0,100,0),
(@PATH,10,3765.615,-1098.793,121.8268,0,0,0,100,0);

-- Pathing for Mindless Wight Entry: 27287
SET @NPC := 133513;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3786.24,`position_y`=-1020.522,`position_z`=118.2757 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3808.903,-1015.707,117.5769,0,0,0,100,0),
(@PATH,2,3786.24,-1020.522,118.2757,0,0,0,100,0),
(@PATH,3,3769.53,-1029.906,118.9007,0,0,0,100,0),
(@PATH,4,3749.827,-1045.751,119.9136,0,0,0,100,0),
(@PATH,5,3766.045,-1074.355,119.5845,0,0,0,100,0),
(@PATH,6,3749.827,-1045.751,119.9136,0,0,0,100,0),
(@PATH,7,3769.53,-1029.906,118.9007,0,0,0,100,0),
(@PATH,8,3786.24,-1020.522,118.2757,0,0,0,100,0);

-- Pathing for Mindless Wight Entry: 27287
SET @NPC := 133514;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3827.871,`position_y`=-1008.744,`position_z`=116.4519 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3843.853,-1000.803,114.3508,0,0,0,100,0),
(@PATH,2,3866.5,-975.2255,111.9066,0,0,0,100,0),
(@PATH,3,3880.219,-956.9473,113.0615,0,0,0,100,0),
(@PATH,4,3891.781,-929.4788,115.7108,0,0,0,100,0),
(@PATH,5,3896.316,-906.512,116.0858,0,0,0,100,0),
(@PATH,6,3891.781,-929.4788,115.7108,0,0,0,100,0),
(@PATH,7,3880.219,-956.9473,113.0615,0,0,0,100,0),
(@PATH,8,3866.5,-975.2255,111.9066,0,0,0,100,0),
(@PATH,9,3843.955,-1000.658,114.3508,0,0,0,100,0),
(@PATH,10,3827.871,-1008.744,116.4519,0,0,0,100,0);

-- Pathing for 7th Legion Cavalier Entry: 27161
SET @NPC := 133199;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3612.651,`position_y`=-726.0625,`position_z`=213.935 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,14346, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3587.445,-722.4232,213.935,0,0,0,100,0),
(@PATH,2,3555.9,-731.1179,214.44,0,0,0,100,0),
(@PATH,3,3539.474,-754.7745,215.9302,0,0,0,100,0),
(@PATH,4,3523.979,-780.5864,222.9033,0,0,0,100,0),
(@PATH,5,3539.474,-754.7745,215.9302,0,0,0,100,0),
(@PATH,6,3555.9,-731.1179,214.44,0,0,0,100,0),
(@PATH,7,3587.445,-722.4232,213.935,0,0,0,100,0),
(@PATH,8,3612.651,-726.0625,213.935,0,0,0,100,0);

-- Pathing for 7th Legion Infantryman Entry: 27160
SET @NPC := 133172;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3641.115,`position_y`=-696.2817,`position_z`=213.935 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3617.231,-699.88,213.935,0,0,0,100,0),
(@PATH,2,3600.052,-707.2169,213.935,0,0,0,100,0),
(@PATH,3,3587.962,-712.2491,213.935,0,0,0,100,0),
(@PATH,4,3557.36,-723.9453,214.94,0,0,0,100,0),
(@PATH,5,3540.534,-745.3442,214.6802,0,0,0,100,0),
(@PATH,6,3531.584,-759.6609,218.7618,0,0,0,100,0),
(@PATH,7,3540.534,-745.3442,214.6802,0,0,0,100,0),
(@PATH,8,3557.36,-723.9453,214.94,0,0,0,100,0),
(@PATH,9,3587.962,-712.2491,213.935,0,0,0,100,0),
(@PATH,10,3600.052,-707.2169,213.935,0,0,0,100,0),
(@PATH,11,3617.231,-699.88,213.935,0,0,0,100,0),
(@PATH,12,3641.115,-696.2817,213.935,0,0,0,100,0);

-- Pathing for Arctic Ram Entry: 26426
SET @NPC := 133249;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3557.356,`position_y`=-885.1018,`position_z`=213.8623 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3555.743,-872.7176,226.2373,0,0,0,100,0),
(@PATH,2,3547.863,-855.0227,241.3424,0,0,0,100,0),
(@PATH,3,3555.743,-872.7176,226.2373,0,0,0,100,0),
(@PATH,4,3557.356,-885.1018,213.8623,0,0,0,100,0);

-- Pathing for Foreman Mortuus Entry: 25280
SET @NPC := 125576;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2738.548,`position_y`=6141.264,`position_z`=77.54229 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2740.601,6148.542,77.54229,0,0,0,100,0),
(@PATH,2,2738.548,6141.264,77.54229,0,0,0,100,0),
(@PATH,3,2738.882,6136.919,77.54229,0,0,0,100,0),
(@PATH,4,2738.548,6141.264,77.54229,0,0,0,100,0);

-- Pathing for Warsong Aberration Entry: 25611
SET @NPC := 97487;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2867.919,`position_y`=6443.667,`position_z`=82.88259 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2863.174,6439.854,83.75759,0,0,0,100,0),
(@PATH,2,2848.968,6437.575,83.50759,0,0,0,100,0),
(@PATH,3,2834.608,6443.772,81.13259,0,0,0,100,0),
(@PATH,4,2828.932,6454.542,79.6442,0,0,0,100,0),
(@PATH,5,2828.173,6467.712,78.6414,0,0,0,100,0),
(@PATH,6,2830.424,6479.771,78.0164,0,0,0,100,0),
(@PATH,7,2834.636,6490.322,78.14274,0,0,0,100,0),
(@PATH,8,2842.753,6498.431,78.26774,0,0,0,100,0),
(@PATH,9,2854.071,6499.945,77.01774,0,0,0,100,0),
(@PATH,10,2863.978,6493.317,79.14274,0,0,0,100,0),
(@PATH,11,2867.187,6478.214,79.15935,0,0,0,100,0),
(@PATH,12,2867.226,6461.002,79.25759,0,0,0,100,0),
(@PATH,13,2867.919,6443.667,82.88259,0,0,0,100,0);

-- Pathing for Foreman Miles McMoody Entry: 23738
SET @NPC := 113477;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=638.4495,`position_y`=-4973.4,`position_z`=5.458665 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,638.6205,-4980.014,5.833665,0,0,0,100,0),
(@PATH,2,639.2449,-4985.371,5.708665,0,0,0,100,0),
(@PATH,3,638.6205,-4980.014,5.833665,0,0,0,100,0),
(@PATH,4,638.4495,-4973.4,5.458665,0,0,0,100,0),
(@PATH,5,643.2342,-4964.211,5.381555,0,0,0,100,0),
(@PATH,6,649.8732,-4960.353,5.881555,0,0,0,100,0),
(@PATH,7,643.2342,-4964.211,5.381555,0,0,0,100,0),
(@PATH,8,638.4495,-4973.4,5.458665,0,0,0,100,0);

-- Pathing for Dragonflayer Rune-Seer Entry: 23656
SET @NPC := 105279;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=815.9536,`position_y`=-5480.104,`position_z`=212.1486 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,807.327,-5474.987,212.2354,0,0,0,100,0),
(@PATH,2,815.9536,-5480.104,212.1486,0,0,0,100,0),
(@PATH,3,820.9525,-5473.124,212.1178,0,0,0,100,0),
(@PATH,4,815.9536,-5480.104,212.1486,0,0,0,100,0);

-- Pathing for Dragonflayer Rune-Seer Entry: 23656
SET @NPC := 105278;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1017.9,`position_y`=-5466.781,`position_z`=187.2601 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1028.798,-5462.303,187.0009,0,0,0,100,0),
(@PATH,2,1025.045,-5453.278,187.0592,0,0,0,100,0),
(@PATH,3,1013.774,-5457.924,187.2601,0,0,0,100,0),
(@PATH,4,1017.9,-5466.781,187.2601,0,0,0,100,0);

-- Pathing for Winterskorn Bonegrinder Entry: 23655
SET @NPC := 105184;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1535.755,`position_y`=-5407.994,`position_z`=190.2667 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1564.637,-5388.042,189.2125,0,0,0,100,0),
(@PATH,2,1535.755,-5407.994,190.2667,0,0,0,100,0),
(@PATH,3,1502.654,-5425.741,192.4055,0,0,0,100,0),
(@PATH,4,1477.713,-5432.612,190.0745,0,0,0,100,0),
(@PATH,5,1451.592,-5422.258,188.7154,0,0,0,100,0),
(@PATH,6,1451.592,-5422.258,188.7154,0,0,0,100,0),
(@PATH,7,1477.624,-5432.594,190.0745,0,0,0,100,0),
(@PATH,8,1502.654,-5425.741,192.4055,0,0,0,100,0),
(@PATH,9,1535.755,-5407.994,190.2667,0,0,0,100,0);

-- Pathing for Winterskorn Bonegrinder Entry: 23655
SET @NPC := 105187;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1530.729,`position_y`=-5260.938,`position_z`=202.2724 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1513.021,-5237.5,207.5224,0,0,0,100,0),
(@PATH,2,1514.139,-5242.362,207.5224,0,0,0,100,0),
(@PATH,3,1528.464,-5262.211,202.7724,0,0,0,100,0),
(@PATH,4,1549.229,-5268.947,199.7077,0,0,0,100,0),
(@PATH,5,1565.182,-5272.908,202.6034,0,0,0,100,0),
(@PATH,6,1564.366,-5290.121,202.8534,0,0,0,100,0),
(@PATH,7,1554.61,-5266.971,200.4784,0,0,0,100,0),
(@PATH,8,1530.729,-5260.938,202.2724,0,0,0,100,0);

-- Pathing for Winterskorn Bonegrinder Entry: 23655
SET @NPC := 105186;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1433.288,`position_y`=-5288.5,`position_z`=195.2126 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1416.921,-5279.619,195.8376,0,0,0,100,0),
(@PATH,2,1415.622,-5254.748,190.7362,0,0,0,100,0),
(@PATH,3,1410.65,-5237.281,191.9862,0,0,0,100,0),
(@PATH,4,1422.645,-5223.072,195.145,0,0,0,100,0),
(@PATH,5,1431.248,-5201.435,190.395,0,0,0,100,0),
(@PATH,6,1422.645,-5223.072,195.145,0,0,0,100,0),
(@PATH,7,1410.65,-5237.281,191.9862,0,0,0,100,0),
(@PATH,8,1415.622,-5254.748,190.7362,0,0,0,100,0),
(@PATH,9,1416.921,-5279.619,195.8376,0,0,0,100,0),
(@PATH,10,1432.959,-5288.929,195.0876,0,0,0,100,0),
(@PATH,11,1464.944,-5300.757,195.4252,0,0,0,100,0),
(@PATH,12,1433.288,-5288.5,195.2126,0,0,0,100,0),
(@PATH,13,1406.18,-5300.791,192.9474,0,0,0,100,0),
(@PATH,14,1399.665,-5334.053,195.1207,0,0,0,100,0),
(@PATH,15,1405.759,-5369.869,193.5165,0,0,0,100,0),
(@PATH,16,1399.665,-5334.053,195.1207,0,0,0,100,0),
(@PATH,17,1406.18,-5300.791,192.9474,0,0,0,100,0),
(@PATH,18,1433.288,-5288.5,195.2126,0,0,0,100,0),
(@PATH,19,1464.944,-5300.757,195.4252,0,0,0,100,0),
(@PATH,20,1433.288,-5288.5,195.2126,0,0,0,100,0);

-- Pathing for Dragonflayer Warrior Entry: 23654
SET @NPC := 105141;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1062.211,`position_y`=-5497.463,`position_z`=198.7661 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1064.687,-5467.441,197.8911,0,0,0,100,0),
(@PATH,2,1062.211,-5497.463,198.7661,0,0,0,100,0),
(@PATH,3,1063.853,-5533.536,205.1816,0,0,0,100,0),
(@PATH,4,1058.663,-5566.771,204.7646,0,0,0,100,0),
(@PATH,5,1038.08,-5606.434,219.5592,0,0,0,100,0),
(@PATH,6,1058.663,-5566.771,204.7646,0,0,0,100,0),
(@PATH,7,1063.853,-5533.536,205.1816,0,0,0,100,0),
(@PATH,8,1062.211,-5497.463,198.7661,0,0,0,100,0);

-- Pathing for Dragonflayer Warrior Entry: 23654
SET @NPC := 105149;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=846.3604,`position_y`=-5491.41,`position_z`=213.345 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,838.926,-5532.913,208.3766,0,0,0,100,0),
(@PATH,2,845.0897,-5552.385,201.9454,0,0,0,100,0),
(@PATH,3,866.5723,-5552.206,196.6954,0,0,0,100,0),
(@PATH,4,895.5579,-5541.471,193.3276,0,0,0,100,0),
(@PATH,5,925.5731,-5545.784,187.5047,0,0,0,100,0),
(@PATH,6,948.0293,-5558.479,184.8204,0,0,0,100,0),
(@PATH,7,954.0419,-5554.6,184.8204,0,0,0,100,0),
(@PATH,8,957.7758,-5533.202,185.6618,0,0,0,100,0),
(@PATH,9,954.9789,-5518.392,185.7868,0,0,0,100,0),
(@PATH,10,944.8699,-5507.618,185.8557,0,0,0,100,0),
(@PATH,11,944.6381,-5494.633,186.1347,0,0,0,100,0),
(@PATH,12,950.1157,-5482.309,185.6347,0,0,0,100,0),
(@PATH,13,933.2178,-5467.473,189.7347,0,0,0,100,0),
(@PATH,14,914.2697,-5456.049,197.4529,0,0,0,100,0),
(@PATH,15,899.4795,-5450.521,202.8457,0,0,0,100,0),
(@PATH,16,878.1829,-5448.128,206.4707,0,0,0,100,0),
(@PATH,17,866.7573,-5455.153,209.5957,0,0,0,100,0),
(@PATH,18,857.5803,-5467.02,211.97,0,0,0,100,0),
(@PATH,19,846.3604,-5491.41,213.345,0,0,0,100,0);

-- Pathing for Dragonflayer Warrior Entry: 23654
SET @NPC := 105143;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=885.737,`position_y`=-5543.066,`position_z`=192.4526 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,844.7711,-5555.04,202.0704,0,0,0,100,0),
(@PATH,2,839.8002,-5532.987,208.3766,0,0,0,100,0),
(@PATH,3,838.3271,-5510.918,212.7516,0,0,0,100,0),
(@PATH,4,801.8599,-5490.351,216.0982,0,0,0,100,0),
(@PATH,5,801.8599,-5490.351,216.0982,0,0,0,100,0),
(@PATH,6,808.6978,-5479.681,212.3443,0,0,0,100,0),
(@PATH,7,820.7059,-5477.396,212.4484,0,0,0,100,0),
(@PATH,8,845.6509,-5491.736,213.345,0,0,0,100,0),
(@PATH,9,860.5975,-5457.135,210.6873,0,0,0,100,0),
(@PATH,10,886.1946,-5446.879,205.8457,0,0,0,100,0),
(@PATH,11,910.978,-5453.937,198.7072,0,0,0,100,0),
(@PATH,12,933.2483,-5466.113,189.993,0,0,0,100,0),
(@PATH,13,949.5988,-5487.087,185.7597,0,0,0,100,0),
(@PATH,14,943.2539,-5502.491,185.9165,0,0,0,100,0),
(@PATH,15,955.7552,-5521.782,185.6618,0,0,0,100,0),
(@PATH,16,959.2084,-5538.987,185.4454,0,0,0,100,0),
(@PATH,17,968.0063,-5546.821,185.5182,0,0,0,100,0),
(@PATH,18,975.9687,-5552.027,188.5839,0,0,0,100,0),
(@PATH,19,971.4639,-5549.163,187.1199,0,0,0,100,0),
(@PATH,20,958.3904,-5540.358,185.3204,0,0,0,100,0),
(@PATH,21,911.1376,-5540.936,191.2547,0,0,0,100,0),
(@PATH,22,885.737,-5543.066,192.4526,0,0,0,100,0);

-- Pathing for Forgotten Knight Entry: 27224
SET @NPC := 103874;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2809.228,`position_y`=-786.0521,`position_z`=11.39639 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2410, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2833.675,-780.9371,18.37446,0,0,0,100,0),
(@PATH,2,2833.15,-758.6363,19.07858,0,0,0,100,0),
(@PATH,3,2825.889,-749.9357,21.07858,0,0,0,100,0),
(@PATH,4,2812.55,-737.4151,22.82858,0,0,0,100,0),
(@PATH,5,2783.542,-729.0773,21.05932,0,0,0,100,0),
(@PATH,6,2765.659,-727.304,17.58513,0,0,0,100,0),
(@PATH,7,2751.434,-737.9138,16.07381,0,0,0,100,0),
(@PATH,8,2751.944,-750.9055,16.69881,0,0,0,100,0),
(@PATH,9,2768.903,-761.2964,20.00057,0,0,0,100,0),
(@PATH,10,2781.985,-771.0247,22.92394,0,0,0,100,0),
(@PATH,11,2796.257,-771.977,21.92394,0,0,0,100,0),
(@PATH,12,2808.716,-776.6991,17.77139,0,0,0,100,0),
(@PATH,13,2809.228,-786.0521,11.39639,0,0,0,100,0);

-- Pathing for Forgotten Knight Entry: 27224
SET @NPC := 103873;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2894.109,`position_y`=-745.8281,`position_z`=34.1621 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2410, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2880.134,-747.5494,35.0371,0,0,0,100,0),
(@PATH,2,2891.083,-756.9952,33.4121,0,0,0,100,0),
(@PATH,3,2895.175,-770.9067,32.19512,0,0,0,100,0),
(@PATH,4,2903.07,-781.6721,33.27403,0,0,0,100,0),
(@PATH,5,2914.176,-784.565,31.89903,0,0,0,100,0),
(@PATH,6,2925.826,-785.0627,29.64903,0,0,0,100,0),
(@PATH,7,2930.271,-775.0516,28.64903,0,0,0,100,0),
(@PATH,8,2939.729,-744.412,32.40165,0,0,0,100,0),
(@PATH,9,2943.021,-729.0511,35.20413,0,0,0,100,0),
(@PATH,10,2929.653,-730.5426,33.5611,0,0,0,100,0),
(@PATH,11,2918.323,-739.3417,32.8055,0,0,0,100,0),
(@PATH,12,2912.092,-746.812,31.55551,0,0,0,100,0),
(@PATH,13,2894.109,-745.8281,34.1621,0,0,0,100,0);

-- Pathing for Forgotten Knight Entry: 27224
SET @NPC := 103872;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2932.506,`position_y`=-837.5522,`position_z`=22.2049 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2410, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2918.318,-831.2017,22.15971,0,0,0,100,0),
(@PATH,2,2900.803,-830.7356,20.28471,0,0,0,100,0),
(@PATH,3,2887.271,-836.7582,15.19489,0,0,0,100,0),
(@PATH,4,2875.123,-829.6106,16.41558,0,0,0,100,0),
(@PATH,5,2871.546,-815.7471,17.91558,0,0,0,100,0),
(@PATH,6,2883.228,-809.2447,19.41558,0,0,0,100,0),
(@PATH,7,2895.306,-811.4878,20.66558,0,0,0,100,0),
(@PATH,8,2907.782,-811.962,22.65971,0,0,0,100,0),
(@PATH,9,2923.734,-803.7195,25.15971,0,0,0,100,0),
(@PATH,10,2937.375,-803.5854,23.12252,0,0,0,100,0),
(@PATH,11,2948.706,-813.3407,16.74752,0,0,0,100,0),
(@PATH,12,2955.43,-827.8005,14.24752,0,0,0,100,0),
(@PATH,13,2943.766,-832.0939,19.74752,0,0,0,100,0),
(@PATH,14,2932.506,-837.5522,22.2049,0,0,0,100,0);

-- Pathing for Forgotten Knight Entry: 27224
SET @NPC := 103867;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3031.883,`position_y`=-1193.945,`position_z`=4.10342 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2410, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3021.991,-1208.472,4.68573,0,0,0,100,0),
(@PATH,2,3022.048,-1220.27,4.56073,0,0,0,100,0),
(@PATH,3,3029.59,-1226.407,4.93573,0,0,0,100,0),
(@PATH,4,3024.812,-1243.493,5.85229,0,0,0,100,0),
(@PATH,5,3023.703,-1255.095,6.72729,0,0,0,100,0),
(@PATH,6,3025.416,-1263.592,8.60229,0,0,0,100,0),
(@PATH,7,3021.044,-1271.828,9.719284,0,0,0,100,0),
(@PATH,8,3007.416,-1266.712,4.844284,0,0,0,100,0),
(@PATH,9,3008.505,-1253.591,2.85229,0,0,0,100,0),
(@PATH,10,3004.32,-1236.712,2.35229,0,0,0,100,0),
(@PATH,11,2993.636,-1229.865,1.17068,0,0,0,100,0),
(@PATH,12,2979.269,-1223.784,1.42068,0,0,0,100,0),
(@PATH,13,2965.932,-1206.177,5.491786,0,0,0,100,0),
(@PATH,14,2971.155,-1190.604,5.994758,0,0,0,100,0),
(@PATH,15,2980.288,-1174.813,7.619758,0,0,0,100,0),
(@PATH,16,2995.088,-1166.42,7.937151,0,0,0,100,0),
(@PATH,17,3020.431,-1167.15,6.85342,0,0,0,100,0),
(@PATH,18,3037.439,-1165.075,5.909178,0,0,0,100,0),
(@PATH,19,3047.86,-1172.553,4.58005,0,0,0,100,0),
(@PATH,20,3045.929,-1185.756,3.83005,0,0,0,100,0),
(@PATH,21,3031.883,-1193.945,4.10342,0,0,0,100,0);

-- Pathing for Forgotten Knight Entry: 27224
SET @NPC := 103871;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3010.807,`position_y`=-773.1741,`position_z`=16.34228 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2410, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2963.664,-755.7372,26.02665,0,0,0,100,0),
(@PATH,2,2945.664,-765.416,24.52665,0,0,0,100,0),
(@PATH,3,2945.375,-776.2206,23.87442,0,0,0,100,0),
(@PATH,4,2955.946,-778.843,24.99942,0,0,0,100,0),
(@PATH,5,2971.849,-763.856,25.20815,0,0,0,100,0),
(@PATH,6,2980.967,-761.5911,26.20815,0,0,0,100,0),
(@PATH,7,2990.548,-766.0126,24.95815,0,0,0,100,0),
(@PATH,8,3010.807,-773.1741,16.34228,0,0,0,100,0);

-- Pathing for Forgotten Knight Entry: 27224
SET @NPC := 103923;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3117.313,`position_y`=-1116.784,`position_z`=24.42531 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2410, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3123.031,-1098.988,26.37428,0,0,0,100,0),
(@PATH,2,3138.207,-1080.818,26.98225,0,0,0,100,0),
(@PATH,3,3155.389,-1070.809,32.23225,0,0,0,100,0),
(@PATH,4,3162.057,-1052.932,38.1851,0,0,0,100,0),
(@PATH,5,3175.884,-1045.580,45.10823,0,0,0,100,0),
(@PATH,6,3153.743,-1034.797,36.6851,0,0,0,100,0),
(@PATH,7,3136.181,-1035.721,31.6851,0,0,0,100,0),
(@PATH,8,3103.2,-1051.08,26.4764,0,0,0,100,0),
(@PATH,9,3095.24,-1065.545,25.98299,0,0,0,100,0),
(@PATH,10,3089.212,-1078.389,27.70211,0,0,0,100,0),
(@PATH,11,3089.404,-1089.843,26.82711,0,0,0,100,0),
(@PATH,12,3094.688,-1096.337,27.20211,0,0,0,100,0),
(@PATH,13,3105.258,-1114.044,24.05031,0,0,0,100,0),
(@PATH,14,3117.313,-1116.784,24.42531,0,0,0,100,0);

-- Pathing for Forgotten Knight Entry: 27224
SET @NPC := 103876;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3137.919,`position_y`=-992.722,`position_z`=34.28274 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2410, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3148.599,-963.2103,38.63452,0,0,0,100,0),
(@PATH,2,3142.211,-958.303,38.3529,0,0,0,100,0),
(@PATH,3,3142.709,-950,39.00952,0,0,0,100,0),
(@PATH,4,3137.357,-938.687,38.18606,0,0,0,100,0),
(@PATH,5,3121.781,-935.5909,34.90998,0,0,0,100,0),
(@PATH,6,3100.802,-936.2891,30.90998,0,0,0,100,0),
(@PATH,7,3087.178,-941.303,27.50731,0,0,0,100,0),
(@PATH,8,3071.092,-968.1406,25.55985,0,0,0,100,0),
(@PATH,9,3073.849,-986.3673,24.68485,0,0,0,100,0),
(@PATH,10,3081.633,-1004.435,22.36223,0,0,0,100,0),
(@PATH,11,3100.318,-1012.79,21.16171,0,0,0,100,0),
(@PATH,12,3118.169,-1009.429,22.8615,0,0,0,100,0),
(@PATH,13,3137.919,-992.722,34.28274,0,0,0,100,0);

-- Pathing for Forgotten Knight Entry: 27224
SET @NPC := 103870;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2994.183,`position_y`=-917.3297,`position_z`=15.79732 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2410, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2991.063,-923.8657,16.29732,0,0,0,100,0),
(@PATH,2,2988.507,-934.7225,15.49086,0,0,0,100,0),
(@PATH,3,2991.473,-947.5349,13.86586,0,0,0,100,0),
(@PATH,4,2986.829,-959.4357,14.36586,0,0,0,100,0),
(@PATH,5,2982.086,-973.1686,14.91845,0,0,0,100,0),
(@PATH,6,2986.519,-992.0975,15.04345,0,0,0,100,0),
(@PATH,7,3000.431,-997.9194,13.52108,0,0,0,100,0),
(@PATH,8,3008.087,-1011.985,10.77139,0,0,0,100,0),
(@PATH,9,3017.707,-1028.244,11.64639,0,0,0,100,0),
(@PATH,10,3031.724,-1030.211,11.89639,0,0,0,100,0),
(@PATH,11,3041.782,-1051.163,12.00821,0,0,0,100,0),
(@PATH,12,3035.676,-1067.425,12.25596,0,0,0,100,0),
(@PATH,13,3041.782,-1051.163,12.00821,0,0,0,100,0),
(@PATH,14,3064.94,-1033.926,9.38321,0,0,0,100,0),
(@PATH,15,3049.375,-1016.077,11.23723,0,0,0,100,0),
(@PATH,16,3042.356,-991.0371,13.35068,0,0,0,100,0),
(@PATH,17,3044.027,-973.3226,13.35068,0,0,0,100,0),
(@PATH,18,3035.297,-959.0609,14.15011,0,0,0,100,0),
(@PATH,19,3039.989,-937.3704,14.52511,0,0,0,100,0),
(@PATH,20,3041.8,-923.7596,15.40918,0,0,0,100,0),
(@PATH,21,3026.872,-915.1911,16.42643,0,0,0,100,0),
(@PATH,22,3012.979,-918.055,15.67643,0,0,0,100,0),
(@PATH,23,2994.183,-917.3297,15.79732,0,0,0,100,0);

-- Pathing for Forgotten Knight Entry: 27224
SET @NPC := 103868;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3075.944,`position_y`=-811.9883,`position_z`=20.80827 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2410, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3080.952,-824.3328,23.05827,0,0,0,100,0),
(@PATH,2,3075.61,-839.4752,22.73697,0,0,0,100,0),
(@PATH,3,3060.65,-845.2489,19.05826,0,0,0,100,0),
(@PATH,4,3046.751,-844.7985,16.93326,0,0,0,100,0),
(@PATH,5,3037.941,-836.3997,14.55826,0,0,0,100,0),
(@PATH,6,3030.868,-826.7025,14.97029,0,0,0,100,0),
(@PATH,7,3025.803,-806.0645,12.84529,0,0,0,100,0),
(@PATH,8,3029.52,-794.0267,10.84228,0,0,0,100,0),
(@PATH,9,3038.712,-775.0134,13.51348,0,0,0,100,0),
(@PATH,10,3053.475,-795.7884,14.88848,0,0,0,100,0),
(@PATH,11,3060.79,-809.8187,17.99917,0,0,0,100,0),
(@PATH,12,3075.944,-811.9883,20.80827,0,0,0,100,0);

-- Pathing for Forgotten Knight Entry: 27224
SET @NPC := 103910;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3149.75,`position_y`=-869.2438,`position_z`=36.21198 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2410, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3146.117,-888.8926,30.46198,0,0,0,100,0),
(@PATH,2,3124.167,-897.0647,26.10263,0,0,0,100,0),
(@PATH,3,3109.003,-894.5141,23.35263,0,0,0,100,0),
(@PATH,4,3102.094,-881.6088,24.10263,0,0,0,100,0),
(@PATH,5,3095.041,-871.0077,23.56842,0,0,0,100,0),
(@PATH,6,3085.051,-870.8863,20.19342,0,0,0,100,0),
(@PATH,7,3068.079,-868.6927,15.19342,0,0,0,100,0),
(@PATH,8,3055.256,-851.1473,16.93326,0,0,0,100,0),
(@PATH,9,3057.439,-832.538,19.24917,0,0,0,100,0),
(@PATH,10,3071.083,-814.3071,20.30827,0,0,0,100,0),
(@PATH,11,3088.409,-817.8911,23.93327,0,0,0,100,0),
(@PATH,12,3096.284,-822.4347,28.05827,0,0,0,100,0),
(@PATH,13,3119.771,-833.5566,35.02748,0,0,0,100,0),
(@PATH,14,3138.177,-848.7571,40.79415,0,0,0,100,0),
(@PATH,15,3149.75,-869.2438,36.21198,0,0,0,100,0);

-- Pathing for Forgotten Knight Entry: 27224
SET @NPC := 103875;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2978.204,`position_y`=-643.6324,`position_z`=49.32085 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2410, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2965.427,-625.391,63.11521,0,0,0,100,0),
(@PATH,2,2978.204,-643.6324,49.32085,0,0,0,100,0),
(@PATH,3,2995.292,-669.0926,42.25421,0,0,0,100,0),
(@PATH,4,2976.448,-683.0107,43.00421,0,0,0,100,0),
(@PATH,5,2960.967,-700.3996,41.82913,0,0,0,100,0),
(@PATH,6,2968.173,-720.5273,41.47844,0,0,0,100,0),
(@PATH,7,2951.983,-727.3806,36.82913,0,0,0,100,0),
(@PATH,8,2936.89,-718.2084,37.32913,0,0,0,100,0),
(@PATH,9,2960.967,-700.3996,41.82913,0,0,0,100,0),
(@PATH,10,2976.448,-683.0107,43.00421,0,0,0,100,0),
(@PATH,11,2995.292,-669.0926,42.25421,0,0,0,100,0),
(@PATH,12,2978.204,-643.6324,49.32085,0,0,0,100,0);

-- Pathing for Forgotten Knight Entry: 27224
SET @NPC := 103854;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2801.809,`position_y`=-1351.609,`position_z`=30.75213 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2410, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2817.353,-1349.674,28.00213,0,0,0,100,0),
(@PATH,2,2838.433,-1344.79,23.96613,0,0,0,100,0),
(@PATH,3,2848.939,-1335.581,21.34113,0,0,0,100,0),
(@PATH,4,2866.034,-1321.116,15.20641,0,0,0,100,0),
(@PATH,5,2870.609,-1310.2,11.10666,0,0,0,100,0),
(@PATH,6,2885.081,-1298.237,3.82512,0,0,0,100,0),
(@PATH,7,2896.063,-1302.303,5.106659,0,0,0,100,0),
(@PATH,8,2893.534,-1316.084,11.48166,0,0,0,100,0),
(@PATH,9,2881.322,-1331.398,15.85666,0,0,0,100,0),
(@PATH,10,2870.855,-1347.522,19.17392,0,0,0,100,0),
(@PATH,11,2848.049,-1357.54,25.46613,0,0,0,100,0),
(@PATH,12,2826.136,-1374.455,33.06441,0,0,0,100,0),
(@PATH,13,2807.342,-1380.172,35.56441,0,0,0,100,0),
(@PATH,14,2798.427,-1374.941,35.90455,0,0,0,100,0),
(@PATH,15,2791.729,-1366.846,35.77955,0,0,0,100,0),
(@PATH,16,2794.926,-1355.688,33.31061,0,0,0,100,0),
(@PATH,17,2801.809,-1351.609,30.75213,0,0,0,100,0);

-- Remove dup spawns
DELETE FROM `creature` WHERE `guid`=103909;
DELETE FROM `creature_addon` WHERE `guid`=103909;

-- Pathing for Emerald Skytalon Entry: 27244
SET @NPC := 105773;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2829.573,`position_y`=77.83496,`position_z`=23.05415 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2834.644,66.5554,23.05415,0,0,0,100,0),
(@PATH,2,2832.327,47.98145,23.05415,0,0,0,100,0),
(@PATH,3,2824.19,33.55273,23.05415,0,0,0,100,0),
(@PATH,4,2813.263,27.89535,23.05415,0,0,0,100,0),
(@PATH,5,2799.154,28.69884,23.05415,0,0,0,100,0),
(@PATH,6,2792.593,37.23269,23.05415,0,0,0,100,0),
(@PATH,7,2787.989,49.96674,23.05415,0,0,0,100,0),
(@PATH,8,2790.986,62.9579,23.05415,0,0,0,100,0),
(@PATH,9,2799.894,77.16607,23.05415,0,0,0,100,0),
(@PATH,10,2811.617,81.51264,23.05415,0,0,0,100,0),
(@PATH,11,2829.573,77.83496,23.05415,0,0,0,100,0);

-- Pathing for Emerald Skytalon Entry: 27244
SET @NPC := 105776;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2768.484,`position_y`=170.2238,`position_z`=22.38341 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2795.626,178.1085,19.93896,0,0,0,100,0),
(@PATH,2,2807.406,164.8766,17.6334,0,0,0,100,0),
(@PATH,3,2802.16,140.2939,17.6334,0,0,0,100,0),
(@PATH,4,2811.732,110.9432,17.6334,0,0,0,100,0),
(@PATH,5,2820.829,97.51039,17.6334,0,0,0,100,0),
(@PATH,6,2826.558,81.62894,17.6334,0,0,0,100,0),
(@PATH,7,2809.651,77.49517,17.6334,0,0,0,100,0),
(@PATH,8,2788.568,80.96075,17.6334,0,0,0,100,0),
(@PATH,9,2774.997,95.94735,20.41118,0,0,0,100,0),
(@PATH,10,2774.55,112.1218,22.38341,0,0,0,100,0),
(@PATH,11,2760.725,140.132,22.38341,0,0,0,100,0),
(@PATH,12,2758.094,158.0518,22.38341,0,0,0,100,0),
(@PATH,13,2768.484,170.2238,22.38341,0,0,0,100,0);

-- Pathing for Emerald Skytalon Entry: 27244
SET @NPC := 105790;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2690.665,`position_y`=105.8982,`position_z`=21.48963 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2705.308,102.4151,21.48963,0,0,0,100,0),
(@PATH,2,2703.798,84.28983,21.67711,0,0,0,100,0),
(@PATH,3,2705.529,52.25309,4.98267,0,0,0,100,0),
(@PATH,4,2705.258,36.26714,0.510448,0,0,0,100,0),
(@PATH,5,2705.416,24.20399,4.038228,0,0,0,100,0),
(@PATH,6,2691.849,-11.67057,19.26741,0,0,0,100,0),
(@PATH,7,2695.837,-31.84223,22.57297,0,0,0,100,0),
(@PATH,8,2721.802,-37.03499,22.57297,0,0,0,100,0),
(@PATH,9,2733.044,-22.9873,20.85075,0,0,0,100,0),
(@PATH,10,2740.016,-0.903429,20.85075,0,0,0,100,0),
(@PATH,11,2720.839,32.38059,20.85075,0,0,0,100,0),
(@PATH,12,2687.212,64.41743,21.48963,0,0,0,100,0),
(@PATH,13,2690.665,105.8982,21.48963,0,0,0,100,0);

-- Pathing for Emerald Skytalon Entry: 27244
SET @NPC := 105751;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2818.96,`position_y`=19.08247,`position_z`=18.30093 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2825.987,33.99419,18.30093,0,0,0,100,0),
(@PATH,2,2828.41,56.17736,18.30093,0,0,0,100,0),
(@PATH,3,2822.678,71.10498,18.30093,0,0,0,100,0),
(@PATH,4,2807.275,74.22374,18.30093,0,0,0,100,0),
(@PATH,5,2796.926,65.10563,18.30093,0,0,0,100,0),
(@PATH,6,2791.43,53.62164,18.30093,0,0,0,100,0),
(@PATH,7,2789.82,40.9783,18.30093,0,0,0,100,0),
(@PATH,8,2797.13,30.63395,18.30093,0,0,0,100,0),
(@PATH,9,2806.262,18.99745,18.30093,0,0,0,100,0),
(@PATH,10,2818.96,19.08247,18.30093,0,0,0,100,0);

-- Pathing for Emerald Skytalon Entry: 27244
SET @NPC := 105771;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2822.304,`position_y`=25.58095,`position_z`=28.66101 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2838.793,39.95627,28.66101,0,0,0,100,0),
(@PATH,2,2836.108,57.5306,28.66101,0,0,0,100,0),
(@PATH,3,2825.485,74.04839,28.66101,0,0,0,100,0),
(@PATH,4,2805.867,74.06527,28.66101,0,0,0,100,0),
(@PATH,5,2792.58,59.60639,28.66101,0,0,0,100,0),
(@PATH,6,2792.146,41.0931,28.66101,0,0,0,100,0),
(@PATH,7,2806.482,27.81955,28.66101,0,0,0,100,0),
(@PATH,8,2822.304,25.58095,28.66101,0,0,0,100,0);

-- Pathing for Emerald Skytalon Entry: 27244
SET @NPC := 105793;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2885.995,`position_y`=86.84375,`position_z`=25.08892 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2877.463,71.04628,26.72781,0,0,0,100,0),
(@PATH,2,2862.192,67.89458,24.06114,0,0,0,100,0),
(@PATH,3,2846.071,81.27257,23.17225,0,0,0,100,0),
(@PATH,4,2835.402,100.0479,22.14447,0,0,0,100,0),
(@PATH,5,2844.852,113.7791,23.17225,0,0,0,100,0),
(@PATH,6,2858.143,119.3263,21.75558,0,0,0,100,0),
(@PATH,7,2876.194,105.5451,24.2278,0,0,0,100,0),
(@PATH,8,2885.995,86.84375,25.08892,0,0,0,100,0);

-- Pathing for Emerald Skytalon Entry: 27244
SET @NPC := 105792;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2870.061,`position_y`=48.39068,`position_z`=24.00088 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2887.51,42.04189,24.00088,0,0,0,100,0),
(@PATH,2,2890.971,26.92735,24.00088,0,0,0,100,0),
(@PATH,3,2888.869,7.343913,24.00088,0,0,0,100,0),
(@PATH,4,2875.525,-13.28494,24.00088,0,0,0,100,0),
(@PATH,5,2856.301,-22.60704,24.00088,0,0,0,100,0),
(@PATH,6,2843.07,-12.60786,24.00088,0,0,0,100,0),
(@PATH,7,2838.096,10.55545,24.00088,0,0,0,100,0),
(@PATH,8,2852.048,33.66027,24.00088,0,0,0,100,0),
(@PATH,9,2870.061,48.39068,24.00088,0,0,0,100,0);

-- Pathing for Emerald Skytalon Entry: 27244
SET @NPC := 105743;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2791.267,`position_y`=-5.982639,`position_z`=23.38554 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2800.101,-11.76535,19.27443,0,0,0,100,0),
(@PATH,2,2804.809,-27.09413,19.27443,0,0,0,100,0),
(@PATH,3,2795.457,-39.61523,19.27443,0,0,0,100,0),
(@PATH,4,2772.509,-53.71186,24.91332,0,0,0,100,0),
(@PATH,5,2752.826,-48.53326,19.27443,0,0,0,100,0),
(@PATH,6,2744.481,-35.89621,23.6911,0,0,0,100,0),
(@PATH,7,2750.413,-22.42415,19.27443,0,0,0,100,0),
(@PATH,8,2762.693,-11.72667,24.38554,0,0,0,100,0),
(@PATH,9,2778.425,-5.4662,19.27443,0,0,0,100,0),
(@PATH,10,2791.267,-5.982639,23.38554,0,0,0,100,0);

-- Fix Inhabittype for Emerald Skytalon
UPDATE `creature_template` SET `InhabitType`=5 WHERE `entry`=27244;
-- Some Emerald Skytalons should not be moving (Should be landed but......well you know...)
UPDATE `creature` SET `spawndist`=0,`MovementType`=0 WHERE `id`=27244 AND `MovementType`=1;

-- Pathing for Wild Wyrm Entry: 30275
SET @NPC := 202972;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7066.043,`position_y`=-1968.466,`position_z`=824.2749 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7126.909,-2006.859,838.8026,0,0,0,100,0),
(@PATH,2,7128.004,-2079.435,824.9972,0,0,0,100,0),
(@PATH,3,7123.410,-2161.681,837.6913,0,0,0,100,0),
(@PATH,4,7032.643,-2110.862,816.2751,0,0,0,100,0),
(@PATH,5,7066.043,-1968.466,824.2749,0,0,0,100,0);

-- Pathing for Wild Wyrm Entry: 30275
SET @NPC := 202973;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7115.650,`position_y`=-2059.480,`position_z`=818.3268 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7033.949,-2100.414,836.1047,0,0,0,100,0),
(@PATH,2,7059.351,-2161.099,826.7712,0,0,0,100,0),
(@PATH,3,7092.921,-2188.170,811.4102,0,0,0,100,0),
(@PATH,4,7133.742,-2166.362,794.6603,0,0,0,100,0),
(@PATH,5,7151.966,-2105.456,792.9937,0,0,0,100,0),
(@PATH,6,7115.650,-2059.480,818.3268,0,0,0,100,0);

-- Pathing for Wild Wyrm Entry: 30275
SET @NPC := 202974;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7213.711,`position_y`=-2226.125,`position_z`=806.5094 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7167.105,-2184.223,820.4260,0,0,0,100,0),
(@PATH,2,7125.120,-2255.990,806.5094,0,0,0,100,0),
(@PATH,3,7173.554,-2300.135,806.5094,0,0,0,100,0),
(@PATH,4,7251.454,-2287.427,789.5095,0,0,0,100,0),
(@PATH,5,7213.711,-2226.125,806.5094,0,0,0,100,0);

-- Pathing for Wild Wyrm Entry: 30275
SET @NPC := 202975;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7109.281,`position_y`=-2100.445,`position_z`=817.4706 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7072.179,-2111.299,817.4706,0,0,0,100,0),
(@PATH,2,7064.227,-2116.913,817.4706,0,0,0,100,0),
(@PATH,3,7050.559,-2152.228,817.4706,0,0,0,100,0),
(@PATH,4,7062.942,-2203.969,813.1094,0,0,0,100,0),
(@PATH,5,7103.487,-2255.553,806.3886,0,0,0,100,0),
(@PATH,6,7177.481,-2288.611,796.1102,0,0,0,100,0),
(@PATH,7,7275.345,-2308.585,793.6097,0,0,0,100,0),
(@PATH,8,7372.846,-2327.065,798.7206,0,0,0,100,0),
(@PATH,9,7427.968,-2391.033,804.1375,0,0,0,100,0),
(@PATH,10,7423.436,-2447.741,807.2206,0,0,0,100,0),
(@PATH,11,7355.370,-2486.082,804.4431,0,0,0,100,0),
(@PATH,12,7304.908,-2475.450,803.7766,0,0,0,100,0),
(@PATH,13,7279.233,-2422.631,808.0823,0,0,0,100,0),
(@PATH,14,7257.583,-2362.908,817.4706,0,0,0,100,0),
(@PATH,15,7227.192,-2262.001,817.4706,0,0,0,100,0),
(@PATH,16,7168.813,-2158.760,817.4706,0,0,0,100,0),
(@PATH,17,7143.784,-2112.828,817.4706,0,0,0,100,0),
(@PATH,18,7109.281,-2100.445,817.4706,0,0,0,100,0);

-- Pathing for Wild Wyrm Entry: 30275
SET @NPC := 202976;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7327.672,`position_y`=-2396.082,`position_z`=794.1380 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7369.227,-2353.661,800.3325,0,0,0,100,0),
(@PATH,2,7356.053,-2268.009,817.5546,0,0,0,100,0),
(@PATH,3,7278.459,-2252.020,801.5268,0,0,0,100,0),
(@PATH,4,7239.885,-2275.736,811.6657,0,0,0,100,0),
(@PATH,5,7239.562,-2376.111,797.7770,0,0,0,100,0),
(@PATH,6,7327.672,-2396.082,794.1380,0,0,0,100,0);

-- Pathing for Wild Wyrm Entry: 30275
SET @NPC := 202977;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7424.327,`position_y`=-2393.728,`position_z`=797.1465 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7334.587,-2389.095,818.5355,0,0,0,100,0),
(@PATH,2,7282.970,-2459.180,819.0909,0,0,0,100,0),
(@PATH,3,7309.571,-2509.064,792.0912,0,0,0,100,0),
(@PATH,4,7420.728,-2505.169,815.1464,0,0,0,100,0),
(@PATH,5,7424.327,-2393.728,797.1465,0,0,0,100,0);

UPDATE `creature_template` SET `speed_run`=3.571429,`speed_walk`=3.6,`InhabitType`=5 WHERE `entry`=30275;

-- ========================
--  2011_05_18_10_world_npc_text.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Insert npc_text from sniff
DELETE FROM `npc_text` WHERE `ID` IN (16726,8336,16540);
INSERT INTO `npc_text` (`ID`,`prob0`,`text0_0`,`text0_1`,`lang0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`prob1`,`text1_0`,`text1_1`,`lang1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`prob2`,`text2_0`,`text2_1`,`lang2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`prob3`,`text3_0`,`text3_1`,`lang3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`prob4`,`text4_0`,`text4_1`,`lang4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`prob5`,`text5_0`,`text5_1`,`lang5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`prob6`,`text6_0`,`text6_1`,`lang6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`prob7`,`text7_0`,`text7_1`,`lang7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(16726,1,'I care far too deeply about redeeming Eldre''thalas to deal with any other matter. War, strife, allegiances, none of it matters until this city is safe.','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(8336,1,'What now?  Can''t you see I''m rather busy?','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1),
(16540,1,'I train only warriors, $c. You''ll have to look elsewhere.','I train only warriors, $c. You''ll have to look elsewhere.',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,1);

-- ========================
--  2011_05_18_11_world_item_template.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `item_template` SET `DisenchantID` = 43 WHERE `DisenchantID` = 34 AND `ItemLevel` = 35;

-- ========================
--  2011_05_19_00_world_spell_script_names.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM spell_script_names WHERE ScriptName = 'spell_gen_lifeblood';
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES
(-55428, 'spell_gen_lifeblood');

-- ========================
--  2011_05_19_01_world_instance_misc.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Clean Up
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (32941,33333,33332,32950,33331,32946,32948,33330,32938));
DELETE FROM `creature` WHERE `id` IN (32941,33333,33332,32950,33331,32946,32948,33330,32938);

-- Factions
UPDATE `creature_template` SET `faction_A`=1665, `faction_H`=1665, `unit_flags`=32768 WHERE `entry` IN (33325,32901,33328,32901,32893,33327,32897,33326,32941,33333,33332,32950,33331,32946,32948,33330);
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry` IN (33352,33353);

-- Unit Flags
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=32941;
UPDATE `creature_template` SET `unit_flags`=33686016, `flags_extra`=2 WHERE `entry`=30298;
UPDATE `creature_template` SET `unit_flags`=33817094 WHERE `entry`=33174;
UPDATE `creature_template` SET `unit_flags`=393220 WHERE `entry`=32938;
UPDATE `creature_template` SET `unit_flags`=33948166 WHERE `entry`=33174;
UPDATE `creature_template` SET `unit_flags`=393220 WHERE `entry` IN (33352,33353);

-- Immunities
UPDATE `creature_template` SET `mechanic_immune_mask`=612597599 WHERE `entry` IN (32938,32926,33352,33353);
UPDATE `creature_template` SET `mechanic_immune_mask`=650854239 WHERE `entry`=32845;

-- Miscelaneous
UPDATE `creature_template` SET `difficulty_entry_1`=33352, `flags_extra`=0 WHERE `entry`=32926;
UPDATE `creature_template` SET `flags_extra`=0 WHERE `entry` IN (32938,33352,33353);

-- GameObjects
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=194173;

-- Spell Linked Spell
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (61990,61969,65280);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`)
VALUES 
(61990,-62457,2,'Hodir - Ice Shards Immunity'),
(61990,-65370,2,'Hodir - Ice Shards Immunity'),
(65280,-62469,2,'Toasty fire - Freeze imunity'),
(65280,-62039,2,'Toasty fire - Biting cold imunity'),
(61969,7940,2,'Hodir - Flash Freeze immunity'),
(61990,7940,2,'Hodir - Flash Freeze immunity');

-- ========================
--  2011_05_19_01_world_script_text.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `script_texts` WHERE `entry` IN (-1603209,-1603219);
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`)
VALUES
(32845,-1603209,'Hodir begins to cast Flash Freeze!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Hodir - EMOTE_FREEZE'),
(32845,-1603219,'Hodir gains Frozen Blows!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Hodir - EMOTE_BLOW');

-- ========================
--  2011_05_19_01_world_scriptname.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `creature_template` SET `ScriptName`='npc_hodir_priest' WHERE `entry` IN (32897,33326,32948,33330);
UPDATE `creature_template` SET `ScriptName`='npc_hodir_shaman' WHERE `entry` IN (33328,32901,33332,32950);
UPDATE `creature_template` SET `ScriptName`='npc_hodir_druid' WHERE `entry` IN (33325,32900,32941,33333);
UPDATE `creature_template` SET `ScriptName`='npc_hodir_mage' WHERE `entry` IN (32893,33327,33331,32946);
UPDATE `creature_template` SET `ScriptName`='npc_toasty_fire' WHERE `entry`=33342;
UPDATE `creature_template` SET `ScriptName`='npc_flash_freeze' WHERE `entry`=32926;
UPDATE `creature_template` SET `ScriptName`='npc_icicle' WHERE `entry` IN (33169,33173);
UPDATE `creature_template` SET `ScriptName`='npc_snowpacked_icicle' WHERE `entry`=33174;
UPDATE `creature_template` SET `ScriptName`='npc_ice_block' WHERE `entry`=32938;
UPDATE `creature_template` SET `ScriptName`='boss_hodir' WHERE `entry`=32845;

-- ========================
--  2011_05_19_01_world_spell_script_names.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `spell_id` IN (62038,62039);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`)
VALUES
(62038,'spell_biting_cold'),
(62039,'spell_biting_cold_dot');

-- ========================
--  2011_05_20_00_world_conditions.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry`=23417;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,0,23417,0,24,1,16975,0,0, '', 'Sanctified Crystal - Uncontrolled Voidwalker target');

-- ========================
--  2011_05_20_01_world_achievement_criteria_data.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `disables` WHERE `entry` IN (12757,12954,12971,12978,12979,12980,13048,13059,13099,13124,13125,13126,13335,13355) AND `sourceType`=4;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12757,12954,12971,12978,12979,12980,13048,13059,13099,13124,13125,13126,13335,13355);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(12978,12,0,0,''),
(12979,12,1,0,''),
(12971,12,2,0,''),
(12980,12,3,0,''),
(12978,11,0,0,'achievement_portal_jockey'),
(12979,11,0,0,'achievement_portal_jockey'),
(12971,11,0,0,'achievement_portal_jockey'),
(12980,11,0,0,'achievement_portal_jockey'),
(13355,12,1,0,''),
(13335,12,0,0,''),
(12757,12,0,0,''),
(12954,12,1,0,''),
(13048,12,2,0,''),
(13059,12,3,0,''),
(13099,12,0,0,''),
(13125,12,2,0,''),
(13124,12,1,0,''),
(13126,12,3,0,'');

-- ========================
--  2011_05_20_01_world_instance_misc.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `creature_text` WHERE `entry` IN (16980,36789,37491,37493,37494,37495);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(16980,0,0,'Intruders have breached the inner sanctum. Hasten the destruction of the green dragon! Leave only bones and sinew for the reanimation!',14,0,0,0,0,17251,'The Lich King - SAY_LICH_KING_INTRO'),
(36789,0,0,'Heroes, lend me your aid. I... I cannot hold them off much longer. You must heal my wounds!',14,0,0,0,0,17064,'Valithria Dreamwalker - SAY_VALITHRIA_ENTER_COMBAT'),
(36789,1,0,'I have opened a portal into the Dream. Your salvation lies within, heroes...',14,0,0,0,0,17068,'Valithria Dreamwalker - SAY_VALITHRIA_DREAM_PORTAL'),
(36789,2,0,'My strength is returning! Press on, heroes!',14,0,0,0,0,17070,'Valithria Dreamwalker - SAY_VALITHRIA_75_PERCENT'),
(36789,3,0,'I will not last much longer!',14,0,0,0,0,17069,'Valithria Dreamwalker - SAY_VALITHRIA_25_PERCENT'),
(36789,4,0,'Forgive me for what I do! I... cannot... stop... ONLY NIGHTMARES REMAIN!',14,0,0,0,0,17072,'Valithria Dreamwalker - SAY_VALITHRIA_DEATH'),
(36789,5,0,'A tragic loss...',14,0,0,0,0,17066,'Valithria Dreamwalker - SAY_VALITHRIA_PLAYER_DEATH'),
(36789,6,0,'FAILURES!',14,0,0,0,0,17067,'Valithria Dreamwalker - SAY_VALITHRIA_BERSERK'),
(36789,7,0,'I am renewed! Ysera grants me the favor to lay these foul creatures to rest!',14,0,0,0,0,17071,'Valithria Dreamwalker - SAY_VALITHRIA_SUCCESS'),
(37491,1,0, 'You miserable fools never did manage to select a decent bat wing.',1,0,0,0,0,16587, 'Captain Arnath - SAY_ARNATH_RESURRECTED'),
(37491,2,0, 'THAT was for bringing me spoiled spider ichor!',1,0,0,0,0,16588, 'Captain Arnath - SAY_ARNATH_KILL'),
(37491,3,0, 'Don''t... let Finklestein use me... for his potions...',1,0,0,0,0,16589, 'Captain Arnath - SAY_ARNATH_SECOND_DEATH'),
(37493,1,0, 'What? This strength...? All of the pain is gone! You... must join me in the eternal embrace of death!',1,0,0,0,0,16811, 'Captain Brandon - SAY_BRANDON_RESURRECTED'),
(37493,2,0, 'It doesn''t hurt anymore, does it?',1,0,0,0,0,16812, 'Captain Brandon - SAY_BRANDON_KILL'),
(37493,3,0, 'I''m sorry...',1,0,0,0,0,16813, 'Captain Brandon - SAY_BRANDON_SECOND_DEATH'),
(37494,1,0, 'No! Why was I denied a death by flame? You must all BURN!',1,0,0,0,0,16845, 'Captain Grondel - SAY_GRONDEL_RESURRECTED'),
(37494,2,0, 'Can you feel the burn?',1,0,0,0,0,16846, 'Captain Grondel - SAY_GRONDEL_KILL'),
(37494,3,0, 'What... have I done? No!',1,0,0,0,0,16847, 'Captain Grondel - SAY_GRONDEL_SECOND_DEATH'),
(37495,1,0, 'There is no escaping the Lich King''s will. Prepare for an explosive encounter!',1,0,0,0,0,16999, 'Captain Rupert - SAY_RUPERT_RESURRECTED'),
(37495,2,0, 'So that''s what happens when you stand too close to a bomb!',1,0,0,0,0,17000, 'Captain Rupert - SAY_RUPERT_KILL'),
(37495,3,0, 'What an... explosive ending!',1,0,0,0,0,17001, 'Captain Rupert - SAY_RUPERT_SECOND_DEATH');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (71948,70588,70602,71946,72031,72032,72033,70921,71032,71078,70933,72706,73843);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,71948,0,18,1,37950,0,0,'','Valithria Dreamwalker - Copy Damage on Valithria'),
(13,0,70588,0,18,1,36789,0,0,'','Suppresser - Suppression target Valithria'),
(13,0,70602,0,18,1,36789,0,0,'','Risen Archmage - Corruption target Valithria'),
(13,0,71946,0,18,1,36789,0,0,'','Valithria Dreamwalker - Nightmare Cloud'),
(13,0,72031,0,18,1,36789,0,0,'','Valithria Dreamwalker - Nightmare Cloud'),
(13,0,72032,0,18,1,36789,0,0,'','Valithria Dreamwalker - Nightmare Cloud'),
(13,0,72033,0,18,1,36789,0,0,'','Valithria Dreamwalker - Nightmare Cloud'),
(13,0,70921,0,18,1,22515,0,0,'','The Lich King - Summon Gluttonous Abomination'),
(13,0,71032,0,18,1,22515,0,0,'','The Lich King - Summon Blistering Zombie'),
(13,0,71078,0,18,1,22515,0,0,'','The Lich King - Summon Risen Archmage'),
(13,0,70933,0,18,1,22515,0,0,'','The Lich King - Summon Blazing Skeleton'),
(13,0,72706,0,18,1,0,0,0,'','Valithria Dreamwalker - Achievement Check'),
(13,0,73843,0,18,1,0,0,0,'','Valithria Dreamwalker - Reputation reward');

DELETE FROM `creature_template_addon` WHERE `entry` IN (36789,38174,37934,37950,38068,37918,37907,38168,38726,38736,37945,38430,38186,38429,37985,38421);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(36789,0,0x0000000,1,0,'72724 70904'),
(38174,0,0x0000000,1,0,'72724 70904'),
(37934,0,0x0000000,1,0,'70749'),
(37950,0,0x3000000,1,0,''),
(38068,0,0x0000000,1,0,'71085'),
(37918,0,0x0000000,1,0,'70715'),
(37907,0,0x0000000,1,0,'72962'),
(38168,0,0x0000000,1,0,'72962'),
(38726,0,0x0000000,1,0,'72962'),
(38736,0,0x0000000,1,0,'72962'),
(37945,0,0x0000000,1,0,'70763'), -- Dream Portal
(38430,0,0x0000000,1,0,'71994'), -- Nightmare Portal
(38186,0,0x0000000,1,0,'71304'), -- Dream Portal (Pre-effect)
(38429,0,0x0000000,1,0,'71986'), -- Nightmare Portal (Pre-effect)
(37985,0,0x3000000,1,0,'70876'), -- Dream Cloud
(38421,0,0x3000000,1,0,'71939 71970'); -- Nightmre Cloud

UPDATE `creature_template` SET `minlevel`=83,`maxlevel`=83,`exp`=2,`unit_class`=1,`faction_A`=1665,`faction_H`=1665,`unit_flags`=`unit_flags`|33554432,`baseattacktime`=2000,`scale`=1,`InhabitType`=7 WHERE `entry`=37950; -- Valithria Dreamwalker
UPDATE `creature_template` SET `minlevel`=60,`maxlevel`=60,`unit_class`=1,`faction_A`=14,`faction_H`=14,`unit_flags`=`unit_flags`|33554432,`baseattacktime`=2000,`flags_extra`=`flags_extra`|128 WHERE `entry`=38068; -- Mana Void
UPDATE `creature_template` SET `minlevel`=60,`maxlevel`=60,`unit_class`=1,`faction_A`=14,`faction_H`=14,`unit_flags`=`unit_flags`|33554432,`baseattacktime`=2000,`flags_extra`=`flags_extra`|128 WHERE `entry`=37918; -- Column of Frost
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`exp`=2,`unit_class`=1,`faction_A`=35,`faction_H`=35,`npcflag`=`npcflag`|16777216 WHERE `entry` IN (37945,38430); -- Dream Portal and Nightmare Portal
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`faction_A`=35,`faction_H`=35,`unit_flags`=`unit_flags`|33554432,`npcflag`=`npcflag`|16777216,`baseattacktime`=2000 WHERE `entry`=38186; -- Dream Portal (Pre-effect)
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`faction_A`=35,`faction_H`=35,`unit_flags`=`unit_flags`|33554432,`npcflag`=`npcflag`|16777216,`baseattacktime`=2000 WHERE `entry`=38429; -- Nightmare Portal (Pre-effect)
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`exp`=2,`unit_class`=1,`faction_A`=2022,`faction_H`=2022,`unit_flags`=`unit_flags`|33554432,`baseattacktime`=2000,`InhabitType`=7,`flags_extra`=`flags_extra`|128 WHERE `entry`=37985; -- Dream Cloud
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`exp`=2,`unit_class`=1,`faction_A`=2022,`faction_H`=2022,`unit_flags`=`unit_flags`|33554432,`baseattacktime`=2000,`InhabitType`=7,`flags_extra`=`flags_extra`|128 WHERE `entry`=38421; -- Nightmare Cloud
UPDATE `creature_template` SET `minlevel`=83,`maxlevel`=83,`exp`=2,`unit_class`=1,`faction_A`=35,`faction_H`=35,`npcflag`=`npcflag`|3,`baseattacktime`=2000,`scale`=1 WHERE `entry`=38589; -- Valithria Dreamwalker (questgiver)

SET @GUID := 137794;
UPDATE `creature` SET `phaseMask`=`phaseMask`|4 WHERE `id`=36789;
-- Add The Lich King and Green Dragon Combat Trigger to all encounter phases, fixes evading when all players enter portals
UPDATE `creature` SET `phaseMask`=`phaseMask`|16 WHERE `guid` IN (137789,137752);
DELETE FROM `creature` WHERE `id` IN (37950,37985,38421) OR `guid`=137793 OR `guid` BETWEEN @GUID+00 AND @GUID+27;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(1636,37950,631,15,20,0,0,4202.847,2484.917,383.8368,0.00000,604800,0,0,0,0,0,0,0,0,0), -- Valithria Dreamwalker (dream phase)
(137793,22515,631,10,1,0,0,4166.170,2411.520,364.9520,1.57080,120,0,0,0,0,0,0,0,0,0), -- World Trigger
-- Dream Cloud
(@GUID+00,37985,631,3,16,0,0,4155.51,2478.76,382.494,4.97053,30,10,0,0,0,0,1,0,0,0),
(@GUID+01,37985,631,3,16,0,0,4158.75,2494.08,384.334,2.31129,30,10,0,0,0,0,1,0,0,0),
(@GUID+02,37985,631,3,16,0,0,4172.57,2464.47,385.368,3.72021,30,10,0,0,0,0,1,0,0,0),
(@GUID+03,37985,631,3,16,0,0,4173.67,2504.13,386.174,2.67313,30,10,0,0,0,0,1,0,0,0),
(@GUID+04,37985,631,3,16,0,0,4181.62,2514.91,386.374,2.65209,30,10,0,0,0,0,1,0,0,0),
(@GUID+05,37985,631,3,16,0,0,4186.72,2450.97,388.373,4.95968,30,10,0,0,0,0,1,0,0,0),
(@GUID+06,37985,631,3,16,0,0,4200.96,2456.00,387.128,3.58291,30,10,0,0,0,0,1,0,0,0),
(@GUID+07,37985,631,3,16,0,0,4202.23,2508.00,383.985,2.09137,30,10,0,0,0,0,1,0,0,0),
(@GUID+08,37985,631,3,16,0,0,4220.35,2515.16,388.649,2.34469,30,10,0,0,0,0,1,0,0,0),
(@GUID+09,37985,631,3,16,0,0,4222.26,2455.20,385.568,0.00000,30,10,0,0,0,0,1,0,0,0),
(@GUID+10,37985,631,3,16,0,0,4231.61,2464.44,389.011,0.00000,30,10,0,0,0,0,1,0,0,0),
(@GUID+11,37985,631,3,16,0,0,4236.75,2500.62,383.373,5.97527,30,10,0,0,0,0,1,0,0,0),
(@GUID+12,37985,631,3,16,0,0,4243.29,2476.89,386.076,0.00000,30,10,0,0,0,0,1,0,0,0),
(@GUID+13,37985,631,3,16,0,0,4244.83,2493.18,387.677,4.29139,30,10,0,0,0,0,1,0,0,0),
-- Nightmare Cloud
(@GUID+14,38421,631,12,20,0,0,4155.51,2478.76,382.494,4.97053,30,10,0,0,0,0,1,0,0,0),
(@GUID+15,38421,631,12,20,0,0,4158.75,2494.08,384.334,2.31129,30,10,0,0,0,0,1,0,0,0),
(@GUID+16,38421,631,12,20,0,0,4172.57,2464.47,385.368,3.72021,30,10,0,0,0,0,1,0,0,0),
(@GUID+17,38421,631,12,20,0,0,4181.62,2514.91,386.374,2.65209,30,10,0,0,0,0,1,0,0,0),
(@GUID+18,38421,631,12,20,0,0,4200.96,2456.00,387.128,3.58291,30,10,0,0,0,0,1,0,0,0),
(@GUID+19,38421,631,12,20,0,0,4202.23,2508.00,383.985,2.09137,30,10,0,0,0,0,1,0,0,0),
(@GUID+20,38421,631,12,20,0,0,4220.35,2515.16,388.649,2.34469,30,10,0,0,0,0,1,0,0,0),
(@GUID+21,38421,631,12,20,0,0,4222.26,2455.20,385.568,0.00000,30,10,0,0,0,0,1,0,0,0),
(@GUID+22,38421,631,12,20,0,0,4236.75,2500.62,383.373,5.97527,30,10,0,0,0,0,1,0,0,0),
(@GUID+23,38421,631,12,20,0,0,4243.29,2476.89,386.076,0.00000,30,10,0,0,0,0,1,0,0,0);

DELETE FROM `linked_respawn` WHERE `guid`=137789 AND `linkType`=0;
INSERT INTO `linked_respawn` (`guid`,`linkedGuid`,`linkType`) VALUES
(137789,137752,0); -- The Lich King link to Green Dragon Combat Trigger

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (37945,38430,38186,38429);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(37945,70766,0,0,0,3,0,0,0), -- Dream Portal
(38430,70766,0,0,0,3,0,0,0), -- Nightmare Portal
(38186,70766,0,0,0,3,0,0,0), -- Dream Portal (Pre-effect)
(38429,70766,0,0,0,3,0,0,0); -- Nightmare Portal (Pre-effect)

-- Gates should also exist in all phases, prevent players from leaving room
UPDATE `gameobject` SET `phaseMask`=`phaseMask`|16 WHERE `id` IN (201375,201374,201380,201381,201382,201383);

-- ========================
--  2011_05_20_01_world_scriptname.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `creature_template` SET `ScriptName`='boss_valithria_dreamwalker' WHERE `entry`=36789;
UPDATE `creature_template` SET `ScriptName`='npc_green_dragon_combat_trigger' WHERE `entry`=38752;
UPDATE `creature_template` SET `ScriptName`='npc_the_lich_king_controller' WHERE `entry`=16980;
UPDATE `creature_template` SET `ScriptName`='npc_risen_archmage' WHERE `entry`=37868;
UPDATE `creature_template` SET `ScriptName`='npc_blazing_skeleton' WHERE `entry`=36791;
UPDATE `creature_template` SET `ScriptName`='npc_suppresser' WHERE `entry`=37863;
UPDATE `creature_template` SET `ScriptName`='npc_blistering_zombie' WHERE `entry`=37934;
UPDATE `creature_template` SET `ScriptName`='npc_gluttonous_abomination' WHERE `entry`=37886;
UPDATE `creature_template` SET `ScriptName`='npc_dream_portal' WHERE `entry` IN (37945,38430);
UPDATE `creature_template` SET `ScriptName`='npc_dream_cloud' WHERE `entry` IN (37985,38421);

-- ========================
--  2011_05_20_01_world_spell_script_names.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dreamwalker_mana_void';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dreamwalker_decay_periodic_timer';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dreamwalker_summoner';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dreamwalker_summon_suppresser';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dreamwalker_summon_dream_portal';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dreamwalker_summon_nightmare_portal';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dreamwalker_nightmare_cloud';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_putricide_slime_puddle_aura';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(71085,'spell_dreamwalker_mana_void'),
(70915,'spell_dreamwalker_decay_periodic_timer'),
(70912,'spell_dreamwalker_decay_periodic_timer'),
(70916,'spell_dreamwalker_decay_periodic_timer'),
(70913,'spell_dreamwalker_decay_periodic_timer'),
(70921,'spell_dreamwalker_summoner'),
(70912,'spell_dreamwalker_summon_suppresser'),
(71032,'spell_dreamwalker_summoner'),
(71078,'spell_dreamwalker_summoner'),
(70933,'spell_dreamwalker_summoner'),
(72224,'spell_dreamwalker_summon_dream_portal'),
(72480,'spell_dreamwalker_summon_nightmare_portal'),
(71970,'spell_dreamwalker_nightmare_cloud'),
-- bind only on heroic modes, normal does not need this replacement
(72868,'spell_putricide_slime_puddle_aura'),
(72869,'spell_putricide_slime_puddle_aura');

-- ========================
--  2011_05_20_02_world_pool_template.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

SET @REST := 800; -- Leftover area (88 nodes)
SET @AREA17 := @REST+1; -- Area 17 (305 nodes)
SET @AREA383 := @REST+2; -- Area 383 (41 nodes)
SET @AREA385 := @REST+3; -- Area 385 (19 nodes)
SET @AREA386 := @REST+4; -- Area 386 (15 nodes)
SET @AREA387 := @REST+5; -- Area 387 (54 nodes)
SET @AREA388 := @REST+6; -- Area 388 (21 nodes)
SET @AREA390 := @REST+7; -- Area 390 (39 nodes)
SET @AREA391 := @REST+8; -- Area 391 (86 nodes)
SET @AREA1156 := @REST+9; -- Area 1156 (92 nodes)
SET @AREA1698 := @REST+10; -- Area 1698 (20 nodes)
SET @AREA1699 := @REST+11; -- Area 1699 (21 nodes)
SET @AREA1700 := @REST+12; -- Area 1700 (28 nodes)
SET @AREA1701 := @REST+13; -- Area 1701 (39 nodes)

DELETE FROM `pool_template` WHERE `entry` BETWEEN @REST AND @REST+17 ; 
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES 
(@REST,18, 'Master Zone 17 Leftover Areas (18 out of 88 nodes)'),
(@AREA17,60, 'Master Zone 17 Area 17 (60 out of 305 nodes'),
(@AREA383,8, 'Master Zone 17 Area 383 (8 out of 41 nodes'),
(@AREA385,4, 'Master Zone 17 Area 385 (4 out of 19 nodes'),
(@AREA386,3, 'Master Zone 17 Area 386 (3 out of 15 nodes'),
(@AREA387,10, 'Master Zone 17 Area 387 (10 out of 54 nodes'),
(@AREA388,4, 'Master Zone 17 Area 388 (4 out of 21 nodes'),
(@AREA390,8, 'Master Zone 17 Area 390 (8 out of 39 nodes'),
(@AREA391,17, 'Master Zone 17 Area 391 (17 out of 86 nodes'),
(@AREA1156,10, 'Master Zone 17 Area 1156 (18 out of 92 nodes'),
(@AREA1698,10, 'Master Zone 17 Area 1698 (4 out of 20 nodes'),
(@AREA1699,10, 'Master Zone 17 Area 1699 (4 out of 21 nodes'),
(@AREA1700,10, 'Master Zone 17 Area 1700 (6 out of 28 nodes'),
(@AREA1701,10, 'Master Zone 17 Area 1701 (8 out of 39 nodes');

DELETE FROM `pool_gameobject` WHERE `pool_entry` BETWEEN @REST AND @REST+17 ; 
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES 
-- Nodes are numbered based on GUID, comment shows area and type
-- Pooled per area for more randomness
(462,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 1'),
(473,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 2'),
(507,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 7'),
(520,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 8'),
(532,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 9'),
(533,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 10'),
(542,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 11'),
(562,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 12'),
(585,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 13'),
(589,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 14'),
(593,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 15'),
(606,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 18'),
(632,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 21'),
(659,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 23'),
(671,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 24'),
(696,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 27'),
(775,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 34'),
(782,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 35'),
(795,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 37'),
(812,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 38'),
(824,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 39'),
(879,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 43'),
(927,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 54'),
(945,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 57'),
(946,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 58'),
(947,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 59'),
(1011,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 66'),
(1034,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 69'),
(1040,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 71'),
(1082,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 74'),
(1106,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 80'),
(1131,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 83'),
(1166,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 86'),
(1168,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 87'),
(1170,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 89'),
(1193,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 90'),
(1255,@AREA17,0, 'Silverleaf,Zone 17,Area 17,node 93'),
(1355,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 96'),
(1372,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 97'),
(1376,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 100'),
(1398,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 102'),
(1404,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 103'),
(1413,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 107'),
(1429,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 110'),
(1440,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 112'),
(1470,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 115'),
(1471,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 116'),
(1485,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 120'),
(1490,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 121'),
(1512,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 126'),
(1513,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 127'),
(1514,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 128'),
(1522,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 129'),
(1528,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 131'),
(1536,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 132'),
(1544,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 135'),
(1559,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 137'),
(1560,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 138'),
(1575,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 142'),
(1606,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 146'),
(1622,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 147'),
(1634,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 150'),
(1642,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 151'),
(1644,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 152'),
(1663,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 156'),
(1677,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 160'),
(1702,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 162'),
(1704,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 163'),
(1737,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 166'),
(1742,@AREA17,0, 'Peacebloom,Zone 17,Area 17,node 167'),
(1756,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 169'),
(1764,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 173'),
(1765,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 174'),
(1767,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 175'),
(1787,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 181'),
(1796,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 184'),
(1797,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 185'),
(1802,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 187'),
(1804,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 188'),
(1807,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 189'),
(1808,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 190'),
(1809,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 191'),
(1815,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 194'),
(1816,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 195'),
(1823,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 196'),
(1833,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 198'),
(1844,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 202'),
(1845,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 203'),
(1846,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 204'),
(1852,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 205'),
(1859,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 211'),
(1861,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 212'),
(1866,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 214'),
(1868,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 215'),
(1898,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 218'),
(1899,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 219'),
(1900,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 220'),
(1902,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 222'),
(1903,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 223'),
(1905,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 224'),
(1907,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 225'),
(1908,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 226'),
(1911,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 227'),
(1913,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 228'),
(1926,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 235'),
(1930,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 237'),
(1931,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 238'),
(1932,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 239'),
(1934,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 240'),
(1935,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 241'),
(1936,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 242'),
(1942,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 243'),
(1943,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 244'),
(1944,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 245'),
(1945,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 246'),
(1946,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 247'),
(1950,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 248'),
(1961,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 253'),
(1963,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 254'),
(1965,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 255'),
(1967,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 256'),
(1968,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 257'),
(1975,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 259'),
(1977,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 260'),
(1978,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 261'),
(1979,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 262'),
(1980,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 263'),
(1986,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 266'),
(1988,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 268'),
(1989,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 269'),
(1990,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 270'),
(1991,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 271'),
(1992,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 272'),
(1995,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 273'),
(1997,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 274'),
(2003,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 277'),
(2006,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 280'),
(2007,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 281'),
(2009,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 282'),
(2019,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 286'),
(2020,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 287'),
(2021,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 288'),
(2040,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 294'),
(2041,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 295'),
(2064,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 301'),
(2067,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 303'),
(2068,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 304'),
(2069,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 305'),
(2071,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 306'),
(2072,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 307'),
(2078,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 308'),
(2079,@AREA17,0, 'Earthroot,Zone 17,Area 17,node 309'),
(2082,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 311'),
(2085,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 313'),
(2089,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 315'),
(2106,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 323'),
(2123,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 328'),
(2125,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 329'),
(2135,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 332'),
(2136,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 333'),
(2141,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 336'),
(2142,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 337'),
(2153,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 345'),
(2156,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 347'),
(2161,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 350'),
(2170,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 355'),
(2174,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 357'),
(2183,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 365'),
(2186,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 366'),
(2194,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 371'),
(2200,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 375'),
(2201,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 376'),
(2202,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 377'),
(2203,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 378'),
(2204,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 379'),
(2207,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 382'),
(2213,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 386'),
(2223,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 390'),
(2226,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 392'),
(2227,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 393'),
(2230,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 396'),
(2231,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 397'),
(2232,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 398'),
(2233,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 399'),
(2263,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 410'),
(2264,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 411'),
(2267,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 412'),
(2268,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 413'),
(2272,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 416'),
(2289,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 423'),
(2290,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 424'),
(2291,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 425'),
(2292,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 426'),
(2293,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 427'),
(2296,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 428'),
(2297,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 429'),
(2308,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 431'),
(2310,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 432'),
(2312,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 434'),
(2313,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 435'),
(2314,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 436'),
(2315,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 437'),
(2317,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 438'),
(2318,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 439'),
(2337,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 443'),
(2361,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 457'),
(2362,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 458'),
(2363,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 459'),
(2364,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 460'),
(2369,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 461'),
(2378,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 464'),
(2383,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 466'),
(2385,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 468'),
(2387,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 470'),
(2388,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 471'),
(2392,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 475'),
(2393,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 476'),
(2395,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 477'),
(2400,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 479'),
(2405,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 481'),
(2419,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 483'),
(2427,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 487'),
(2429,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 488'),
(2430,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 489'),
(2433,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 490'),
(2434,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 491'),
(2445,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 493'),
(2446,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 494'),
(2447,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 495'),
(2472,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 504'),
(2482,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 506'),
(2483,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 507'),
(2486,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 508'),
(2488,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 510'),
(2489,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 511'),
(2503,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 517'),
(2507,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 520'),
(2508,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 521'),
(2509,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 522'),
(2513,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 524'),
(2528,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 529'),
(2534,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 530'),
(2535,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 531'),
(2536,@AREA17,0, 'Mageroyal,Zone 17,Area 17,node 532'),
(2564,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 542'),
(2567,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 544'),
(2569,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 545'),
(2591,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 548'),
(2599,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 549'),
(2621,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 554'),
(2644,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 558'),
(2646,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 559'),
(2648,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 560'),
(2659,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 562'),
(2668,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 564'),
(2716,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 570'),
(2728,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 577'),
(2747,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 582'),
(2762,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 588'),
(2772,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 593'),
(2789,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 596'),
(2807,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 597'),
(2814,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 598'),
(2836,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 605'),
(2859,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 607'),
(2865,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 608'),
(2880,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 609'),
(2881,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 610'),
(2883,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 611'),
(2885,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 613'),
(2887,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 615'),
(2906,@AREA17,0, 'Briarthorn,Zone 17,Area 17,node 620'),
(2955,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 628'),
(2971,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 629'),
(3015,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 631'),
(3032,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 633'),
(3056,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 636'),
(3134,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 648'),
(3135,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 649'),
(3361,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 671'),
(3406,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 675'),
(3409,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 676'),
(3451,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 678'),
(3452,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 679'),
(3453,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 680'),
(3455,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 681'),
(3574,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 697'),
(3575,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 698'),
(3579,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 699'),
(3595,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 701'),
(3621,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 702'),
(3827,@AREA17,0, 'Bruiseweed,Zone 17,Area 17,node 716'),
(4028,@AREA17,0, 'Wild Steelbloom,Zone 17,Area 17,node 731'),
(4294,@AREA17,0, 'Kingsblood,Zone 17,Area 17,node 747'),
(4324,@AREA17,0, 'Kingsblood,Zone 17,Area 17,node 750'),
(4325,@AREA17,0, 'Kingsblood,Zone 17,Area 17,node 751'),
(8231,@AREA17,0, 'Stranglekelp,Zone 17,Area 17,node 772'),
(8382,@AREA17,0, 'Stranglekelp,Zone 17,Area 17,node 794'),
(8383,@AREA17,0, 'Stranglekelp,Zone 17,Area 17,node 795'),
(8384,@AREA17,0, 'Stranglekelp,Zone 17,Area 17,node 796'),
(8425,@AREA17,0, 'Stranglekelp,Zone 17,Area 17,node 797'),
(8426,@AREA17,0, 'Stranglekelp,Zone 17,Area 17,node 798'),
(8452,@AREA17,0, 'Stranglekelp,Zone 17,Area 17,node 801'),
(8466,@AREA17,0, 'Stranglekelp,Zone 17,Area 17,node 807'),
(8570,@AREA17,0, 'Stranglekelp,Zone 17,Area 17,node 819'),
(488,@AREA383,0, 'Silverleaf,Zone 17,Area 383,node 5'),
(489,@AREA383,0, 'Silverleaf,Zone 17,Area 383,node 6'),
(689,@AREA383,0, 'Silverleaf,Zone 17,Area 383,node 26'),
(913,@AREA383,0, 'Silverleaf,Zone 17,Area 383,node 52'),
(918,@AREA383,0, 'Silverleaf,Zone 17,Area 383,node 53'),
(1085,@AREA383,0, 'Silverleaf,Zone 17,Area 383,node 75'),
(1086,@AREA383,0, 'Silverleaf,Zone 17,Area 383,node 76'),
(1087,@AREA383,0, 'Silverleaf,Zone 17,Area 383,node 77'),
(1089,@AREA383,0, 'Silverleaf,Zone 17,Area 383,node 78'),
(1755,@AREA383,0, 'Earthroot,Zone 17,Area 383,node 168'),
(1856,@AREA383,0, 'Earthroot,Zone 17,Area 383,node 209'),
(2060,@AREA383,0, 'Earthroot,Zone 17,Area 383,node 297'),
(2061,@AREA383,0, 'Earthroot,Zone 17,Area 383,node 298'),
(2062,@AREA383,0, 'Earthroot,Zone 17,Area 383,node 299'),
(2063,@AREA383,0, 'Earthroot,Zone 17,Area 383,node 300'),
(2176,@AREA383,0, 'Mageroyal,Zone 17,Area 383,node 358'),
(2177,@AREA383,0, 'Mageroyal,Zone 17,Area 383,node 359'),
(2178,@AREA383,0, 'Mageroyal,Zone 17,Area 383,node 360'),
(2179,@AREA383,0, 'Mageroyal,Zone 17,Area 383,node 361'),
(2180,@AREA383,0, 'Mageroyal,Zone 17,Area 383,node 362'),
(2181,@AREA383,0, 'Mageroyal,Zone 17,Area 383,node 363'),
(2182,@AREA383,0, 'Mageroyal,Zone 17,Area 383,node 364'),
(2377,@AREA383,0, 'Mageroyal,Zone 17,Area 383,node 463'),
(2455,@AREA383,0, 'Mageroyal,Zone 17,Area 383,node 497'),
(2590,@AREA383,0, 'Briarthorn,Zone 17,Area 383,node 547'),
(2610,@AREA383,0, 'Briarthorn,Zone 17,Area 383,node 550'),
(2615,@AREA383,0, 'Briarthorn,Zone 17,Area 383,node 552'),
(2667,@AREA383,0, 'Briarthorn,Zone 17,Area 383,node 563'),
(2691,@AREA383,0, 'Briarthorn,Zone 17,Area 383,node 567'),
(2719,@AREA383,0, 'Briarthorn,Zone 17,Area 383,node 572'),
(2743,@AREA383,0, 'Briarthorn,Zone 17,Area 383,node 581'),
(2763,@AREA383,0, 'Briarthorn,Zone 17,Area 383,node 589'),
(2817,@AREA383,0, 'Briarthorn,Zone 17,Area 383,node 599'),
(2954,@AREA383,0, 'Bruiseweed,Zone 17,Area 383,node 627'),
(3006,@AREA383,0, 'Bruiseweed,Zone 17,Area 383,node 630'),
(3157,@AREA383,0, 'Bruiseweed,Zone 17,Area 383,node 651'),
(3303,@AREA383,0, 'Bruiseweed,Zone 17,Area 383,node 664'),
(3350,@AREA383,0, 'Bruiseweed,Zone 17,Area 383,node 668'),
(3351,@AREA383,0, 'Bruiseweed,Zone 17,Area 383,node 669'),
(3352,@AREA383,0, 'Bruiseweed,Zone 17,Area 383,node 670'),
(3368,@AREA383,0, 'Bruiseweed,Zone 17,Area 383,node 672'),
(2122,@AREA385,0, 'Mageroyal,Zone 17,Area 385,node 327'),
(2717,@AREA385,0, 'Briarthorn,Zone 17,Area 385,node 571'),
(2732,@AREA385,0, 'Briarthorn,Zone 17,Area 385,node 579'),
(2884,@AREA385,0, 'Briarthorn,Zone 17,Area 385,node 612'),
(2886,@AREA385,0, 'Briarthorn,Zone 17,Area 385,node 614'),
(3260,@AREA385,0, 'Bruiseweed,Zone 17,Area 385,node 655'),
(3262,@AREA385,0, 'Bruiseweed,Zone 17,Area 385,node 657'),
(3342,@AREA385,0, 'Bruiseweed,Zone 17,Area 385,node 667'),
(3469,@AREA385,0, 'Bruiseweed,Zone 17,Area 385,node 685'),
(3538,@AREA385,0, 'Bruiseweed,Zone 17,Area 385,node 694'),
(3739,@AREA385,0, 'Bruiseweed,Zone 17,Area 385,node 712'),
(3793,@AREA385,0, 'Bruiseweed,Zone 17,Area 385,node 713'),
(4024,@AREA385,0, 'Wild Steelbloom,Zone 17,Area 385,node 729'),
(4288,@AREA385,0, 'Kingsblood,Zone 17,Area 385,node 746'),
(13366,@AREA385,0, 'Wild Steelbloom,Zone 17,Area 385,node 822'),
(15755,@AREA385,0, 'Stranglekelp,Zone 17,Area 385,node 831'),
(15756,@AREA385,0, 'Stranglekelp,Zone 17,Area 385,node 832'),
(65366,@AREA385,0, 'Stranglekelp,Zone 17,Area 385,node 847'),
(65367,@AREA385,0, 'Stranglekelp,Zone 17,Area 385,node 848'),
(604,@AREA386,0, 'Silverleaf,Zone 17,Area 386,node 16'),
(605,@AREA386,0, 'Silverleaf,Zone 17,Area 386,node 17'),
(1813,@AREA386,0, 'Earthroot,Zone 17,Area 386,node 192'),
(1814,@AREA386,0, 'Earthroot,Zone 17,Area 386,node 193'),
(1901,@AREA386,0, 'Earthroot,Zone 17,Area 386,node 221'),
(2066,@AREA386,0, 'Earthroot,Zone 17,Area 386,node 302'),
(2108,@AREA386,0, 'Mageroyal,Zone 17,Area 386,node 325'),
(2139,@AREA386,0, 'Mageroyal,Zone 17,Area 386,node 335'),
(2160,@AREA386,0, 'Mageroyal,Zone 17,Area 386,node 349'),
(2205,@AREA386,0, 'Mageroyal,Zone 17,Area 386,node 380'),
(2206,@AREA386,0, 'Mageroyal,Zone 17,Area 386,node 381'),
(2611,@AREA386,0, 'Briarthorn,Zone 17,Area 386,node 551'),
(2625,@AREA386,0, 'Briarthorn,Zone 17,Area 386,node 555'),
(2725,@AREA386,0, 'Briarthorn,Zone 17,Area 386,node 576'),
(2822,@AREA386,0, 'Briarthorn,Zone 17,Area 386,node 600'),
(630,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 20'),
(650,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 22'),
(700,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 28'),
(785,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 36'),
(852,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 41'),
(904,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 45'),
(905,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 46'),
(906,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 47'),
(907,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 48'),
(908,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 49'),
(909,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 50'),
(910,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 51'),
(928,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 55'),
(983,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 61'),
(994,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 62'),
(998,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 63'),
(1002,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 64'),
(1004,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 65'),
(1013,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 67'),
(1039,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 70'),
(1051,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 72'),
(1100,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 79'),
(1107,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 81'),
(1146,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 85'),
(1258,@AREA387,0, 'Silverleaf,Zone 17,Area 387,node 94'),
(2138,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 334'),
(2192,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 369'),
(2199,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 374'),
(2222,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 389'),
(2229,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 395'),
(2339,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 444'),
(2340,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 445'),
(2341,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 446'),
(2347,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 450'),
(2348,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 451'),
(2349,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 452'),
(2350,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 453'),
(2351,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 454'),
(2358,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 456'),
(2386,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 469'),
(2391,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 474'),
(2475,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 505'),
(2492,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 512'),
(2504,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 518'),
(2515,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 525'),
(2537,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 533'),
(2538,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 534'),
(2539,@AREA387,0, 'Mageroyal,Zone 17,Area 387,node 535'),
(2699,@AREA387,0, 'Briarthorn,Zone 17,Area 387,node 569'),
(2766,@AREA387,0, 'Briarthorn,Zone 17,Area 387,node 590'),
(2835,@AREA387,0, 'Briarthorn,Zone 17,Area 387,node 604'),
(3328,@AREA387,0, 'Bruiseweed,Zone 17,Area 387,node 665'),
(3812,@AREA387,0, 'Bruiseweed,Zone 17,Area 387,node 714'),
(3813,@AREA387,0, 'Bruiseweed,Zone 17,Area 387,node 715'),
(705,@AREA388,0, 'Silverleaf,Zone 17,Area 388,node 29'),
(1078,@AREA388,0, 'Silverleaf,Zone 17,Area 388,node 73'),
(1130,@AREA388,0, 'Silverleaf,Zone 17,Area 388,node 82'),
(1218,@AREA388,0, 'Silverleaf,Zone 17,Area 388,node 91'),
(1234,@AREA388,0, 'Silverleaf,Zone 17,Area 388,node 92'),
(2088,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 314'),
(2098,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 319'),
(2165,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 352'),
(2166,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 353'),
(2191,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 368'),
(2193,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 370'),
(2274,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 417'),
(2285,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 421'),
(2328,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 440'),
(2401,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 480'),
(2406,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 482'),
(2423,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 484'),
(2487,@AREA388,0, 'Mageroyal,Zone 17,Area 388,node 509'),
(2652,@AREA388,0, 'Briarthorn,Zone 17,Area 388,node 561'),
(2751,@AREA388,0, 'Briarthorn,Zone 17,Area 388,node 583'),
(2902,@AREA388,0, 'Briarthorn,Zone 17,Area 388,node 618'),
(1434,@AREA390,0, 'Peacebloom,Zone 17,Area 390,node 111'),
(1481,@AREA390,0, 'Peacebloom,Zone 17,Area 390,node 119'),
(2084,@AREA390,0, 'Mageroyal,Zone 17,Area 390,node 312'),
(2107,@AREA390,0, 'Mageroyal,Zone 17,Area 390,node 324'),
(2109,@AREA390,0, 'Mageroyal,Zone 17,Area 390,node 326'),
(2211,@AREA390,0, 'Mageroyal,Zone 17,Area 390,node 384'),
(2212,@AREA390,0, 'Mageroyal,Zone 17,Area 390,node 385'),
(2343,@AREA390,0, 'Mageroyal,Zone 17,Area 390,node 447'),
(2344,@AREA390,0, 'Mageroyal,Zone 17,Area 390,node 448'),
(2345,@AREA390,0, 'Mageroyal,Zone 17,Area 390,node 449'),
(2355,@AREA390,0, 'Mageroyal,Zone 17,Area 390,node 455'),
(2426,@AREA390,0, 'Mageroyal,Zone 17,Area 390,node 486'),
(2506,@AREA390,0, 'Mageroyal,Zone 17,Area 390,node 519'),
(2767,@AREA390,0, 'Briarthorn,Zone 17,Area 390,node 591'),
(2898,@AREA390,0, 'Briarthorn,Zone 17,Area 390,node 617'),
(2930,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 623'),
(3270,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 658'),
(3271,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 659'),
(3272,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 660'),
(3375,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 673'),
(3376,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 674'),
(3458,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 682'),
(3494,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 687'),
(3495,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 688'),
(3496,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 689'),
(3497,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 690'),
(3498,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 691'),
(3505,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 692'),
(3591,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 700'),
(3708,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 708'),
(3736,@AREA390,0, 'Bruiseweed,Zone 17,Area 390,node 711'),
(3979,@AREA390,0, 'Wild Steelbloom,Zone 17,Area 390,node 727'),
(4066,@AREA390,0, 'Wild Steelbloom,Zone 17,Area 390,node 733'),
(4227,@AREA390,0, 'Wild Steelbloom,Zone 17,Area 390,node 743'),
(4295,@AREA390,0, 'Kingsblood,Zone 17,Area 390,node 748'),
(4330,@AREA390,0, 'Kingsblood,Zone 17,Area 390,node 754'),
(4390,@AREA390,0, 'Kingsblood,Zone 17,Area 390,node 763'),
(4401,@AREA390,0, 'Kingsblood,Zone 17,Area 390,node 764'),
(87281,@AREA390,0, 'Kingsblood,Zone 17,Area 390,node 867'),
(1506,@AREA391,0, 'Peacebloom,Zone 17,Area 391,node 123'),
(1759,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 171'),
(1761,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 172'),
(1776,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 176'),
(1781,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 178'),
(1782,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 179'),
(1783,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 180'),
(1798,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 186'),
(1830,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 197'),
(1837,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 199'),
(1853,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 206'),
(1854,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 207'),
(1855,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 208'),
(1864,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 213'),
(1896,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 216'),
(1897,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 217'),
(1925,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 234'),
(1928,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 236'),
(1957,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 249'),
(1958,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 250'),
(1959,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 251'),
(1960,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 252'),
(1972,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 258'),
(1983,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 264'),
(1984,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 265'),
(2016,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 283'),
(2017,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 284'),
(2018,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 285'),
(2022,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 289'),
(2023,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 290'),
(2028,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 291'),
(2029,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 292'),
(2030,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 293'),
(2050,@AREA391,0, 'Earthroot,Zone 17,Area 391,node 296'),
(2724,@AREA391,0, 'Briarthorn,Zone 17,Area 391,node 575'),
(8232,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 773'),
(8233,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 774'),
(8256,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 776'),
(8280,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 778'),
(8281,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 779'),
(8282,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 780'),
(8294,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 783'),
(8295,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 784'),
(8296,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 785'),
(8317,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 786'),
(8360,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 792'),
(8448,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 800'),
(8457,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 802'),
(8458,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 803'),
(8459,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 804'),
(8460,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 805'),
(8461,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 806'),
(8504,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 809'),
(8505,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 810'),
(8507,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 811'),
(8508,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 812'),
(8527,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 813'),
(8547,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 816'),
(8559,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 817'),
(12594,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 820'),
(15754,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 830'),
(15757,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 833'),
(15758,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 834'),
(15761,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 836'),
(15780,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 837'),
(29187,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 840'),
(29234,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 841'),
(29235,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 842'),
(32508,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 844'),
(32866,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 846'),
(86907,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 852'),
(86909,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 853'),
(86910,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 854'),
(86912,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 855'),
(86927,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 856'),
(86942,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 857'),
(86943,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 858'),
(86946,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 859'),
(86947,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 860'),
(86948,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 861'),
(86949,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 862'),
(86950,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 863'),
(86951,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 864'),
(87006,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 865'),
(87063,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 866'),
(87572,@AREA391,0, 'Stranglekelp,Zone 17,Area 391,node 868'),
(484,@AREA1156,0, 'Silverleaf,Zone 17,Area 1156,node 4'),
(723,@AREA1156,0, 'Silverleaf,Zone 17,Area 1156,node 30'),
(729,@AREA1156,0, 'Silverleaf,Zone 17,Area 1156,node 31'),
(730,@AREA1156,0, 'Silverleaf,Zone 17,Area 1156,node 32'),
(1375,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 99'),
(1395,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 101'),
(1464,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 114'),
(1480,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 118'),
(1505,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 122'),
(1539,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 134'),
(1592,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 144'),
(1594,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 145'),
(1630,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 148'),
(1649,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 153'),
(1662,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 155'),
(1665,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 157'),
(1668,@AREA1156,0, 'Peacebloom,Zone 17,Area 1156,node 159'),
(1757,@AREA1156,0, 'Earthroot,Zone 17,Area 1156,node 170'),
(1793,@AREA1156,0, 'Earthroot,Zone 17,Area 1156,node 183'),
(2103,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 321'),
(2104,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 322'),
(2128,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 330'),
(2143,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 338'),
(2144,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 339'),
(2146,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 341'),
(2147,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 342'),
(2154,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 346'),
(2162,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 351'),
(2171,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 356'),
(2198,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 373'),
(2209,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 383'),
(2228,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 394'),
(2246,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 402'),
(2247,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 403'),
(2257,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 405'),
(2270,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 414'),
(2271,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 415'),
(2277,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 418'),
(2280,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 419'),
(2287,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 422'),
(2304,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 430'),
(2375,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 462'),
(2382,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 465'),
(2397,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 478'),
(2424,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 485'),
(2462,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 499'),
(2463,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 500'),
(2470,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 502'),
(2494,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 513'),
(2495,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 514'),
(2496,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 515'),
(2520,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 526'),
(2522,@AREA1156,0, 'Mageroyal,Zone 17,Area 1156,node 527'),
(2551,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 538'),
(2559,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 540'),
(2565,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 543'),
(2620,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 553'),
(2643,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 557'),
(2677,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 565'),
(2722,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 573'),
(2760,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 587'),
(2770,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 592'),
(2783,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 595'),
(2826,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 603'),
(2857,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 606'),
(2893,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 616'),
(2905,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 619'),
(2907,@AREA1156,0, 'Briarthorn,Zone 17,Area 1156,node 621'),
(3099,@AREA1156,0, 'Bruiseweed,Zone 17,Area 1156,node 639'),
(3100,@AREA1156,0, 'Bruiseweed,Zone 17,Area 1156,node 640'),
(3101,@AREA1156,0, 'Bruiseweed,Zone 17,Area 1156,node 641'),
(3102,@AREA1156,0, 'Bruiseweed,Zone 17,Area 1156,node 642'),
(3103,@AREA1156,0, 'Bruiseweed,Zone 17,Area 1156,node 643'),
(3104,@AREA1156,0, 'Bruiseweed,Zone 17,Area 1156,node 644'),
(3274,@AREA1156,0, 'Bruiseweed,Zone 17,Area 1156,node 661'),
(3703,@AREA1156,0, 'Bruiseweed,Zone 17,Area 1156,node 707'),
(3898,@AREA1156,0, 'Wild Steelbloom,Zone 17,Area 1156,node 720'),
(4085,@AREA1156,0, 'Wild Steelbloom,Zone 17,Area 1156,node 734'),
(4103,@AREA1156,0, 'Wild Steelbloom,Zone 17,Area 1156,node 736'),
(4298,@AREA1156,0, 'Kingsblood,Zone 17,Area 1156,node 749'),
(4342,@AREA1156,0, 'Kingsblood,Zone 17,Area 1156,node 755'),
(4347,@AREA1156,0, 'Kingsblood,Zone 17,Area 1156,node 756'),
(4349,@AREA1156,0, 'Kingsblood,Zone 17,Area 1156,node 757'),
(4373,@AREA1156,0, 'Kingsblood,Zone 17,Area 1156,node 760'),
(4379,@AREA1156,0, 'Kingsblood,Zone 17,Area 1156,node 761'),
(4405,@AREA1156,0, 'Kingsblood,Zone 17,Area 1156,node 766'),
(13368,@AREA1156,0, 'Wild Steelbloom,Zone 17,Area 1156,node 824'),
(13370,@AREA1156,0, 'Wild Steelbloom,Zone 17,Area 1156,node 826'),
(13374,@AREA1156,0, 'Kingsblood,Zone 17,Area 1156,node 827'),
(86316,@AREA1156,0, 'Kingsblood,Zone 17,Area 1156,node 849'),
(86322,@AREA1156,0, 'Kingsblood,Zone 17,Area 1156,node 850'),
(86337,@AREA1156,0, 'Kingsblood,Zone 17,Area 1156,node 851'),
(2091,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 316'),
(2092,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 317'),
(2095,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 318'),
(2099,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 320'),
(2130,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 331'),
(2196,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 372'),
(2219,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 387'),
(2220,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 388'),
(2225,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 391'),
(2258,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 406'),
(2461,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 498'),
(2464,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 501'),
(2471,@AREA1698,0, 'Mageroyal,Zone 17,Area 1698,node 503'),
(2549,@AREA1698,0, 'Briarthorn,Zone 17,Area 1698,node 537'),
(3143,@AREA1698,0, 'Bruiseweed,Zone 17,Area 1698,node 650'),
(3261,@AREA1698,0, 'Bruiseweed,Zone 17,Area 1698,node 656'),
(4153,@AREA1698,0, 'Wild Steelbloom,Zone 17,Area 1698,node 737'),
(4367,@AREA1698,0, 'Kingsblood,Zone 17,Area 1698,node 759'),
(4387,@AREA1698,0, 'Kingsblood,Zone 17,Area 1698,node 762'),
(13365,@AREA1698,0, 'Wild Steelbloom,Zone 17,Area 1698,node 821'),
(620,@AREA1699,0, 'Silverleaf,Zone 17,Area 1699,node 19'),
(681,@AREA1699,0, 'Silverleaf,Zone 17,Area 1699,node 25'),
(878,@AREA1699,0, 'Silverleaf,Zone 17,Area 1699,node 42'),
(935,@AREA1699,0, 'Silverleaf,Zone 17,Area 1699,node 56'),
(1026,@AREA1699,0, 'Silverleaf,Zone 17,Area 1699,node 68'),
(1169,@AREA1699,0, 'Silverleaf,Zone 17,Area 1699,node 88'),
(1346,@AREA1699,0, 'Peacebloom,Zone 17,Area 1699,node 95'),
(1410,@AREA1699,0, 'Peacebloom,Zone 17,Area 1699,node 104'),
(1411,@AREA1699,0, 'Peacebloom,Zone 17,Area 1699,node 105'),
(1412,@AREA1699,0, 'Peacebloom,Zone 17,Area 1699,node 106'),
(1414,@AREA1699,0, 'Peacebloom,Zone 17,Area 1699,node 108'),
(1509,@AREA1699,0, 'Peacebloom,Zone 17,Area 1699,node 124'),
(1511,@AREA1699,0, 'Peacebloom,Zone 17,Area 1699,node 125'),
(1524,@AREA1699,0, 'Peacebloom,Zone 17,Area 1699,node 130'),
(1538,@AREA1699,0, 'Peacebloom,Zone 17,Area 1699,node 133'),
(1667,@AREA1699,0, 'Peacebloom,Zone 17,Area 1699,node 158'),
(1693,@AREA1699,0, 'Peacebloom,Zone 17,Area 1699,node 161'),
(2723,@AREA1699,0, 'Briarthorn,Zone 17,Area 1699,node 574'),
(2729,@AREA1699,0, 'Briarthorn,Zone 17,Area 1699,node 578'),
(2737,@AREA1699,0, 'Briarthorn,Zone 17,Area 1699,node 580'),
(2754,@AREA1699,0, 'Briarthorn,Zone 17,Area 1699,node 584'),
(1419,@AREA1700,0, 'Peacebloom,Zone 17,Area 1700,node 109'),
(1550,@AREA1700,0, 'Peacebloom,Zone 17,Area 1700,node 136'),
(1633,@AREA1700,0, 'Peacebloom,Zone 17,Area 1700,node 149'),
(1661,@AREA1700,0, 'Peacebloom,Zone 17,Area 1700,node 154'),
(1730,@AREA1700,0, 'Peacebloom,Zone 17,Area 1700,node 165'),
(1998,@AREA1700,0, 'Earthroot,Zone 17,Area 1700,node 275'),
(2080,@AREA1700,0, 'Earthroot,Zone 17,Area 1700,node 310'),
(2145,@AREA1700,0, 'Mageroyal,Zone 17,Area 1700,node 340'),
(2188,@AREA1700,0, 'Mageroyal,Zone 17,Area 1700,node 367'),
(2245,@AREA1700,0, 'Mageroyal,Zone 17,Area 1700,node 401'),
(2384,@AREA1700,0, 'Mageroyal,Zone 17,Area 1700,node 467'),
(2436,@AREA1700,0, 'Mageroyal,Zone 17,Area 1700,node 492'),
(2450,@AREA1700,0, 'Mageroyal,Zone 17,Area 1700,node 496'),
(2554,@AREA1700,0, 'Briarthorn,Zone 17,Area 1700,node 539'),
(2574,@AREA1700,0, 'Briarthorn,Zone 17,Area 1700,node 546'),
(2634,@AREA1700,0, 'Briarthorn,Zone 17,Area 1700,node 556'),
(2678,@AREA1700,0, 'Briarthorn,Zone 17,Area 1700,node 566'),
(2824,@AREA1700,0, 'Briarthorn,Zone 17,Area 1700,node 601'),
(2825,@AREA1700,0, 'Briarthorn,Zone 17,Area 1700,node 602'),
(2928,@AREA1700,0, 'Bruiseweed,Zone 17,Area 1700,node 622'),
(2952,@AREA1700,0, 'Bruiseweed,Zone 17,Area 1700,node 626'),
(3049,@AREA1700,0, 'Bruiseweed,Zone 17,Area 1700,node 635'),
(3058,@AREA1700,0, 'Bruiseweed,Zone 17,Area 1700,node 637'),
(3410,@AREA1700,0, 'Bruiseweed,Zone 17,Area 1700,node 677'),
(3852,@AREA1700,0, 'Bruiseweed,Zone 17,Area 1700,node 717'),
(4027,@AREA1700,0, 'Wild Steelbloom,Zone 17,Area 1700,node 730'),
(4275,@AREA1700,0, 'Wild Steelbloom,Zone 17,Area 1700,node 745'),
(4329,@AREA1700,0, 'Kingsblood,Zone 17,Area 1700,node 753'),
(1573,@AREA1701,0, 'Peacebloom,Zone 17,Area 1701,node 141'),
(1792,@AREA1701,0, 'Earthroot,Zone 17,Area 1701,node 182'),
(2159,@AREA1701,0, 'Mageroyal,Zone 17,Area 1701,node 348'),
(2168,@AREA1701,0, 'Mageroyal,Zone 17,Area 1701,node 354'),
(2259,@AREA1701,0, 'Mageroyal,Zone 17,Area 1701,node 407'),
(2562,@AREA1701,0, 'Briarthorn,Zone 17,Area 1701,node 541'),
(2756,@AREA1701,0, 'Briarthorn,Zone 17,Area 1701,node 585'),
(2950,@AREA1701,0, 'Bruiseweed,Zone 17,Area 1701,node 624'),
(2951,@AREA1701,0, 'Bruiseweed,Zone 17,Area 1701,node 625'),
(3028,@AREA1701,0, 'Bruiseweed,Zone 17,Area 1701,node 632'),
(3098,@AREA1701,0, 'Bruiseweed,Zone 17,Area 1701,node 638'),
(3201,@AREA1701,0, 'Bruiseweed,Zone 17,Area 1701,node 652'),
(3226,@AREA1701,0, 'Bruiseweed,Zone 17,Area 1701,node 653'),
(3558,@AREA1701,0, 'Bruiseweed,Zone 17,Area 1701,node 696'),
(3692,@AREA1701,0, 'Bruiseweed,Zone 17,Area 1701,node 704'),
(3693,@AREA1701,0, 'Bruiseweed,Zone 17,Area 1701,node 705'),
(3694,@AREA1701,0, 'Bruiseweed,Zone 17,Area 1701,node 706'),
(3862,@AREA1701,0, 'Bruiseweed,Zone 17,Area 1701,node 719'),
(3934,@AREA1701,0, 'Wild Steelbloom,Zone 17,Area 1701,node 723'),
(3937,@AREA1701,0, 'Wild Steelbloom,Zone 17,Area 1701,node 724'),
(3984,@AREA1701,0, 'Wild Steelbloom,Zone 17,Area 1701,node 728'),
(4065,@AREA1701,0, 'Wild Steelbloom,Zone 17,Area 1701,node 732'),
(4097,@AREA1701,0, 'Wild Steelbloom,Zone 17,Area 1701,node 735'),
(4198,@AREA1701,0, 'Wild Steelbloom,Zone 17,Area 1701,node 739'),
(4210,@AREA1701,0, 'Wild Steelbloom,Zone 17,Area 1701,node 741'),
(4223,@AREA1701,0, 'Wild Steelbloom,Zone 17,Area 1701,node 742'),
(4252,@AREA1701,0, 'Wild Steelbloom,Zone 17,Area 1701,node 744'),
(4327,@AREA1701,0, 'Kingsblood,Zone 17,Area 1701,node 752'),
(4355,@AREA1701,0, 'Kingsblood,Zone 17,Area 1701,node 758'),
(4404,@AREA1701,0, 'Kingsblood,Zone 17,Area 1701,node 765'),
(4406,@AREA1701,0, 'Kingsblood,Zone 17,Area 1701,node 767'),
(4442,@AREA1701,0, 'Kingsblood,Zone 17,Area 1701,node 768'),
(4486,@AREA1701,0, 'Kingsblood,Zone 17,Area 1701,node 769'),
(4493,@AREA1701,0, 'Kingsblood,Zone 17,Area 1701,node 770'),
(4496,@AREA1701,0, 'Kingsblood,Zone 17,Area 1701,node 771'),
(13367,@AREA1701,0, 'Wild Steelbloom,Zone 17,Area 1701,node 823'),
(13369,@AREA1701,0, 'Wild Steelbloom,Zone 17,Area 1701,node 825'),
(13375,@AREA1701,0, 'Kingsblood,Zone 17,Area 1701,node 828'),
(13378,@AREA1701,0, 'Kingsblood,Zone 17,Area 1701,node 829'),
(2151,@REST,0, 'Mageroyal,Zone 17,Area 1157,node 343'),
(2281,@REST,0, 'Mageroyal,Zone 17,Area 1157,node 420'),
(2389,@REST,0, 'Mageroyal,Zone 17,Area 1157,node 472'),
(2512,@REST,0, 'Mageroyal,Zone 17,Area 1157,node 523'),
(2523,@REST,0, 'Mageroyal,Zone 17,Area 1157,node 528'),
(3921,@REST,0, 'Wild Steelbloom,Zone 17,Area 1316,node 721'),
(3923,@REST,0, 'Wild Steelbloom,Zone 17,Area 1316,node 722'),
(3957,@REST,0, 'Wild Steelbloom,Zone 17,Area 1316,node 725'),
(3968,@REST,0, 'Wild Steelbloom,Zone 17,Area 1316,node 726'),
(3478,@REST,0, 'Bruiseweed,Zone 17,Area 1697,node 686'),
(4174,@REST,0, 'Wild Steelbloom,Zone 17,Area 1697,node 738'),
(1842,@REST,0, 'Earthroot,Zone 17,Area 1702,node 200'),
(1843,@REST,0, 'Earthroot,Zone 17,Area 1702,node 201'),
(1917,@REST,0, 'Earthroot,Zone 17,Area 1702,node 229'),
(1918,@REST,0, 'Earthroot,Zone 17,Area 1702,node 230'),
(1919,@REST,0, 'Earthroot,Zone 17,Area 1702,node 231'),
(1920,@REST,0, 'Earthroot,Zone 17,Area 1702,node 232'),
(1921,@REST,0, 'Earthroot,Zone 17,Area 1702,node 233'),
(1987,@REST,0, 'Earthroot,Zone 17,Area 1702,node 267'),
(1999,@REST,0, 'Earthroot,Zone 17,Area 1702,node 276'),
(2781,@REST,0, 'Briarthorn,Zone 17,Area 1702,node 594'),
(482,@REST,0, 'Silverleaf,Zone 17,Area 1704,node 3'),
(731,@REST,0, 'Silverleaf,Zone 17,Area 1704,node 33'),
(847,@REST,0, 'Silverleaf,Zone 17,Area 1704,node 40'),
(1373,@REST,0, 'Peacebloom,Zone 17,Area 1704,node 98'),
(1459,@REST,0, 'Peacebloom,Zone 17,Area 1704,node 113'),
(1563,@REST,0, 'Peacebloom,Zone 17,Area 1704,node 139'),
(892,@REST,0, 'Silverleaf,Zone 17,Area 2757,node 44'),
(950,@REST,0, 'Silverleaf,Zone 17,Area 2757,node 60'),
(1138,@REST,0, 'Silverleaf,Zone 17,Area 2757,node 84'),
(2152,@REST,0, 'Mageroyal,Zone 17,Area 359,node 344'),
(2390,@REST,0, 'Mageroyal,Zone 17,Area 359,node 473'),
(2758,@REST,0, 'Briarthorn,Zone 17,Area 359,node 586'),
(3105,@REST,0, 'Bruiseweed,Zone 17,Area 359,node 645'),
(3106,@REST,0, 'Bruiseweed,Zone 17,Area 359,node 646'),
(3107,@REST,0, 'Bruiseweed,Zone 17,Area 359,node 647'),
(3464,@REST,0, 'Bruiseweed,Zone 17,Area 359,node 683'),
(3465,@REST,0, 'Bruiseweed,Zone 17,Area 359,node 684'),
(3524,@REST,0, 'Bruiseweed,Zone 17,Area 359,node 693'),
(4207,@REST,0, 'Wild Steelbloom,Zone 17,Area 359,node 740'),
(1475,@REST,0, 'Peacebloom,Zone 17,Area 378,node 117'),
(1584,@REST,0, 'Peacebloom,Zone 17,Area 378,node 143'),
(3245,@REST,0, 'Bruiseweed,Zone 17,Area 378,node 654'),
(2501,@REST,0, 'Mageroyal,Zone 17,Area 381,node 516'),
(2542,@REST,0, 'Briarthorn,Zone 17,Area 381,node 536'),
(3329,@REST,0, 'Bruiseweed,Zone 17,Area 381,node 666'),
(3854,@REST,0, 'Bruiseweed,Zone 17,Area 381,node 718'),
(1567,@REST,0, 'Peacebloom,Zone 17,Area 382,node 140'),
(3047,@REST,0, 'Bruiseweed,Zone 17,Area 384,node 634'),
(3275,@REST,0, 'Bruiseweed,Zone 17,Area 384,node 662'),
(3276,@REST,0, 'Bruiseweed,Zone 17,Area 384,node 663'),
(3549,@REST,0, 'Bruiseweed,Zone 17,Area 384,node 695'),
(3667,@REST,0, 'Bruiseweed,Zone 17,Area 384,node 703'),
(3734,@REST,0, 'Bruiseweed,Zone 17,Area 384,node 709'),
(3735,@REST,0, 'Bruiseweed,Zone 17,Area 384,node 710'),
(8234,@REST,0, 'Stranglekelp,Zone 17,Area 392,node 775'),
(8444,@REST,0, 'Stranglekelp,Zone 17,Area 392,node 799'),
(15759,@REST,0, 'Stranglekelp,Zone 17,Area 392,node 835'),
(32512,@REST,0, 'Stranglekelp,Zone 17,Area 392,node 845'),
(1779,@REST,0, 'Earthroot,Zone 17,Area 401,node 177'),
(1857,@REST,0, 'Earthroot,Zone 17,Area 401,node 210'),
(8279,@REST,0, 'Stranglekelp,Zone 17,Area 401,node 777'),
(8283,@REST,0, 'Stranglekelp,Zone 17,Area 401,node 781'),
(8288,@REST,0, 'Stranglekelp,Zone 17,Area 401,node 782'),
(8345,@REST,0, 'Stranglekelp,Zone 17,Area 401,node 789'),
(8346,@REST,0, 'Stranglekelp,Zone 17,Area 401,node 790'),
(8347,@REST,0, 'Stranglekelp,Zone 17,Area 401,node 791'),
(32507,@REST,0, 'Stranglekelp,Zone 17,Area 401,node 843'),
(1714,@REST,0, 'Peacebloom,Zone 17,Area 458,node 164'),
(2261,@REST,0, 'Mageroyal,Zone 17,Area 458,node 408'),
(2262,@REST,0, 'Mageroyal,Zone 17,Area 458,node 409'),
(2695,@REST,0, 'Briarthorn,Zone 17,Area 458,node 568'),
(8318,@REST,0, 'Stranglekelp,Zone 17,Area 720,node 787'),
(8339,@REST,0, 'Stranglekelp,Zone 17,Area 720,node 788'),
(8369,@REST,0, 'Stranglekelp,Zone 17,Area 720,node 793'),
(8501,@REST,0, 'Stranglekelp,Zone 17,Area 720,node 808'),
(8534,@REST,0, 'Stranglekelp,Zone 17,Area 720,node 814'),
(8536,@REST,0, 'Stranglekelp,Zone 17,Area 720,node 815'),
(8566,@REST,0, 'Stranglekelp,Zone 17,Area 720,node 818'),
(15781,@REST,0, 'Stranglekelp,Zone 17,Area 720,node 838'),
(15782,@REST,0, 'Stranglekelp,Zone 17,Area 720,node 839'),
(2004,@REST,0, 'Earthroot,Zone 17,Area 815,node 278'),
(2005,@REST,0, 'Earthroot,Zone 17,Area 815,node 279'),
(2234,@REST,0, 'Mageroyal,Zone 17,Area 815,node 400'),
(2253,@REST,0, 'Mageroyal,Zone 17,Area 815,node 404'),
(2311,@REST,0, 'Mageroyal,Zone 17,Area 815,node 433'),
(2333,@REST,0, 'Mageroyal,Zone 17,Area 815,node 441'),
(2334,@REST,0, 'Mageroyal,Zone 17,Area 815,node 442');

-- ========================
--  2011_05_20_03_world_pool_template.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

SET @Rest := 814; -- Leftover area (49 nodes)
SET @Area361 := @Rest+1; -- Area 361 (85 nodes)
SET @Area1763 := @Rest+2; -- Area 1763 (19 nodes)
SET @Area1766 := @Rest+3; -- Area 1766 (17 nodes)
SET @Area1767 := @Rest+4; -- Area 1767 (45 nodes)
SET @Area2481 := @Rest+5; -- Area 2481 (13 nodes)
SET @Area2618 := @Rest+6; -- Area 2618 (14 nodes)

DELETE FROM `pool_template` WHERE `entry` BETWEEN @Rest AND @Rest+6 ; 
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES 
(@Rest   ,10, 'Master Herbs Zone 361 Leftover Areas (10 out of 49 nodes)'),
(@Area361,17, 'Master Herbs Zone 361 Area 361 (17 out of 85 nodes)'),
(@Area1763,4, 'Master Herbs Zone 361 Area 1763 (4 out of 19 nodes)'),
(@Area1766,3, 'Master Herbs Zone 361 Area 1766 (3 out of 17 nodes)'),
(@Area1767,9, 'Master Herbs Zone 361 Area 1767 (9 out of 45 nodes)'),
(@Area2481,9, 'Master Herbs Zone 361 Area 2481 (3 out of 13 nodes)'),
(@Area2618,9, 'Master Herbs Zone 361 Area 2618 (3 out of 14 nodes)');

DELETE FROM `pool_gameobject` WHERE `pool_entry` BETWEEN @REST AND @REST+6 ; 
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES 
-- Nodes are numbered based on GUID, comment shows area and type
-- Pooled per area for more randomness
(15955,@Area361,0,'Arthas Tears,Zone 361,Area 361,node 3'),
(15964,@Area361,0,'Arthas Tears,Zone 361,Area 361,node 6'),
(15965,@Area361,0,'Arthas Tears,Zone 361,Area 361,node 7'),
(15981,@Area361,0,'Arthas Tears,Zone 361,Area 361,node 10'),
(16004,@Area361,0,'Arthas Tears,Zone 361,Area 361,node 14'),
(16006,@Area361,0,'Arthas Tears,Zone 361,Area 361,node 15'),
(16020,@Area361,0,'Arthas Tears,Zone 361,Area 361,node 20'),
(16023,@Area361,0,'Arthas Tears,Zone 361,Area 361,node 21'),
(16024,@Area361,0,'Arthas Tears,Zone 361,Area 361,node 22'),
(16031,@Area361,0,'Sungrass,Zone 361,Area 361,node 24'),
(16062,@Area361,0,'Sungrass,Zone 361,Area 361,node 25'),
(16073,@Area361,0,'Sungrass,Zone 361,Area 361,node 26'),
(16074,@Area361,0,'Sungrass,Zone 361,Area 361,node 27'),
(16091,@Area361,0,'Sungrass,Zone 361,Area 361,node 29'),
(16156,@Area361,0,'Sungrass,Zone 361,Area 361,node 31'),
(16177,@Area361,0,'Sungrass,Zone 361,Area 361,node 33'),
(16259,@Area361,0,'Sungrass,Zone 361,Area 361,node 36'),
(16451,@Area361,0,'Gromsblood,Zone 361,Area 361,node 39'),
(16452,@Area361,0,'Gromsblood,Zone 361,Area 361,node 40'),
(16455,@Area361,0,'Gromsblood,Zone 361,Area 361,node 41'),
(16459,@Area361,0,'Gromsblood,Zone 361,Area 361,node 42'),
(16460,@Area361,0,'Gromsblood,Zone 361,Area 361,node 43'),
(16461,@Area361,0,'Gromsblood,Zone 361,Area 361,node 44'),
(16466,@Area361,0,'Gromsblood,Zone 361,Area 361,node 46'),
(16467,@Area361,0,'Gromsblood,Zone 361,Area 361,node 47'),
(16469,@Area361,0,'Gromsblood,Zone 361,Area 361,node 49'),
(16471,@Area361,0,'Gromsblood,Zone 361,Area 361,node 51'),
(16483,@Area361,0,'Gromsblood,Zone 361,Area 361,node 55'),
(16484,@Area361,0,'Gromsblood,Zone 361,Area 361,node 56'),
(16485,@Area361,0,'Gromsblood,Zone 361,Area 361,node 57'),
(16487,@Area361,0,'Gromsblood,Zone 361,Area 361,node 59'),
(16492,@Area361,0,'Gromsblood,Zone 361,Area 361,node 64'),
(16493,@Area361,0,'Gromsblood,Zone 361,Area 361,node 65'),
(16494,@Area361,0,'Gromsblood,Zone 361,Area 361,node 66'),
(16495,@Area361,0,'Gromsblood,Zone 361,Area 361,node 67'),
(16496,@Area361,0,'Gromsblood,Zone 361,Area 361,node 68'),
(16505,@Area361,0,'Gromsblood,Zone 361,Area 361,node 71'),
(16507,@Area361,0,'Gromsblood,Zone 361,Area 361,node 73'),
(16508,@Area361,0,'Gromsblood,Zone 361,Area 361,node 74'),
(16509,@Area361,0,'Gromsblood,Zone 361,Area 361,node 75'),
(16512,@Area361,0,'Gromsblood,Zone 361,Area 361,node 76'),
(16514,@Area361,0,'Gromsblood,Zone 361,Area 361,node 78'),
(16516,@Area361,0,'Gromsblood,Zone 361,Area 361,node 79'),
(16520,@Area361,0,'Gromsblood,Zone 361,Area 361,node 82'),
(16525,@Area361,0,'Gromsblood,Zone 361,Area 361,node 85'),
(16528,@Area361,0,'Gromsblood,Zone 361,Area 361,node 86'),
(16532,@Area361,0,'Gromsblood,Zone 361,Area 361,node 89'),
(16542,@Area361,0,'Gromsblood,Zone 361,Area 361,node 92'),
(18966,@Area361,0,'Golden Sansam,Zone 361,Area 361,node 97'),
(18975,@Area361,0,'Golden Sansam,Zone 361,Area 361,node 99'),
(19002,@Area361,0,'Golden Sansam,Zone 361,Area 361,node 103'),
(19028,@Area361,0,'Golden Sansam,Zone 361,Area 361,node 104'),
(19036,@Area361,0,'Golden Sansam,Zone 361,Area 361,node 105'),
(19253,@Area361,0,'Golden Sansam,Zone 361,Area 361,node 124'),
(19276,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 125'),
(19307,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 126'),
(19360,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 130'),
(19377,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 131'),
(19379,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 132'),
(19382,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 135'),
(19409,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 138'),
(19412,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 139'),
(19447,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 144'),
(19459,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 148'),
(19461,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 149'),
(19462,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 150'),
(19463,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 151'),
(19486,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 154'),
(19521,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 159'),
(19545,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 161'),
(19561,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 165'),
(19562,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 166'),
(19623,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 172'),
(19631,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 173'),
(19655,@Area361,0,'Dreamfoil,Zone 361,Area 361,node 177'),
(19892,@Area361,0,'Plaguebloom,Zone 361,Area 361,node 183'),
(19945,@Area361,0,'Plaguebloom,Zone 361,Area 361,node 193'),
(20005,@Area361,0,'Plaguebloom,Zone 361,Area 361,node 208'),
(20037,@Area361,0,'Plaguebloom,Zone 361,Area 361,node 220'),
(20039,@Area361,0,'Plaguebloom,Zone 361,Area 361,node 222'),
(20066,@Area361,0,'Plaguebloom,Zone 361,Area 361,node 231'),
(20067,@Area361,0,'Plaguebloom,Zone 361,Area 361,node 232'),
(20068,@Area361,0,'Plaguebloom,Zone 361,Area 361,node 233'),
(20076,@Area361,0,'Plaguebloom,Zone 361,Area 361,node 234'),
(20131,@Area361,0,'Plaguebloom,Zone 361,Area 361,node 242'),
(16473,@Rest,0,'Gromsblood,Zone 361,Area 1761,node 52'),
(16530,@Rest,0,'Gromsblood,Zone 361,Area 1761,node 88'),
(19098,@Rest,0,'Golden Sansam,Zone 361,Area 1761,node 110'),
(19997,@Rest,0,'Plaguebloom,Zone 361,Area 1761,node 206'),
(19998,@Rest,0,'Plaguebloom,Zone 361,Area 1761,node 207'),
(20078,@Rest,0,'Plaguebloom,Zone 361,Area 1761,node 235'),
(16535,@Rest,0,'Gromsblood,Zone 361,Area 1762,node 90'),
(18986,@Rest,0,'Golden Sansam,Zone 361,Area 1762,node 100'),
(19043,@Rest,0,'Golden Sansam,Zone 361,Area 1762,node 106'),
(19070,@Rest,0,'Golden Sansam,Zone 361,Area 1762,node 108'),
(19575,@Rest,0,'Dreamfoil,Zone 361,Area 1762,node 169'),
(19576,@Rest,0,'Dreamfoil,Zone 361,Area 1762,node 170'),
(19827,@Rest,0,'Mountain Silversage,Zone 361,Area 1762,node 179'),
(20098,@Rest,0,'Plaguebloom,Zone 361,Area 1762,node 238'),
(15953,@Area1763,0,'Arthas Tears,Zone 361,Area 1763,node 1'),
(15960,@Area1763,0,'Arthas Tears,Zone 361,Area 1763,node 4'),
(15976,@Area1763,0,'Arthas Tears,Zone 361,Area 1763,node 8'),
(15978,@Area1763,0,'Arthas Tears,Zone 361,Area 1763,node 9'),
(16018,@Area1763,0,'Arthas Tears,Zone 361,Area 1763,node 19'),
(16157,@Area1763,0,'Sungrass,Zone 361,Area 1763,node 32'),
(16203,@Area1763,0,'Sungrass,Zone 361,Area 1763,node 34'),
(16474,@Area1763,0,'Gromsblood,Zone 361,Area 1763,node 53'),
(16480,@Area1763,0,'Gromsblood,Zone 361,Area 1763,node 54'),
(16500,@Area1763,0,'Gromsblood,Zone 361,Area 1763,node 69'),
(16524,@Area1763,0,'Gromsblood,Zone 361,Area 1763,node 84'),
(16536,@Area1763,0,'Gromsblood,Zone 361,Area 1763,node 91'),
(19001,@Area1763,0,'Golden Sansam,Zone 361,Area 1763,node 102'),
(19111,@Area1763,0,'Golden Sansam,Zone 361,Area 1763,node 112'),
(19154,@Area1763,0,'Golden Sansam,Zone 361,Area 1763,node 117'),
(19380,@Area1763,0,'Dreamfoil,Zone 361,Area 1763,node 133'),
(19580,@Area1763,0,'Dreamfoil,Zone 361,Area 1763,node 171'),
(19660,@Area1763,0,'Dreamfoil,Zone 361,Area 1763,node 178'),
(19985,@Area1763,0,'Plaguebloom,Zone 361,Area 1763,node 204'),
(16513,@Rest,0,'Gromsblood,Zone 361,Area 1764,node 77'),
(16518,@Rest,0,'Gromsblood,Zone 361,Area 1764,node 80'),
(16519,@Rest,0,'Gromsblood,Zone 361,Area 1764,node 81'),
(16522,@Rest,0,'Gromsblood,Zone 361,Area 1764,node 83'),
(16529,@Rest,0,'Gromsblood,Zone 361,Area 1764,node 87'),
(19381,@Rest,0,'Dreamfoil,Zone 361,Area 1765,node 134'),
(19635,@Rest,0,'Dreamfoil,Zone 361,Area 1765,node 174'),
(20040,@Rest,0,'Plaguebloom,Zone 361,Area 1765,node 223'),
(15995,@Area1766,0,'Arthas Tears,Zone 361,Area 1766,node 11'),
(16009,@Area1766,0,'Arthas Tears,Zone 361,Area 1766,node 16'),
(16016,@Area1766,0,'Arthas Tears,Zone 361,Area 1766,node 18'),
(16231,@Area1766,0,'Sungrass,Zone 361,Area 1766,node 35'),
(18998,@Area1766,0,'Golden Sansam,Zone 361,Area 1766,node 101'),
(19399,@Area1766,0,'Dreamfoil,Zone 361,Area 1766,node 137'),
(19500,@Area1766,0,'Dreamfoil,Zone 361,Area 1766,node 157'),
(19962,@Area1766,0,'Plaguebloom,Zone 361,Area 1766,node 198'),
(19964,@Area1766,0,'Plaguebloom,Zone 361,Area 1766,node 199'),
(19983,@Area1766,0,'Plaguebloom,Zone 361,Area 1766,node 202'),
(20022,@Area1766,0,'Plaguebloom,Zone 361,Area 1766,node 216'),
(20023,@Area1766,0,'Plaguebloom,Zone 361,Area 1766,node 217'),
(20024,@Area1766,0,'Plaguebloom,Zone 361,Area 1766,node 218'),
(20048,@Area1766,0,'Plaguebloom,Zone 361,Area 1766,node 224'),
(20049,@Area1766,0,'Plaguebloom,Zone 361,Area 1766,node 225'),
(20050,@Area1766,0,'Plaguebloom,Zone 361,Area 1766,node 226'),
(20095,@Area1766,0,'Plaguebloom,Zone 361,Area 1766,node 237'),
(15962,@Area1767,0,'Arthas Tears,Zone 361,Area 1767,node 5'),
(16025,@Area1767,0,'Arthas Tears,Zone 361,Area 1767,node 23'),
(16284,@Area1767,0,'Sungrass,Zone 361,Area 1767,node 37'),
(16285,@Area1767,0,'Sungrass,Zone 361,Area 1767,node 38'),
(18948,@Area1767,0,'Golden Sansam,Zone 361,Area 1767,node 95'),
(19076,@Area1767,0,'Golden Sansam,Zone 361,Area 1767,node 109'),
(19106,@Area1767,0,'Golden Sansam,Zone 361,Area 1767,node 111'),
(19130,@Area1767,0,'Golden Sansam,Zone 361,Area 1767,node 114'),
(19131,@Area1767,0,'Golden Sansam,Zone 361,Area 1767,node 115'),
(19132,@Area1767,0,'Golden Sansam,Zone 361,Area 1767,node 116'),
(19167,@Area1767,0,'Golden Sansam,Zone 361,Area 1767,node 118'),
(19177,@Area1767,0,'Golden Sansam,Zone 361,Area 1767,node 119'),
(19187,@Area1767,0,'Golden Sansam,Zone 361,Area 1767,node 120'),
(19236,@Area1767,0,'Golden Sansam,Zone 361,Area 1767,node 122'),
(19391,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 136'),
(19413,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 140'),
(19432,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 143'),
(19449,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 145'),
(19450,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 146'),
(19451,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 147'),
(19485,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 153'),
(19487,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 155'),
(19515,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 158'),
(19539,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 160'),
(19546,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 162'),
(19547,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 163'),
(19572,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 167'),
(19574,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 168'),
(19638,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 175'),
(19651,@Area1767,0,'Dreamfoil,Zone 361,Area 1767,node 176'),
(19917,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 187'),
(19959,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 196'),
(19965,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 200'),
(19974,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 201'),
(19984,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 203'),
(20006,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 209'),
(20007,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 210'),
(20008,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 211'),
(20009,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 212'),
(20052,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 227'),
(20065,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 230'),
(20090,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 236'),
(20106,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 239'),
(20107,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 240'),
(20117,@Area1767,0,'Plaguebloom,Zone 361,Area 1767,node 241'),
(16501,@Rest,0,'Gromsblood,Zone 361,Area 1769,node 70'),
(16543,@Rest,0,'Gromsblood,Zone 361,Area 1769,node 93'),
(18967,@Rest,0,'Golden Sansam,Zone 361,Area 1998,node 98'),
(19118,@Rest,0,'Golden Sansam,Zone 361,Area 1998,node 113'),
(19414,@Rest,0,'Dreamfoil,Zone 361,Area 1998,node 141'),
(19415,@Rest,0,'Dreamfoil,Zone 361,Area 1998,node 142'),
(19878,@Rest,0,'Plaguebloom,Zone 361,Area 1998,node 180'),
(19879,@Rest,0,'Plaguebloom,Zone 361,Area 1998,node 181'),
(19919,@Rest,0,'Plaguebloom,Zone 361,Area 1998,node 188'),
(19961,@Rest,0,'Plaguebloom,Zone 361,Area 1998,node 197'),
(15997,@Rest,0,'Arthas Tears,Zone 361,Area 2478,node 12'),
(16489,@Rest,0,'Gromsblood,Zone 361,Area 2478,node 61'),
(19231,@Rest,0,'Golden Sansam,Zone 361,Area 2478,node 121'),
(19317,@Rest,0,'Dreamfoil,Zone 361,Area 2478,node 127'),
(19347,@Rest,0,'Dreamfoil,Zone 361,Area 2478,node 129'),
(19930,@Rest,0,'Plaguebloom,Zone 361,Area 2478,node 192'),
(19995,@Rest,0,'Plaguebloom,Zone 361,Area 2478,node 205'),
(20019,@Rest,0,'Plaguebloom,Zone 361,Area 2478,node 213'),
(20020,@Rest,0,'Plaguebloom,Zone 361,Area 2478,node 214'),
(20021,@Rest,0,'Plaguebloom,Zone 361,Area 2478,node 215'),
(19950,@Rest,0,'Plaguebloom,Zone 361,Area 2479,node 194'),
(19951,@Rest,0,'Plaguebloom,Zone 361,Area 2479,node 195'),
(16154,@Rest,0,'Sungrass,Zone 361,Area 2480,node 30'),
(19239,@Rest,0,'Golden Sansam,Zone 361,Area 2480,node 123'),
(19927,@Rest,0,'Plaguebloom,Zone 361,Area 2480,node 190'),
(19928,@Rest,0,'Plaguebloom,Zone 361,Area 2480,node 191'),
(20053,@Rest,0,'Plaguebloom,Zone 361,Area 2480,node 228'),
(16468,@Area2481,0,'Gromsblood,Zone 361,Area 2481,node 48'),
(16486,@Area2481,0,'Gromsblood,Zone 361,Area 2481,node 58'),
(16488,@Area2481,0,'Gromsblood,Zone 361,Area 2481,node 60'),
(16490,@Area2481,0,'Gromsblood,Zone 361,Area 2481,node 62'),
(16491,@Area2481,0,'Gromsblood,Zone 361,Area 2481,node 63'),
(18965,@Area2481,0,'Golden Sansam,Zone 361,Area 2481,node 96'),
(19471,@Area2481,0,'Dreamfoil,Zone 361,Area 2481,node 152'),
(19907,@Area2481,0,'Plaguebloom,Zone 361,Area 2481,node 184'),
(19908,@Area2481,0,'Plaguebloom,Zone 361,Area 2481,node 185'),
(19909,@Area2481,0,'Plaguebloom,Zone 361,Area 2481,node 186'),
(19926,@Area2481,0,'Plaguebloom,Zone 361,Area 2481,node 189'),
(20036,@Area2481,0,'Plaguebloom,Zone 361,Area 2481,node 219'),
(20038,@Area2481,0,'Plaguebloom,Zone 361,Area 2481,node 221'),
(15954,@Area2618,0,'Arthas Tears,Zone 361,Area 2618,node2'),
(16000,@Area2618,0,'Arthas Tears,Zone 361,Area 2618,node 13'),
(16010,@Area2618,0,'Arthas Tears,Zone 361,Area 2618,node 17'),
(16088,@Area2618,0,'Sungrass,Zone 361,Area 2618,node 28'),
(16465,@Area2618,0,'Gromsblood,Zone 361,Area 2618,node 45'),
(16470,@Area2618,0,'Gromsblood,Zone 361,Area 2618,node 50'),
(16506,@Area2618,0,'Gromsblood,Zone 361,Area 2618,node 72'),
(16545,@Area2618,0,'Gromsblood,Zone 361,Area 2618,node 94'),
(19055,@Area2618,0,'Golden Sansam,Zone 361,Area 2618,node 107'),
(19320,@Area2618,0,'Dreamfoil,Zone 361,Area 2618,node 128'),
(19488,@Area2618,0,'Dreamfoil,Zone 361,Area 2618,node 156'),
(19557,@Area2618,0,'Dreamfoil,Zone 361,Area 2618,node 164'),
(19888,@Area2618,0,'Plaguebloom,Zone 361,Area 2618,node 182'),
(20061,@Area2618,0,'Plaguebloom,Zone 361,Area 2618,node 229'); 

-- ========================
--  2011_05_20_04_world_pool_template.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

SET @Rest := 821; -- Leftover area (41 nodes)
SET @Area405 := @Rest+1; -- Area 405 (40 nodes)
SET @Area596 := @Rest+2; -- Area 596 (18 nodes)
SET @Area598 := @Rest+3; -- Area 598 (20 nodes)
SET @Area602 := @Rest+4; -- Area 602 (27 nodes)
SET @Area607 := @Rest+5; -- Area 607 (22 nodes)

DELETE FROM `pool_template` WHERE `entry` BETWEEN @Rest AND @Rest+6 ; 
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES 
(@Rest   ,10, 'Master Herbs Zone 405 Leftover Areas (10 out of 41 nodes)'),
(@Area405,8, 'Master Herbs Zone 405 Leftover Areas (8 out of 40 nodes)'),
(@Area596,4, 'Master Herbs Zone 405 Leftover Areas (4 out of 18 nodes)'),
(@Area598,5, 'Master Herbs Zone 405 Leftover Areas (5 out of 20 nodes)'),
(@Area602,5, 'Master Herbs Zone 405 Leftover Areas (5 out of 27 nodes)'),
(@Area607,5, 'Master Herbs Zone 405 Leftover Areas (5 out of 22 nodes)');

DELETE FROM `pool_gameobject` WHERE `pool_entry` BETWEEN @REST AND @REST+5 ; 
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES 
-- node s are numbered based on GUID, comment shows area and type
-- Pooled per area for more randomness
(3126,@Area405,0,'Bruiseweed,Zone 405,405,node 14'),
(3196,@Area405,0,'Bruiseweed,Zone 405,405,node 16'),
(3197,@Area405,0,'Bruiseweed,Zone 405,405,node 17'),
(3198,@Area405,0,'Bruiseweed,Zone 405,405,node 18'),
(3393,@Area405,0,'Bruiseweed,Zone 405,405,node 25'),
(3588,@Area405,0,'Bruiseweed,Zone 405,405,node 32'),
(3707,@Area405,0,'Bruiseweed,Zone 405,405,node 36'),
(3814,@Area405,0,'Bruiseweed,Zone 405,405,node 44'),
(3939,@Area405,0,'Wild Steelbloom,Zone 405,405,node 47'),
(4200,@Area405,0,'Wild Steelbloom,Zone 405,405,node 51'),
(4206,@Area405,0,'Wild Steelbloom,Zone 405,405,node 52'),
(4226,@Area405,0,'Wild Steelbloom,Zone 405,405,node 53'),
(4251,@Area405,0,'Wild Steelbloom,Zone 405,405,node 54'),
(4286,@Area405,0,'Kingsblood,Zone 405,405,node 55'),
(4316,@Area405,0,'Kingsblood,Zone 405,405,node 56'),
(4334,@Area405,0,'Kingsblood,Zone 405,405,node 57'),
(4338,@Area405,0,'Kingsblood,Zone 405,405,node 58'),
(4340,@Area405,0,'Kingsblood,Zone 405,405,node 59'),
(4358,@Area405,0,'Kingsblood,Zone 405,405,node 60'),
(4389,@Area405,0,'Kingsblood,Zone 405,405,node 62'),
(4398,@Area405,0,'Kingsblood,Zone 405,405,node 63'),
(4400,@Area405,0,'Kingsblood,Zone 405,405,node 64'),
(7336,@Area405,0,'Liferoot,Zone 405,405,node 80'),
(7491,@Area405,0,'Liferoot,Zone 405,405,node 86'),
(16475,@Area405,0,'Gromsblood,Zone 405,405,node 112'),
(18619,@Area405,0,'Wild Steelbloom,Zone 405,405,node 126'),
(18624,@Area405,0,'Kingsblood,Zone 405,405,node 129'),
(18680,@Area405,0,'Grave Moss,Zone 405,405,node 133'),
(29185,@Area405,0,'Liferoot,Zone 405,405,node 135'),
(29186,@Area405,0,'Liferoot,Zone 405,405,node 136'),
(34170,@Area405,0,'Kingsblood,Zone 405,405,node 147'),
(63344,@Area405,0,'Bruiseweed,Zone 405,405,node 151'),
(63386,@Area405,0,'Kingsblood,Zone 405,405,node 152'),
(63410,@Area405,0,'Grave Moss,Zone 405,405,node 153'),
(65114,@Area405,0,'Kingsblood,Zone 405,405,node 155'),
(86317,@Area405,0,'Kingsblood,Zone 405,405,node 158'),
(86348,@Area405,0,'Grave Moss,Zone 405,405,node 160'),
(86827,@Area405,0,'Liferoot,Zone 405,405,node 162'),
(86835,@Area405,0,'Liferoot,Zone 405,405,node 163'),
(87282,@Area405,0,'Grave Moss,Zone 405,405,node 167'),
(4437,@Area596,0,'Grave Moss,Zone 405,596,node 65'),
(4441,@Area596,0,'Grave Moss,Zone 405,596,node 66'),
(4443,@Area596,0,'Grave Moss,Zone 405,596,node 67'),
(4451,@Area596,0,'Grave Moss,Zone 405,596,node 68'),
(4468,@Area596,0,'Grave Moss,Zone 405,596,node 69'),
(4476,@Area596,0,'Grave Moss,Zone 405,596,node 70'),
(4477,@Area596,0,'Grave Moss,Zone 405,596,node 71'),
(4481,@Area596,0,'Grave Moss,Zone 405,596,node 72'),
(4487,@Area596,0,'Grave Moss,Zone 405,596,node 73'),
(4489,@Area596,0,'Grave Moss,Zone 405,596,node 74'),
(4495,@Area596,0,'Grave Moss,Zone 405,596,node 75'),
(4499,@Area596,0,'Grave Moss,Zone 405,596,node 76'),
(4503,@Area596,0,'Grave Moss,Zone 405,596,node 77'),
(4505,@Area596,0,'Grave Moss,Zone 405,596,node 78'),
(4507,@Area596,0,'Grave Moss,Zone 405,596,node 79'),
(86350,@Area596,0,'Grave Moss,Zone 405,596,node 161'),
(87272,@Area596,0,'Kingsblood,Zone 405,596,node 165'),
(87483,@Area596,0,'Grave Moss,Zone 405,596,node 168'),
(4388,@Area598,0,'Kingsblood,Zone 405,598,node 61'),
(8252,@Area598,0,'Stranglekelp,Zone 405,598,node 87'),
(8257,@Area598,0,'Stranglekelp,Zone 405,598,node 88'),
(8258,@Area598,0,'Stranglekelp,Zone 405,598,node 89'),
(8326,@Area598,0,'Stranglekelp,Zone 405,598,node 91'),
(8340,@Area598,0,'Stranglekelp,Zone 405,598,node 92'),
(8352,@Area598,0,'Stranglekelp,Zone 405,598,node 93'),
(8357,@Area598,0,'Stranglekelp,Zone 405,598,node 94'),
(8397,@Area598,0,'Stranglekelp,Zone 405,598,node 95'),
(8398,@Area598,0,'Stranglekelp,Zone 405,598,node 96'),
(8503,@Area598,0,'Stranglekelp,Zone 405,598,node 99'),
(8528,@Area598,0,'Stranglekelp,Zone 405,598,node 100'),
(18620,@Area598,0,'Wild Steelbloom,Zone 405,598,node 127'),
(29195,@Area598,0,'Stranglekelp,Zone 405,598,node 138'),
(29198,@Area598,0,'Stranglekelp,Zone 405,598,node 139'),
(29199,@Area598,0,'Stranglekelp,Zone 405,598,node 140'),
(29201,@Area598,0,'Stranglekelp,Zone 405,598,node 142'),
(29202,@Area598,0,'Stranglekelp,Zone 405,598,node 143'),
(29203,@Area598,0,'Stranglekelp,Zone 405,598,node 144'),
(87274,@Area598,0,'Kingsblood,Zone 405,598,node 166'),
(2920,@Area602,0,'Bruiseweed,Zone 405,602,node 1'),
(2921,@Area602,0,'Bruiseweed,Zone 405,602,node 2'),
(2953,@Area602,0,'Bruiseweed,Zone 405,602,node 4'),
(3083,@Area602,0,'Bruiseweed,Zone 405,602,node 10'),
(3156,@Area602,0,'Bruiseweed,Zone 405,602,node 15'),
(3203,@Area602,0,'Bruiseweed,Zone 405,602,node 19'),
(3771,@Area602,0,'Bruiseweed,Zone 405,602,node 40'),
(3772,@Area602,0,'Bruiseweed,Zone 405,602,node 41'),
(3790,@Area602,0,'Bruiseweed,Zone 405,602,node 43'),
(7464,@Area602,0,'Liferoot,Zone 405,602,node 84'),
(7469,@Area602,0,'Liferoot,Zone 405,602,node 85'),
(16458,@Area602,0,'Gromsblood,Zone 405,602,node 110'),
(16464,@Area602,0,'Gromsblood,Zone 405,602,node 111'),
(16498,@Area602,0,'Gromsblood,Zone 405,602,node 113'),
(16502,@Area602,0,'Gromsblood,Zone 405,602,node 114'),
(16510,@Area602,0,'Gromsblood,Zone 405,602,node 115'),
(16523,@Area602,0,'Gromsblood,Zone 405,602,node 116'),
(16533,@Area602,0,'Gromsblood,Zone 405,602,node 117'),
(16537,@Area602,0,'Gromsblood,Zone 405,602,node 118'),
(16538,@Area602,0,'Gromsblood,Zone 405,602,node 119'),
(16539,@Area602,0,'Gromsblood,Zone 405,602,node 120'),
(16540,@Area602,0,'Gromsblood,Zone 405,602,node 121'),
(16541,@Area602,0,'Gromsblood,Zone 405,602,node 122'),
(16544,@Area602,0,'Gromsblood,Zone 405,602,node 123'),
(28646,@Area602,0,'Liferoot,Zone 405,602,node 134'),
(34831,@Area602,0,'Bruiseweed,Zone 405,602,node 150'),
(86143,@Area602,0,'Gromsblood,Zone 405,602,node 156'),
(2936,@Area607,0,'Bruiseweed,Zone 405,607,node 3'),
(2972,@Area607,0,'Bruiseweed,Zone 405,607,node 5'),
(2973,@Area607,0,'Bruiseweed,Zone 405,607,node 6'),
(3003,@Area607,0,'Bruiseweed,Zone 405,607,node 8'),
(3221,@Area607,0,'Bruiseweed,Zone 405,607,node 20'),
(3251,@Area607,0,'Bruiseweed,Zone 405,607,node 21'),
(3430,@Area607,0,'Bruiseweed,Zone 405,607,node 26'),
(3431,@Area607,0,'Bruiseweed,Zone 405,607,node 27'),
(3432,@Area607,0,'Bruiseweed,Zone 405,607,node 28'),
(3665,@Area607,0,'Bruiseweed,Zone 405,607,node 35'),
(3860,@Area607,0,'Bruiseweed,Zone 405,607,node 45'),
(3861,@Area607,0,'Bruiseweed,Zone 405,607,node 46'),
(16427,@Area607,0,'Ghost Mushroom,Zone 405,607,node 104'),
(16432,@Area607,0,'Ghost Mushroom,Zone 405,607,node 105'),
(16440,@Area607,0,'Ghost Mushroom,Zone 405,607,node 106'),
(16441,@Area607,0,'Ghost Mushroom,Zone 405,607,node 107'),
(16444,@Area607,0,'Ghost Mushroom,Zone 405,607,node 108'),
(16446,@Area607,0,'Ghost Mushroom,Zone 405,607,node 109'),
(18214,@Area607,0,'Ghost Mushroom,Zone 405,607,node 124'),
(34185,@Area607,0,'Ghost Mushroom,Zone 405,607,node 148'),
(34187,@Area607,0,'Bruiseweed,Zone 405,607,node 149'),
(86288,@Area607,0,'Bruiseweed,Zone 405,607,node 157'),
(3123,@Rest,0,'Bruiseweed,Zone 405,603,node 11'),
(3124,@Rest,0,'Bruiseweed,Zone 405,603,node 12'),
(3125,@Rest,0,'Bruiseweed,Zone 405,603,node 13'),
(3320,@Rest,0,'Bruiseweed,Zone 405,603,node 22'),
(3363,@Rest,0,'Bruiseweed,Zone 405,603,node 23'),
(3364,@Rest,0,'Bruiseweed,Zone 405,603,node 24'),
(3566,@Rest,0,'Bruiseweed,Zone 405,603,node 30'),
(3577,@Rest,0,'Bruiseweed,Zone 405,603,node 31'),
(3622,@Rest,0,'Bruiseweed,Zone 405,603,node 34'),
(3718,@Rest,0,'Bruiseweed,Zone 405,603,node 38'),
(3720,@Rest,0,'Bruiseweed,Zone 405,603,node 39'),
(18617,@Rest,0,'Bruiseweed,Zone 405,603,node 125'),
(18621,@Rest,0,'Wild Steelbloom,Zone 405,603,node 128'),
(7362,@Rest,0,'Liferoot,Zone 405,604,node 81'),
(7437,@Rest,0,'Liferoot,Zone 405,604,node 82'),
(7458,@Rest,0,'Liferoot,Zone 405,604,node 83'),
(29188,@Rest,0,'Liferoot,Zone 405,604,node 137'),
(3990,@Rest,0,'Wild Steelbloom,Zone 405,609,node 48'),
(4063,@Rest,0,'Wild Steelbloom,Zone 405,609,node 49'),
(18676,@Rest,0,'Grave Moss,Zone 405,609,node 131'),
(65072,@Rest,0,'Wild Steelbloom,Zone 405,609,node 154'),
(29200,@Rest,0,'Stranglekelp,Zone 405,2324,node 141'),
(4086,@Rest,0,'Wild Steelbloom,Zone 405,2404,node 50'),
(8542,@Rest,0,'Stranglekelp,Zone 405,2405,node 101'),
(8543,@Rest,0,'Stranglekelp,Zone 405,2405,node 102'),
(8557,@Rest,0,'Stranglekelp,Zone 405,2405,node 103'),
(8272,@Rest,0,'Stranglekelp,Zone 405,2408,node 90'),
(8404,@Rest,0,'Stranglekelp,Zone 405,2408,node 97'),
(8447,@Rest,0,'Stranglekelp,Zone 405,2408,node 98'),
(3773,@Rest,0,'Bruiseweed,Zone 405,2617,node 42'),
(18625,@Rest,0,'Kingsblood,Zone 405,2617,node 130'),
(18677,@Rest,0,'Grave Moss,Zone 405,2657,node 132'),
(2979,@Rest,0,'Bruiseweed,Zone 405,599,node 7'),
(3078,@Rest,0,'Bruiseweed,Zone 405,599,node 9'),
(3501,@Rest,0,'Bruiseweed,Zone 405,599,node 29'),
(3599,@Rest,0,'Bruiseweed,Zone 405,599,node 33'),
(3717,@Rest,0,'Bruiseweed,Zone 405,599,node 37'),
(34165,@Rest,0,'Bruiseweed,Zone 405,599,node 145'),
(34168,@Rest,0,'Wild Steelbloom,Zone 405,599,node 146'),
(86326,@Rest,0,'Kingsblood,Zone 405,599,node 159'),
(87250,@Rest,0,'Bruiseweed,Zone 405,599,node 164');

-- ========================
--  2011_05_20_05_world_creature_template.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Fix InhabitType for Mana Snapper (Netherstorm)
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=18883;

-- ========================
--  2011_05_21_01_world_conditions.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `conditions` WHERE `SourceEntry` IN (62385,62386,62387,62521,62525,62524);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES
(13,0,62385,0,18,1,32906,0,0,'','Brightleaf\'s Essence'),
(13,0,62386,0,18,1,32906,0,0,'','Stonebarks\'s Essence'),
(13,0,62387,0,18,1,32906,0,0,'','Ironbranch\'s Essence'),
(13,0,62521,0,18,1,32906,0,0,'','Attuned to Nature 25 Dose Reduction'),
(13,0,62524,0,18,1,32906,0,0,'','Attuned to Nature 2 Dose Reduction'),
(13,0,62525,0,18,1,32906,0,0,'','Attuned to Nature 10 Dose Reduction');

-- ========================
--  2011_05_21_01_world_instance_misc.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Trigger flag
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry`=34129;

-- Delete NPC which is not supposed to be here
DELETE FROM `creature` WHERE `guid`=136607;

-- Immunity
UPDATE `creature_template` SET `mechanic_immune_mask`=650854239 WHERE `entry`=32906;

-- Spell Difficulties
DELETE FROM `spelldifficulty_dbc` WHERE `id` BETWEEN 3240 AND 3250;
INSERT INTO `spelldifficulty_dbc` (`id`,`spellid0`,`spellid1`,`spellid2`,`spellid3`)
VALUES
(3240,63169,63549,0,0), -- Ulduar: Corrupted Servitor - Petrify Joints
(3241,63082,63559,0,0), -- Ulduar: Misguided Nymph - Bind Life
(3242,63111,63562,0,0), -- Ulduar: Misguided Nymph - Frost Spear
(3243,63136,63564,0,0), -- Ulduar: Misguided Nymph - Winter's Embrace
(3244,63047,63550,0,0), -- Ulduar: Guardian Lasher - Guardian's Lash
(3245,63242,63556,0,0), -- Ulduar: Mangrove Ent - Nourish
(3246,63241,63554,0,0), -- Ulduar: Mangrove Ent - Tranquility
(3247,63240,63553,0,0), -- Ulduar: Ironroot Lasher - Ironroot Thorns
(3248,63247,63568,0,0), -- Ulduar: Nature's Blade - Living Tsunami
(3249,63226,63551,0,0), -- Ulduar: Guardian of Life - Poison Breath
(3250,64587,34650,0,0); -- Ulduar: Nature Bomb - Nature Bomb

-- ========================
--  2011_05_21_01_world_scriptname.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `creature_template` SET `ScriptName`='boss_freya' WHERE `entry`=32906;
UPDATE `creature_template` SET `ScriptName`='boss_elder_brightleaf' WHERE `entry`=32915;
UPDATE `creature_template` SET `ScriptName`='boss_elder_ironbranch' WHERE `entry`=32913;
UPDATE `creature_template` SET `ScriptName`='boss_elder_stonebark' WHERE `entry`=32914;
UPDATE `creature_template` SET `ScriptName`='npc_ancient_conservator' WHERE `entry`=33203;
UPDATE `creature_template` SET `ScriptName`='npc_snaplasher' WHERE `entry`=32916;
UPDATE `creature_template` SET `ScriptName`='npc_storm_lasher' WHERE `entry`=32919;
UPDATE `creature_template` SET `ScriptName`='npc_ancient_water_spirit' WHERE `entry`=33202;
UPDATE `creature_template` SET `ScriptName`='npc_detonating_lasher' WHERE `entry`=32918;
UPDATE `creature_template` SET `ScriptName`='npc_sun_beam' WHERE `entry`=33170;
UPDATE `creature_template` SET `ScriptName`='npc_nature_bomb' WHERE `entry`=34129;
UPDATE `creature_template` SET `ScriptName`='npc_eonars_gift' WHERE `entry`=33228;
UPDATE `creature_template` SET `ScriptName`='npc_healthy_spore' WHERE `entry`=33215;
UPDATE `creature_template` SET `ScriptName`='npc_unstable_sun_beam' WHERE `entry`=33050;
UPDATE `creature_template` SET `ScriptName`='npc_iron_roots' WHERE `entry` IN (33088,33168);

-- ========================
--  2011_05_21_01_world_spell_script_names.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `spell_id` IN (62519,65158,65160);
INSERT INTO `spell_script_names`
VALUES
(62519, 'spell_freya_attuned_to_nature'),
(65158, 'spell_freya_iron_roots'),
(65160, 'spell_freya_iron_roots');

-- ========================
--  2011_05_21_02_world_creature_misc.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~0x02000100 WHERE `entry` IN (37007,38031);

DELETE FROM `creature_template_addon` WHERE `entry` IN (37007,38031);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(37007,0,0x0000000,0,0,'70733'),
(38031,0,0x0000000,0,0,'70733');

-- ========================
--  2011_05_21_02_world_spell_script_names.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_icc_stoneform';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_icc_sprit_alarm';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(70733, 'spell_icc_stoneform'),
(70546, 'spell_icc_sprit_alarm'),
(70536, 'spell_icc_sprit_alarm'),
(70545, 'spell_icc_sprit_alarm'),
(70547, 'spell_icc_sprit_alarm');

-- ========================
--  2011_05_21_03_world_creature_text.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `creature_text` WHERE `entry`=37007;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(37007,0,0, 'The master''s sanctum has been disturbed!',1,0,0,0,0,16865, 'Deathbound Ward - SAY_TRAP_ACTIVATE'),
(37007,0,1, 'I... awaken!',1,0,0,0,0,16866, 'Deathbound Ward - SAY_TRAP_ACTIVATE'),
(37007,0,2, 'Who... goes there...?',1,0,0,0,0,16867, 'Deathbound Ward - SAY_TRAP_ACTIVATE');

-- ========================
--  2011_05_22_00_world_creatures.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

SET @Zul = 23863; -- Zul'jin (ZA)
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=2.14286 WHERE `entry`=@Zul;
UPDATE `creature_model_info` SET `bounding_radius`=1.566,`combat_reach`=3.6,`gender`=0 WHERE `modelid`=21899;
DELETE FROM `creature_template_addon` WHERE `entry`=@Zul;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Zul,0,0,1,0, NULL);

/* should this be set by core script or DB?
SET @EquiEntry = XXX; -- (creature_equip_template.entry - need 1)
UPDATE `creature_template` SET `equipment_id`=@EquiEntry WHERE `entry`=@Zul;
DELETE FROM `creature_equip_template` WHERE `entry`=@EquiEntry;
INSERT INTO `creature_equip_template` (`entry`,`equipentry1`,`equipentry2`,`equipentry3`) VALUES
(@EquiEntry,33975,0,0);*/

-- ========================
--  2011_05_22_01_world_misc.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

/* Ruby Sanctum template updates */
SET @EquiEntry = 2466; -- (creature_equip_template.entry - need 7)

-- Template
UPDATE `creature_template` SET `exp`=2,`equipment_id`=@EquiEntry+0 WHERE `entry`=39746; -- General Zarithrian
UPDATE `creature_template` SET `exp`=2 WHERE `entry`=39747; -- Saviana Ragefire
UPDATE `creature_template` SET `exp`=2,`equipment_id`=@EquiEntry+1 WHERE `entry`=39751; -- Baltharus the Warborn
UPDATE `creature_template` SET `exp`=2,`minlevel`=80,`maxlevel`=80,`unit_flags`=`unit_flags`|0x2000000,`speed_run`=0.99206 WHERE `entry`=39794; -- Zarithrian Spawn Stalker
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x8000,`equipment_id`=@EquiEntry+2 WHERE `entry`=39814; -- Onyx Flamecaller (flying)
UPDATE `creature_template` SET `baseattacktime`=1500,`unit_flags`=`unit_flags`|0x8040 WHERE `entry`=39863; -- Halion
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x40,`equipment_id`=@EquiEntry+1 WHERE `entry`=39899; -- Baltharus the Warborn (clone)
UPDATE `creature_template` SET `exp`=2,`unit_flags`=`unit_flags`|0x2000000,`unit_class`=1 WHERE `entry`=40001; -- Combustion
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000000,`unit_class`=2 WHERE `entry`=40029; -- Meteor Strike
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000000,`unit_class`=2 WHERE `entry`=40041; -- Meteor Strike
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000000,`unit_class`=2 WHERE `entry`=40042; -- Meteor Strike
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000000,`unit_class`=2 WHERE `entry`=40043; -- Meteor Strike
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000000,`unit_class`=2 WHERE `entry`=40044; -- Meteor Strike
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000000,`unit_class`=2 WHERE `entry`=40055; -- Meteor Strike
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x2000100,`speed_run`=0.42857 WHERE `entry`=40081; -- Orb Carrier (vehicle)
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x2000000,`speed_run`=0.85714 WHERE `entry`=40083; -- Shadow Orb
UPDATE `creature_template` SET `baseattacktime`=2000,`unit_flags`=`unit_flags`|0x2000100,`speed_run`=0.78571 WHERE `entry`=40091; -- Orb Rotation Focus
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x2000000,`speed_run`=0.85714 WHERE `entry`=40100; -- Shadow Orb
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=1500,`unit_flags`=`unit_flags`|0x88840,`dynamicflags`=`dynamicflags`|0xC WHERE `entry`=40142; -- Halion (P2)
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000100 WHERE `entry`=40146; -- Halion Controller
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x8040,`equipment_id`=@EquiEntry+3,`unit_class`=8 WHERE `entry`=40417; -- Charscale Invoker
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x8040,`equipment_id`=@EquiEntry+4 WHERE `entry`=40419; -- Charscale Assaulter
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=1250,`unit_flags`=`unit_flags`|0x8040,`equipment_id`=@EquiEntry+5 WHERE `entry`=40421; -- Charscale Elite
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x8040,`equipment_id`=@EquiEntry+6 WHERE `entry`=40423; -- Charscale Commander
UPDATE `creature_template` SET `exp`=2,`unit_flags`=`unit_flags`|0x8000,`unit_class`=8 WHERE `entry`=40429; -- Sanctum Guardian Xerestrasza
UPDATE `creature_template` SET `exp`=2,`unit_flags`=`unit_flags`|0x22040300 WHERE `entry`=40626; -- Ruby Drakonid
UPDATE `creature_template` SET `exp`=2,`unit_flags`=`unit_flags`|0x22040300 WHERE `entry`=40627; -- Ruby Drake
UPDATE `creature_template` SET `exp`=2,`unit_flags`=`unit_flags`|0x22040300 WHERE `entry`=40628; -- Ruby Scalebane
UPDATE `creature_template` SET `exp`=2,`unit_flags`=`unit_flags`|0x22040300 WHERE `entry`=40870; -- Ruby Dragon

-- Equips
DELETE FROM `creature_equip_template` WHERE `entry` BETWEEN @EquiEntry AND @EquiEntry+6;
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES 
(@EquiEntry+0,43111,0,0),
(@EquiEntry+1,28365,0,0),
(@EquiEntry+2,19355,0,0),
(@EquiEntry+3,43114,0,0),
(@EquiEntry+4,5597,0,0),
(@EquiEntry+5,49737,49737,0),
(@EquiEntry+6,40608,0,0);

-- Model
UPDATE `creature_model_info` SET `bounding_radius`=1.75,`combat_reach`=1,`gender`=0 WHERE `modelid`=32179; -- General Zarithrian
UPDATE `creature_model_info` SET `bounding_radius`=2.625,`combat_reach`=5.25,`gender`=1 WHERE `modelid`=31577; -- Saviana Ragefire
UPDATE `creature_model_info` SET `bounding_radius`=3,`combat_reach`=9,`gender`=0 WHERE `modelid`=31761; -- Baltharus the Warborn
UPDATE `creature_model_info` SET `bounding_radius`=1.8,`combat_reach`=1,`gender`=2 WHERE `modelid`=31952; -- Halion
UPDATE `creature_model_info` SET `bounding_radius`=2,`combat_reach`=4,`gender`=2 WHERE `modelid`=16946; -- Combustion
UPDATE `creature_model_info` SET `bounding_radius`=1.5,`combat_reach`=5,`gender`=0 WHERE `modelid`=14308; -- Charscale Assaulter
UPDATE `creature_model_info` SET `bounding_radius`=0.67025,`combat_reach`=2.625,`gender`=1 WHERE `modelid`=31962; -- Sanctum Guardian Xerestrasza
UPDATE `creature_model_info` SET `bounding_radius`=1.875,`combat_reach`=6.25,`gender`=0 WHERE `modelid`=32105; -- Ruby Drakonid
UPDATE `creature_model_info` SET `bounding_radius`=3.75,`combat_reach`=4.375,`gender`=0 WHERE `modelid`=32104; -- Ruby Scalebane
UPDATE `creature_model_info` SET `bounding_radius`=1,`combat_reach`=1,`gender`=1 WHERE `modelid`=2718; -- Ruby Dragon

-- Addon
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=0x1,`mount`=0,`emote`=0,`auras`='29266' WHERE `entry`=40626; -- Ruby Drakonid (Permanent Feing Death)
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=0x1,`mount`=0,`emote`=0,`auras`='29266' WHERE `entry`=40627; -- Ruby Drake (Permanent Feing Death)
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=0x1,`mount`=0,`emote`=0,`auras`='29266' WHERE `entry`=40628; -- Ruby Scalebane (Permanent Feing Death)
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=0x1,`mount`=0,`emote`=0,`auras`='29266' WHERE `entry`=40870; -- Ruby Dragon (Permanent Feing Death)
DELETE FROM `creature_template_addon` WHERE `entry` IN (39746,39747,39751,39794,39814,39863,40001,40029,40041,40042,40043,40044,40055,40081,40083,40091,40100,40142,40146,40417,40419,40421,40423,40429);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(39746,0,0,0x1,0, NULL), -- General Zarithrian
(39747,0,0,0x1,0, NULL), -- Saviana Ragefire
(39751,0,0,0x1,0, NULL), -- Baltharus the Warborn
(39794,0,0,0x1,0, NULL), -- Zarithrian Spawn Stalker
(39814,0,0,0x1,0, NULL), -- Onyx Flamecaller
(39863,0,0,0x1,0, NULL), -- Halion
(40001,0,0,0x1,0, NULL), -- Combustion
(40029,0,0,0x1,0, NULL), -- Meteor Strike
(40041,0,0,0x1,0, NULL), -- Meteor Strike
(40042,0,0,0x1,0, NULL), -- Meteor Strike
(40043,0,0,0x1,0, NULL), -- Meteor Strike
(40044,0,0,0x1,0, NULL), -- Meteor Strike
(40055,0,0,0x1,0, NULL), -- Meteor Strike
(40081,0,0x3000000,0x1,0, NULL), -- Orb Carrier
(40083,0,0x2000000,0x1,0, NULL), -- Shadow Orb
(40091,0,0,0x1,0, NULL), -- Orb Rotation Focus
(40100,0,0x2000000,0x1,0, NULL), -- Shadow Orb
(40142,0,0,0x1,0, NULL), -- Halion
(40146,0,0,0x1,0, NULL), -- Halion Controller
(40417,0,0,0x1,0, NULL), -- Charscale Invoker
(40419,0,0,0x1,0, NULL), -- Charscale Assaulter
(40421,0,0,0x1,0, NULL), -- Charscale Elite
(40423,0,0,0x1,0, NULL), -- Charscale Commander
(40429,0,0,0x1,0, NULL); -- Sanctum Guardian Xerestrasza

-- GOs
UPDATE `gameobject_template` SET `flags`=`flags`|0x30 WHERE `entry`=203007; -- Ruby Sanctum Halion Flame Ring

-- ========================
--  2011_05_22_02_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

SET @Valkyr = 38391; -- Val'kyr Guardian
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x8000,`AIName`='SmartAI' WHERE `entry`=@Valkyr; -- unk_15
UPDATE `creature_model_info` SET `bounding_radius`=0.124,`combat_reach`=1.6,`gender`=1 WHERE `modelid`=31181;
DELETE FROM `creature_template_addon` WHERE `entry`=@Valkyr;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Valkyr,0,50331648,1,0, NULL);

DELETE FROM `smart_scripts` WHERE `entryorguid`=@Valkyr;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Valkyr,0,0,0,25,0,100,0,0,0,0,0,58,1,71841,1500,2500,45,0,1,0,0,0,0,0,0,0, 'Val''kyr Guardian - On reset install AI template caster - Cast Smite every 1.5/2.5 seconds');

-- ========================
--  2011_05_22_03_world_gameobject_template.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `gameobject_template` SET `flags`=`flags`|32,`faction`=35 WHERE `entry`=195527; -- Argent Coliseum Floor

-- ========================
--  2011_05_22_04_world_creature_text.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `creature_text` WHERE `entry` IN (37007,37491,37493,37494,37495);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(37007,0,0, 'The master''s sanctum has been disturbed!',14,0,0,0,0,16865, 'Deathbound Ward - SAY_TRAP_ACTIVATE'),
(37007,0,1, 'I... awaken!',14,0,0,0,0,16866, 'Deathbound Ward - SAY_TRAP_ACTIVATE'),
(37007,0,2, 'Who... goes there...?',14,0,0,0,0,16867, 'Deathbound Ward - SAY_TRAP_ACTIVATE'),
(37491,1,0, 'You miserable fools never did manage to select a decent bat wing.',14,0,0,0,0,16587, 'Captain Arnath - SAY_ARNATH_RESURRECTED'),
(37491,2,0, 'THAT was for bringing me spoiled spider ichor!',14,0,0,0,0,16588, 'Captain Arnath - SAY_ARNATH_KILL'),
(37491,3,0, 'Don''t... let Finklestein use me... for his potions...',14,0,0,0,0,16589, 'Captain Arnath - SAY_ARNATH_SECOND_DEATH'),
(37493,1,0, 'What? This strength...? All of the pain is gone! You... must join me in the eternal embrace of death!',14,0,0,0,0,16811, 'Captain Brandon - SAY_BRANDON_RESURRECTED'),
(37493,2,0, 'It doesn''t hurt anymore, does it?',14,0,0,0,0,16812, 'Captain Brandon - SAY_BRANDON_KILL'),
(37493,3,0, 'I''m sorry...',14,0,0,0,0,16813, 'Captain Brandon - SAY_BRANDON_SECOND_DEATH'),
(37494,1,0, 'No! Why was I denied a death by flame? You must all BURN!',14,0,0,0,0,16845, 'Captain Grondel - SAY_GRONDEL_RESURRECTED'),
(37494,2,0, 'Can you feel the burn?',14,0,0,0,0,16846, 'Captain Grondel - SAY_GRONDEL_KILL'),
(37494,3,0, 'What... have I done? No!',14,0,0,0,0,16847, 'Captain Grondel - SAY_GRONDEL_SECOND_DEATH'),
(37495,1,0, 'There is no escaping the Lich King''s will. Prepare for an explosive encounter!',14,0,0,0,0,16999, 'Captain Rupert - SAY_RUPERT_RESURRECTED'),
(37495,2,0, 'So that''s what happens when you stand too close to a bomb!',14,0,0,0,0,17000, 'Captain Rupert - SAY_RUPERT_KILL'),
(37495,3,0, 'What an... explosive ending!',14,0,0,0,0,17001, 'Captain Rupert - SAY_RUPERT_SECOND_DEATH');

-- ========================
--  2011_05_22_05_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

SET @Valkyr = 38391;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (@Valkyr,@Valkyr+1); -- 9 scripts

UPDATE `creature_template` SET `AIName`='SmartAI',`exp`=2,`minlevel`=80,`maxlevel`=80,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x8000,`speed_walk`=2.8,`speed_run`=1.07143 WHERE `entry`=@Valkyr+1; -- Val'kyr Protector

DELETE FROM `creature_template_addon` WHERE `entry`=@Valkyr+1;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Valkyr+1,0,0x3000000,0x801,0, NULL); -- Val'kyr Protector

DELETE FROM `smart_scripts` WHERE `entryorguid`=@Valkyr+1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Valkyr+1,0,0,0,25,0,100,0,0,0,0,0,58,1,71842,1500,2500,45,0,1,0,0,0,0,0,0,0, 'Val''kyr Protector - On reset install AI template caster - Cast Smite (Rank 12) every 1.5/2.5 seconds');

-- ========================
--  2011_05_22_06_world_creature_template.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=29598; -- Icefang
UPDATE `creature_template` SET `spell1`=54897, `spell2`=54907, `spell3`=54788 WHERE `entry`=29602; -- Icefang
-- Last spell (spell3) shouldn't be show to the client, core implementation of vehicle spells needs to change.
DELETE FROM `creature_template_addon` WHERE `entry`=29598;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29598,0,0,1,0, NULL); -- Icefang

-- ========================
--  2011_05_22_07_world_misc.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

UPDATE `creature_text` SET `type`=14 WHERE `type`=1; -- 9 rows changed
UPDATE `creature_text` SET `type`=16 WHERE `type`=2; -- 1 row changed

-- Fix unrelated DB errors
UPDATE `creature_template` SET `unit_class`=8 WHERE `entry`=40418;
DELETE FROM `creature_addon` WHERE `guid`=136607;

-- ========================
--  2011_05_22_08_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Eradication should not have internal cooldown
UPDATE `spell_proc_event` SET `Cooldown`=0 WHERE `entry` IN (47195,47196,47197); 

-- ========================
--  2011_05_23_00_world_spell_dbc.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

DELETE FROM `spell_dbc` WHERE `Id`=25042;
INSERT INTO `spell_dbc` (`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
(25042,0,0,384,268435592,4,0,0,0,0,0,0,1,0,0,101,0,0,0,0,29,1,0,-1,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,22,0,0,15,0,0,12,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0, 'Triggerspell - Mark of Nature');

-- ========================
--  2011_05_24_00_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

SET @ENTRY := 27853;
SET @GUID := 115101;

-- Remove old EAI and replace with proper SAI
DELETE FROM `creature_ai_scripts` WHERE `id`=2785301;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,-109577,-109576,-109573);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,3000,3000,3000,11,49731,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Projections and Plans Kill Credit Bunny - OOC - Cast Projections and Plans: Kill Credit on self'),
(-109577,0,0,0,1,0,100,1,1000,1000,30000,30000,11,46906,2,0,0,0,0,10,@GUID,@ENTRY,0,0,0,0,0, 'Surge Needle Sorcerer - OOC - Cast Surge Needle Beam'),
(-109577,0,1,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Surge Needle Sorcerer - Combat - Cast Arcane Blast on victim'),
(-109576,0,0,0,1,0,100,1,1000,1000,30000,30000,11,46906,2,0,0,0,0,10,@GUID,@ENTRY,0,0,0,0,0, 'Surge Needle Sorcerer - OOC - Cast Surge Needle Beam'),
(-109576,0,1,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Surge Needle Sorcerer - Combat - Cast Arcane Blast on victim'),
(-109573,0,0,0,1,0,100,1,1000,1000,30000,30000,11,46906,2,0,0,0,0,10,@GUID,@ENTRY,0,0,0,0,0, 'Surge Needle Sorcerer - OOC - Cast Surge Needle Beam'),
(-109573,0,1,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Surge Needle Sorcerer - Combat - Cast Arcane Blast on victim');

-- ========================
--  2011_05_24_01_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Pathing for Stormpeak Wyrm Entry: 29753
SET @NPC := 101109;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7171.794,`position_y`=-1623.425,`position_z`=1024.3910 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7232.853,-1552.436,1018.6120,0,0,0,100,0),
(@PATH,2,7307.723,-1450.282,1031.3350,0,0,0,100,0),
(@PATH,3,7331.675,-1329.285,1071.6680,0,0,0,100,0),
(@PATH,4,7358.584,-1200.453,1095.0840,0,0,0,100,0),
(@PATH,5,7466.604,-1189.773,1087.8350,0,0,0,100,0),
(@PATH,6,7551.937,-1306.039,1036.9180,0,0,0,100,0),
(@PATH,7,7448.903,-1429.033,989.2788,0,0,0,100,0),
(@PATH,8,7265.264,-1460.603,924.7513,0,0,0,100,0),
(@PATH,9,7092.603,-1462.597,1039.6130,0,0,0,100,0),
(@PATH,10,6996.566,-1627.143,1060.5580,0,0,0,100,0),
(@PATH,11,7050.830,-1759.601,1026.4740,0,0,0,100,0),
(@PATH,12,7171.794,-1623.425,1024.3910,0,0,0,100,0);

-- Pathing for Stormpeak Wyrm Entry: 29753
SET @NPC := 101111;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7587.957,`position_y`=-1291.808,`position_z`=991.6395 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7576.177,-1339.229,991.6395,0,0,0,100,0),
(@PATH,2,7507.776,-1364.563,991.6395,0,0,0,100,0),
(@PATH,3,7462.349,-1304.429,991.6395,0,0,0,100,0),
(@PATH,4,7498.511,-1237.602,991.6395,0,0,0,100,0),
(@PATH,5,7560.044,-1239.629,991.6395,0,0,0,100,0),
(@PATH,6,7587.957,-1291.808,991.6395,0,0,0,100,0);

-- Pathing for Stormpeak Wyrm Entry: 29753
SET @NPC := 101112;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7325.549,`position_y`=-1146.471,`position_z`=1046.3540 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7422.022,-1135.820,1033.4380,0,0,0,100,0),
(@PATH,2,7518.522,-1237.663,1056.8260,0,0,0,100,0),
(@PATH,3,7501.124,-1449.262,1017.7980,0,0,0,100,0),
(@PATH,4,7376.508,-1303.557,1049.8540,0,0,0,100,0),
(@PATH,5,7325.549,-1146.471,1046.3540,0,0,0,100,0);

-- Pathing for Stormpeak Wyrm Entry: 29753
SET @NPC := 101121;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7306.776,`position_y`=-1409.522,`position_z`=1035.3630 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7403.804,-1456.458,1035.3630,0,0,0,100,0),
(@PATH,2,7468.895,-1421.992,1035.3630,0,0,0,100,0),
(@PATH,3,7499.714,-1349.263,1035.3630,0,0,0,100,0),
(@PATH,4,7436.533,-1280.687,1035.3630,0,0,0,100,0),
(@PATH,5,7396.054,-1281.403,1035.3630,0,0,0,100,0),
(@PATH,6,7298.188,-1334.745,1035.3630,0,0,0,100,0),
(@PATH,7,7306.776,-1409.522,1035.3630,0,0,0,100,0);

-- Pathing for Stormpeak Wyrm Entry: 29753
SET @NPC := 101123;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7505.094,`position_y`=-1216.210,`position_z`=980.8120 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7458.424,-1438.003,1005.1730,0,0,0,100,0),
(@PATH,2,7528.125,-1725.565,1300.1730,0,0,0,100,0),
(@PATH,3,7422.311,-1569.981,1141.3120,0,0,0,100,0),
(@PATH,4,7330.956,-1412.603,980.8120,0,0,0,100,0),
(@PATH,5,7303.932,-1283.664,980.8120,0,0,0,100,0),
(@PATH,6,7361.022,-1158.353,980.8120,0,0,0,100,0),
(@PATH,7,7505.094,-1216.210,980.8120,0,0,0,100,0);

-- Pathing for Stormpeak Wyrm Entry: 29753
SET @NPC := 101124;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7462.040,`position_y`=-1145.189,`position_z`=1073.3400 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7534.368,-1192.623,1109.7570,0,0,0,100,0),
(@PATH,2,7491.979,-1297.336,1075.2560,0,0,0,100,0),
(@PATH,3,7435.823,-1388.198,963.8117,0,0,0,100,0),
(@PATH,4,7374.318,-1466.145,951.8396,0,0,0,100,0),
(@PATH,5,7270.311,-1513.188,983.5063,0,0,0,100,0),
(@PATH,6,7186.261,-1542.495,999.2841,0,0,0,100,0),
(@PATH,7,7146.302,-1430.093,1026.7840,0,0,0,100,0),
(@PATH,8,7277.046,-1312.483,941.7841,0,0,0,100,0),
(@PATH,9,7350.680,-1247.736,932.9788,0,0,0,100,0),
(@PATH,10,7462.040,-1145.189,1073.3400,0,0,0,100,0);

-- Some fixups
UPDATE `creature` SET `spawndist`=0,`MovementType`=0 WHERE `guid` IN (101107,101113,101115,101117);
DELETE FROM `creature` WHERE `guid`=101116;
DELETE FROM `creature_addon` WHERE `guid`=101116;
UPDATE `creature_template` SET `speed_run`=1.25 WHERE `entry`=29753;

-- ========================
--  2011_05_24_02_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97322;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3561.386,`position_y`=5473.793,`position_z`=30.31353 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3557.931,5461.132,32.72385,0,0,0,100,0),
(@PATH,2,3561.386,5473.793,30.31353,0,0,0,100,0),
(@PATH,3,3564.122,5486.128,28.18853,0,0,0,100,0),
(@PATH,4,3570.361,5499.623,27.06404,0,0,0,100,0),
(@PATH,5,3575.282,5511.941,27.06258,0,0,0,100,0),
(@PATH,6,3582.943,5519.652,27.06258,0,0,0,100,0),
(@PATH,7,3597.379,5520.971,27.06258,0,0,0,100,0),
(@PATH,8,3582.943,5519.652,27.06258,0,0,0,100,0),
(@PATH,9,3575.282,5511.941,27.06258,0,0,0,100,0),
(@PATH,10,3570.361,5499.623,27.06404,0,0,0,100,0),
(@PATH,11,3564.122,5486.128,28.18853,0,0,0,100,0),
(@PATH,12,3561.386,5473.793,30.31353,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97331;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3664.771,`position_y`=5602.22,`position_z`=32.81259 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3652.738,5615.229,33.31259,0,0,0,100,0),
(@PATH,2,3664.771,5602.22,32.81259,0,0,0,100,0),
(@PATH,3,3674.368,5584.944,32.89562,0,0,0,100,0),
(@PATH,4,3674.716,5568.044,34.64562,0,0,0,100,0),
(@PATH,5,3678.86,5555.542,36.44348,0,0,0,100,0),
(@PATH,6,3685.907,5546.087,38.06848,0,0,0,100,0),
(@PATH,7,3690.099,5526.772,39.84897,0,0,0,100,0),
(@PATH,8,3685.907,5546.087,38.06848,0,0,0,100,0),
(@PATH,9,3678.86,5555.542,36.44348,0,0,0,100,0),
(@PATH,10,3674.716,5568.044,34.64562,0,0,0,100,0),
(@PATH,11,3674.368,5584.944,32.89562,0,0,0,100,0),
(@PATH,12,3664.771,5602.22,32.81259,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97301;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3585.395,`position_y`=5444.673,`position_z`=39.95293 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3585.856,5453.249,37.95293,0,0,0,100,0),
(@PATH,2,3586.374,5461.863,35.32793,0,0,0,100,0),
(@PATH,3,3585.856,5453.249,37.95293,0,0,0,100,0),
(@PATH,4,3585.395,5444.673,39.95293,0,0,0,100,0),
(@PATH,5,3585.615,5433.987,40.45293,0,0,0,100,0),
(@PATH,6,3585.395,5444.673,39.95293,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97276;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3697.089,`position_y`=5631.371,`position_z`=32.76652 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3698.534,5644.674,32.66938,0,0,0,100,0),
(@PATH,2,3706.474,5658.97,32.38537,0,0,0,100,0),
(@PATH,3,3698.534,5644.674,32.66938,0,0,0,100,0),
(@PATH,4,3697.089,5631.371,32.76652,0,0,0,100,0),
(@PATH,5,3702.564,5621.85,32.72995,0,0,0,100,0),
(@PATH,6,3708.017,5615.569,32.85495,0,0,0,100,0),
(@PATH,7,3716.102,5613.98,33.35495,0,0,0,100,0),
(@PATH,8,3727.071,5621.008,35.35495,0,0,0,100,0),
(@PATH,9,3716.102,5613.98,33.35495,0,0,0,100,0),
(@PATH,10,3708.017,5615.569,32.85495,0,0,0,100,0),
(@PATH,11,3702.564,5621.85,32.72995,0,0,0,100,0),
(@PATH,12,3697.089,5631.371,32.76652,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97318;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3548.629,`position_y`=5599.825,`position_z`=50.65398 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3555.003,5601.37,46.20094,0,0,0,100,0),
(@PATH,2,3564.607,5602.538,37.57594,0,0,0,100,0),
(@PATH,3,3578.939,5601.566,31.57699,0,0,0,100,0),
(@PATH,4,3586.806,5593.127,31.12983,0,0,0,100,0),
(@PATH,5,3592.613,5587.148,30.37983,0,0,0,100,0),
(@PATH,6,3586.806,5593.127,31.12983,0,0,0,100,0),
(@PATH,7,3578.939,5601.566,31.57699,0,0,0,100,0),
(@PATH,8,3564.607,5602.538,37.57594,0,0,0,100,0),
(@PATH,9,3555.003,5601.37,46.20094,0,0,0,100,0),
(@PATH,10,3548.629,5599.825,50.65398,0,0,0,100,0),
(@PATH,11,3543.457,5613.289,52.70094,0,0,0,100,0),
(@PATH,12,3535.345,5628.1,53.57594,0,0,0,100,0),
(@PATH,13,3526.802,5644.103,55.89756,0,0,0,100,0),
(@PATH,14,3535.345,5628.1,53.57594,0,0,0,100,0),
(@PATH,15,3543.457,5613.289,52.70094,0,0,0,100,0),
(@PATH,16,3548.629,5599.825,50.65398,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97307;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3534.608,`position_y`=5627.963,`position_z`=53.57594 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3539.981,5619.029,53.45094,0,0,0,100,0),
(@PATH,2,3546.2,5609.595,51.45094,0,0,0,100,0),
(@PATH,3,3550.636,5602.65,49.20094,0,0,0,100,0),
(@PATH,4,3560.588,5603.686,41.20094,0,0,0,100,0),
(@PATH,5,3567.586,5605.285,35.95199,0,0,0,100,0),
(@PATH,6,3573.637,5605.286,32.70199,0,0,0,100,0),
(@PATH,7,3581.634,5597.975,31.25483,0,0,0,100,0),
(@PATH,8,3587.999,5591.561,31.12983,0,0,0,100,0),
(@PATH,9,3596.174,5584.191,29.25483,0,0,0,100,0),
(@PATH,10,3587.999,5591.561,31.12983,0,0,0,100,0),
(@PATH,11,3581.634,5597.975,31.25483,0,0,0,100,0),
(@PATH,12,3573.637,5605.286,32.70199,0,0,0,100,0),
(@PATH,13,3567.637,5605.286,35.95199,0,0,0,100,0),
(@PATH,14,3560.814,5603.728,41.20094,0,0,0,100,0),
(@PATH,15,3550.873,5602.673,49.20094,0,0,0,100,0),
(@PATH,16,3546.2,5609.595,51.45094,0,0,0,100,0),
(@PATH,17,3539.981,5619.029,53.45094,0,0,0,100,0),
(@PATH,18,3534.608,5627.963,53.57594,0,0,0,100,0),
(@PATH,19,3530.087,5637.976,54.52256,0,0,0,100,0),
(@PATH,20,3527.31,5655.765,58.77256,0,0,0,100,0),
(@PATH,21,3530.087,5637.976,54.52256,0,0,0,100,0),
(@PATH,22,3534.608,5627.963,53.57594,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97326;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3513.876,`position_y`=5606.854,`position_z`=63.13185 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3520.958,5599.072,62.37835,0,0,0,100,0),
(@PATH,2,3526.856,5589.065,62.00335,0,0,0,100,0),
(@PATH,3,3526.894,5567.229,62.87835,0,0,0,100,0),
(@PATH,4,3528.539,5553.205,63.56588,0,0,0,100,0),
(@PATH,5,3530.672,5540.383,65.44087,0,0,0,100,0),
(@PATH,6,3527.634,5519.506,64.80357,0,0,0,100,0),
(@PATH,7,3530.648,5540.28,65.44087,0,0,0,100,0),
(@PATH,8,3528.539,5553.205,63.56588,0,0,0,100,0),
(@PATH,9,3526.894,5567.229,62.87835,0,0,0,100,0),
(@PATH,10,3526.856,5589.065,62.00335,0,0,0,100,0),
(@PATH,11,3520.958,5599.072,62.37835,0,0,0,100,0),
(@PATH,12,3513.876,5606.854,63.13185,0,0,0,100,0),
(@PATH,13,3505.681,5611.771,63.63185,0,0,0,100,0),
(@PATH,14,3502.509,5621.209,64.63185,0,0,0,100,0),
(@PATH,15,3503.642,5628.48,64.50685,0,0,0,100,0),
(@PATH,16,3505.995,5635.619,63.89756,0,0,0,100,0),
(@PATH,17,3505.937,5645.619,62.52256,0,0,0,100,0),
(@PATH,18,3505.995,5635.619,63.89756,0,0,0,100,0),
(@PATH,19,3503.642,5628.48,64.50685,0,0,0,100,0),
(@PATH,20,3502.509,5621.209,64.63185,0,0,0,100,0),
(@PATH,21,3505.681,5611.771,63.63185,0,0,0,100,0),
(@PATH,22,3513.876,5606.854,63.13185,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97319;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3517.062,`position_y`=5501.915,`position_z`=63.42858 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3518.122,5485.379,58.96079,0,0,0,100,0),
(@PATH,2,3522.787,5476,55.96079,0,0,0,100,0),
(@PATH,3,3518.122,5485.379,58.96079,0,0,0,100,0),
(@PATH,4,3517.062,5501.915,63.42858,0,0,0,100,0),
(@PATH,5,3517.615,5510.972,65.17857,0,0,0,100,0),
(@PATH,6,3521.31,5518.627,65.42857,0,0,0,100,0),
(@PATH,7,3517.615,5510.972,65.17857,0,0,0,100,0),
(@PATH,8,3517.062,5501.915,63.42858,0,0,0,100,0);

-- ========================
--  2011_05_24_03_world_creature.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Add Missing Black Blood of Draenor Spawns to db
SET @GUID := 209032;
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID AND @GUID+36;
INSERT IGNORE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES 
(@GUID+0,23286,530,1,1,0,0,-4989.68945,533.267,-6.23201227,2.588225,120,5,0,1,0,0,1),
(@GUID+1,23286,530,1,1,0,0,-5008.07764,445.799774,-7.687496,4.848184,120,5,0,1,0,0,1),
(@GUID+2,23286,530,1,1,0,0,-5012.0127,514.3434,-5.042469,5.13465834,120,5,0,1,0,0,1),
(@GUID+3,23286,530,1,1,0,0,-5012.997,549.9415,-4.40564346,1.67378473,120,5,0,1,0,0,1),
(@GUID+4,23286,530,1,1,0,0,-5016.02148,490.971039,-7.866439,4.838478,120,5,0,1,0,0,1),
(@GUID+5,23286,530,1,1,0,0,-5021.433,469.1069,-8.175169,1.2226696,120,5,0,1,0,0,1),
(@GUID+6,23286,530,1,1,0,0,-5024.51563,426.561432,-10.20804,1.11687481,120,5,0,1,0,0,1),
(@GUID+7,23286,530,1,1,0,0,-5025.797,397.633545,-13.0280495,4.00145245,120,5,0,1,0,0,1),
(@GUID+8,23286,530,1,1,0,0,-5036.446,597.1265,18.5822525,0.0929955542,120,5,0,1,0,0,1),
(@GUID+9,23286,530,1,1,0,0,-5048.92041,450.347321,-12.185751,2.29650974,120,5,0,1,0,0,1),
(@GUID+10,23286,530,1,1,0,0,-5051.3457,399.3506,-12.2878532,5.29644632,120,5,0,1,0,0,1),
(@GUID+11,23286,530,1,1,0,0,-5053.088,628.9155,24.1695518,2.795165,120,5,0,1,0,0,1),
(@GUID+12,23286,530,1,1,0,0,-5056.857,296.117645,-7.93896675,3.48118663,120,5,0,1,0,0,1),
(@GUID+13,23286,530,1,1,0,0,-5069.628,423.853058,-11.0079794,6.07293034,120,5,0,1,0,0,1),
(@GUID+14,23286,530,1,1,0,0,-5069.8833,636.1971,30.2196884,5.05358,120,5,0,1,0,0,1),
(@GUID+15,23286,530,1,1,0,0,-5080.326,676.015869,32.9786034,3.00858331,120,5,0,1,0,0,1),
(@GUID+16,23286,530,1,1,0,0,-5085.002,454.966553,-7.321316,1.203854,120,5,0,1,0,0,1),
(@GUID+17,23286,530,1,1,0,0,-5087.409,344.1611,4.08592224,5.54356575,120,5,0,1,0,0,1),
(@GUID+18,23286,530,1,1,0,0,-5087.988,507.385925,-11.2343569,1.80733728,120,5,0,1,0,0,1),
(@GUID+19,23286,530,1,1,0,0,-5088.39746,475.1501,-7.82405758,5.05217171,120,5,0,1,0,0,1),
(@GUID+20,23286,530,1,1,0,0,-5088.81445,645.055237,32.7489166,2.61234975,120,5,0,1,0,0,1),
(@GUID+21,23286,530,1,1,0,0,-5094.403,647.8368,33.02874,5.85462,120,5,0,1,0,0,1),
(@GUID+22,23286,530,1,1,0,0,-5099.644,408.555359,-12.73991,2.38603544,120,5,0,1,0,0,1),
(@GUID+23,23286,530,1,1,0,0,-5102.78174,685.7555,33.9081421,5.558793,120,5,0,1,0,0,1),
(@GUID+24,23286,530,1,1,0,0,-5102.902,443.3057,-7.44998455,0.574597657,120,5,0,1,0,0,1),
(@GUID+25,23286,530,1,1,0,0,-5105.38037,536.0138,-10.526392,5.009346,120,5,0,1,0,0,1),
(@GUID+26,23286,530,1,1,0,0,-5119.125,387.557648,-12.1417027,3.153311,120,5,0,1,0,0,1),
(@GUID+27,23286,530,1,1,0,0,-5131.08838,361.671021,-17.5902081,4.802402,120,5,0,1,0,0,1),
(@GUID+28,23286,530,1,1,0,0,-5133.446,398.5927,-11.155489,3.7525115,120,5,0,1,0,0,1),
(@GUID+29,23286,530,1,1,0,0,-5134.523,424.9907,-10.7020779,2.93014455,120,5,0,1,0,0,1),
(@GUID+30,23286,530,1,1,0,0,-5136.922,466.687683,-13.7564421,2.79966116,120,5,0,1,0,0,1),
(@GUID+31,23286,530,1,1,0,0,-5149.55469,351.741577,-19.33655,0.996007144,120,5,0,1,0,0,1),
(@GUID+32,23286,530,1,1,0,0,-5153.18555,487.3614,-12.2186108,4.57836151,120,5,0,1,0,0,1),
(@GUID+33,23286,530,1,1,0,0,-5170.654,422.92,-10.6833916,0.485873938,120,5,0,1,0,0,1),
(@GUID+34,23286,530,1,1,0,0,-5179.337,369.596924,-20.0646782,1.51201284,120,5,0,1,0,0,1),
(@GUID+35,23286,530,1,1,0,0,-5181.72559,345.638947,-21.1928349,5.528716,120,5,0,1,0,0,1),
(@GUID+36,23286,530,1,1,0,0,-5212.74658,326.250763,-21.8211174,4.56194735,120,5,0,1,0,0,1);

-- ========================
--  2011_05_24_04_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Onslaught Warhorse SAI
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` IN (27213,27206);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (27213,27206);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(27213,0,0,0,11,0,100,0,0,0,0,0,12,27206,8,0,0,0,0,1,0,0,0,0,0,0,0,'Onslaught Warhorse - On Spawn - Summon Onslaught Knight'),
(27206,0,0,0,1,0,100,1,500,500,500,500,11,43671,3,0,0,0,0,19,27213,0,0,0,0,0,0,'Onslaught Knight - OOC once - Cast Ride Vehicle on Onslaught Warhorse');

-- Remove spawned Onslaught Knights
DELETE FROM `creature_addon` WHERE `guid` IN (Select `guid` FROM `creature` WHERE `id`=27206);
DELETE FROM `creature` WHERE `id`=27206;

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102716;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2508.58,`position_y`=-290.6462,`position_z`=-0.1427202 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2519.424,-279.186,-0.7677202,0,0,0,100,0),
(@PATH,2,2530.539,-279.0238,-0.7677202,0,0,0,100,0),
(@PATH,3,2539.442,-270.758,-0.3258755,0,0,0,100,0),
(@PATH,4,2540.027,-251.3916,-0.06487894,0,0,0,100,0),
(@PATH,5,2539.442,-270.758,-0.3258755,0,0,0,100,0),
(@PATH,6,2530.539,-279.0238,-0.7677202,0,0,0,100,0),
(@PATH,7,2519.424,-279.186,-0.7677202,0,0,0,100,0),
(@PATH,8,2508.58,-290.6462,-0.1427202,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102717;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2587.305,`position_y`=-291.1189,`position_z`=3.032966 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2601.257,-273.5315,1.532966,0,0,0,100,0),
(@PATH,2,2618.792,-253.0176,2.282767,0,0,0,100,0),
(@PATH,3,2633.199,-245.2131,4.532767,0,0,0,100,0),
(@PATH,4,2618.873,-252.9083,2.282767,0,0,0,100,0),
(@PATH,5,2601.339,-273.4219,1.532966,0,0,0,100,0),
(@PATH,6,2587.305,-291.1189,3.032966,0,0,0,100,0),
(@PATH,7,2575.844,-304.2566,3.642326,0,0,0,100,0),
(@PATH,8,2570.643,-318.0563,3.767326,0,0,0,100,0),
(@PATH,9,2571.61,-332.3442,3.767326,0,0,0,100,0),
(@PATH,10,2570.399,-357.3963,3.884323,0,0,0,100,0),
(@PATH,11,2571.61,-332.3442,3.767326,0,0,0,100,0),
(@PATH,12,2570.643,-318.0563,3.767326,0,0,0,100,0),
(@PATH,13,2575.844,-304.2566,3.642326,0,0,0,100,0),
(@PATH,14,2587.305,-291.1189,3.032966,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102719;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2538.552,`position_y`=-475.1394,`position_z`=0.6403183 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2515.825,-450.3543,0.282984,0,0,0,100,0),
(@PATH,2,2538.552,-475.1394,0.6403183,0,0,0,100,0),
(@PATH,3,2562.629,-487.9083,0.7653183,0,0,0,100,0),
(@PATH,4,2569.465,-510.7032,0.8169425,0,0,0,100,0),
(@PATH,5,2575.739,-523.7434,1.191942,0,0,0,100,0),
(@PATH,6,2601.065,-534.6965,0.9285774,0,0,0,100,0),
(@PATH,7,2575.739,-523.7434,1.191942,0,0,0,100,0),
(@PATH,8,2569.465,-510.7032,0.8169425,0,0,0,100,0),
(@PATH,9,2562.629,-487.9083,0.7653183,0,0,0,100,0),
(@PATH,10,2538.552,-475.1394,0.6403183,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102721;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2582.436,`position_y`=-222.4737,`position_z`=-0.4052925 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2579.515,-214.4551,-0.5302925,0,0,0,100,0),
(@PATH,2,2580.979,-202.8364,0.3447075,0,0,0,100,0),
(@PATH,3,2579.515,-214.4551,-0.5302925,0,0,0,100,0),
(@PATH,4,2582.436,-222.4737,-0.4052925,0,0,0,100,0),
(@PATH,5,2561.902,-230.8203,-0.3034239,0,0,0,100,0),
(@PATH,6,2582.436,-222.4737,-0.4052925,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102723;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2838.992,`position_y`=-178.4683,`position_z`=137.0378 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2837.595,-191.9704,137.9128,0,0,0,100,0),
(@PATH,2,2842.86,-215.9774,136.6075,0,0,0,100,0),
(@PATH,3,2837.595,-191.9704,137.9128,0,0,0,100,0),
(@PATH,4,2838.992,-178.4683,137.0378,0,0,0,100,0),
(@PATH,5,2836.44,-170.251,138.1628,0,0,0,100,0),
(@PATH,6,2829.992,-167.1136,138.761,0,0,0,100,0),
(@PATH,7,2820.281,-166.5459,138.6697,0,0,0,100,0),
(@PATH,8,2829.992,-167.1136,138.761,0,0,0,100,0),
(@PATH,9,2836.44,-170.251,138.1628,0,0,0,100,0),
(@PATH,10,2838.992,-178.4683,137.0378,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102724;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2712.161,`position_y`=-564.5253,`position_z`=9.693825 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2693.882,-580.2343,7.060011,0,0,0,100,0),
(@PATH,2,2672.807,-596.9056,9.185011,0,0,0,100,0),
(@PATH,3,2662.762,-603.8812,9.776094,0,0,0,100,0),
(@PATH,4,2648.289,-604.2076,10.40109,0,0,0,100,0),
(@PATH,5,2662.762,-603.8812,9.776094,0,0,0,100,0),
(@PATH,6,2672.807,-596.9056,9.185011,0,0,0,100,0),
(@PATH,7,2693.882,-580.2343,7.060011,0,0,0,100,0),
(@PATH,8,2712.161,-564.5253,9.693825,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102725;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2688.144,`position_y`=-181.5894,`position_z`=138.8123 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2690.253,-211.2009,138.7873,0,0,0,100,0),
(@PATH,2,2711.088,-233.0926,141.4496,0,0,0,100,0),
(@PATH,3,2691.518,-247.295,142.4064,0,0,0,100,0),
(@PATH,4,2690.253,-211.2009,138.7873,0,0,0,100,0),
(@PATH,5,2688.144,-181.5894,138.8123,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102726;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2832.563,`position_y`=-258.2318,`position_z`=133.0783 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2823.757,-269.6722,132.6919,0,0,0,100,0),
(@PATH,2,2810.606,-274.9349,132.6919,0,0,0,100,0),
(@PATH,3,2798.263,-267.8378,132.7004,0,0,0,100,0),
(@PATH,4,2795.204,-255.2375,132.6619,0,0,0,100,0),
(@PATH,5,2815.456,-249.9233,133.0783,0,0,0,100,0),
(@PATH,6,2841.983,-244.2453,135.4677,0,0,0,100,0),
(@PATH,7,2815.456,-249.9233,133.0783,0,0,0,100,0),
(@PATH,8,2795.204,-255.2375,132.6619,0,0,0,100,0),
(@PATH,9,2798.263,-267.8378,132.7004,0,0,0,100,0),
(@PATH,10,2810.606,-274.9349,132.6919,0,0,0,100,0),
(@PATH,11,2823.757,-269.6722,132.6919,0,0,0,100,0),
(@PATH,12,2832.563,-258.2318,133.0783,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102727;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2655.115,`position_y`=-139.6238,`position_z`=73.46788 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2656.776,-155.0757,66.71788,0,0,0,100,0),
(@PATH,2,2655.572,-172.0843,62.16366,0,0,0,100,0),
(@PATH,3,2650.678,-180.1066,63.41366,0,0,0,100,0),
(@PATH,4,2656.032,-164.1928,64.71788,0,0,0,100,0),
(@PATH,5,2656.646,-150.7192,68.46788,0,0,0,100,0),
(@PATH,6,2654.885,-130.6351,77.12984,0,0,0,100,0),
(@PATH,7,2659.214,-115.5115,82.62984,0,0,0,100,0),
(@PATH,8,2659.958,-93.19423,87.00713,0,0,0,100,0),
(@PATH,9,2666.549,-83.81207,89.50713,0,0,0,100,0),
(@PATH,10,2681.103,-87.36887,92.43093,0,0,0,100,0),
(@PATH,11,2700.115,-95.54926,101.8188,0,0,0,100,0),
(@PATH,12,2718.652,-104.436,110.9657,0,0,0,100,0),
(@PATH,13,2731.385,-117.8694,116.5907,0,0,0,100,0),
(@PATH,14,2726.709,-128.2827,120.8407,0,0,0,100,0),
(@PATH,15,2714.232,-134.095,125.4612,0,0,0,100,0),
(@PATH,16,2684.606,-134.3662,125.9815,0,0,0,100,0),
(@PATH,17,2705.027,-135.4983,127.8362,0,0,0,100,0),
(@PATH,18,2719.343,-131.1707,122.8407,0,0,0,100,0),
(@PATH,19,2731.655,-119.8017,117.2157,0,0,0,100,0),
(@PATH,20,2725.038,-106.6583,113.3407,0,0,0,100,0),
(@PATH,21,2703.98,-99.18321,103.9438,0,0,0,100,0),
(@PATH,22,2680.189,-88.67188,92.05593,0,0,0,100,0),
(@PATH,23,2665.09,-83.62039,89.38213,0,0,0,100,0),
(@PATH,24,2660.516,-94.05186,87.00713,0,0,0,100,0),
(@PATH,25,2659.939,-112.8213,83.37984,0,0,0,100,0),
(@PATH,26,2658.327,-126.0295,79.12984,0,0,0,100,0),
(@PATH,27,2655.115,-139.6238,73.46788,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102728;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2809.652,`position_y`=-404.1015,`position_z`=118.2837 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2820.063,-404.6535,118.2837,0,0,0,100,0),
(@PATH,2,2808.515,-405.1523,118.2837,0,0,0,100,0),
(@PATH,3,2793.463,-420.3747,118.3209,0,0,0,100,0),
(@PATH,4,2779.776,-437.7538,118.6404,0,0,0,100,0),
(@PATH,5,2775.378,-463.4759,116.1404,0,0,0,100,0),
(@PATH,6,2767.986,-472.3566,116.8041,0,0,0,100,0),
(@PATH,7,2755.093,-477.2342,121.6782,0,0,0,100,0),
(@PATH,8,2773.319,-467.1881,116.1791,0,0,0,100,0),
(@PATH,9,2778.031,-447.918,118.3904,0,0,0,100,0),
(@PATH,10,2785.59,-429.4701,118.3209,0,0,0,100,0),
(@PATH,11,2800.177,-413.79,118.2837,0,0,0,100,0),
(@PATH,12,2809.652,-404.1015,118.2837,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102729;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2750.5,`position_y`=-154.7686,`position_z`=139.4088 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2741.167,-164.7871,139.1588,0,0,0,100,0),
(@PATH,2,2750.5,-154.7686,139.4088,0,0,0,100,0),
(@PATH,3,2759.093,-161.0407,138.9088,0,0,0,100,0),
(@PATH,4,2771.567,-152.4166,139.9017,0,0,0,100,0),
(@PATH,5,2781.019,-154.3085,140.5267,0,0,0,100,0),
(@PATH,6,2791.13,-161.2096,139.1517,0,0,0,100,0),
(@PATH,7,2802.436,-164.2816,137.4197,0,0,0,100,0),
(@PATH,8,2791.13,-161.2096,139.1517,0,0,0,100,0),
(@PATH,9,2781.019,-154.3085,140.5267,0,0,0,100,0),
(@PATH,10,2771.567,-152.4166,139.9017,0,0,0,100,0),
(@PATH,11,2759.093,-161.0407,138.9088,0,0,0,100,0),
(@PATH,12,2750.5,-154.7686,139.4088,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102730;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2712.018,`position_y`=-465.3528,`position_z`=85.87247 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2722.812,-487.2094,91.62904,0,0,0,100,0),
(@PATH,2,2726.125,-504.7564,94.96687,0,0,0,100,0),
(@PATH,3,2720.495,-521.4435,91.71687,0,0,0,100,0),
(@PATH,4,2727.937,-503.8876,95.59187,0,0,0,100,0),
(@PATH,5,2725.637,-491.6325,93.62904,0,0,0,100,0),
(@PATH,6,2715.711,-476.3229,88.62904,0,0,0,100,0),
(@PATH,7,2704.701,-454.9398,81.12247,0,0,0,100,0),
(@PATH,8,2692.514,-431.9863,72.42125,0,0,0,100,0),
(@PATH,9,2672.562,-431.7496,64.54625,0,0,0,100,0),
(@PATH,10,2649.395,-432.2932,52.79884,0,0,0,100,0),
(@PATH,11,2643.88,-442.8751,50.55303,0,0,0,100,0),
(@PATH,12,2652.563,-431.4375,54.42384,0,0,0,100,0),
(@PATH,13,2682.649,-431.7939,69.17125,0,0,0,100,0),
(@PATH,14,2693.424,-434.0273,73.17553,0,0,0,100,0),
(@PATH,15,2703.067,-449.0695,79.62247,0,0,0,100,0),
(@PATH,16,2712.018,-465.3528,85.87247,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102731;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2534.057,`position_y`=-419.9908,`position_z`=3.277672 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2543.743,-400.441,2.027672,0,0,0,100,0),
(@PATH,2,2555.679,-395.5271,2.825949,0,0,0,100,0),
(@PATH,3,2543.743,-400.441,2.027672,0,0,0,100,0),
(@PATH,4,2534.057,-419.9908,3.277672,0,0,0,100,0),
(@PATH,5,2532.219,-440.2344,3.032984,0,0,0,100,0),
(@PATH,6,2532.378,-470.4768,0.8200397,0,0,0,100,0),
(@PATH,7,2548.762,-479.3864,0.5153183,0,0,0,100,0),
(@PATH,8,2532.378,-470.4768,0.8200397,0,0,0,100,0),
(@PATH,9,2532.219,-440.2344,3.032984,0,0,0,100,0),
(@PATH,10,2534.057,-419.9908,3.277672,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102734;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2684.26,`position_y`=-287.8797,`position_z`=127.2792 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2728.101,-295.6697,132.1564,0,0,0,100,0),
(@PATH,2,2698.353,-312.0914,133.1807,0,0,0,100,0),
(@PATH,3,2689.288,-321.3154,132.3057,0,0,0,100,0),
(@PATH,4,2675.345,-320.4376,131.9307,0,0,0,100,0),
(@PATH,5,2654.261,-324.0862,132.1816,0,0,0,100,0),
(@PATH,6,2675.345,-320.4376,131.9307,0,0,0,100,0),
(@PATH,7,2689.288,-321.3154,132.3057,0,0,0,100,0),
(@PATH,8,2698.353,-312.0914,133.1807,0,0,0,100,0),
(@PATH,9,2728.101,-295.6697,132.1564,0,0,0,100,0),
(@PATH,10,2684.26,-287.8797,127.2792,0,0,0,100,0);

-- ========================
--  2011_05_24_05_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Pathing for Zorus the Judicator Entry: 21774 (Replace)
SET @NPC := 76076;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-3970.86,`position_y`=2191.12,`position_z`=101.885 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3959.922,2188.494,101.799,0,0,0,100,0),
(@PATH,2,-3951.734,2200.173,101.7906,0,0,0,100,0),
(@PATH,3,-3958.357,2210.038,101.9156,0,0,0,100,0),
(@PATH,4,-3967.201,2208.166,101.76,0,0,0,100,0),
(@PATH,5,-3972.306,2201.522,101.76,0,0,0,100,0),
(@PATH,6,-3992.194,2215.025,103.635,0,0,0,100,0),
(@PATH,7,-4014.109,2218.045,108.6923,0,0,0,100,0),
(@PATH,8,-4023.189,2214.694,109.9423,0,0,0,100,0),
(@PATH,9,-4019.969,2183.267,107.4989,0,0,0,100,0),
(@PATH,10,-4000.393,2174.054,104.3739,0,0,0,100,0),
(@PATH,11,-3970.86,2191.12,101.885,0,0,0,100,0);

-- Pathing for Wildhammer Guard Entry: 19353 (Replace)
SET @NPC := 69029;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-3956.661,`position_y`=2150.609,`position_z`=99.19981 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3952.747,2135.461,98.19981,0,0,0,100,0),
(@PATH,2,-3942.882,2121.993,96.84258,0,0,0,100,0),
(@PATH,3,-3936.123,2108.748,95.46758,0,0,0,100,0),
(@PATH,4,-3928.641,2095.985,94.73193,0,0,0,100,0),
(@PATH,5,-3916.894,2085.577,94.10693,0,0,0,100,0),
(@PATH,6,-3905.937,2073.934,94.48193,3000,0,0,100,0),
(@PATH,7,-3916.894,2085.577,94.10693,0,0,0,100,0),
(@PATH,8,-3928.641,2095.985,94.73193,0,0,0,100,0),
(@PATH,9,-3936.123,2108.748,95.46758,0,0,0,100,0),
(@PATH,10,-3942.882,2121.993,96.84258,0,0,0,100,0),
(@PATH,11,-3952.747,2135.461,98.19981,0,0,0,100,0),
(@PATH,12,-3956.661,2150.609,99.19981,0,0,0,100,0),
(@PATH,13,-3958.419,2169.508,100.424,0,0,0,100,0),
(@PATH,14,-3945.74,2173.963,101.174,0,0,0,100,0),
(@PATH,15,-3941.273,2175.507,101.549,3000,0,0,100,0),
(@PATH,16,-3945.74,2173.963,101.174,0,0,0,100,0),
(@PATH,17,-3958.419,2169.508,100.424,0,0,0,100,0),
(@PATH,18,-3956.661,2150.609,99.19981,0,0,0,100,0);

-- Pathing for Wildhammer Guard Entry: 19353 (Replace)
SET @NPC := 69030;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-3953.156,`position_y`=2196.489,`position_z`=101.799 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3956.213,2190.557,101.799,0,0,0,100,0),
(@PATH,2,-3961.978,2187.907,101.924,0,0,0,100,0),
(@PATH,3,-3970.904,2191.666,101.885,0,0,0,100,0),
(@PATH,4,-3977.542,2187.189,102.135,0,0,0,100,0),
(@PATH,5,-3984.635,2183.306,102.885,0,0,0,100,0),
(@PATH,6,-3994.975,2177.334,103.885,0,0,0,100,0),
(@PATH,7,-4002.002,2173.979,104.4989,0,0,0,100,0),
(@PATH,8,-4020.553,2182.329,107.4989,0,0,0,100,0),
(@PATH,9,-4022.445,2199.229,109.3739,0,0,0,100,0),
(@PATH,10,-4024.303,2213.243,110.0673,0,0,0,100,0),
(@PATH,11,-4019.943,2220.104,109.9423,0,0,0,100,0),
(@PATH,12,-4010.167,2219.025,107.8173,0,0,0,100,0),
(@PATH,13,-3997.926,2217.727,105.135,0,0,0,100,0),
(@PATH,14,-3987.671,2211.935,102.76,0,0,0,100,0),
(@PATH,15,-3976.702,2204.916,101.885,0,0,0,100,0),
(@PATH,16,-3971.531,2203.007,101.76,0,0,0,100,0),
(@PATH,17,-3967.494,2207.26,101.76,0,0,0,100,0),
(@PATH,18,-3961.75,2209.582,101.7906,0,0,0,100,0),
(@PATH,19,-3955.481,2208.423,101.9156,0,0,0,100,0),
(@PATH,20,-3952.822,2204.261,101.9156,0,0,0,100,0),
(@PATH,21,-3953.156,2196.489,101.799,0,0,0,100,0);

-- Pathing for Wildhammer Guard Entry: 19353
SET @NPC := 69036;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4027.414,`position_y`=2111.922,`position_z`=137.2429 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4010.903,2103.363,137.2429,0,0,0,100,0),
(@PATH,2,-4027.414,2111.922,137.2429,0,0,0,100,0),
(@PATH,3,-4040.183,2116.031,137.2471,0,0,0,100,0),
(@PATH,4,-4051.71,2120.875,137.254,0,0,0,100,0),
(@PATH,5,-4064.835,2126.483,137.2603,0,0,0,100,0),
(@PATH,6,-4061.585,2129.041,137.2603,0,0,0,100,0),
(@PATH,7,-4053.318,2126.078,137.2559,0,0,0,100,0),
(@PATH,8,-4049.116,2130.594,137.254,0,0,0,100,0),
(@PATH,9,-4030.205,2123.756,127.3917,0,0,0,100,0),
(@PATH,10,-4013.132,2115.52,115.9905,0,0,0,100,0),
(@PATH,11,-4008.05,2114.437,115.6337,0,0,0,100,0),
(@PATH,12,-4005.22,2120.062,115.6409,0,0,0,100,0),
(@PATH,13,-4000.72,2130.597,107.8586,0,0,0,100,0),
(@PATH,14,-3993.985,2139.561,104.7343,0,0,0,100,0),
(@PATH,15,-3984.795,2135.855,104.9843,0,0,0,100,0),
(@PATH,16,-3982.541,2129.627,105.0458,0,0,0,100,0),
(@PATH,17,-3963.905,2117.34,100.7176,0,0,0,100,0),
(@PATH,18,-3954.1,2115.367,97.96758,0,0,0,100,0),
(@PATH,19,-3946.531,2111.822,96.84258,0,0,0,100,0),
(@PATH,20,-3943.734,2106.022,96.21758,0,0,0,100,0),
(@PATH,21,-3946.531,2111.822,96.84258,0,0,0,100,0),
(@PATH,22,-3953.81,2115.304,97.96758,0,0,0,100,0),
(@PATH,23,-3963.905,2117.34,100.7176,0,0,0,100,0),
(@PATH,24,-3982.541,2129.627,105.0458,0,0,0,100,0),
(@PATH,25,-3984.795,2135.855,104.9843,0,0,0,100,0),
(@PATH,26,-3993.985,2139.561,104.7343,0,0,0,100,0),
(@PATH,27,-4000.72,2130.597,107.8586,0,0,0,100,0),
(@PATH,28,-4005.202,2120.103,115.6362,0,0,0,100,0),
(@PATH,29,-4008.05,2114.437,115.6337,0,0,0,100,0),
(@PATH,30,-4013.132,2115.52,115.9905,0,0,0,100,0),
(@PATH,31,-4030.205,2123.756,127.3917,0,0,0,100,0),
(@PATH,32,-4049.116,2130.594,137.254,0,0,0,100,0),
(@PATH,33,-4053.318,2126.078,137.2559,0,0,0,100,0),
(@PATH,34,-4061.585,2129.041,137.2603,0,0,0,100,0),
(@PATH,35,-4064.835,2126.483,137.2603,0,0,0,100,0),
(@PATH,36,-4051.71,2120.875,137.254,0,0,0,100,0),
(@PATH,37,-4040.183,2116.031,137.2471,0,0,0,100,0),
(@PATH,38,-4027.414,2111.922,137.2429,0,0,0,100,0);

-- Pathing for Thane Yoregar Entry: 21773
SET @NPC := 76075;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4034.194,`position_y`=2233.48,`position_z`=112.0453 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,17718, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4037.18,2229.153,112.0457,0,0,0,100,0),
(@PATH,2,-4043.923,2229.386,112.0464,0,0,0,100,0),
(@PATH,3,-4037.18,2229.153,112.0457,0,0,0,100,0),
(@PATH,4,-4034.194,2233.48,112.0453,0,0,0,100,0);

-- Pathing for Wildhammer Scout Entry: 19384
SET @NPC := 69128;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4022.309,`position_y`=2134.639,`position_z`=104.274 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4021.637,2136.38,104.274,0,0,0,100,0),
(@PATH,2,-4020.335,2138.243,104.274,0,0,0,100,0),
(@PATH,3,-4018.53,2139.381,104.274,0,0,0,100,0),
(@PATH,4,-4016.425,2138.772,104.274,10000,0,0,100,0),
(@PATH,5,-4017.231,2139.141,104.274,0,0,0,100,0),
(@PATH,6,-4018.49,2140.534,104.274,0,0,0,100,0),
(@PATH,7,-4019.722,2143.937,104.274,10000,0,0,100,0),
(@PATH,8,-4019.373,2143.061,104.274,0,0,0,100,0),
(@PATH,9,-4019.427,2140.091,104.274,0,0,0,100,0),
(@PATH,10,-4020.97,2136.993,104.274,0,0,0,100,0),
(@PATH,11,-4022.309,2134.639,104.274,15000,0,0,100,0);

-- ========================
--  2011_05_24_06_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Pathing for Stonespine Gargoyle Entry: 36896
SET @NPC := 201822;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=674.3073,`position_y`=-26.43229,`position_z`=512.5833 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,871.2952,252.9757,561.8807,0,0,0,100,0),
(@PATH,2,908.3472,250.5347,561.8807,0,0,0,100,0),
(@PATH,3,914.9774,291.7049,561.8807,0,0,0,100,0),
(@PATH,4,862.7778,292.8316,561.8807,0,0,0,100,0),
(@PATH,5,840.6111,278.9184,561.8807,0,0,0,100,0),
(@PATH,6,826.5712,228.2292,561.8807,0,0,0,100,0),
(@PATH,7,833.5452,174.3576,561.8807,0,0,0,100,0),
(@PATH,8,840.9531,116.6059,561.8807,0,0,0,100,0),
(@PATH,9,816.033,96.46702,561.8807,0,0,0,100,0),
(@PATH,10,773.6111,120.1024,561.8807,0,0,0,100,0),
(@PATH,11,700.3021,175.5278,561.8807,0,0,0,100,0),
(@PATH,12,672.0243,223.6806,561.8807,0,0,0,100,0),
(@PATH,13,710.2379,266.3021,561.8807,0,0,0,100,0),
(@PATH,14,806.8594,287.4445,561.8807,0,0,0,100,0);

-- Pathing for Stonespine Gargoyle Entry: 36896
SET @NPC := 201834;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=674.3073,`position_y`=-26.43229,`position_z`=512.5833 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,410.967,187.1424,581.4994,0,0,0,100,0),
(@PATH,2,413.2448,207.5677,581.4994,0,0,0,100,0),
(@PATH,3,410.6823,230.7569,581.4994,0,0,0,100,0),
(@PATH,4,365.309,278.4445,581.4994,0,0,0,100,0),
(@PATH,5,378.1736,302.0868,581.4994,0,0,0,100,0),
(@PATH,6,410.0504,294.9097,581.4994,0,0,0,100,0),
(@PATH,7,439.2795,289.7951,581.4994,0,0,0,100,0),
(@PATH,8,477.2188,240.033,581.4994,0,0,0,100,0),
(@PATH,9,473.9323,183.2101,581.4994,0,0,0,100,0),
(@PATH,10,469.3889,140.6754,581.4994,0,0,0,100,0),
(@PATH,11,429.6354,121.7135,581.4994,0,0,0,100,0),
(@PATH,12,407.4063,143.0243,581.4994,0,0,0,100,0);

-- Pathing for Stonespine Gargoyle Entry: 36896
SET @NPC := 201838;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=674.3073,`position_y`=-26.43229,`position_z`=512.5833 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,873.783,136.9774,623.6115,0,0,0,100,0),
(@PATH,2,872.9045,139.2743,622.4446,0,0,0,100,0),
(@PATH,3,888.7917,171.3403,591.3615,0,0,0,100,0),
(@PATH,4,861.3073,209.8455,591.3615,0,0,0,100,0),
(@PATH,5,830.4913,254.5556,591.3615,0,0,0,100,0),
(@PATH,6,780.4844,277.6406,591.3615,0,0,0,100,0),
(@PATH,7,732.6771,272.4635,591.3615,0,0,0,100,0),
(@PATH,8,683.9028,265.276,591.3615,0,0,0,100,0),
(@PATH,9,612.3368,284.7934,553.4998,0,0,0,100,0),
(@PATH,10,554.816,303.1858,553.4998,0,0,0,100,0),
(@PATH,11,498.1024,309.0625,553.4998,0,0,0,100,0),
(@PATH,12,470.4167,230.0174,553.4998,0,0,0,100,0),
(@PATH,13,454.0087,175.2135,553.4998,0,0,0,100,0),
(@PATH,14,492.4288,127.1806,583.1108,0,0,0,100,0),
(@PATH,15,551.2604,121.6354,583.1108,0,0,0,100,0),
(@PATH,16,647.5573,126.3542,583.1108,0,0,0,100,0),
(@PATH,17,766.2222,130.9254,583.1108,0,0,0,100,0),
(@PATH,18,829.408,42.33854,583.1108,0,0,0,100,0),
(@PATH,19,746.7101,-53.03299,583.1108,0,0,0,100,0),
(@PATH,20,663.2379,-77.32291,583.1108,0,0,0,100,0),
(@PATH,21,618.6389,3.369792,583.1108,0,0,0,100,0),
(@PATH,22,641.8559,89.27604,583.1108,0,0,0,100,0),
(@PATH,23,794.1667,115.6858,583.1108,0,0,0,100,0);

-- Pathing for Stonespine Gargoyle Entry: 36896
SET @NPC := 201846;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=674.3073,`position_y`=-26.43229,`position_z`=512.5833 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,750.842,23.30903,568.327,0,0,0,100,0),
(@PATH,2,755.467,-50.2257,568.327,0,0,0,100,0),
(@PATH,3,734.6927,-93.41319,568.327,0,0,0,100,0),
(@PATH,4,662.4028,-41.9757,568.327,0,0,0,100,0),
(@PATH,5,634.9601,19.78472,568.327,0,0,0,100,0),
(@PATH,6,619.0972,58.13368,568.327,0,0,0,100,0),
(@PATH,7,569.6493,80.08681,568.327,0,0,0,100,0),
(@PATH,8,474.8889,136.7135,568.327,0,0,0,100,0),
(@PATH,9,427.566,173.5174,568.327,0,0,0,100,0),
(@PATH,10,399.5938,237.6424,568.327,0,0,0,100,0),
(@PATH,11,416.8108,271.5695,568.327,0,0,0,100,0),
(@PATH,12,442.8767,281.1493,568.327,0,0,0,100,0),
(@PATH,13,472.9375,286.9531,568.327,0,0,0,100,0),
(@PATH,14,515.0677,321.1632,568.327,0,0,0,100,0),
(@PATH,15,547.0538,332.9358,568.327,0,0,0,100,0),
(@PATH,16,605.0295,286.3281,568.327,0,0,0,100,0),
(@PATH,17,673.9167,184.0747,568.327,0,0,0,100,0);

-- Remove dupe Stonespine Gargoyle Spawns
DELETE FROM `creature` WHERE `MovementType`=0 AND `id`=36896;

-- Pathing for Iceborn Proto-Drake Entry: 36891
SET @NPC := 202197;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=619.3055,`position_y`=18.79167,`position_z`=513.5994 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,626.5364,0.711806,513.8494,0,0,0,100,0),
(@PATH,2,619.3055,18.79167,513.5994,0,0,0,100,0),
(@PATH,3,615.1875,32.38021,512.5994,0,0,0,100,0),
(@PATH,4,615.4705,47.52778,512.4364,0,0,0,100,0),
(@PATH,5,617.6285,62.52083,512.5614,0,0,0,100,0),
(@PATH,6,621.3264,77.02604,512.4487,0,0,0,100,0),
(@PATH,7,617.6285,62.52083,512.5614,0,0,0,100,0),
(@PATH,8,615.4705,47.52778,512.4364,0,0,0,100,0),
(@PATH,9,615.1875,32.38021,512.5994,0,0,0,100,0),
(@PATH,10,619.3055,18.79167,513.5994,0,0,0,100,0);

-- Pathing for Iceborn Proto-Drake Entry: 36891
SET @NPC := 201991;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=679.2205,`position_y`=-100.6076,`position_z`=513.8377 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,661.1771,-79.90452,513.8378,0,0,0,100,0),
(@PATH,2,651.3489,-62.0191,513.7985,0,0,0,100,0),
(@PATH,3,645.1337,-45.49132,513.7985,0,0,0,100,0),
(@PATH,4,634.1077,-20.19618,513.8635,0,0,0,100,0),
(@PATH,5,645.1337,-45.49132,513.7985,0,0,0,100,0),
(@PATH,6,651.3489,-62.0191,513.7985,0,0,0,100,0),
(@PATH,7,661.1771,-79.90452,513.8378,0,0,0,100,0),
(@PATH,8,679.2205,-100.6076,513.8377,0,0,0,100,0);

-- ========================
--  2011_05_24_07_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Pathing for Venom Stalker Entry: 15976
SET @NPC := 127864; -- 127865 should be in formation with him
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3310.01,`position_y`=-3862.94,`position_z`=294.662 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3321.301,-3868.157,294.6607,0,0,0,100,0),
(@PATH,2,3328.406,-3877.447,294.6608,0,0,0,100,0),
(@PATH,3,3327.705,-3889.598,294.6607,0,0,0,100,0),
(@PATH,4,3312.01,-3901.51,294.6607,0,0,0,100,0),
(@PATH,5,3297.603,-3897.307,294.6607,0,0,0,100,0),
(@PATH,6,3292.267,-3890.234,294.6607,0,0,0,100,0),
(@PATH,7,3290.384,-3882.75,294.6607,0,0,0,100,0),
(@PATH,8,3279.155,-3882.98,294.6607,0,0,0,100,0),
(@PATH,9,3260.253,-3882.767,294.6603,0,0,0,100,0),
(@PATH,10,3241.78,-3882.872,292.3388,0,0,0,100,0),
(@PATH,11,3221.214,-3882.398,282.8664,0,0,0,100,0),
(@PATH,12,3207.818,-3881.953,275.8379,0,0,0,100,0),
(@PATH,13,3166.121,-3882.08,267.5934,0,0,0,100,0),
(@PATH,14,3142.54,-3882.999,267.5932,0,0,0,100,0),
(@PATH,15,3118.083,-3883.491,267.593,0,0,0,100,0),
(@PATH,16,3114.162,-3894.186,267.5924,0,0,0,100,0),
(@PATH,17,3104.3,-3900.575,267.593,0,0,0,100,0),
(@PATH,18,3093.041,-3899.523,267.593,0,0,0,100,0),
(@PATH,19,3083.292,-3890.907,267.5929,0,0,0,100,0),
(@PATH,20,3082.536,-3878.924,267.593,0,0,0,100,0),
(@PATH,21,3088.724,-3868.493,267.593,0,0,0,100,0),
(@PATH,22,3103.835,-3863.884,267.593,0,0,0,100,0),
(@PATH,23,3114.156,-3873.857,267.5919,0,0,0,100,0),
(@PATH,24,3118.014,-3882.239,267.5925,0,0,0,100,0),
(@PATH,25,3142.844,-3882.002,267.5931,0,0,0,100,0),
(@PATH,26,3166.121,-3882.08,267.5934,0,0,0,100,0),
(@PATH,27,3207.818,-3881.953,275.8379,0,0,0,100,0),
(@PATH,28,3221.214,-3882.398,282.8664,0,0,0,100,0),
(@PATH,29,3241.78,-3882.872,292.3388,0,0,0,100,0),
(@PATH,30,3260.253,-3882.767,294.6603,0,0,0,100,0),
(@PATH,31,3279.155,-3882.98,294.6607,0,0,0,100,0),
(@PATH,32,3290.384,-3882.75,294.6607,0,0,0,100,0),
(@PATH,33,3291.66,-3875.24,294.662,0,0,0,100,0),
(@PATH,34,3295.71,-3868.95,294.662,0,0,0,100,0),
(@PATH,35,3302.22,-3864.56,294.662,0,0,0,100,0),
(@PATH,36,3310.01,-3862.94,294.662,0,0,0,100,0);

-- Pathing for Venom Stalker Entry: 15976
SET @NPC := 127863; -- 127862 should be in formation with him
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3252.581,`position_y`=-3730.202,`position_z`=279.2595 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3234.624,-3733.446,282.4044,0,0,0,100,0),
(@PATH,2,3234.132,-3743.128,280.9408,0,0,0,100,0),
(@PATH,3,3247.629,-3762.814,277.5423,0,0,0,100,0),
(@PATH,4,3232.144,-3779.076,273.1304,0,0,0,100,0),
(@PATH,5,3247.629,-3762.814,277.5423,0,0,0,100,0),
(@PATH,6,3234.124,-3743.281,280.9517,0,0,0,100,0),
(@PATH,7,3234.624,-3733.446,282.4044,0,0,0,100,0),
(@PATH,8,3252.519,-3730.217,279.2638,0,0,0,100,0),
(@PATH,9,3276.249,-3724.284,275.8947,0,0,0,100,0),
(@PATH,10,3309.417,-3714.943,266.8448,0,0,0,100,0),
(@PATH,11,3322.029,-3700.557,262.8869,0,0,0,100,0),
(@PATH,12,3298.23,-3700.239,271.5263,0,0,0,100,0),
(@PATH,13,3280.485,-3698.461,278.4746,0,0,0,100,0),
(@PATH,14,3298.23,-3700.239,271.5263,0,0,0,100,0),
(@PATH,15,3321.937,-3700.525,262.8836,0,0,0,100,0),
(@PATH,16,3309.417,-3714.943,266.8448,0,0,0,100,0),
(@PATH,17,3276.249,-3724.284,275.8947,0,0,0,100,0),
(@PATH,18,3252.581,-3730.202,279.2595,0,0,0,100,0);

-- Pathing for Noth the Plaguebringer Entry: 15954
SET @NPC := 127801;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2671.649,`position_y`=-3489.11,`position_z`=261.3754 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2666.34,-3502.596,261.2903,0,0,0,100,0),
(@PATH,2,2670.345,-3514.169,261.2776,0,0,0,100,0),
(@PATH,3,2676.189,-3520.29,261.2623,0,0,0,100,0),
(@PATH,4,2670.345,-3514.169,261.2776,0,0,0,100,0),
(@PATH,5,2666.34,-3502.596,261.2903,0,0,0,100,0),
(@PATH,6,2671.649,-3489.11,261.3754,0,0,0,100,0),
(@PATH,7,2676.566,-3484.499,261.3998,0,0,0,100,0),
(@PATH,8,2671.649,-3489.11,261.3754,0,0,0,100,0);

-- Pathing for Grobbulus Entry: 15931
SET @NPC := 127781;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3227.579,`position_y`=-3378.296,`position_z`=311.3255 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3228.724,-3363.874,304.4799,0,0,0,100,0),
(@PATH,2,3228.579,-3342.257,293.1313,0,0,0,100,0),
(@PATH,3,3228.15,-3327.913,292.5951,0,0,0,100,0),
(@PATH,4,3232.389,-3309.209,292.5951,0,0,0,100,0),
(@PATH,5,3252.036,-3310.178,292.5951,0,0,0,100,0),
(@PATH,6,3249.856,-3309.415,292.5951,60000,0,0,100,0),
(@PATH,7,3230.975,-3315.273,292.5951,0,0,0,100,0),
(@PATH,8,3229.008,-3330.244,292.5951,0,0,0,100,0),
(@PATH,9,3228.291,-3352.366,298.4386,0,0,0,100,0),
(@PATH,10,3228.85,-3367.867,306.5768,0,0,0,100,0),
(@PATH,11,3229.231,-3377.598,311.3294,0,0,0,100,0),
(@PATH,12,3222.958,-3389.251,311.3295,0,0,0,100,0),
(@PATH,13,3211.568,-3389.394,311.3405,0,0,0,100,0),
(@PATH,14,3205.059,-3380.847,311.3312,0,0,0,100,0),
(@PATH,15,3205.269,-3368.451,313.6086,0,0,0,100,0),
(@PATH,16,3205.238,-3346.578,318.9844,0,0,0,100,0),
(@PATH,17,3209.54,-3326.247,320.3741,0,0,0,100,0),
(@PATH,18,3209.07,-3314,320.337,0,0,0,100,0),
(@PATH,19,3200.387,-3306.898,320.325,0,0,0,100,0),
(@PATH,20,3186.123,-3306.752,320.2604,0,0,0,100,0),
(@PATH,21,3174.501,-3306.841,319.6423,60000,0,0,100,0),
(@PATH,22,3188.372,-3305.996,320.2764,0,0,0,100,0),
(@PATH,23,3201.267,-3305.621,320.3262,0,0,0,100,0),
(@PATH,24,3208.785,-3314.216,320.3366,0,0,0,100,0),
(@PATH,25,3211.18,-3328.448,320.3932,0,0,0,100,0),
(@PATH,26,3203.891,-3342.488,320.0162,0,0,0,100,0),
(@PATH,27,3204.194,-3365.331,314.3783,0,0,0,100,0),
(@PATH,28,3204.95,-3382.075,311.3327,0,0,0,100,0),
(@PATH,29,3211.571,-3388.579,311.3394,0,0,0,100,0),
(@PATH,30,3227.579,-3378.296,311.3255,0,0,0,100,0);

-- Pathing for Plague Beast Entry: 16034
SET @NPC := 128177;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2727.223,`position_y`=-3594.056,`position_z`=258.8858 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2723.637,-3604.718,259.6959,0,0,0,100,0),
(@PATH,2,2720.893,-3620.152,260.07,0,0,0,100,0),
(@PATH,3,2723.637,-3604.718,259.6959,0,0,0,100,0),
(@PATH,4,2727.223,-3594.056,258.8858,0,0,0,100,0),
(@PATH,5,2736.519,-3591.672,257.9183,0,0,0,100,0),
(@PATH,6,2743.838,-3597.846,257.6706,0,0,0,100,0),
(@PATH,7,2752.585,-3595.404,257.0601,0,0,0,100,0),
(@PATH,8,2755.268,-3585.129,256.3048,0,0,0,100,0),
(@PATH,9,2757.008,-3575.477,255.6362,0,0,0,100,0),
(@PATH,10,2755.268,-3585.129,256.3048,0,0,0,100,0),
(@PATH,11,2752.585,-3595.404,257.0601,0,0,0,100,0),
(@PATH,12,2743.837,-3597.847,257.6707,0,0,0,100,0),
(@PATH,13,2736.519,-3591.672,257.9183,0,0,0,100,0),
(@PATH,14,2727.223,-3594.056,258.8858,0,0,0,100,0);

-- Pathing for Plague Beast Entry: 16034
SET @NPC := 128178;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2847.407,`position_y`=-3611.501,`position_z`=261.8609 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2857.005,-3599.331,263.6793,0,0,0,100,0),
(@PATH,2,2873.124,-3590.235,267.1259,0,0,0,100,0),
(@PATH,3,2887.852,-3592.763,270.6516,0,0,0,100,0),
(@PATH,4,2897.192,-3605.39,273.3059,0,0,0,100,0),
(@PATH,5,2899.383,-3619.342,275.0363,0,0,0,100,0),
(@PATH,6,2891.756,-3631.639,274.1991,0,0,0,100,0),
(@PATH,7,2879.466,-3638.177,273.2885,0,0,0,100,0),
(@PATH,8,2866.484,-3640.015,271.3249,0,0,0,100,0),
(@PATH,9,2879.466,-3638.177,273.2885,0,0,0,100,0),
(@PATH,10,2891.756,-3631.639,274.1991,0,0,0,100,0),
(@PATH,11,2899.383,-3619.342,275.0363,0,0,0,100,0),
(@PATH,12,2897.192,-3605.39,273.3059,0,0,0,100,0),
(@PATH,13,2887.852,-3592.763,270.6516,0,0,0,100,0),
(@PATH,14,2873.124,-3590.235,267.1259,0,0,0,100,0),
(@PATH,15,2857.005,-3599.331,263.6793,0,0,0,100,0),
(@PATH,16,2847.407,-3611.501,261.8609,0,0,0,100,0);

-- Pathing for Plague Beast Entry: 16034
SET @NPC := 128179;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2777.605,`position_y`=-3575.896,`position_z`=253.7501 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2790.739,-3564.992,251.512,0,0,0,100,0),
(@PATH,2,2806.231,-3568.648,252.5588,0,0,0,100,0),
(@PATH,3,2817.801,-3583.097,254.5759,0,0,0,100,0),
(@PATH,4,2822.715,-3595.134,257.7653,0,0,0,100,0),
(@PATH,5,2829.62,-3612.201,259.9153,0,0,0,100,0),
(@PATH,6,2822.715,-3595.134,257.7653,0,0,0,100,0),
(@PATH,7,2817.801,-3583.097,254.5759,0,0,0,100,0),
(@PATH,8,2806.231,-3568.648,252.5588,0,0,0,100,0),
(@PATH,9,2790.979,-3565.049,251.5594,0,0,0,100,0),
(@PATH,10,2777.605,-3575.896,253.7501,0,0,0,100,0),
(@PATH,11,2767.949,-3589.933,256.7042,0,0,0,100,0),
(@PATH,12,2777.605,-3575.896,253.7501,0,0,0,100,0);

-- Pathing for Plague Beast Entry: 16034
SET @NPC := 128183;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2897.484,`position_y`=-3671.875,`position_z`=280.3942 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2900.623,-3683.831,284.0013,0,0,0,100,0),
(@PATH,2,2894.853,-3698.01,285.4735,0,0,0,100,0),
(@PATH,3,2881.999,-3708.828,285.7333,0,0,0,100,0),
(@PATH,4,2865.732,-3705.732,284.1666,0,0,0,100,0),
(@PATH,5,2858.935,-3691.243,281.1445,0,0,0,100,0),
(@PATH,6,2846.578,-3686.145,278.5287,0,0,0,100,0),
(@PATH,7,2827.884,-3686.887,275.8904,0,0,0,100,0),
(@PATH,8,2846.578,-3686.145,278.5287,0,0,0,100,0),
(@PATH,9,2858.935,-3691.243,281.1445,0,0,0,100,0),
(@PATH,10,2865.732,-3705.732,284.1666,0,0,0,100,0),
(@PATH,11,2881.999,-3708.828,285.7333,0,0,0,100,0),
(@PATH,12,2894.65,-3698.181,285.4753,0,0,0,100,0),
(@PATH,13,2900.623,-3683.831,284.0013,0,0,0,100,0),
(@PATH,14,2897.484,-3671.875,280.3942,0,0,0,100,0),
(@PATH,15,2884.267,-3662.161,277.4121,0,0,0,100,0),
(@PATH,16,2867.519,-3655.968,274.4418,0,0,0,100,0),
(@PATH,17,2884.267,-3662.161,277.4121,0,0,0,100,0),
(@PATH,18,2897.484,-3671.875,280.3942,0,0,0,100,0);

-- Pathing for Bile Retcher Entry: 16018
SET @NPC := 128082;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3042.894,`position_y`=-3210.451,`position_z`=293.3452 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3045.409,-3229.587,293.3453,0,0,0,100,0),
(@PATH,2,3042.894,-3210.451,293.3452,0,0,0,100,0),
(@PATH,3,3044.73,-3193.168,293.345,0,0,0,100,0),
(@PATH,4,3050.198,-3175.146,293.3451,0,0,0,100,0),
(@PATH,5,3057.628,-3160.267,293.3452,0,0,0,100,0),
(@PATH,6,3070.946,-3144.958,293.3451,0,0,0,100,0),
(@PATH,7,3085.224,-3133.8,293.3451,0,0,0,100,0),
(@PATH,8,3100.719,-3125.13,293.3454,0,0,0,100,0),
(@PATH,9,3115.583,-3120.971,293.3454,0,0,0,100,0),
(@PATH,10,3123.499,-3119.894,293.3453,0,0,0,100,0),
(@PATH,11,3115.583,-3120.971,293.3454,0,0,0,100,0),
(@PATH,12,3100.719,-3125.13,293.3454,0,0,0,100,0),
(@PATH,13,3085.224,-3133.8,293.3451,0,0,0,100,0),
(@PATH,14,3070.946,-3144.958,293.3451,0,0,0,100,0),
(@PATH,15,3057.628,-3160.267,293.3452,0,0,0,100,0),
(@PATH,16,3050.198,-3175.146,293.3451,0,0,0,100,0),
(@PATH,17,3044.73,-3193.168,293.345,0,0,0,100,0),
(@PATH,18,3042.894,-3210.451,293.3452,0,0,0,100,0);

-- Pathing for Bile Retcher Entry: 16018
SET @NPC := 128080;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3033.41,`position_y`=-3103.28,`position_z`=294.0816 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3042.117,-3111.578,294.0787,0,0,0,100,0),
(@PATH,2,3054.847,-3117.892,294.0732,0,0,0,100,0),
(@PATH,3,3064.48,-3116.37,294.0733,0,0,0,100,0),
(@PATH,4,3071.523,-3110.154,294.0739,0,0,0,100,0),
(@PATH,5,3073.239,-3096.89,294.0799,0,0,0,100,0),
(@PATH,6,3070.978,-3083.671,294.0771,0,0,0,100,0),
(@PATH,7,3069.906,-3072.977,294.0717,0,0,0,100,0),
(@PATH,8,3070.978,-3083.671,294.0771,0,0,0,100,0),
(@PATH,9,3073.239,-3096.89,294.0799,0,0,0,100,0),
(@PATH,10,3071.523,-3110.154,294.0739,0,0,0,100,0),
(@PATH,11,3064.48,-3116.37,294.0733,0,0,0,100,0),
(@PATH,12,3054.985,-3117.871,294.0741,0,0,0,100,0),
(@PATH,13,3042.117,-3111.578,294.0787,0,0,0,100,0),
(@PATH,14,3033.41,-3103.28,294.0816,0,0,0,100,0);

-- Pathing for Bile Retcher Entry: 16018
SET @NPC := 128077;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3142.82,`position_y`=-3289.663,`position_z`=293.6283 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3133.79,-3280.204,293.6283,0,0,0,100,0),
(@PATH,2,3124.373,-3283.016,293.6283,0,0,0,100,0),
(@PATH,3,3115.834,-3292.965,293.6283,0,0,0,100,0),
(@PATH,4,3107.542,-3301.675,293.6283,0,0,0,100,0),
(@PATH,5,3100.092,-3309.104,293.6283,0,0,0,100,0),
(@PATH,6,3096.534,-3315.12,293.6284,0,0,0,100,0),
(@PATH,7,3098.168,-3321.916,293.6283,0,0,0,100,0),
(@PATH,8,3105.722,-3329.35,293.6283,0,0,0,100,0),
(@PATH,9,3096.036,-3342.595,294.4876,0,0,0,100,0),
(@PATH,10,3089.529,-3352.048,299.1511,0,0,0,100,0),
(@PATH,11,3080.938,-3360.322,298.3178,0,0,0,100,0),
(@PATH,12,3090.223,-3352.669,299.1137,0,0,0,100,0),
(@PATH,13,3098.557,-3345.29,294.5518,0,0,0,100,0),
(@PATH,14,3110.563,-3333.553,293.6283,0,0,0,100,0),
(@PATH,15,3119.627,-3342.392,293.6283,0,0,0,100,0),
(@PATH,16,3126.197,-3344.948,293.6283,0,0,0,100,0),
(@PATH,17,3132.594,-3340.744,293.6283,0,0,0,100,0),
(@PATH,18,3139.652,-3333.695,293.6254,0,0,0,100,0),
(@PATH,19,3147.054,-3325.681,293.6215,0,0,0,100,0),
(@PATH,20,3156.757,-3316.759,293.6283,0,0,0,100,0),
(@PATH,21,3159.579,-3307.466,293.6283,0,0,0,100,0),
(@PATH,22,3151.304,-3298.503,293.6283,0,0,0,100,0),
(@PATH,23,3142.82,-3289.663,293.6283,0,0,0,100,0);

-- Pathing for Bile Retcher Entry: 16018
SET @NPC := 128083;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3014.116,`position_y`=-3151.28,`position_z`=294.0802 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3006.086,-3148.801,294.0794,0,0,0,100,0),
(@PATH,2,2998.345,-3143.183,294.0745,0,0,0,100,0),
(@PATH,3,3006.086,-3148.801,294.0794,0,0,0,100,0),
(@PATH,4,3014.116,-3151.28,294.0802,0,0,0,100,0),
(@PATH,5,3021.593,-3152.803,294.0765,0,0,0,100,0),
(@PATH,6,3029.989,-3151.037,294.0749,0,0,0,100,0),
(@PATH,7,3035.378,-3146.691,294.0736,0,0,0,100,0),
(@PATH,8,3037.918,-3141.474,294.0722,0,0,0,100,0),
(@PATH,9,3037.771,-3135.391,294.0739,0,0,0,100,0),
(@PATH,10,3032.81,-3126.448,294.0777,0,0,0,100,0),
(@PATH,11,3027.861,-3119.256,294.0811,0,0,0,100,0),
(@PATH,12,3023.261,-3113.858,294.0814,0,0,0,100,0),
(@PATH,13,3027.861,-3119.256,294.0811,0,0,0,100,0),
(@PATH,14,3032.81,-3126.448,294.0777,0,0,0,100,0),
(@PATH,15,3037.771,-3135.391,294.0739,0,0,0,100,0),
(@PATH,16,3037.918,-3141.474,294.0722,0,0,0,100,0),
(@PATH,17,3035.378,-3146.691,294.0736,0,0,0,100,0),
(@PATH,18,3029.989,-3151.037,294.0749,0,0,0,100,0),
(@PATH,19,3021.593,-3152.803,294.0765,0,0,0,100,0),
(@PATH,20,3014.116,-3151.28,294.0802,0,0,0,100,0);

-- Pathing for Patchwerk Entry: 16028 Goodbye YTDB waypoints :)
SET @NPC := 128135;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3256.364,`position_y`=-3230.328,`position_z`=294.0628 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3294.435,-3232.726,294.0628,0,0,0,100,0),
(@PATH,2,3259.98,-3230.881,294.0628,0,0,0,100,0),
(@PATH,3,3239.911,-3221.095,294.0628,0,0,0,100,0),
(@PATH,4,3217.512,-3195.807,294.0628,0,0,0,100,0),
(@PATH,5,3191.55,-3171.159,294.0628,0,0,0,100,0),
(@PATH,6,3163.729,-3148.403,294.0628,0,0,0,100,0),
(@PATH,7,3135.152,-3140.675,294.0628,0,0,0,100,0),
(@PATH,8,3102.748,-3145.538,294.0628,0,0,0,100,0),
(@PATH,9,3132.792,-3139.218,294.0628,0,0,0,100,0),
(@PATH,10,3158.633,-3145.425,294.0628,0,0,0,100,0),
(@PATH,11,3183.093,-3161.458,294.0628,0,0,0,100,0),
(@PATH,12,3207.656,-3187.538,294.0628,0,0,0,100,0),
(@PATH,13,3231.767,-3210.727,294.0628,0,0,0,100,0),
(@PATH,14,3256.364,-3230.328,294.0628,0,0,0,100,0);

-- Pathing for Sludge Belcher Entry: 16029
SET @NPC := 128136;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3118.057,`position_y`=-3238.513,`position_z`=294.0628 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3110.502,-3233.311,294.0628,0,0,0,100,0),
(@PATH,2,3104.615,-3222.995,294.062,0,0,0,100,0),
(@PATH,3,3102.009,-3217.843,294.0619,0,0,0,100,0),
(@PATH,4,3088.782,-3219.72,294.2053,0,0,0,100,0),
(@PATH,5,3062.66,-3225.544,294.0628,0,0,0,100,0),
(@PATH,6,3088.782,-3219.72,294.2053,0,0,0,100,0),
(@PATH,7,3102.009,-3217.843,294.0619,0,0,0,100,0),
(@PATH,8,3104.615,-3222.995,294.062,0,0,0,100,0),
(@PATH,9,3110.502,-3233.311,294.0628,0,0,0,100,0),
(@PATH,10,3118.057,-3238.513,294.0628,0,0,0,100,0),
(@PATH,11,3132.468,-3243.824,294.0882,0,0,0,100,0),
(@PATH,12,3132.824,-3258.017,294.5639,0,0,0,100,0),
(@PATH,13,3134.089,-3269.027,294.4024,0,0,0,100,0),
(@PATH,14,3145.958,-3276.273,294.7125,0,0,0,100,0),
(@PATH,15,3159.74,-3284.686,294.9083,0,0,0,100,0),
(@PATH,16,3165.632,-3293.163,294.7399,0,0,0,100,0),
(@PATH,17,3170.729,-3299.799,294.5983,0,0,0,100,0),
(@PATH,18,3176.233,-3307.651,294.5355,0,0,0,100,0),
(@PATH,19,3174.618,-3318.042,294.5306,0,0,0,100,0),
(@PATH,20,3165.177,-3325.201,294.523,0,0,0,100,0),
(@PATH,21,3174.617,-3318.042,294.5306,0,0,0,100,0),
(@PATH,22,3176.233,-3307.651,294.5355,0,0,0,100,0),
(@PATH,23,3170.73,-3299.8,294.5983,0,0,0,100,0),
(@PATH,24,3165.632,-3293.163,294.7399,0,0,0,100,0),
(@PATH,25,3159.74,-3284.686,294.9083,0,0,0,100,0),
(@PATH,26,3145.958,-3276.273,294.7125,0,0,0,100,0),
(@PATH,27,3134.089,-3269.027,294.4024,0,0,0,100,0),
(@PATH,28,3132.824,-3258.017,294.5639,0,0,0,100,0),
(@PATH,29,3132.468,-3243.824,294.0882,0,0,0,100,0),
(@PATH,30,3118.057,-3238.513,294.0628,0,0,0,100,0);

-- Pathing for Sludge Belcher Entry: 16029
SET @NPC := 97736;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=16029,`modelid`=0,`map`=533,`spawnMask`=3,`spawndist`=0,`MovementType`=2,`position_x`=2992.316,`position_y`=-3175.448,`position_z`=294.0716 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2985.661,-3189.97,294.0675,0,0,0,100,0),
(@PATH,2,2992.316,-3175.448,294.0716,0,0,0,100,0),
(@PATH,3,2998.143,-3166.825,294.0744,0,0,0,100,0),
(@PATH,4,3007.454,-3161.701,294.0769,0,0,0,100,0),
(@PATH,5,3021.642,-3159.072,294.0751,0,0,0,100,0),
(@PATH,6,3033.026,-3156.022,294.0723,0,0,0,100,0),
(@PATH,7,3047.169,-3147.989,294.0677,0,0,0,100,0),
(@PATH,8,3061.901,-3133.495,294.0666,0,0,0,100,0),
(@PATH,9,3075.713,-3122.531,294.0668,0,0,0,100,0),
(@PATH,10,3088.894,-3113.645,294.0691,0,0,0,100,0),
(@PATH,11,3102.977,-3108.005,294.0687,0,0,0,100,0),
(@PATH,12,3115.019,-3104.743,294.0686,0,0,0,100,0),
(@PATH,13,3102.98,-3108.004,294.0687,0,0,0,100,0),
(@PATH,14,3088.894,-3113.645,294.0691,0,0,0,100,0),
(@PATH,15,3075.713,-3122.531,294.0668,0,0,0,100,0),
(@PATH,16,3061.901,-3133.495,294.0666,0,0,0,100,0),
(@PATH,17,3047.169,-3147.989,294.0677,0,0,0,100,0),
(@PATH,18,3033.026,-3156.022,294.0723,0,0,0,100,0),
(@PATH,19,3021.642,-3159.072,294.0751,0,0,0,100,0),
(@PATH,20,3007.454,-3161.701,294.0769,0,0,0,100,0),
(@PATH,21,2998.143,-3166.825,294.0744,0,0,0,100,0),
(@PATH,22,2992.316,-3175.448,294.0716,0,0,0,100,0);

-- Pathing for Sludge Belcher Entry: 16029
SET @NPC := 97718;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=16029,`modelid`=0,`map`=533,`spawnMask`=3,`spawndist`=0,`MovementType`=2,`position_x`=3008.161,`position_y`=-3239.027,`position_z`=294.0628 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3012.525,-3243.854,294.0628,0,0,0,100,0),
(@PATH,2,3022.682,-3242.966,294.0628,0,0,0,100,0),
(@PATH,3,3028.833,-3236.661,294.0628,0,0,0,100,0),
(@PATH,4,3032.736,-3219.687,294.0628,0,0,0,100,0),
(@PATH,5,3028.816,-3207.798,294.0628,0,0,0,100,0),
(@PATH,6,3021.306,-3202.189,294.0628,0,0,0,100,0),
(@PATH,7,3006.159,-3199.062,294.0689,0,0,0,100,0),
(@PATH,8,2991.62,-3203.322,294.0628,0,0,0,100,0),
(@PATH,9,2985.41,-3218.486,294.0628,0,0,0,100,0),
(@PATH,10,2988.189,-3227.132,294.0628,0,0,0,100,0),
(@PATH,11,3001.484,-3232.543,294.0628,0,0,0,100,0),
(@PATH,12,3008.161,-3239.027,294.0628,0,0,0,100,0);

-- Pathing for Sludge Belcher Entry: 16029
SET @NPC := 97724;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=16029,`modelid`=0,`map`=533,`spawnMask`=3,`spawndist`=0,`MovementType`=2,`position_x`=3103.862,`position_y`=-3199.295,`position_z`=294.0628 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3110.057,-3189.071,294.0628,0,0,0,100,0),
(@PATH,2,3117.292,-3183.439,294.0628,0,0,0,100,0),
(@PATH,3,3124.222,-3180.931,294.0628,0,0,0,100,0),
(@PATH,4,3134.678,-3179.746,294.0628,0,0,0,100,0),
(@PATH,5,3147.699,-3183.069,294.0628,0,0,0,100,0),
(@PATH,6,3156.941,-3191.08,294.0628,0,0,0,100,0),
(@PATH,7,3163.032,-3198.683,294.0628,0,0,0,100,0),
(@PATH,8,3165.123,-3211.401,294.0628,0,0,0,100,0),
(@PATH,9,3162.973,-3223.654,294.0628,0,0,0,100,0),
(@PATH,10,3155.372,-3234.195,294.0628,0,0,0,100,0),
(@PATH,11,3146.969,-3240.264,294.0867,0,0,0,100,0),
(@PATH,12,3138.718,-3243.327,294.088,0,0,0,100,0),
(@PATH,13,3146.969,-3240.264,294.0867,0,0,0,100,0),
(@PATH,14,3155.372,-3234.195,294.0628,0,0,0,100,0),
(@PATH,15,3162.97,-3223.67,294.0628,0,0,0,100,0),
(@PATH,16,3165.123,-3211.401,294.0628,0,0,0,100,0),
(@PATH,17,3163.032,-3198.683,294.0628,0,0,0,100,0),
(@PATH,18,3156.941,-3191.08,294.0628,0,0,0,100,0),
(@PATH,19,3147.699,-3183.069,294.0628,0,0,0,100,0),
(@PATH,20,3134.678,-3179.746,294.0628,0,0,0,100,0),
(@PATH,21,3124.222,-3180.931,294.0628,0,0,0,100,0),
(@PATH,22,3117.292,-3183.439,294.0628,0,0,0,100,0),
(@PATH,23,3110.057,-3189.071,294.0628,0,0,0,100,0),
(@PATH,24,3103.862,-3199.295,294.0628,0,0,0,100,0),
(@PATH,25,3102.404,-3208.719,294.0627,0,0,0,100,0),
(@PATH,26,3103.862,-3199.295,294.0628,0,0,0,100,0);

-- Pathing for Sludge Belcher Entry: 16029
SET @NPC := 97747;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=16029,`modelid`=0,`map`=533,`spawnMask`=3,`spawndist`=0,`MovementType`=2,`position_x`=3112.745,`position_y`=-3093.264,`position_z`=294.0749 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3119.318,-3086.976,294.0759,0,0,0,100,0),
(@PATH,2,3126.585,-3076.191,294.0714,0,0,0,100,0),
(@PATH,3,3119.318,-3086.976,294.0759,0,0,0,100,0),
(@PATH,4,3112.745,-3093.264,294.0749,0,0,0,100,0),
(@PATH,5,3103.091,-3093.424,294.076,0,0,0,100,0),
(@PATH,6,3096.566,-3090.718,294.0785,0,0,0,100,0),
(@PATH,7,3089.514,-3081.602,294.08,0,0,0,100,0),
(@PATH,8,3086.157,-3071.268,294.0743,0,0,0,100,0),
(@PATH,9,3089.514,-3081.602,294.08,0,0,0,100,0),
(@PATH,10,3096.566,-3090.718,294.0785,0,0,0,100,0),
(@PATH,11,3103.091,-3093.424,294.076,0,0,0,100,0),
(@PATH,12,3112.745,-3093.264,294.0749,0,0,0,100,0);

-- Set random movement to Embalming Slime, Patchwork Golem, Maggot, Frenzied Bat, Plagued Bat, Diseased Maggot, Rotting Maggot, Larva Entry, Risen Squire
UPDATE `creature` SET `spawndist`=8,`MovementType`=1 WHERE `id` IN (16017,16024,16030,16036,16037,16056,16057,16068,16154);

-- Pathing for Death Knight Cavalier Entry: 16163
SET @NPC := 127752;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2827.984,`position_y`=-3152.95,`position_z`=273.787 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=2827.984,`position_y`=-3152.95,`position_z`=273.787 WHERE `guid`=127751;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,25278, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2828.418,-3128.86,273.8279,0,0,0,100,0),
(@PATH,2,2828.67,-3097.49,273.8293,0,0,0,100,0),
(@PATH,3,2824.122,-3127.451,273.8248,0,0,0,100,0),
(@PATH,4,2813.568,-3143.734,273.7569,0,0,0,100,0),
(@PATH,5,2801.097,-3163.161,273.7858,0,0,0,100,0),
(@PATH,6,2799.644,-3189.22,273.787,0,0,0,100,0),
(@PATH,7,2820.002,-3202.299,273.8145,0,0,0,100,0),
(@PATH,8,2844.853,-3200.758,273.787,0,0,0,100,0),
(@PATH,9,2848.53,-3180.427,273.787,0,0,0,100,0),
(@PATH,10,2827.984,-3152.95,273.787,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=127752;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(127752,127752,5,90,2),
(127752,127751,5,90,2);

-- Pathing for Death Knight Cavalier Entry: 16163
SET @NPC := 127745;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2709.55,`position_y`=-3013.26,`position_z`=240.524 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=2709.55,`position_y`=-3013.26,`position_z`=240.524 WHERE `guid`=127744;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,25278, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2724.357,-3002.94,240.5246,0,0,0,100,0),
(@PATH,2,2734.208,-2991.862,240.525,0,0,0,100,0),
(@PATH,3,2744.237,-2985.519,240.5257,0,0,0,100,0),
(@PATH,4,2763.189,-2986.039,240.5255,0,0,0,100,0),
(@PATH,5,2781.199,-2986.169,240.5265,0,0,0,100,0),
(@PATH,6,2791.35,-2986.05,240.528,0,0,0,100,0),
(@PATH,7,2811.443,-2985.972,250.953,0,0,0,100,0),
(@PATH,8,2830.531,-2985.851,260.8194,0,0,0,100,0),
(@PATH,9,2847.362,-2985.841,267.593,0,0,0,100,0),
(@PATH,10,2870.534,-2986.177,267.5924,0,0,0,100,0),
(@PATH,11,2882.414,-2997.007,267.5921,0,0,0,100,0),
(@PATH,12,2895.966,-3012.106,267.5932,0,0,0,100,0),
(@PATH,13,2915.716,-3014.353,267.594,0,0,0,100,0),
(@PATH,14,2931.21,-3007.478,267.5924,0,0,0,100,0),
(@PATH,15,2938.199,-2994.229,267.5921,0,0,0,100,0),
(@PATH,16,2937.735,-2977.154,267.5934,0,0,0,100,0),
(@PATH,17,2916.35,-2957.36,267.592,0,0,0,100,0),
(@PATH,18,2904.34,-2957.15,267.592,0,0,0,100,0),
(@PATH,19,2892.14,-2962.4,267.592,0,0,0,100,0),
(@PATH,20,2884.039,-2971.864,267.5926,0,0,0,100,0),
(@PATH,21,2870.617,-2985.568,267.5924,0,0,0,100,0),
(@PATH,22,2847.519,-2985.616,267.593,0,0,0,100,0),
(@PATH,23,2831.011,-2985.781,260.82,0,0,0,100,0),
(@PATH,24,2811.443,-2985.972,250.953,0,0,0,100,0),
(@PATH,25,2791.35,-2986.05,240.528,0,0,0,100,0),
(@PATH,26,2781.199,-2986.169,240.5265,0,0,0,100,0),
(@PATH,27,2763.189,-2986.039,240.5255,0,0,0,100,0),
(@PATH,28,2744.237,-2985.519,240.5257,0,0,0,100,0),
(@PATH,29,2734.137,-2977.427,240.5255,0,0,0,100,0),
(@PATH,30,2722.754,-2967.005,240.5243,0,0,0,100,0),
(@PATH,31,2708.031,-2957.228,240.5254,0,0,0,100,0),
(@PATH,32,2691.098,-2957.404,240.5251,0,0,0,100,0),
(@PATH,33,2676.669,-2966.855,240.5253,0,0,0,100,0),
(@PATH,34,2671.321,-2976.635,240.5246,0,0,0,100,0),
(@PATH,35,2671.421,-2993.49,240.5249,0,0,0,100,0),
(@PATH,36,2680.976,-3008.883,240.5253,0,0,0,100,0),
(@PATH,37,2696.83,-3014.89,240.524,0,0,0,100,0),
(@PATH,38,2709.55,-3013.26,240.524,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=127745;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(127745,127745,5,90,2),
(127745,127744,5,90,2);

-- Pathing for Death Knight Cavalier Entry: 16163
SET @NPC := 127743;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2787.864,`position_y`=-3320.589,`position_z`=267.6845 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=2787.864,`position_y`=-3320.589,`position_z`=267.6845 WHERE `guid`=127742;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,25278, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2787.931,-3363.628,267.6847,0,0,0,100,0),
(@PATH,2,2787.864,-3320.606,267.6845,0,0,0,100,0),
(@PATH,3,2787.388,-3287.191,267.6845,0,0,0,100,0),
(@PATH,4,2787.864,-3320.589,267.6845,0,0,0,100,0);
-- F1303F2316ADF300 .go 2787.931 -3363.628 267.6847

DELETE FROM `creature_formations` WHERE `leaderGUID`=127743;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(127743,127743,5,90,2),
(127743,127742,5,90,2);

-- Pathing for Death Knight Cavalier Entry: 16163
SET @NPC := 127754;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2911.993,`position_y`=-3204.611,`position_z`=273.3833 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2911.993,`position_y`=-3204.611,`position_z`=273.3833 WHERE `guid`=127753;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,25278, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2926.023,-3200.403,273.4004,0,0,0,100,0),
(@PATH,2,2931.457,-3188.328,273.3847,0,0,0,100,0),
(@PATH,3,2925.778,-3167.298,273.787,0,0,0,100,0),
(@PATH,4,2907.542,-3166.655,273.787,0,0,0,100,0),
(@PATH,5,2873.219,-3165.419,273.787,0,0,0,100,0),
(@PATH,6,2861.632,-3165.088,273.787,0,0,0,100,0),
(@PATH,7,2860.526,-3185.717,273.787,0,0,0,100,0),
(@PATH,8,2860.435,-3203.401,273.787,0,0,0,100,0),
(@PATH,9,2875.204,-3203.906,273.4075,0,0,0,100,0),
(@PATH,10,2892.834,-3204.38,273.3951,0,0,0,100,0),
(@PATH,11,2911.993,-3204.611,273.3833,0,0,0,100,0);
-- F1303F2317A7F300 .go 2926.023 -3200.403 273.4004
DELETE FROM `creature_formations` WHERE `leaderGUID`=127754;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(127754,127754,5,90,2),
(127754,127753,5,90,2);

-- Pathing for Shade of Naxxramas Entry: 16164
SET @NPC := 127756;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2892.747,`position_y`=-3294.521,`position_z`=298.1457 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2881.74,-3294.004,298.1457,0,0,0,100,0),
(@PATH,2,2870.605,-3303.931,298.1457,0,0,0,100,0),
(@PATH,3,2867.386,-3319,298.1457,0,0,0,100,0),
(@PATH,4,2863.142,-3340.528,298.1457,0,0,0,100,0),
(@PATH,5,2867.386,-3319,298.1457,0,0,0,100,0),
(@PATH,6,2870.605,-3303.931,298.1457,0,0,0,100,0),
(@PATH,7,2881.74,-3294.004,298.1457,0,0,0,100,0),
(@PATH,8,2892.747,-3294.521,298.1457,0,0,0,100,0),
(@PATH,9,2915.861,-3295.495,298.547,0,0,0,100,0),
(@PATH,10,2892.747,-3294.521,298.1457,0,0,0,100,0);

-- Pathing for Bony Construct Entry: 16167
SET @NPC := 127764;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2845.056,`position_y`=-3296.362,`position_z`=298.1237 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2847.821,-3308.784,298.1465,0,0,0,100,0),
(@PATH,2,2838.797,-3321.935,298.1519,0,0,0,100,0),
(@PATH,3,2847.821,-3308.784,298.1465,0,0,0,100,0),
(@PATH,4,2845.056,-3296.362,298.1237,0,0,0,100,0),
(@PATH,5,2832.532,-3295.221,298.1501,0,0,0,100,0),
(@PATH,6,2845.056,-3296.362,298.1237,0,0,0,100,0);

-- Pathing for Bony Construct Entry: 16167
SET @NPC := 127767;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2835.764,`position_y`=-3331.32,`position_z`=299.3642 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2830.406,-3329.089,304.8374,0,0,0,100,0),
(@PATH,2,2835.764,-3331.32,299.3642,0,0,0,100,0),
(@PATH,3,2842.907,-3323.556,298.1545,0,0,0,100,0),
(@PATH,4,2852.525,-3333.609,298.1457,0,0,0,100,0),
(@PATH,5,2854.874,-3350.62,298.1457,0,0,0,100,0),
(@PATH,6,2852.525,-3333.609,298.1457,0,0,0,100,0),
(@PATH,7,2842.907,-3323.556,298.1545,0,0,0,100,0),
(@PATH,8,2835.764,-3331.32,299.3642,0,0,0,100,0);

-- Pathing for Stoneskin Gargoyle Entry: 16168
SET @NPC := 127775;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2854.793,`position_y`=-3489.831,`position_z`=297.8863 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2872.719,-3489.734,297.6203,0,0,0,100,0),
(@PATH,2,2855.09,-3489.832,297.8829,0,0,0,100,0),
(@PATH,3,2836.616,-3489.816,297.8643,0,0,0,100,0),
(@PATH,4,2809.425,-3490.459,285.9723,0,0,0,100,0),
(@PATH,5,2775.243,-3489.796,274.0275,0,0,0,100,0),
(@PATH,6,2728.599,-3490.62,262.1311,0,0,0,100,0),
(@PATH,7,2775.243,-3489.796,274.0275,0,0,0,100,0),
(@PATH,8,2809.425,-3490.459,285.9723,0,0,0,100,0),
(@PATH,9,2836.616,-3489.816,297.8643,0,0,0,100,0),
(@PATH,10,2854.793,-3489.831,297.8863,0,0,0,100,0);

-- Pathing for Stoneskin Gargoyle Entry: 16168
SET @NPC := 127772;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2864.621,`position_y`=-3468.973,`position_z`=297.8703 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2871.249,-3500.704,297.6192,0,0,0,100,0),
(@PATH,2,2888.541,-3522.788,297.6146,0,0,0,100,0),
(@PATH,3,2905.121,-3519.568,297.863,0,0,0,100,0),
(@PATH,4,2921.399,-3509.922,297.4822,0,0,0,100,0),
(@PATH,5,2944.054,-3494.677,297.6308,0,0,0,100,0),
(@PATH,6,2921.399,-3509.922,297.4822,0,0,0,100,0),
(@PATH,7,2905.121,-3519.568,297.863,0,0,0,100,0),
(@PATH,8,2888.541,-3522.788,297.6146,0,0,0,100,0),
(@PATH,9,2871.249,-3500.704,297.6192,0,0,0,100,0),
(@PATH,10,2864.621,-3468.973,297.8703,0,0,0,100,0);

-- Pathing for Skeletal Smith Entry: 16193
SET @NPC := 127791;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2882.137,`position_y`=-3275.976,`position_z`=298.1409 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2899.501,-3263.09,298.1457,0,0,0,100,0),
(@PATH,2,2899.086,-3280.568,298.547,0,0,0,100,0),
(@PATH,3,2902.461,-3288.92,298.547,0,0,0,100,0),
(@PATH,4,2889.017,-3298.332,298.1457,0,0,0,100,0),
(@PATH,5,2879.739,-3293.503,298.1457,0,0,0,100,0),
(@PATH,6,2882.137,-3275.976,298.1409,0,0,0,100,0);

-- Pathing for Skeletal Smith Entry: 16193
SET @NPC := 127792;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2910.939,`position_y`=-3290.127,`position_z`=298.547 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2902.236,-3293.143,298.547,0,0,0,100,0),
(@PATH,2,2899.265,-3299.745,298.1457,0,0,0,100,0),
(@PATH,3,2902.873,-3306.907,298.1457,0,0,0,100,0),
(@PATH,4,2911.011,-3309.07,298.1457,0,0,0,100,0),
(@PATH,5,2920.521,-3308.821,298.1457,0,0,0,100,0),
(@PATH,6,2920.324,-3301.099,298.547,0,0,0,100,0),
(@PATH,7,2915.13,-3296.642,298.547,0,0,0,100,0),
(@PATH,8,2910.939,-3290.127,298.547,0,0,0,100,0);

-- ========================
--  2011_05_24_08_world_creature_template.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Fix some screwed up / hacked up factions
UPDATE `creature_template` SET `faction_H`=`faction_A` WHERE `subname` IN ('The Assurance','The Cloudkisser','The Bravery');
UPDATE `creature_template` SET `faction_H`=`faction_A` WHERE `entry` IN (25013,25014);

-- ========================
--  2011_05_24_09_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Quest 12321 "A Righteous Sermon"
-- SAI for Inquisitor Hallard 
SET @ENTRY := 27316;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`='' WHERE `entry`=@ENTRY; 
UPDATE `creature` SET `position_x`=3797.918,`position_y`=-677.4138,`position_z`=213.7526 WHERE id=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@ENTRY*100); 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
-- AI
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - on reset - load path 0'),
(@ENTRY,0,1,0,19,0,100,0,12321,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - on quest accept 12321 - run script'),
-- Script
(@ENTRY*100,9,0,0,0,0,100,0,1000,1000,0,0,54,180000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - pause path'),
(@ENTRY*100,9,1,0,0,0,100,0,100,100,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Turn off Questgiver flag'),
(@ENTRY*100,9,2,0,0,0,100,0,100,100,0,0,69,0,0,0,0,0,0,1,0,0,0,3801.585,-678.4510,213.7526,0, 'Inquisitor Hallard - Script - Move to'),
(@ENTRY*100,9,3,0,0,0,100,0,1500,1500,0,0,69,0,0,0,0,0,0,1,0,0,0,3800.602,-680.9520,213.5028,0, 'Inquisitor Hallard - Script - Move to'),
(@ENTRY*100,9,4,0,0,0,100,0,4000,4000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 0'),
(@ENTRY*100,9,5,0,0,0,100,0,6000,6000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 1'),
(@ENTRY*100,9,6,0,0,0,100,0,8000,8000,0,0,1,0,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 0'),
(@ENTRY*100,9,7,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 2'),
(@ENTRY*100,9,8,0,0,0,100,0,7000,7000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 3'),
(@ENTRY*100,9,9,0,0,0,100,0,3000,3000,0,0,1,1,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 1'),
(@ENTRY*100,9,10,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 2'),
(@ENTRY*100,9,11,0,0,0,100,0,4000,4000,0,0,1,3,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 3'),
(@ENTRY*100,9,12,0,0,0,100,0,7000,7000,0,0,1,4,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 4'),
(@ENTRY*100,9,13,0,0,0,100,0,7000,7000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 4'),
(@ENTRY*100,9,14,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 5'),
(@ENTRY*100,9,15,0,0,0,100,0,5000,5000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 6'),
(@ENTRY*100,9,16,0,0,0,100,0,5000,5000,0,0,11,49061,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - cast spell 49061'),
(@ENTRY*100,9,17,0,0,0,100,0,4000,4000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 7'),
(@ENTRY*100,9,18,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 5'),
(@ENTRY*100,9,19,0,0,0,100,0,3500,3500,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 8'),
(@ENTRY*100,9,20,0,0,0,100,0,3500,3500,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 9'),
(@ENTRY*100,9,21,0,0,0,100,0,500,500,0,0,1,6,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 6'),
(@ENTRY*100,9,22,0,0,0,100,0,3000,3000,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 10'),
(@ENTRY*100,9,23,0,0,0,100,0,2000,2000,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 11'),
(@ENTRY*100,9,24,0,0,0,100,0,7000,7000,0,0,1,7,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 7'),
(@ENTRY*100,9,25,0,0,0,100,0,7000,7000,0,0,1,12,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 12'),
(@ENTRY*100,9,26,0,0,0,100,0,12000,12000,0,0,1,8,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 8'),
(@ENTRY*100,9,27,0,0,0,100,0,5000,5000,0,0,1,9,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 9'),
(@ENTRY*100,9,28,0,0,0,100,0,13000,13000,0,0,1,13,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 13'),
(@ENTRY*100,9,29,0,0,0,100,0,7000,7000,0,0,1,10,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 10'),
(@ENTRY*100,9,30,0,0,0,100,0,9000,9000,0,0,1,11,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 11'),
(@ENTRY*100,9,31,0,0,0,100,0,5000,5000,0,0,1,14,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 14'),
(@ENTRY*100,9,32,0,0,0,100,0,5000,5000,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - turn to player'),
(@ENTRY*100,9,33,0,0,0,100,0,1000,1000,0,0,1,15,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 15'),
(@ENTRY*100,9,34,0,0,0,100,0,9000,9000,0,0,15,12321,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - give quest credit to player'),
(@ENTRY*100,9,35,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - turn to Mayor Godfrey'),
(@ENTRY*100,9,36,0,0,0,100,0,3000,3000,0,0,1,16,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 16'),
(@ENTRY*100,9,37,0,0,0,100,0,10000,10000,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Turn on Questgiver flag'),
(@ENTRY*100,9,38,0,0,0,100,0,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - reset creature');

-- waypoints for Inquisitor Hallard
DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY); 
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES 
(@ENTRY,1,3804.538,-679.7090,213.7526, 'Inquisitor Hallard'), 
(@ENTRY,2,3802.979,-678.8114,214.2526, 'Inquisitor Hallard'),
(@ENTRY,3,3800.479,-678.0614,214.2526, 'Inquisitor Hallard'),
(@ENTRY,4,3797.918,-677.4138,213.7526, 'Inquisitor Hallard');

-- NPC talk text insert from sniff 
DELETE FROM `creature_text` WHERE `entry` IN (27316,27577); 
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(27316,0,0, 'Stand back, $N, the beast might lash out and harm you.',12,7,100,396,0,0, 'Inquisitor Hallard'),
(27316,1,0, 'GODFREY! Hear me, fiend! Hear me, for I am the Light, here to deliver you from evil!',12,7,100,5,0,0, 'Inquisitor Hallard'),
(27577,0,0, '%s growls.',16,0,100,0,0,409, 'Mayor Godfrey'),
(27316,2,0, 'Good. I have your attention, then, Godfrey?',12,7,100,396,0,0, 'Inquisitor Hallard'),
(27316,3,0, 'We can do this in one of two ways, Godfrey. First, I will simply ask you to tell me what the unholy markings etched upon the pages of this tome mean. What say you?',12,7,100,1,0,0, 'Inquisitor Hallard'),
(27577,1,0, '%s hisses!',16,0,100,0,0,410, 'Mayor Godfrey'),
(27577,2,0, 'Tell you nothing, preacher.',12,0,100,1,0,0, 'Mayor Godfrey'),
(27577,3,0, 'What can you do to me that Kel''Thuzad has not? That the Lich King will not?',12,0,100,1,0,0, 'Mayor Godfrey'),
(27577,4,0, 'The book is your salvation, yes... but nothing will you know! NOTHING I SAY! NOTHING! ',12,0,100,1,0,0, 'Mayor Godfrey'),
(27316,4,0, 'Then it is option two.',12,7,100,1,0,0, 'Inquisitor Hallard'),
(27316,5,0, 'I say a prayer for you now, lost soul. May the Light take you gracefully.',12,7,100,68,4000,0, 'Inquisitor Hallard'),
(27316,6,0, 'Let the sermon begin.',12,7,100,1,0,0, 'Inquisitor Hallard'),
(27316,7,0, 'LIGHT TAKE YOU, BEAST!',12,7,100,0,0,0, 'Inquisitor Hallard'),
(27577,5,0, 'No more LIGHT! NO MORE! I BEG YOU!',12,0,100,0,0,0, 'Mayor Godfrey'),
(27316,8,0, 'BURN IN HOLY FIRE!',12,7,100,0,0,0, 'Inquisitor Hallard'),
(27316,9,0, 'LET THE LIGHT IN, GODFREY GOODARD!',12,7,100,0,0,0, 'Inquisitor Hallard'),
(27577,6,0, 'Never felt hurt like this!',12,0,100,0,0,0, 'Mayor Godfrey'),
(27316,10,0, 'May the power of Light compel you!',12,7,100,0,0,0, 'Inquisitor Hallard'),
(27316,11,0, 'I thought you would see the Light, Godfrey... Now speak quickly, fiend. What does it say?',12,7,100,396,0,0, 'Inquisitor Hallard'),
(27577,7,0, 'It tells of the coming apocalypse. How this world will burn and be reborn from death.',12,0,100,1,0,0, 'Mayor Godfrey'),
(27316,12,0, 'RUBBISH! Godfrey do you take me for a fool? Do not spew your Scourge propaganda at a man of the Light, heathen! Speak now or I will have the peasants craft a holy water bath and dip you into it like a dog with fleas!',12,7,100,6,0,0, 'Inquisitor Hallard'),
(27577,8,0, 'NOOOO!!! I tell you! I tell you everything!',12,0,100,39,0,0, 'Mayor Godfrey'),
(27577,9,0, 'Humans... Beneath the earth of Wintergarde Village you built a mausoleum! Why do you think Naxxramas attacked that spot? Thel''zan hides deep in your own crypt and sends a thousand-thousand corpses at you! Perish you will...',12,0,100,1,0,0, 'Mayor Godfrey'),
(27316,13,0, 'What? There is a mausoleum beneath the old village? What fools we are to not have noticed! We will find and strike down your master now, Godfrey. We will end this nightmare.',12,7,100,6,0,0, 'Inquisitor Hallard'),
(27577,10,0, 'How? Humans truly are stupid, yes? Thel''zan the Duskbringer! Thel''zan the Lich! He who is born of human flesh and bone, sacrificed all for power, protected by the Lich King!',12,0,100,1,0,0, 'Mayor Godfrey'),
(27577,11,0, 'You cannot stop Thel''zan! He bears the dark gift, bestowed upon him by the Lich King himself!',12,0,100,1,0,0, 'Mayor Godfrey'),
(27316,14,0, 'You let us worry about how we kill the monster, Godfrey.',12,7,100,396,0,0, 'Inquisitor Hallard'),
(27316,15,0, 'Return to Halford with the information that the good mayor was kind enough to submit, $N. I will finish here and squeeze whatever else this wretch might know about Thel''zan. Now, I will show Godfrey the rarely seen "option three."',12,7,100,1,0,0, 'Inquisitor Hallard'),
(27316,16,0, 'Let''s you and I have a chat about some things, Godfrey.',12,7,100,1,0,0, 'Inquisitor Hallard');

-- Add spell conditions for 49062
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=49062;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,49062,0,18,1,27577,0,0,'','Spell 49062 target creature 27577');

-- ========================
--  2011_05_24_10_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- SAI for Grom'tor, Son of Oronok & Coilskar Commander (Shadowmoon Valley)
SET @ENTRY := 21291;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=-2815.424,`position_y`=1771.031,`position_z`=59.10168,`orientation`=4.967079 WHERE `guid`=74574;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
-- AI
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - On spawn - Start WP movement'),
(@ENTRY,0,1,0,1,0,100,0,10000,30000,240000,240000,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - OOC - Run Script'),
-- Script
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,54,16000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Pause path'),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,1,0,0,0,-2814.744,1774.838,59.49939,0, 'Grom''tor, Son of Oronok - Script - Move to'),
(@ENTRY*100,9,2,0,0,0,100,0,1200,1200,0,0,66,0,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Turn to Coilskar Commander'),
(@ENTRY*100,9,3,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 0'),
(@ENTRY*100,9,4,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 1'),
(@ENTRY*100,9,5,0,0,0,100,0,3000,3000,0,0,5,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - do emote 5'),
(@ENTRY*100,9,6,0,0,0,100,0,4000,4000,0,0,1,0,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Coilskar Commander Say text 0'),
(@ENTRY*100,9,7,0,0,0,100,0,1000,1000,0,0,65,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Resume path'),
(@ENTRY*100,9,8,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Coilskar Commander Say text 1'),
(@ENTRY*100,9,9,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 2'),
(@ENTRY*100,9,10,0,0,0,100,0,2000,2000,0,0,54,26000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Pause path'),
(@ENTRY*100,9,11,0,0,0,100,0,2000,2000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 3'),
(@ENTRY*100,9,12,0,0,0,100,0,2000,2000,0,0,1,2,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Coilskar Commander Say text 2'),
(@ENTRY*100,9,13,0,0,0,100,0,5000,5000,0,0,69,0,0,0,0,0,0,1,0,0,0,-2814.744,1774.838,59.49939,0, 'Grom''tor, Son of Oronok - Script - Move to'),
(@ENTRY*100,9,14,0,0,0,100,0,1500,1500,0,0,66,0,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Turn to Coilskar Commander'),
(@ENTRY*100,9,15,0,0,0,100,0,2000,2000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 4'),
(@ENTRY*100,9,16,0,0,0,100,0,2000,2000,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - do emote 25'),
(@ENTRY*100,9,17,0,0,0,100,0,1500,1500,0,0,11,36538,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - cast 36538 on Coilskar Commander'),
(@ENTRY*100,9,18,0,0,0,100,0,1200,1200,0,0,11,36540,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - cast 36540 on Coilskar Commander'),
(@ENTRY*100,9,19,0,0,0,100,0,1200,1200,0,0,11,36538,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - cast 36538 on Coilskar Commander'),
(@ENTRY*100,9,20,0,0,0,100,0,1200,1200,0,0,11,36538,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - cast 36538 on Coilskar Commander'),
(@ENTRY*100,9,21,0,0,0,100,0,1200,1200,0,0,11,36540,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - cast 36540 on Coilskar Commander'),
(@ENTRY*100,9,22,0,0,0,100,0,1200,1200,0,0,11,36539,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - cast 36539 on Coilskar Commander'),
(@ENTRY*100,9,23,0,0,0,100,0,1500,1500,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 5'),
(@ENTRY*100,9,24,0,0,0,100,0,500,500,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 6'),
(@ENTRY*100,9,25,0,0,0,100,0,2500,2500,0,0,65,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Resume path'),
(@ENTRY*100,9,26,0,0,0,100,0,2500,2500,0,0,54,16000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Pause path'),
(@ENTRY*100,9,27,0,0,0,100,0,100,100,0,0,66,0,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Turn to Coilskar Commander'),
(@ENTRY*100,9,28,0,0,0,100,0,500,500,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 7'),
(@ENTRY*100,9,29,0,0,0,100,0,3000,3000,0,0,1,4,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Coilskar Commander Say text 4'),
(@ENTRY*100,9,30,0,0,0,100,0,4000,4000,0,0,1,5,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Coilskar Commander Say text 5'),
(@ENTRY*100,9,31,0,0,0,100,0,4000,4000,0,0,65,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Resume path');
-- Waypoints for Grom'tor, Son of Oronok from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,-2817.188,1777.806,60.35168, 'Grom''tor, Son of Oronok'),
(@ENTRY,2,-2815.424,1771.031,59.10168, 'Grom''tor, Son of Oronok');
-- SAI for Coilskar Commander
SET @ENTRY := 21295;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,1,8,0,100,0,36539,0,0,0,11,36542,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - cast 36542 on self'),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - set bytes1 7'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - set phase 1'),
(@ENTRY,0,3,4,1,1,100,0,6000,6000,6000,6000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - Coilskar Commander Say text 3 (phase 1)'),
(@ENTRY,0,4,5,61,1,100,0,0,0,0,0,28,36542,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - remove aura 36542 (phase 1)'),
(@ENTRY,0,5,6,61,1,100,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - unset bytes1 7 (phase 1)'),
(@ENTRY,0,6,0,61,1,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - set phase 0 (phase 1)');
-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry` IN (21291,21295);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(21291,0,0, 'I''m through asking nicely, fish-man.',12,0,100,25,0,0, 'Grom''tor, Son of Oronok'),
(21291,1,0, 'Where is the Cipher of Damnation? I know a third of it is in this village.',12,0,100,6,0,0, 'Grom''tor, Son of Oronok'),
(21295,0,0, 'Whhaaat... are you sssspeaking of, ssssoft-sskin?',12,0,100,1,0,0, 'Coilskar Commander'),
(21295,1,0, 'The naga do nottt... have thissss... cipherrr...',12,0,100,1,0,0, 'Coilskar Commander'),
(21291,2,0, 'No... Of course not. What was I thinking? Why would you have a third of the Cipher of Damnation?',12,0,100,274,0,0, 'Grom''tor, Son of Oronok'),
(21291,3,0, 'I feel so stupid. Maybe I should unchain you and set you free?',12,0,100,11,0,0, 'Grom''tor, Son of Oronok'),
(21295,2,0, 'Yesss... Yesss... Ssset me freee...',12,0,100,1,0,0, 'Coilskar Commander'),
(21291,4,0, 'DO I HONESTLY LOOK THAT STUPID TO YOU, NAGA? NOW YOU FEEL PAIN!',12,0,100,5,0,0, 'Grom''tor, Son of Oronok'),
(21291,5,0, '%s spits on the Coilskar naga.',16,0,100,5,0,0, 'Grom''tor, Son of Oronok'),
(21291,6,0, 'GET UP YOU ROTTEN PIECE OF TRASH! GET UP BEFORE I END YOU!',12,0,100,5,0,0, 'Grom''tor, Son of Oronok'),
(21295,3,0, '%s regains consciousness.',16,0,100,0,0,0, 'Coilskar Commander'),
(21291,7,0, 'I''m listening...',12,0,100,273,0,0, 'Grom''tor, Son of Oronok'),
(21295,4,0, 'Do not beat the Coilsssskaarrr commander anymore, orc! I will tell you! The cipherrr... It is hidden in one of the chests at Coilssskarrr Point... The naga there hold the keysss...',12,0,100,1,0,0, 'Coilskar Commander'),
(21295,5,0, 'COILSSSKARRR!',12,0,100,15,0,0, 'Coilskar Commander');

-- ========================
--  2011_05_24_11_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Plagued Proto-Dragon SAI
SET @ENTRY  := 23680;
SET @SPELL  := 21862; -- Radiation
SET @SPELL1 := 9573;  -- Flame Breath
SET @SPELL2 := 3391;  -- Thrash
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,23,0,100,0,@SPELL,0,2000,2000,11,@SPELL,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Plagued Proto-Dragon - Aura Radiation not present - Add Aura Radiation'),
(@ENTRY,0,1,0,0,0,100,0,5000,7000,10000,15000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Plagued Proto-Dragon - Combat - Cast Flame Breath on victim'),
(@ENTRY,0,2,0,0,0,100,0,10000,15000,20000,25000,11,@SPELL2,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Plagued Proto-Dragon - Combat - Cast Thrash on victim');
-- Plagued Proto-Dragon fix InhabitType
UPDATE `creature_template` SET `InhabitType`=7 WHERE entry=@ENTRY;
-- Plagued Proto-Dragon fix model info
UPDATE `creature_model_info` SET `bounding_radius`=0.225,`combat_reach`=3.75,`gender`=0 WHERE `modelid`=24874; -- Plagued Proto-Dragon
-- Plagued Proto-Dragon fix bytes1 and bytes2
DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`) VALUES
(@ENTRY,50331648,1); -- Plagued Proto-Dragon
-- Pathing for Plagued Proto-Dragon Entry: 23680
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
--  2011_05_24_12_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Shadow Adept <Cult of the Damned> SAI
SET @ENTRY   := 31145; -- NPC entry
SET @CHANNEL := 58847; -- Spell to cast
SET @TARGET  := 31245; -- Target creature entry
SET @SPELL1  := 60646; -- Shadow Blast
SET @SPELL2  := 17238; -- Drain Life
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,1000,1000,1000,1000,11,@CHANNEL,2,0,0,0,0,11,@TARGET,30,0,0,0,0,0, 'Shadow Adept - On spawn & reset - Channel Green Cultist Beam on target'),
(@ENTRY,0,1,0,0,0,100,0,4000,7000,6000,9000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Shadow Adept - Combat - Cast Shadow Blast on victim'),
(@ENTRY,0,2,0,2,0,100,0,0,80,20000,30000,11,@SPELL2,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Shadow Adept - Combat - Cast Drain Life on victim');
-- Invisible Ooze Stalker Fixup and set as trigger
UPDATE `creature` SET `modelid`=0,`spawndist`=0,`MovementType`=0 WHERE `id`=31245;
UPDATE `creature_template` SET `InhabitType`=7,`flags_extra`=`flags_extra`|128 WHERE `entry`=31245;

-- ========================
--  2011_05_24_13_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Iron Rune-Weaver SAI
SET @ENTRY   := 26820; -- NPC entry
SET @CHANNEL := 47463; -- Rune-Weaver Channel
SET @TARGET  := 26785; -- Directional Rune
SET @SPELL1  := 52713; -- Rune Weaving
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,1000,1000,1000,1000,11,@CHANNEL,2,0,0,0,0,11,@TARGET,30,0,0,0,0,0, 'Iron Rune-Weaver - On spawn & reset - Channel Rune-Weaver Channel on Directional Rune'),
(@ENTRY,0,1,0,0,0,100,0,4000,7000,10000,16000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Iron Rune-Weaver - Combat - Cast Rune Weaving on victim');
-- Fix Spell condition for Spell 47463 to only target Directional Rune
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=47463;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,47463,0,18,1,26785,0,0,'','Spell 47463 targets only Directional Rune');

-- ========================
--  2011_05_24_14_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Priest of Rhunok SAI
SET @ENTRY   := 28417; -- NPC entry
SET @CHANNEL := 51616; -- Priest of Rhunok: Channel to Prophet
SET @TARGET  := 28442; -- Prophet of Rhunok
SET @SPELL1  := 9734;  -- Holy Smite
SET @SPELL2  := 54518; -- Penance
SET @SPELL3  := 37274; -- Power Infusion
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,1000,1000,1000,1000,11,@CHANNEL,0,0,0,0,0,11,@TARGET,90,0,0,0,0,0, 'Priest of Rhunok - On spawn & reset - Priest of Rhunok: Channel to Prophet'),
(@ENTRY,0,1,0,0,0,100,0,2000,5000,10000,18000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Priest of Rhunok - Combat - Cast Holy Smite on victim'),
(@ENTRY,0,2,0,0,0,100,0,17000,26000,17000,20000,11,@SPELL2,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Priest of Rhunok - Combat - Cast Penance on victim'),
(@ENTRY,0,3,0,0,0,100,0,12000,16000,60000,60000,11,@SPELL3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Priest of Rhunok - Combat - Cast Power Infusion on self');
-- Fix Spell condition for Spell 51616 to only target Prophet of Rhunok
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=51616;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,51616,0,18,1,28442,0,0,'','Spell 51616 targets only Prophet of Rhunok');

-- ========================
--  2011_05_24_15_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=8118 AND `text_id`=10054;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8118,10054);
DELETE FROM `gossip_menu` WHERE `entry`=8119 AND `text_id`=10056;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8119,10056);
DELETE FROM `gossip_menu` WHERE `entry`=8083 AND `text_id`=9993;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8083,9993);
DELETE FROM `gossip_menu` WHERE `entry`=8576 AND `text_id`=10752;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8576,10752);
-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=8646 WHERE `entry`=19539;
UPDATE `creature_template` SET `gossip_menu_id`=8118 WHERE `entry`=20470;
UPDATE `creature_template` SET `gossip_menu_id`=8119 WHERE `entry`=20471;
UPDATE `creature_template` SET `gossip_menu_id`=8083 WHERE `entry`=20084;
UPDATE `creature_template` SET `gossip_menu_id`=8576 WHERE `entry`=22899;
-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7982) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7982,7818) AND `id` IN (1);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(7982,0,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(7982,1,1, 'I want to browse your goods.',3,128,0,0,0,0,0, ''),
(7818,1,1, 'Let me browse your goods.',3,128,0,0,0,0,0, '');
-- SAI for Karaaz,Dealer Aljaan,Dealer Digriz (Netherstorm)
SET @ENTRY := 21878;
UPDATE creature_template SET AIName='SmartAI' WHERE entry IN (20242,19533,19534);
DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid IN (20242,19533,19534);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
(20242,0,0,0,1,0,100,0,1000,30000,60000,120000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Karaaz - OOC - Say Text 0'),
(19533,0,0,0,1,0,100,0,1000,30000,60000,120000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dealer Aljaan - OOC - Say Text 0'),
(19534,0,0,0,1,0,100,0,1000,30000,60000,120000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dealer Digriz - OOC - Say Text 0');
-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry` IN (20242,19533,19534) AND `groupid` IN (0);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(20242,0,0, 'The best selection of smuggled goods is available right here, $N.  Great for the whole family!  Avoid goblin taxation and naaru prohibition - the Consortium is here to fill your every shopping need!',12,0,100,1,0,0, 'Karaaz'),
(19533,0,0, 'A tradesman, perhaps? You need look no further than I for supplies. My prices are quite fair, friend. These items were difficult to acquire, but what does the source matter, eh? You''ll have what you need.',12,0,100,1,0,0, 'Dealer Aljaan'),
(19534,0,0, 'The creatures of this place are strong, wayfarer. You''ll need ample ammunition if you hope to survive. You''re in luck - I am well-stocked with fine arrows, bullets, and throwing weapons. The price is reasonable, considering circumstances.',12,0,100,1,0,0, 'Dealer Digriz');

-- ========================
--  2011_05_24_16_world_sai.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Convert Grimscale Murloc EAI script to SAI
SET @ENTRY   := 15668; -- NPC entry
SET @SPELL   := 26661; -- Fear
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,10000,18000,23000,11,@SPELL,3,0,0,0,0,2,0,0,0,0,0,0,0,'Grimscale Murloc - IC - Cast Fear');

-- ========================
--  2011_05_24_16_world_spell_proc_event.sql  IN  E:\trinitycore_new2\sql\updates\world\
-- ========================

-- Fixed Omen of Clarity proc
UPDATE `spell_proc_event` SET `ppmRate`=0,`CustomChance`=6,`Cooldown`=10 WHERE `entry`=16864;
