delete from city_capture_ports where city_id=2;
insert into city_capture_ports values 
(2,0,2937.0473,-1400.6788,165.9437,4.2499,0),
(2,1,2539.9565,-1937.5093,91.9137,0.3535,0);

delete from city_capture_cities where id=2;
insert into city_capture_cities values
(2,1,80,'Hearthglen',0);

delete from city_capture_bosses where city_id=2;
insert into city_capture_bosses values
(2,1842,1842,150010,0);

delete from creature_template where entry=150010;
INSERT INTO `creature_template` VALUES 
(150010, 0, 0, 0, 0, 0, 328, 0, 328, 0, 'CQ: Boss Spawning Bunny Hearthglen', '', '', 0, 82, 82, 0, 35, 35, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2000, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 43, 1, 0, 0, 130, 'city_conquest_spawner', 0);

delete from creature where id=150010;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (150010, 1, 1, 1, 0, 0, 2942.432129, -1390.144043, 167.237503, 4.271054, 300, 0, 0, 4518, 4169, 0, 0);

delete from city_capture_creatures where city_id=2;
insert into city_capture_creatures values
(2,1827,210,83),
(2,1885,210,83),
(2,1834,210,83),
(2,10608,210,83),
(2,1836,210,83),
(2,1832,210,83),
(2,1846,210,83),
(2,1883,210,83);

update creature_template set minlevel=80,maxlevel=80,exp=2,faction_A=210,faction_H=210,npcflag=0,unit_flags=0,dynamicflags=0,type_flags=0,rank=1,movementtype=1,mindmg=422,maxdmg=586,attackpower=642,dmg_multiplier=10,Health_mod=13,ScriptName='city_conquest_generic' where entry in (1827,1834,10608,1836,1832,1846,500301,1885);
update creature_template set minlevel=80,maxlevel=80,exp=2,faction_A=210,faction_H=210,npcflag=0,unit_flags=0,dynamicflags=0,type_flags=0,rank=1,movementtype=1,mindmg=422,maxdmg=586,attackpower=642,dmg_multiplier=6,Health_mod=5,ScriptName='city_conquest_generic' where entry in (1883);
update creature_template set minlevel=80,maxlevel=80,exp=2,faction_A=210,faction_H=210,npcflag=0,unit_flags=0,dynamicflags=0,type_flags=0,movementtype=1,rank=1,mindmg=422,maxdmg=586,attackpower=642,dmg_multiplier=18,Health_mod=20,ScriptName='city_conquest_boss' where entry in (1842);
	
update creature_template set flags_extra=32768 where entry in (1827,1885,1834,10608,1836,1832,1846,1883);
update creature_template set mechanic_immune_mask=604706397 where entry in (1827,1885,1834,10608,1836,1832,1846,1883);
update creature_template set `mechanic_immune_mask`=`mechanic_immune_mask`|4|8|16|64|128|256|512|1024|4096|65536|131072|524288|67108864|536870912 where entry in (1842);
	
