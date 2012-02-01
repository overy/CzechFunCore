delete from reference_loot_template where item=49426 and entry=34172;


update creature_loot_template set maxcount=4 where entry=36612 and mincountorref='-34230';
update creature_loot_template set maxcount=4 where entry=36855 and mincountorref='-34231';
update creature_loot_template set maxcount=4 where entry=36626 and mincountorref='-34232';
update creature_loot_template set maxcount=4 where entry=36627 and mincountorref='-34233';
update creature_loot_template set maxcount=3 where entry=36678 and mincountorref='-34234';
update creature_loot_template set maxcount=3 where entry=37955 and mincountorref='-34236';
update creature_loot_template set maxcount=3 where entry=36853 and mincountorref='-34237';
update creature_loot_template set maxcount=3 where entry=36597 and mincountorref='-34238';

update creature_loot_template set maxcount=4 where entry=37970 and mincountorref='-34235';

update gameobject_loot_template set maxcount=4 where entry=28052 and mincountorref='-34241';
update gameobject_loot_template set maxcount=4 where entry=28046 and mincountorref='-34240';


insert into creature_loot_template values
(36678, 2, 50, 1, 0, '-34172', 1),
(37955, 2, 50, 1, 0, '-34172', 1),
(36853, 2, 50, 1, 0, '-34172', 1);