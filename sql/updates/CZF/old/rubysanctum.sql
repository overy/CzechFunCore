-- General Zarithrian
UPDATE creature_template SET faction_A=103, faction_H=103, speed_walk=2, unit_flags=64 WHERE entry IN (39746,39805);

-- boss template updates 10man
update creature_template set mindmg=509, maxdmg=683, attackpower=805, dmg_multiplier=35, minrangedmg=371, maxrangedmg=535, 
rangedattackpower=135, mechanic_immune_mask=113983487 where entry in (39746,39747,39751,39863,39899);

-- trash template updates 10man
update creature_template set mindmg=422, maxdmg=586, attackpower=642, dmg_multiplier='7.5', minrangedmg=345, maxrangedmg=509, 
rangedattackpower=103, mechanic_immune_mask=113983487 where entry in (39814,26712,39794,40417,40419,40421,40423,40429,40626,40627,40628,40870);

-- respawn for bosses and trash
update creature set spawntimesecs=604800 where id in (39746,39747,39751,39863,39899);   -- bosses
update creature set spawntimesecs=16146 where id in (39814,26712,39794,40417,40419,40421,40423,40429,40626,40627,40628,40870); -- trash 