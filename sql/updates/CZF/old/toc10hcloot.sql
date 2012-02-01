-- Icehowl
-- 25man
DELETE FROM `world`.`creature_loot_template` WHERE `creature_loot_template`.`entry` = 35447 AND `item` = 1;
DELETE FROM `world`.`creature_loot_template` WHERE `creature_loot_template`.`entry` = 35447 AND `item` = 3;
UPDATE `creature_loot_template` SET `item`='47241' WHERE `entry` =35447 AND `item` IN (45624,49426,40752,47241,40753);
UPDATE `creature_loot_template` SET `mincountOrRef`='6',`maxcount`='8' WHERE `entry` =35447 AND `item` =47241;
UPDATE `creature_loot_template` SET `maxcount`='4' WHERE `entry`=35447 AND `item` =2;
-- 10HC verze
DELETE FROM `world`.`creature_loot_template` WHERE `entry` =35448 AND `item` =1;
DELETE FROM `creature_loot_template` WHERE `entry` =35448 AND `item` =3;
UPDATE `creature_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '10' WHERE `entry` =35448 AND `item` IN (45624,49426,40752,47241,40753);
-- 25Hc verze
DELETE FROM `creature_loot_template` WHERE `entry` =35449 AND `item` =1;
DELETE FROM `creature_loot_template` WHERE `entry` =35449 AND `item` =3;
UPDATE `creature_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '10' WHERE `entry` =35449 AND `item` IN (45624,49426,40752,47241,40753);


-- Lord
-- 25man
DELETE FROM `creature_loot_template` WHERE `entry` =35216 AND `item` =1;
DELETE FROM `creature_loot_template` WHERE `entry` =35216 AND `item` =3;
UPDATE `creature_loot_template` SET `maxcount` = '4' WHERE `entry` =35216 AND `item` =2;
UPDATE `creature_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '8' WHERE `entry` =35216 AND `item` IN (45624,49426,40752,47241,40753);
-- 10hc verze
DELETE FROM `creature_loot_template` WHERE `entry` =35268 AND `item` =1;
DELETE FROM `creature_loot_template` WHERE `entry` =35268 AND `item` =3;
UPDATE `creature_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '10' WHERE `entry` =35268 AND `item` IN (45624,49426,40752,47241,40753);
-- 25hc verze
DELETE FROM `creature_loot_template` WHERE `entry` =35269 AND `item` =1;
DELETE FROM `creature_loot_template` WHERE `entry` =35269 AND `item` =3;
UPDATE `creature_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '10' WHERE `entry` =35269 AND `item` IN (45624,49426,40752,47241,40753);

-- Championi
-- 25man
DELETE FROM `world`.`gameobject_loot_template` WHERE `gameobject_loot_template`.`entry` =27503 AND `gameobject_loot_template`.`item` =1;
DELETE FROM `world`.`gameobject_loot_template` WHERE `gameobject_loot_template`.`entry` =27503 AND `gameobject_loot_template`.`item` =3;
UPDATE `world`.`gameobject_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '10' WHERE `gameobject_loot_template`.`entry` =27503 AND `item` IN (45624,49426,40752,47241,40753);
-- 10hc verze
DELETE FROM `world`.`gameobject_loot_template` WHERE `gameobject_loot_template`.`entry` =27335 AND `gameobject_loot_template`.`item` =1;
DELETE FROM `world`.`gameobject_loot_template` WHERE `gameobject_loot_template`.`entry` =27335 AND `gameobject_loot_template`.`item` =3;
UPDATE `world`.`gameobject_loot_template` SET `maxcount` = '4' WHERE `gameobject_loot_template`.`entry` =27335 AND `gameobject_loot_template`.`item` =2;
UPDATE `world`.`gameobject_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '8' WHERE `gameobject_loot_template`.`entry` =27335 AND `item` IN (45624,49426,40752,47241,40753);
-- 25hc verze
DELETE FROM `world`.`gameobject_loot_template` WHERE `gameobject_loot_template`.`entry` =27356 AND `gameobject_loot_template`.`item` =1;
DELETE FROM `world`.`gameobject_loot_template` WHERE `gameobject_loot_template`.`entry` =27356 AND `gameobject_loot_template`.`item` =3;
UPDATE `world`.`gameobject_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '10' WHERE `gameobject_loot_template`.`entry` =27356 AND `item` IN (45624,49426,40752,47241,40753);

-- Valkyrky
update creature_template set lootid=35347 where entry in (35350);
update creature_template set lootid=35348 where entry in (35351);
update creature_template set lootid=35349 where entry in (35352);
update creature_template set lootid=0 where entry in (35347,35348,35349);
-- 25man
DELETE FROM `creature_loot_template` WHERE `entry` =35347 AND `item` =1;
DELETE FROM `creature_loot_template` WHERE `entry` =35347 AND `item` =3;
UPDATE `creature_loot_template` SET `maxcount` = '4' WHERE `entry` =35347 AND `item` =2;
UPDATE `creature_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '8' WHERE `entry` =35347 AND `item` IN (45624,49426,40752,47241,40753);
-- 10hc verze
DELETE FROM `creature_loot_template` WHERE `entry` =35348 AND `item` =1;
DELETE FROM `creature_loot_template` WHERE `entry` =35348 AND `item` =3;
delete from `creature_loot_template` where entry=35348 and item in (45624,49426,40752,47241,40753);
INSERT INTO `creature_loot_template` (`entry` ,`item` ,`ChanceOrQuestChance` ,`lootmode` ,`groupid` ,`mincountOrRef` ,`maxcount` )VALUES 
('35348', '47241', '100', '1', '0', '6', '10');
-- 25hc verze
DELETE FROM `creature_loot_template` WHERE `entry` =35349 AND `item` =1;
DELETE FROM `creature_loot_template` WHERE `entry` =35349 AND `item` =3;
UPDATE `creature_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '10' WHERE `entry` =35349 AND `item` IN (45624,49426,40752,47241,40753);

-- Anub
-- 25man
DELETE FROM `creature_loot_template` WHERE `entry` =34566 AND `item` =1;
DELETE FROM `creature_loot_template` WHERE `entry` =34566 AND `item` =3;
UPDATE `creature_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '10' WHERE `entry` =34566 AND `item` IN (45624,49426,40752,47241,40753);
UPDATE `creature_loot_template` SET `maxcount` = '4' WHERE `entry` =34566 AND `item` =2;
-- 10hc verze
DELETE FROM `creature_loot_template` WHERE `entry` =35615 AND `item` =1;
DELETE FROM `creature_loot_template` WHERE `entry` =35615 AND `item` =3;
UPDATE `creature_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '10' WHERE `entry` =35615 AND `item` IN (45624,49426,40752,47241,40753);
-- 25hc verze
DELETE FROM `creature_loot_template` WHERE `entry` =35616 AND `item` =1;
DELETE FROM `creature_loot_template` WHERE `entry` =35616 AND `item` =3;
UPDATE `creature_loot_template` SET `item` = '47241',`mincountOrRef` = '6',`maxcount` = '10' WHERE `entry` =35616 AND `item` IN (45624,49426,40752,47241,40753);



