-- SW
delete from smart_scripts where entryorguid=29611;
Insert into smart_scripts values 
(29611, 0, 0, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 41057, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Whirlwind'),
(29611, 0, 1, 0, 0, 0, 100, 0, 50000, 5000, 5000, 5000, 11, 59689, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Heroic Leap');

-- exodar
delete from smart_scripts where entryorguid=17468;
Insert into smart_scripts values 
(17468, 0, 0, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 59700, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Holy Blast'),
(17468, 0, 1, 0, 0, 0, 100, 0, 20000, 20000, 20000, 20000, 11, 59701, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Holy Nova'),
(17468, 0, 2, 0, 0, 0, 100, 0, 22000, 22000, 22000, 22000, 11, 59703, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Holy Smite'),
(17468, 0, 3, 0, 0, 0, 100, 0, 18000, 18000, 18000, 18000, 11, 59698, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prayer of Healing'),
(17468, 0, 4, 0, 0, 0, 100, 0, 8000, 8000, 8000, 8000, 11, 84647, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Staff Strike');


-- darnassus
delete from smart_scripts where entryorguid=7999;
Insert into smart_scripts values 
(7999, 0, 0, 0, 0, 0, 100, 0, 8000, 8000, 8000, 9000, 11, 20691, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cleave'),
(7999, 0, 1, 0, 0, 0, 100, 0, 15000, 15000, 15000, 15000, 11, 20690, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Moonfire'),
(7999, 0, 2, 0, 0, 0, 100, 0, 14000, 14000, 14000, 14000, 11, 20688, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Searing arrow'),
(7999, 0, 3, 0, 0, 0, 100, 0, 18000, 18000, 18000, 18000, 11, 20687, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Starfall');

-- IF
delete from smart_scripts where entryorguid=2784;
Insert into smart_scripts values 
(2784, 0, 0, 0, 0, 0, 100, 0, 8000, 8000, 8000, 8000, 11, 41056, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cleave');

-- update template source Putridus the Ancient probably it is not blizzlike but, better when nothing 
update creature_template set AIname='SmartAI',mechanic_immune_mask=113983487 where entry in (29611,17468,7999,2784);

