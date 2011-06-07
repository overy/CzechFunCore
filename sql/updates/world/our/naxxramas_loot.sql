UPDATE creature_loot_template SET maxcount=4 WHERE entry=15956 AND mincountOrRef=-34098;
UPDATE creature_loot_template SET maxcount=4 WHERE entry=15953 AND mincountOrRef=-34099;
UPDATE creature_loot_template SET maxcount=4 WHERE entry=15952 AND mincountOrRef=-34040;
UPDATE creature_loot_template SET maxcount=4 WHERE entry=15954 AND mincountOrRef=-34042;
UPDATE creature_loot_template SET maxcount=4 WHERE entry=15936 AND mincountOrRef=-34041;
UPDATE creature_loot_template SET maxcount=4 WHERE entry=16061 AND mincountOrRef=-34102;
UPDATE creature_loot_template SET maxcount=4 WHERE entry=16060 AND mincountOrRef=-34103;
UPDATE creature_loot_template SET maxcount=4 WHERE entry=16028 AND mincountOrRef=-34100;
UPDATE creature_loot_template SET maxcount=4 WHERE entry=15931 AND mincountOrRef=-34101;
UPDATE creature_loot_template SET maxcount=4 WHERE entry=15989 AND mincountOrRef=-34043;
UPDATE creature_loot_template SET maxcount=4 WHERE entry=15990 AND mincountOrRef=-34044;


UPDATE creature_loot_template SET groupid=2 WHERE entry=16011 AND item IN (39256,39257);
UPDATE creature_loot_template SET groupid=3 WHERE entry=16011 AND item IN (39258,39259);
UPDATE creature_loot_template SET groupid=4 WHERE entry=16011 AND item IN (39260,40622);
UPDATE creature_loot_template SET groupid=5 WHERE entry=16011 AND item IN (40623,40624);



UPDATE creature_loot_template SET groupid=2 WHERE entry=15932 AND item IN (39146,39188);
UPDATE creature_loot_template SET groupid=2 WHERE entry=15932 AND item IN (39191,39193);
UPDATE creature_loot_template SET groupid=2 WHERE entry=15932 AND item IN (39194,39200);
UPDATE creature_loot_template SET groupid=2 WHERE entry=15932 AND item IN (39215,39232);
UPDATE creature_loot_template SET groupid=3 WHERE entry=15932 AND item IN (39237,39248);
UPDATE creature_loot_template SET groupid=3 WHERE entry=15932 AND item IN (39251,39272);
UPDATE creature_loot_template SET groupid=3 WHERE entry=15932 AND item IN (39279,39281);
UPDATE creature_loot_template SET groupid=3 WHERE entry=15932 AND item IN (39284,39294);

UPDATE creature_loot_template SET groupid=4 WHERE entry=15932 AND item IN (39309,39344);
UPDATE creature_loot_template SET groupid=4 WHERE entry=15932 AND item IN (39345,39379);
UPDATE creature_loot_template SET groupid=4 WHERE entry=15932 AND item IN (39388,39394);
UPDATE creature_loot_template SET groupid=4 WHERE entry=15932 AND item IN (39396,40610);

UPDATE creature_loot_template SET groupid=5 WHERE entry=15932 AND item IN (40611,40612);
UPDATE creature_loot_template SET groupid=5 WHERE entry=15932 AND item IN (40619,40620);
UPDATE creature_loot_template SET groupid=5 WHERE entry=15932 AND item IN (40621,40622);
UPDATE creature_loot_template SET groupid=5 WHERE entry=15932 AND item IN (40623,40624);


delete from creature_loot_template where entry=25192;
UPDATE gameobject_loot_template SET groupid=1 WHERE entry=25192 AND item IN (39393,39394);
UPDATE gameobject_loot_template SET groupid=2 WHERE entry=25192 AND item IN (39395,39396);
UPDATE gameobject_loot_template SET groupid=3 WHERE entry=25192 AND item IN (39397,40610);
UPDATE gameobject_loot_template SET groupid=4 WHERE entry=25192 AND item IN (40611,40612);
	
UPDATE creature_loot_template SET groupid=1 WHERE entry=15928 AND item IN (39291,39292);
UPDATE creature_loot_template SET groupid=2 WHERE entry=15928 AND item IN (39293,39294);
UPDATE creature_loot_template SET groupid=3 WHERE entry=15928 AND item IN (39295,40619);
UPDATE creature_loot_template SET groupid=4 WHERE entry=15928 AND item IN (40620,40621);

delete from gameobject_loot_template where entry=25192 and item=45624;
INSERT INTO gameobject_loot_template (entry,item,ChanceOrQuestChance,lootmode,groupid,mincountOrRef,maxcount)
VALUES
(25192,40753,100,1,0,1,2);




