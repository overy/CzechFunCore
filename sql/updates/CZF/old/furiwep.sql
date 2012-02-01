
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
(100010, 0, 0, 0, 0, 0, 28202, 0, 0, 0, 'Furious Gladiator Weapons', 'Furious Gladiator Weapons', '', 0, 80, 80, 0, 35, 35, 128, 1, 1.14286, 1, 0, 422, 586, 0, 642, 1, 1000, 1000, 1, 0, 8, 0, 0, 0, 0, 0, 345, 509, 103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1643, 617299803, 0, '', 1);

delete from npc_vendor where entry=100010;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
-- tho hands
(100010, 0, 42364, 0, 0, 2965),
(100010, 0, 42323, 0, 0, 2965),
(100010, 0, 42318, 0, 0, 2965),
(100010, 0, 42385, 0, 0, 2965),
(100010, 0, 44422, 0, 0, 2965),
(100010, 0, 42333, 0, 0, 2965),
(100010, 0, 42328, 0, 0, 2965),
(100010, 0, 42391, 0, 0, 2965),
(100010, 0, 44421, 0, 0, 2965),
-- one + main hands
(100010, 0, 42209, 0, 0, 2403),
(100010, 0, 42353, 0, 0, 2403),
(100010, 0, 42276, 0, 0, 2403),
(100010, 0, 42261, 0, 0, 2403),
(100010, 0, 42243, 0, 0, 2403),
(100010, 0, 42286, 0, 0, 2403),
(100010, 0, 42347, 0, 0, 2403),
(100010, 0, 42238, 0, 0, 2403),
-- off hand
(100010, 0, 42565, 0, 0, 2237),
(100010, 0, 42281, 0, 0, 2237),
(100010, 0, 42526, 0, 0, 2237),
(100010, 0, 42538, 0, 0, 2237),
(100010, 0, 42228, 0, 0, 2237),
(100010, 0, 42233, 0, 0, 2237),
(100010, 0, 42266, 0, 0, 2237),
(100010, 0, 42271, 0, 0, 2237),
(100010, 0, 42256, 0, 0, 2237),
(100010, 0, 42291, 0, 0, 2237),
(100010, 0, 42571, 0, 0, 2237),
(100010, 0, 42532, 0, 0, 2237),
(100010, 0, 42560, 0, 0, 2237),
(100010, 0, 42249, 0, 0, 2237),
-- ranged
(100010, 0, 42514, 0, 0, 2965),
(100010, 0, 42496, 0, 0, 2965),
(100010, 0, 42491, 0, 0, 2965),
(100010, 0, 42520, 0, 0, 2965),
(100010, 0, 42486, 0, 0, 2965),
(100010, 0, 42503, 0, 0, 2965),
-- relic
(100010, 0, 42589, 0, 0, 125),
(100010, 0, 42584, 0, 0, 125),
(100010, 0, 42579, 0, 0, 125),
(100010, 0, 42853, 0, 0, 125),
(100010, 0, 42615, 0, 0, 125),
(100010, 0, 42621, 0, 0, 125),
(100010, 0, 42608, 0, 0, 125),
(100010, 0, 42603, 0, 0, 125),
(100010, 0, 42598, 0, 0, 125);
