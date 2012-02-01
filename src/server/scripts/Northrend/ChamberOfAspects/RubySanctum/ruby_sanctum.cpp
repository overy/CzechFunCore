/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// Based on /dev/rsa modified by Vlad
// need testing

#include "ScriptPCH.h"
#include "ruby_sanctum.h"

enum TrashSpells
{
    // Charscale Assaulter
    SPELL_CLEAVE          = 15284,
    SPELL_SHOCKWAVE_10    = 75417,
    SPELL_SHOCKWAVE_25    = 75418,

    // Charscale Commander
    SPELL_MORTAL_STRIKE   = 13737,
    SPELL_RALLYING_SHOUT  = 75414,

    // Charscale Elite
    SPELL_SKULL_CRACK     = 15621,

    // Charscale Invoker
    SPELL_FLAME_WAVE      = 75413,
    SPELL_SCORCH_10       = 75412,
    SPELL_SCORCH_25       = 75419,
};

/*######
## npc_charscale_assaulter
######*/
class npc_charscale_assaulter : public CreatureScript
{
public:
    npc_charscale_assaulter() : CreatureScript("npc_charscale_assaulter") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_charscale_assaulterAI(pCreature);
    }

    struct npc_charscale_assaulterAI : public ScriptedAI
    {
        npc_charscale_assaulterAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
            Reset();
        }
		
        InstanceScript* pInstance;
		
        uint32 m_uiCleaveTimer;
        uint32 m_uiShockwaveTimer;

        void Reset()
        {
            m_uiCleaveTimer = urand(5*IN_MILLISECONDS,10*IN_MILLISECONDS);
            m_uiShockwaveTimer = urand(10*IN_MILLISECONDS,15*IN_MILLISECONDS);
            me->SetRespawnDelay(7*DAY);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (m_uiCleaveTimer <= diff)
            {
                DoCast(SPELL_CLEAVE);
                m_uiCleaveTimer = urand(5*IN_MILLISECONDS,10*IN_MILLISECONDS);
            } else m_uiCleaveTimer -= diff;

            if (m_uiShockwaveTimer <= diff)
            {
                if (GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL || GetDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
                    DoCast(SPELL_SHOCKWAVE_10);
                else DoCast(SPELL_SHOCKWAVE_25);
                m_uiShockwaveTimer = urand(10*IN_MILLISECONDS,15*IN_MILLISECONDS);
            } else m_uiShockwaveTimer -= diff;
			
            DoMeleeAttackIfReady();
        }
    };
};

/*######
## npc_charscale_invoker
######*/
class npc_charscale_invoker : public CreatureScript
{
public:
    npc_charscale_invoker() : CreatureScript("npc_charscale_invoker") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_charscale_invokerAI(pCreature);
    }

    struct npc_charscale_invokerAI : public ScriptedAI
    {
        npc_charscale_invokerAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
			Reset();
        }
		
		InstanceScript* pInstance;
		
		uint32 m_uiFlameWaveTimer;
        uint32 m_uiScorchTimer;

        void Reset()
        {
			m_uiFlameWaveTimer = urand(15*IN_MILLISECONDS,20*IN_MILLISECONDS);
            m_uiScorchTimer = 10*IN_MILLISECONDS;
            me->SetRespawnDelay(7*DAY);
        }

		void UpdateAI(const uint32 diff)
        {
			if (!UpdateVictim())
                return;

            if (m_uiFlameWaveTimer <= diff)
            {
                DoCast(SPELL_FLAME_WAVE);
                m_uiFlameWaveTimer = urand(15*IN_MILLISECONDS,20*IN_MILLISECONDS);
            }
            else m_uiFlameWaveTimer -= diff;

            if (m_uiScorchTimer <= diff)
            {
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                {
                    if (GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL || GetDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
                        DoCast(pTarget,SPELL_SCORCH_10);
                    else DoCast(pTarget,SPELL_SCORCH_25);
                    m_uiScorchTimer = 10*IN_MILLISECONDS;
                }
            } else m_uiScorchTimer -= diff;
			
            DoMeleeAttackIfReady();
        }
    };
};

/*######
## npc_charscale_elite
######*/
class npc_charscale_elite : public CreatureScript
{
public:
    npc_charscale_elite() : CreatureScript("npc_charscale_elite") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_charscale_eliteAI(pCreature);
    }

    struct npc_charscale_eliteAI : public ScriptedAI
    {
        npc_charscale_eliteAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
            Reset();
        }
		
        InstanceScript* pInstance;
		
        uint32 m_uiSkullCrackTimer;

        void Reset()
        {
            m_uiSkullCrackTimer = urand(5*IN_MILLISECONDS,10*IN_MILLISECONDS);
            me->SetRespawnDelay(7*DAY);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (m_uiSkullCrackTimer <= diff)
            {
                DoCast(SPELL_SKULL_CRACK);
                m_uiSkullCrackTimer = urand(5*IN_MILLISECONDS,10*IN_MILLISECONDS);
            } else m_uiSkullCrackTimer -= diff;
			
            DoMeleeAttackIfReady();
        }
    };
};

/*######
## npc_charscale_commander
######*/
class npc_charscale_commander : public CreatureScript
{
public:
    npc_charscale_commander() : CreatureScript("npc_charscale_commander") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_charscale_commanderAI(pCreature);
    }

    struct npc_charscale_commanderAI : public ScriptedAI
    {
        npc_charscale_commanderAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
            Reset();
        }
		
        InstanceScript* pInstance;

        uint32 m_uiMortalStrikeTimer;
        uint32 m_uiRallyingShoutTimer;

        void Reset()
        {
            m_uiMortalStrikeTimer = urand(10*IN_MILLISECONDS,20*IN_MILLISECONDS);
            m_uiRallyingShoutTimer = urand(35*IN_MILLISECONDS,40*IN_MILLISECONDS);
            me->SetRespawnDelay(7*DAY);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (m_uiMortalStrikeTimer <= diff)
            {
                DoCast(SPELL_MORTAL_STRIKE);
                m_uiMortalStrikeTimer = urand(15*IN_MILLISECONDS,20*IN_MILLISECONDS);
            } else m_uiMortalStrikeTimer -= diff;

            if(m_uiRallyingShoutTimer <= diff)
            {
                me->AddAura(SPELL_RALLYING_SHOUT,me);
                m_uiRallyingShoutTimer = 60*IN_MILLISECONDS;
            } else m_uiRallyingShoutTimer -=diff;

            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_ruby_sanctum()
{
    new npc_charscale_assaulter();
    new npc_charscale_invoker();
    new npc_charscale_elite();
    new npc_charscale_commander();
}