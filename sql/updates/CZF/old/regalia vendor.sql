    delete from creature_template where entry=678245;
    INSERT INTO `creature_template` VALUES 
('678245', '0', '0', '0', '0', '0', '30618', '', '', '', "Regalia Vendor", "CZF ", "", '0', '1', '1', '0', '35', '35', '4227', '31.25', '100', '1', '2', '1', '1', '0', '1', '1', '1', '1', '1', '0', '8', '0', '0', '0', '0', '0', '1', '1', '1', '10', '8', '0', '0', '0', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', "", '1', '3', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', "", '-1');

delete from quest_template where entry=999950;
    INSERT INTO `quest_template` VALUES
    (999950, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 136, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regalie', '100EoT za regalii.', 'dones mi 100EoT.', 'dones mi EoT .', 'Dones mi EoT.', '', NULL, 'dones mi EoT', '', '', '', 47241, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 47557, 47558, 47559, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
delete from creature_involvedrelation where quest=999950;
delete from `creature_questrelation` where quest=999950;
    INSERT INTO `creature_involvedrelation` ( `id`, `quest`) VALUES ('678245', '999950');
    INSERT INTO  `creature_questrelation` ( `id`, `quest`) VALUES ('678245', '999950');


UPDATE quest_template SET RewHonorAddition=0 WHERE entry=999950;
UPDATE quest_template SET RewHonorMultiplier=0 WHERE entry=999950;