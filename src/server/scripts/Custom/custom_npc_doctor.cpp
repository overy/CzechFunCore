#include "ScriptPCH.h"

/*
-- EXAMPLE SQL
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES('700555','0','0','0','0','0','736','0','0','0','NPC Doctor','Wolf Officious','','0','80','80','1','35','35','1','1','1.14286','2','0','5000','5000','0','35000','10','1','0','1','512','0','0','0','0','0','0','10000','10000','68','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','20','20','20','0','0','0','0','0','0','0','0','255','0','0','0','custom_npc_doctor','0');
*/

class custom_npc_doctor : public CreatureScript
{
private:
    bool spell_42995,
         spell_48469,
         spell_53307,
         spell_25899,
         spell_48934,
         spell_25898,
         spell_48938,
         spell_48073,
         spell_48169,
         spell_48161;

    void SendMainMenu(Player *player, Creature *_creature)
    {
        spell_42995 = false;
        spell_48469 = false;
        spell_53307 = false;
        spell_25899 = false;
        spell_48934 = false;
        spell_25898 = false;
        spell_48938 = false;
        spell_48073 = false;
        spell_48169 = false;
        spell_48161 = false;

        if(player->GetHealth() < player->GetMaxHealth())
        {
            player->ADD_GOSSIP_ITEM(5, "Restore Health", GOSSIP_SENDER_MAIN, 101);
        }

        if(player->getPowerType() == POWER_MANA)
        {
            if(player->GetPower(POWER_MANA) < player->GetMaxPower(POWER_MANA))
            {
                player->ADD_GOSSIP_ITEM(5, "Restore Mana", GOSSIP_SENDER_MAIN, 102);
            }
        }

        player->ADD_GOSSIP_ITEM(5, "Remove Cooldown", GOSSIP_SENDER_MAIN, 103);

        /*switch(player->GetTeam())
        {
        case ALLIANCE:
            player->ADD_GOSSIP_ITEM(5, "Remove Exhaustion", GOSSIP_SENDER_MAIN, 104);
            break;
			player->ADD_GOSSIP_ITEM(5, "Remove Sated", GOSSIP_SENDER_MAIN, 105);
            break;
        case HORDE:
            player->ADD_GOSSIP_ITEM(5, "Remove Sated", GOSSIP_SENDER_MAIN, 105);
            break;
			player->ADD_GOSSIP_ITEM(5, "Remove Exhaustion", GOSSIP_SENDER_MAIN, 104);
            break;
        default:
            break;
        }*/

		player->ADD_GOSSIP_ITEM(5, "Remove Sated", GOSSIP_SENDER_MAIN, 105);
		player->ADD_GOSSIP_ITEM(5, "Remove Exhaustion", GOSSIP_SENDER_MAIN, 104);
        player->ADD_GOSSIP_ITEM(7, "Buffs", GOSSIP_SENDER_MAIN, 200);
        player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
    }

    void SendSubMenu(Player *player, Creature *_creature)
    {
        if(!player->HasAura(42995) && !spell_42995)
            player->ADD_GOSSIP_ITEM( 5, "Arcane Intellect",              GOSSIP_SENDER_MAIN, 201);

        if(!player->HasAura(48469) && !spell_48469)
            player->ADD_GOSSIP_ITEM( 5, "Mark of the Wild",              GOSSIP_SENDER_MAIN, 202);

        if(!player->HasAura(53307) && !spell_53307)
            player->ADD_GOSSIP_ITEM( 5, "Thorns",                        GOSSIP_SENDER_MAIN, 203);

        if(!player->HasAura(25899) && !spell_25899)
            player->ADD_GOSSIP_ITEM( 5, "Greater Blessing of Sanctuary", GOSSIP_SENDER_MAIN, 204);

        if(!player->HasAura(48934) && !spell_48934)
            player->ADD_GOSSIP_ITEM( 5, "Greater Blessing of Might",     GOSSIP_SENDER_MAIN, 205);

        if(!player->HasAura(25898) && !spell_25898)
            player->ADD_GOSSIP_ITEM( 5, "Greater Blessing of Kings",     GOSSIP_SENDER_MAIN, 206);

        if(!player->HasAura(48938) && !spell_48938)
            player->ADD_GOSSIP_ITEM( 5, "Greater Blessing of Wisdom",    GOSSIP_SENDER_MAIN, 207);

        if(!player->HasAura(48073) && !spell_48073)
            player->ADD_GOSSIP_ITEM( 5, "Divine Spirit",                 GOSSIP_SENDER_MAIN, 208);

        if(!player->HasAura(48169) && !spell_48169)
            player->ADD_GOSSIP_ITEM( 5, "Shadow Protection",             GOSSIP_SENDER_MAIN, 209);

        if(!player->HasAura(48161) && !spell_48161)
            player->ADD_GOSSIP_ITEM( 5, "Power Word: Fortitude",         GOSSIP_SENDER_MAIN, 210);

        player->ADD_GOSSIP_ITEM(11, "<- Back to Main Page",          GOSSIP_SENDER_MAIN, 666);
        player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
    }

public:
    custom_npc_doctor() : CreatureScript("custom_npc_doctor") { }

    bool OnGossipHello(Player *player, Creature *_creature)
    {
        if(player->isInCombat())
        {
            player->CLOSE_GOSSIP_MENU();
            _creature->MonsterWhisper("You are in combat. Come back later!", player->GetGUID());
            return true;
        }

        SendMainMenu(player, _creature);
        return true;
    }

    bool OnGossipSelect(Player *player, Creature *_creature, uint32 sender, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();

        if(player->isInCombat())
        {
            player->CLOSE_GOSSIP_MENU();
            _creature->MonsterWhisper("You are in combat. Come back later!", player->GetGUID());
            return true;
        }

        if(sender != GOSSIP_SENDER_MAIN)
            return true;

        switch(action)
        {
        /****************************************************************************************
         *  MAINS                                                                               *
         ****************************************************************************************/
        case 101: //Restore Health
            player->SetHealth(player->GetMaxHealth());
            player->CastSpell(player, 61456, false);
            _creature->MonsterWhisper("Your Health has been restored.", player->GetGUID());
            break;
        case 102: //Restore Mana
            player->SetPower(POWER_MANA, player->GetMaxPower(POWER_MANA));
            player->CastSpell(player, 61456, false);
            _creature->MonsterWhisper("Your Mana has been restored.", player->GetGUID());
            break;
        case 103: //Remove Cooldown
            player->RemoveAllSpellCooldown();
            player->CastSpell(player, 75459, false);
            _creature->MonsterWhisper("Your cooldowns have been removed.", player->GetGUID());
            break;
        case 104: //Remove Exhaustion
            player->RemoveAurasDueToSpell(57723);
            player->CastSpell(player, 61456, false);
            _creature->MonsterWhisper("Exhaustion has been removed.", player->GetGUID());
            break;
        case 105: //Remove Sated
            player->RemoveAurasDueToSpell(57724);
            player->CastSpell(player, 61456, false);          
            _creature->MonsterWhisper("Sated has been removed.", player->GetGUID());
            break;

        /****************************************************************************************
         *  BUFFS                                                                               *
         ****************************************************************************************/
        case 200:
            //SendSubMenu(player, _creature);
            break;
        case 201: // Arcane Intellect
            _creature->CastSpell(player, 42995, false);
            spell_42995 = true;
            break;
        case 202: // Mark of the Wild
            _creature->CastSpell(player, 48469, false);
            spell_48469 = true;
            break;
        case 203: // Thorns
            _creature->CastSpell(player, 53307, false);
            spell_53307 = true;
            break;
        case 204: // Greater Blessing of Sanctuary
            _creature->AddAura(25899, player);
            spell_25899 = true;
            // REMOVE COLISION AURAS ---->>
            player->RemoveAurasDueToSpell(48934);
            player->RemoveAurasDueToSpell(25898);
            player->RemoveAurasDueToSpell(48938);
            spell_48934 = false;
            spell_25898 = false;
            spell_48938 = false;
            // <<---- REMOVE COLISION AURAS
            break;
        case 205: // Greater Blessing of Might
			_creature->AddAura(48934, player);
            spell_48934 = true;
            // REMOVE COLISION AURAS ---->>
            player->RemoveAurasDueToSpell(25899);
            player->RemoveAurasDueToSpell(25898);
            player->RemoveAurasDueToSpell(48938);
            spell_25899 = false;
            spell_25898 = false;
            spell_48938 = false;
            // <<---- REMOVE COLISION AURAS
            break;
        case 206: // Greater Blessing of Kings
			_creature->AddAura(25898, player);
            spell_25898 = true;
            // REMOVE COLISION AURAS ---->>
            player->RemoveAurasDueToSpell(25899);
            player->RemoveAurasDueToSpell(48934);
            player->RemoveAurasDueToSpell(48938);
            spell_25899 = false;
            spell_48934 = false;
            spell_48938 = false;
            // <<---- REMOVE COLISION AURAS
            break;
        case 207: // Greater Blessing of Wisdom
			_creature->AddAura(48938, player);
            spell_48938 = true;
            // REMOVE COLISION AURAS ---->>
            player->RemoveAurasDueToSpell(25899);
            player->RemoveAurasDueToSpell(48934);
            player->RemoveAurasDueToSpell(25898);
            spell_25899 = false;
            spell_48934 = false;
            spell_25898 = false;
            // <<---- REMOVE COLISION AURAS
            break;
        case 208: // Divine Spirit
            _creature->CastSpell(player, 48073, false);
            spell_48073 = true;
            break;
        case 209: // Shadow Protection
            _creature->CastSpell(player, 48169, false);
            spell_48169 = true;
            break;
        case 210: // Power Word: Fortitude
            _creature->CastSpell(player, 48161, false);
            spell_48161 = true;
            break;

        /****************************************************************************************
         *  MAIN MENU                                                                           *
         ****************************************************************************************/
        case 666:
            SendMainMenu(player, _creature);
            break;
        default:
            player->CLOSE_GOSSIP_MENU();
            return true;
        }

        if(action >= 100 && action < 200)
            SendMainMenu(player, _creature);

        if(action >= 200 && action < 300)
            SendSubMenu(player, _creature);

        return true;
    }
};

void AddSC_custom_npc_doctor()
{
    new custom_npc_doctor();
}