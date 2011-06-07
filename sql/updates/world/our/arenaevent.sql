delete from `game_event` where `Evententry`=255;
INSERT INTO `game_event` VALUES ('255', '2008-01-01 10:00:00', '2008-12-30 22:00:00', 1440, 720, 0, 'Arena Masteri', 0);
	
delete from `creature` where `id` in (21235,32333,19858,29568,19911,19923,18895,26760,20497,20499,18439,25991,19859,19915,19925,32330,32332,19909,29533,30610,19912);
	
-- delete from `game_event_creature` where `evententry`=255;	
-- Insert INTO `game_event_creature` VALUES 
('255', '2105343'), -- guid, event 
('255', '2105344'); -- guid, event 

-- delete from `creature_addon` where `guid` in (4762,23278,24709,32069,46187,95087,95134,95238,95275,95339,95376,95492,95531,95626,95679,95741,95818,95885,95923,96001,96074,96145,96198,96212,96322,96399,96443,96505,96529,102603,102673,102693,104242,9977484);