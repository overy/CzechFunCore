-- CleanUp
DELETE FROM `spell_area` WHERE `area` in (4812,3456,4493,4665,4722,4500) AND `spell` IN (73825,73819,73822,73828,73821,73827,73820,73826,73819,73825,73818,73824,73816,73762);

-- 30%
/*
INSERT INTO `spell_area` (`spell`,`area`,`racemask`,`gender`,`autocast`) VALUES
(73822,4812,690,2,1),
(73828,4812,1101,2,1);
*/

-- 25%

INSERT INTO `spell_area` (`spell`,`area`,`racemask`,`gender`,`autocast`) VALUES
(73821,4812,690,2,1),
(73827,4812,1101,2,1);


-- 20%
/*
INSERT INTO `spell_area` (`spell`,`area`,`racemask`,`gender`,`autocast`) VALUES
(73820,4812,690,2,1),
(73826,4812,1101,2,1);
*/

-- 15%
-- ICC
/*
INSERT INTO `spell_area` (`spell`,`area`,`racemask`,`gender`,`autocast`) VALUES
(73819,4812,690,2,1),
(73825,4812,1101,2,1);
*/

-- 10%
/*
INSERT INTO `spell_area` (`spell`,`area`,`racemask`,`gender`,`autocast`) VALUES
(73818,4812,690,2,1),
(73824,4812,1101,2,1);
*/

-- 5%
/*
INSERT INTO `spell_area` (`spell`,`area`,`racemask`,`gender`,`autocast`) VALUES
(73816,4812,690,2,1),
(73762,4812,1101,2,1);
*/