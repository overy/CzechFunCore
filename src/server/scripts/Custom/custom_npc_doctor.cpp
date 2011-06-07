    #include "ScriptPCH.h"

    #define MSG1    100001
    #define MSG2    100002

    class custom_npc_doctor : public CreatureScript
    {
    public:
        custom_npc_doctor() : CreatureScript("custom_npc_doctor") { }

        bool OnGossipHello(Player *player, Creature *_creature)
        {
            if (player->isInCombat())
            {
                player->CLOSE_GOSSIP_MENU();
                _creature->MonsterWhisper("You are in combat. Come back later!", player->GetGUID());
                return true;
            }

            player->SEND_GOSSIP_MENU(MSG1, _creature->GetGUID());

            player->ADD_GOSSIP_ITEM(5, "Restore Health", GOSSIP_SENDER_MAIN, 7001);
            player->ADD_GOSSIP_ITEM(5, "Restore Mana", GOSSIP_SENDER_MAIN, 7002);
            player->ADD_GOSSIP_ITEM(5, "Remove Cooldown", GOSSIP_SENDER_MAIN, 7003);
            player->ADD_GOSSIP_ITEM(5, "Remove sickness", GOSSIP_SENDER_MAIN, 9012);
            if ( player->GetTeam() == ALLIANCE )
            {
                player->ADD_GOSSIP_ITEM(5, "Remove Exhaustion", GOSSIP_SENDER_MAIN, 7004);
            }
            if ( player->GetTeam() == HORDE )
            {
                player->ADD_GOSSIP_ITEM(5, "Remove Sated", GOSSIP_SENDER_MAIN, 7005);
            }
            player->ADD_GOSSIP_ITEM(7, "Buffs", GOSSIP_SENDER_MAIN, 7006);


            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
            return true;
        }

        bool OnGossipSelect(Player *player, Creature *_creature, uint32 sender, uint32 action)
        {
            if (player->isInCombat())
            {
                player->CLOSE_GOSSIP_MENU();
                _creature->MonsterWhisper("You are in combat. Come back later!", player->GetGUID());
                return true;
            }

            if (sender != GOSSIP_SENDER_MAIN)
                return true;

            switch(action)
            {
            case 7000: //Menu - Main
                    player->SEND_GOSSIP_MENU(MSG1, _creature->GetGUID());
                    player->ADD_GOSSIP_ITEM(5, "Restore Health", GOSSIP_SENDER_MAIN, 7001);
                    player->ADD_GOSSIP_ITEM(5, "Restore Mana", GOSSIP_SENDER_MAIN, 7002);
                    player->ADD_GOSSIP_ITEM(5, "Remove Cooldown", GOSSIP_SENDER_MAIN, 7003);
                    if ( player->GetTeam() == ALLIANCE )
                    {
                        player->ADD_GOSSIP_ITEM(5, "Remove Exhaustion", GOSSIP_SENDER_MAIN, 7004);
                    }
                    if ( player->GetTeam() == HORDE )
                    {
                        player->ADD_GOSSIP_ITEM(5, "Remove Sated", GOSSIP_SENDER_MAIN, 7005);
                    }
                    player->ADD_GOSSIP_ITEM(11, "Buffs", GOSSIP_SENDER_MAIN, 7006);
                    player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
                    break;
            case 7001: //Restore Health
                    player->CLOSE_GOSSIP_MENU();
                    player->SetHealth(player->GetMaxHealth());
                    player->CastSpell(player,61456,false);
                    _creature->MonsterWhisper("Your Health has been restored.", player->GetGUID());
                    break;
            case 7002: //Restore Mana
                    player->CLOSE_GOSSIP_MENU();
                    player->SetPower(POWER_MANA, player->GetMaxPower(POWER_MANA));
                    player->CastSpell(player,61456,false);
                    _creature->MonsterWhisper("Your Mana has been restored.", player->GetGUID());
                    break;
            case 7003: //Remove Cooldown
                    player->CLOSE_GOSSIP_MENU();
                    player->RemoveAllSpellCooldown();
                    player->CastSpell(player,75459,false);
                    _creature->MonsterWhisper("Your cooldowns have been removed.", player->GetGUID());
                    break;
            case 7004: //Remove Exhaustion
                    player->CLOSE_GOSSIP_MENU();
                    player->RemoveAurasDueToSpell(57723);
                    player->CastSpell(player,61456,false);
                    _creature->MonsterWhisper("Exhaustion has been removed.", player->GetGUID());
                    break;
            case 7005: //Remove Sated
                    player->CLOSE_GOSSIP_MENU();
                    player->RemoveAurasDueToSpell(57724);
                    player->CastSpell(player,61456,false);         
                    _creature->MonsterWhisper("Sated has been removed.", player->GetGUID());
                    break;
            case 7006:
                    player->SEND_GOSSIP_MENU(MSG2, _creature->GetGUID());
                    player->ADD_GOSSIP_ITEM(5, "Arcane Intellect", GOSSIP_SENDER_MAIN, 9001);
                    player->ADD_GOSSIP_ITEM(5, "Mark of the Wild", GOSSIP_SENDER_MAIN, 9002);
                    player->ADD_GOSSIP_ITEM(5, "Thorns", GOSSIP_SENDER_MAIN, 9003);
                    player->ADD_GOSSIP_ITEM(5, "Greater Blessing of Sanctuary", GOSSIP_SENDER_MAIN, 9004);
                    player->ADD_GOSSIP_ITEM(5, "Greater Blessing of Might", GOSSIP_SENDER_MAIN, 9005);
                    player->ADD_GOSSIP_ITEM(5, "Greater Blessing of Kings", GOSSIP_SENDER_MAIN, 9006);
                    player->ADD_GOSSIP_ITEM(5, "Greater Blessing of Wisdom", GOSSIP_SENDER_MAIN, 9007);
                    player->ADD_GOSSIP_ITEM(5, "Divine Spirit", GOSSIP_SENDER_MAIN, 9008);
                    player->ADD_GOSSIP_ITEM(5, "Shadow Protection", GOSSIP_SENDER_MAIN, 9009);
                    player->ADD_GOSSIP_ITEM(5, "Power Word: Fortitude", GOSSIP_SENDER_MAIN, 9010);
                    player->ADD_GOSSIP_ITEM(11, "<- Back to Main Page", GOSSIP_SENDER_MAIN, 7000);
                    player->ADD_GOSSIP_ITEM(11, "Close menu", GOSSIP_SENDER_MAIN, 9011);
                    player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
                    break;
            case 9001: // Buff me Arcane Intellect
                    player->CLOSE_GOSSIP_MENU();
                    _creature->CastSpell(player,42995,false);
                    break;
            case 9002: // Buff me Mark of the Wild
                    player->CLOSE_GOSSIP_MENU();
                    _creature->CastSpell(player,48469,false);
                    break;
            case 9003: // Buff me Thorns
                    player->CLOSE_GOSSIP_MENU();
                    _creature->CastSpell(player,53307,false);
                    break;
            case 9004: // Buff me Greater Blessing of Sanctuary
                    player->CLOSE_GOSSIP_MENU();
                    _creature->CastSpell(player,25899,false);
                    break;
            case 9005: // Buff me Greater Blessing of Might
                    player->CLOSE_GOSSIP_MENU();
                    _creature->CastSpell(player,48934,false);
                    break;
            case 9006: // Buff me Greater Blessing of Kings
                    player->CLOSE_GOSSIP_MENU();
                    _creature->CastSpell(player,25898,false);
                    break;
            case 9007: // Buff me Greater Blessing of Wisdom
                    player->CLOSE_GOSSIP_MENU();
                    _creature->CastSpell(player,48938,false);
                    break;
            case 9008: // Buff me Divine Spirit
                    player->CLOSE_GOSSIP_MENU();
                    _creature->CastSpell(player,48073,false);
                    break;
            case 9009: // Buff me Power Word: Fortitude
                    player->CLOSE_GOSSIP_MENU();
                    _creature->CastSpell(player,48169,false);
                    break;
            case 9010: // Buff me Shadow Protection
                    player->CLOSE_GOSSIP_MENU();
                    _creature->CastSpell(player,48161,false);
                    break;
            case 9011: //Close menu
                    player->CLOSE_GOSSIP_MENU();
                    break;
            case 9012: //Remove RS
                    player->CLOSE_GOSSIP_MENU();
                    player->RemoveAurasDueToSpell(15007);
                    player->CastSpell(player,61456,false);         
                    _creature->MonsterWhisper("sickness has been removed.", player->GetGUID());

            default:
                    break;
            }

            return true;

        }
    };

    void AddSC_custom_npc_doctor()
    {
        new custom_npc_doctor();
    }
