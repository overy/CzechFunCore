#include "ScriptPCH.h"
//  37541-CRYPT RAIDER    3.
//  37538-scourge zombie  1.
//  37539 ghoul invader   2.
//  37542 morlen coldgrip 4.

#define SAY01 "blabla"
#define SAY02 "blabla"

enum quest
{
	QUEST_Thalorien_Dawnseeker    = 24535
};

enum spells
{
	// Crypt raider
    CRYPT_SCARABS                                          = 31600,
	// Scourge zombie
    INFECTED_BITE                                          = 49861,
	// Ghoul invader
    FLESH_RIP                                              = 38056,
	// Morlen coldgrip
    BLOOD_PRESENCE                                         = 50689,
    PLAGUE_STRIKE                                          = 50688,
	KILL_CREDIT											   = 70265
};

enum creatures
{
	SCOURGE_ZOMBIE											= 37538,
	GHOUL_INVADER											= 37539, 
	CRYPT_RAIDER											= 37541
};

/*#########
# Thalorien Dawnseeker's Remains
#########*/
class thalorien_dawnseeker_remains : public CreatureScript
{
public:
        thalorien_dawnseeker_remains() : CreatureScript("thalorien_dawnseeker_remains") {}
        
    bool OnGossipHello(Player *player, Creature *_creature)
    {
        player->ADD_GOSSIP_ITEM( 7, "Examine the remains", GOSSIP_SENDER_MAIN, 1);
        player->ADD_GOSSIP_ITEM( 5, "< - [Close]"        , GOSSIP_SENDER_MAIN, 2);       
        player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
    {
        if(creature->FindNearestCreature(37205,10.0f))
        {
                player->CLOSE_GOSSIP_MENU();
                return false;
        }

        if(sender == GOSSIP_SENDER_MAIN)
        {
            switch(action)
            {
            case 1: // Summon
                player->CLOSE_GOSSIP_MENU();
                player->SummonCreature(37205, player->GetPositionX(), player->GetPositionY(), player->GetPositionZ() + 0.15f, 0, TEMPSUMMON_TIMED_DESPAWN, 180000);
                    break;
            case 2: //Close
                player->CLOSE_GOSSIP_MENU();
                    break;  
            }
        }
      return true;
    }
};

void AddSC_thalorien_dawnseeker_remains()
{
    new thalorien_dawnseeker_remains;
}

/*#########
# Thalorien Dawnseeker
#########*/
class thalorien_dawnseeker : public CreatureScript
    {
    public:
        thalorien_dawnseeker() : CreatureScript("thalorien_dawnseeker") { }

		struct thalorien_dawnseekerAI : public ScriptedAI
		{
			thalorien_dawnseekerAI(Creature *c) : ScriptedAI(c) {}

			bool summoned;

			void Reset()
			{
				summoned = false;
			}

			void EnterCombat(Unit * target)
			{
			}

			void JustDied(Unit *killer)
			{
			}

			void MoveInLineOfSight(Unit* who)
			{
				if (!who)
					return;
				if (me->IsWithinDistInMap(who, 20) && summoned == false)
				{
					me->SummonCreature(37542, 11763.03222f, -7048.968262f, 25.723845f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
					summoned = true;
				}
			}

			void UpdateAI(const uint32 uiDiff)
			{
				if (!UpdateVictim())
					return;

				DoMeleeAttackIfReady();
			}
		};

CreatureAI *GetAI(Creature *creature) const
{
    return new thalorien_dawnseekerAI(creature);
}

};

void AddSC_thalorien_dawnseeker()
{
    new thalorien_dawnseeker;
}

/*#########
# Morle Coldgrip
#########*/
class morlen_coldgrip : public CreatureScript
    {
    public:
        morlen_coldgrip() : CreatureScript("morlen_coldgrip") { }

		struct morlen_coldgripAI : public ScriptedAI
		{
			morlen_coldgripAI(Creature *c) : ScriptedAI(c) {}

			// waves
			uint32 waveoneTimer;
			uint32 wavetwoTimer;
			uint32 wavethreeTimer;
			uint32 phasetwoTimer;
			bool waveone;
			bool wavetwo;
			bool wavethree;
			bool phaseone;
			// spells
			uint32 PLAGUE_STRIKETimer;

			void Reset()
			{
				// waves
				waveoneTimer   = 15000;
				wavetwoTimer   = 30000;
				wavethreeTimer = 45000;
				phasetwoTimer  = 60000;
				waveone = false;
				wavetwo = false;
				wavethree = false;
				phaseone = false;
				// spells
				PLAGUE_STRIKETimer = 10000;
			}

			void EnterCombat(Unit * target)
			{
				me->AttackStop();
				me->SetReactState(REACT_PASSIVE);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED | UNIT_FLAG_NON_ATTACKABLE);
				DoCast(me, BLOOD_PRESENCE);
			}

			void JustDied(Unit* killer)
			{
			}

			void UpdateAI(const uint32 uiDiff)
			{
				if (!UpdateVictim())
					return;

				// 1. wave (5)
				if (waveoneTimer <= uiDiff && waveone==false)
					{
						me->SummonCreature(SCOURGE_ZOMBIE, 11760.03222f, -7057.002246f, 25.775763f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT); 
						me->SummonCreature(SCOURGE_ZOMBIE, 11760.03222f, -7061.301582f, 25.832697f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT); 
						me->SummonCreature(SCOURGE_ZOMBIE, 11760.03222f, -7064.491699f, 25.782633f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
						me->SummonCreature(SCOURGE_ZOMBIE, 11760.03222f, -7067.491699f, 25.782633f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
						me->SummonCreature(SCOURGE_ZOMBIE, 11760.03222f, -7070.168457f, 25.739845f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
						waveoneTimer = 15000;
						waveone = true;
					} else waveoneTimer -= uiDiff;

				// 2. wave (4)
				if (wavetwoTimer <= uiDiff && wavetwo==false)
					{
						me->SummonCreature(GHOUL_INVADER, 11760.03222f, -7061.301582f, 25.832697f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT); 
						me->SummonCreature(GHOUL_INVADER, 11760.03222f, -7064.491699f, 25.782633f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT); 
						me->SummonCreature(GHOUL_INVADER, 11760.03222f, -7067.491699f, 25.782633f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
						me->SummonCreature(GHOUL_INVADER, 11760.03222f, -7070.168457f, 25.739845f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
						wavetwoTimer = 30000;
						wavetwo = true;
					} else wavetwoTimer -= uiDiff;

				// 3. wave (3)
				if (wavethreeTimer <= uiDiff && wavethree==false)
					{
						me->SummonCreature(CRYPT_RAIDER, 11760.03222f, -7061.301582f, 25.832697f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT); 
						me->SummonCreature(CRYPT_RAIDER, 11760.03222f, -7064.491699f, 25.782633f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT); 
						me->SummonCreature(CRYPT_RAIDER, 11760.03222f, -7067.491699f, 25.802633f + 0.15f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
						phaseone = true;
						wavethree = true;
						wavethreeTimer = 45000;
					} else wavethreeTimer -= uiDiff;

				if (phaseone == true && phasetwoTimer <= uiDiff)
				{
					me->SetReactState(REACT_AGGRESSIVE);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_STUNNED);
					// Plague strike
					if (PLAGUE_STRIKETimer <= uiDiff)
					{
						DoCast(me->getVictim(), PLAGUE_STRIKE);
						PLAGUE_STRIKETimer = 7000;
						phasetwoTimer = 60000;
					} else PLAGUE_STRIKETimer -= uiDiff;
				} else phasetwoTimer -= uiDiff;

				DoMeleeAttackIfReady();
			}
		};

CreatureAI *GetAI(Creature *creature) const
{
    return new morlen_coldgripAI(creature);
}

};

void AddSC_morlen_coldgrip()
{
    new morlen_coldgrip;
}