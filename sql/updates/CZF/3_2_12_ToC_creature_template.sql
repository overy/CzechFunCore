-- update dmg_multiplier (re3, warr, dk) now 40k crit (16k to plate) ........
UPDATE creature_template SET dmg_multiplier = dmg_multiplier*0.4 WHERE entry IN (
-- A DK
34461, 35743, 35744, 35745, 
-- A pala
34471, 35668, 35669, 35670, 
-- A warr
34475, 35737, 35738, 35739, 
-- H DK
34458, 35692, 35693, 35694, 
-- H pala
34456, 35708, 35709, 35710, 
-- H warr
34453, 35718, 35719, 35720);

-- update flags_extra for taunt immunity
UPDATE creature_template SET flags_extra = 257 WHERE entry IN (
34461, 35743, 35744, 35745, 
34471, 35668, 35669, 35670, 
34475, 35737, 35738, 35739, 
34458, 35692, 35693, 35694, 
34456, 35708, 35709, 35710, 
34453, 35718, 35719, 35720,
34460, 35702, 35703, 35704, 
34469, 35714, 35715, 35716, 
34467, 35662, 35663, 35664, 
34468, 35721, 35722, 35723, 
34465, 35746, 35747, 35748, 
34466, 35665, 35666, 35667, 
34473, 35674, 35675, 35676, 
34472, 35699, 35700, 35701, 
34463, 35734, 35735, 35736, 
34470, 35728, 35729, 35730, 
34474, 35731, 35732, 35733,
34451, 35671, 35672, 35673, 
34459, 35686, 35687, 35688, 
34448, 35724, 35725, 35726, 
34449, 35689, 35690, 35691, 
34445, 35705, 35706, 35707, 
34447, 35683, 35684, 35685, 
34441, 34442, 34443, 35749, 
34454, 35711, 35712, 35713, 
34455, 35680, 35681, 35682, 
34444, 35740, 35741, 35742, 
34450, 35695, 35696, 35697);

-- update rogue's dmg (on 25(hc) and 10hc he does 1-3 dmg)
UPDATE `creature_template` SET `mindmg` = '388',`maxdmg` = '583',`dmg_multiplier` = '13' WHERE `creature_template`.`entry` =35711;
UPDATE `creature_template` SET `mindmg` = '388',`maxdmg` = '583',`dmg_multiplier` = '17' WHERE `creature_template`.`entry` =35712;
UPDATE `creature_template` SET `mindmg` = '388',`maxdmg` = '583',`dmg_multiplier` = '19' WHERE `creature_template`.`entry` =35713;