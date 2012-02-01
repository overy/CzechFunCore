-- Hildana Deathstealer
delete from smart_scripts where entryorguid=32495;
Insert into smart_scripts values 
(32495, 0, 0, 0, 0, 0, 100, 0, 9000, 9000, 9000, 9000, 11, 60991, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Lash'),
(32495, 0, 1, 0, 0, 0, 100, 0, 20000, 20000, 20000, 20000, 11, 57547, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Touch of the Valkyr');

-- High Thane Jorfus
delete from smart_scripts where entryorguid=32501;
Insert into smart_scripts values 
(32501, 0, 0, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 60950, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Blood Plague'),
(32501, 0, 1, 0, 0, 0, 100, 0, 20000, 20000, 20000, 20000, 11, 60945, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Blood Strike'),
(32501, 0, 2, 0, 0, 0, 100, 0, 30000, 30000, 30000, 30000, 11, 60953, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Death and Decay'),
(32501, 0, 3, 0, 0, 0, 100, 0, 18000, 18000, 18000, 18000, 11, 60949, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Death Coil'),
(32501, 0, 4, 0, 0, 0, 100, 0, 15000, 15000, 15000, 15000, 11, 60951, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Frost Strike');

-- update template source Putridus the Ancient probably it is not blizzlike but, better when nothing 
update creature_template set AIname='SmartAI',faction_A=16,faction_H=16,mindmg=422,maxdmg=586,attackpower=642,minrangedmg=345,maxrangedmg=509,rangedattackpower=103,mechanic_immune_mask=8388624 where entry in (32501,32495);

