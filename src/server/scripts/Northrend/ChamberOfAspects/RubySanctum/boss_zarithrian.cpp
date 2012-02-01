/*
 * Copyright (C) 2008-2010 TrinityCore <http://www.trinitycore.org/>
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
// TODO:  Trash mobs, spawn of halion
// Need correct timers

#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"
#include "ruby_sanctum.h"
#include "SpellAuras.h"
#include "SpellAuraEffects.h"

enum BossSpells
{
    SPELL_CALL_FLAMECALLER           = 74398,
    SPELL_CLEAVE_ARMOR               = 74367,
    SPELL_IMTIMIDATING_ROAR          = 74384,
    SPELL_LAVA_GOUT_10               = 74394,
	SPELL_LAVA_GOUT_25               = 74395,
    SPELL_BLAST_NOVA_10              = 74392,
	SPELL_BLAST_NOVA_25              = 74393,

    NPC_FLAMECALLER                  = 39814,
};

enum Equipment
{
    EQUIP_MAIN           = 47156,
    EQUIP_OFFHAND        = 51812,
    EQUIP_RANGED         = EQUIP_NO_CHANGE,
    EQUIP_DONE           = EQUIP_NO_CHANGE,
};

struct Locations
{
    float x, y, z, o;
};

static Locations SpawnLoc[]=
{
    {3008.552734f, 530.471680f, 89.195290f, 6.16f},    // 0 - zarithrian start point, o = 6,16
    {3014.313477f, 486.453735f, 89.255096f, 6.16f},    // 1 - Where mob attacks 1
    {3025.324951f, 580.588501f, 88.593185f, 6.16f},    // 2 - Where mob attacks 2
	{3043.649902f, 452.039001f, 85.533600f, 6.16f},	   // 3 - where mob spawns 1
	{3048.159912f, 601.634985f, 86.851196f, 6.16f},	   // 4 - where mob spawns 2
};

class boss_zarithrian : public CreatureScript
{
public:
    boss_zarithrian() : CreatureScript("boss_zarithrian") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_zarithrianAI(pCreature);
    }

    struct boss_zarithrianAI : public ScriptedAI
    {
        boss_zarithrianAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            pInstance = (InstanceScript*)pCreature->GetInstanceScript();
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
			Reset();
        }

        InstanceScript* pInstance;

        uint32 m_uiSummonTimer;
        uint32 m_uiCleaveTimer;
        uint32 m_uiImtimidatingTimer;

        void Reset()
        {
            if(!pInstance)
                return;

            m_uiSummonTimer = 15*IN_MILLISECONDS;
            m_uiCleaveTimer = urand(10*IN_MILLISECONDS,15*IN_MILLISECONDS);
            m_uiImtimidatingTimer = urand(15*IN_MILLISECONDS,25*IN_MILLISECONDS);

			if (me->isAlive())
            {
                pInstance->SetData(TYPE_ZARITHRIAN, NOT_STARTED);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			}
			playerList.clear();
        }
		
		void KilledUnit(Unit* pVictim)
        {
			switch (urand(0,1))
			{
			case 0:
				DoScriptText(-1666201,me,pVictim);
				break;
			case 1:
				DoScriptText(-1666202,me,pVictim);
				break;
			}
        }

        void JustReachedHome()
        {
            if (!pInstance) return;
            pInstance->SetData(TYPE_ZARITHRIAN, FAIL);
        }

        void JustSummoned(Creature* summoned)
        {
			if(!pInstance || !summoned) return;

            summoned->SetInCombatWithZone();
			summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
		}

        void EnterCombat(Unit *who) 
        {
            if(!pInstance) return;

            SetEquipmentSlots(false, EQUIP_MAIN, EQUIP_OFFHAND, EQUIP_RANGED);
            pInstance->SetData(TYPE_ZARITHRIAN, IN_PROGRESS);
            DoScriptText(-1666200,me);
        }

        void JustDied(Unit *killer)
        {
            if(!pInstance) return;

            pInstance->SetData(TYPE_ZARITHRIAN, DONE);
            DoScriptText(-1666203,me);
        }

        void UpdateAI(const uint32 diff)
        {
			if (pInstance->GetData(TYPE_XERESTRASZA) == DONE && pInstance->GetData(TYPE_BALTHARUS) == DONE && pInstance->GetData(TYPE_RAGEFIRE) == DONE)
				me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			
			if (!UpdateVictim())
                return;

			if (m_uiSummonTimer <= diff)
			{
				me->SummonCreature(NPC_FLAMECALLER, SpawnLoc[3].x, SpawnLoc[3].y, SpawnLoc[3].z, SpawnLoc[3].o, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
				me->SummonCreature(NPC_FLAMECALLER, SpawnLoc[4].x, SpawnLoc[4].y, SpawnLoc[4].z, SpawnLoc[4].o, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
				DoScriptText(-1666204,me);
				m_uiSummonTimer = 45*IN_MILLISECONDS;
				if (pInstance->instance->GetSpawnMode() == RAID_DIFFICULTY_25MAN_NORMAL || pInstance->instance->GetSpawnMode() == RAID_DIFFICULTY_25MAN_HEROIC)
				{
					switch (urand(0,1))
					{
					case 0:
						me->SummonCreature(NPC_FLAMECALLER, SpawnLoc[3].x, SpawnLoc[3].y, SpawnLoc[3].z, SpawnLoc[3].o, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
						break;
					case 1:
						me->SummonCreature(NPC_FLAMECALLER, SpawnLoc[4].x, SpawnLoc[4].y, SpawnLoc[4].z, SpawnLoc[4].o, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
						break;
					}
				}
            } else m_uiSummonTimer -= diff;
			
			if (m_uiCleaveTimer <= diff)
            {
                DoCast(me->getVictim(),SPELL_CLEAVE_ARMOR);
                m_uiCleaveTimer = urand(10*IN_MILLISECONDS,15*IN_MILLISECONDS);
            } else m_uiCleaveTimer -= diff;

            if (m_uiImtimidatingTimer <= diff)
			{
				DoCast(me->getVictim(),SPELL_IMTIMIDATING_ROAR);
				m_uiImtimidatingTimer = urand(15*IN_MILLISECONDS,25*IN_MILLISECONDS);
			} else m_uiImtimidatingTimer -= diff;
			
			DoMeleeAttackIfReady();
        }
		 private:
            std::list<Unit *> playerList;
    };
};

class npc_onyx_flamecaller : public CreatureScript
{
public:
    npc_onyx_flamecaller() : CreatureScript("npc_onyx_flamecaller") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_onyx_flamecallerAI(pCreature);
    }

    struct npc_onyx_flamecallerAI : public ScriptedAI
    {
        npc_onyx_flamecallerAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            pInstance = (InstanceScript*)pCreature->GetInstanceScript();
            Reset();
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
        }

        InstanceScript* pInstance;

		uint32 m_uiLavaGoutCount;
        uint32 m_uiLavaGoutTimer;
        uint32 m_uiBlastNovaTimer;
		uint8 nextPoint;
		uint8 stage;
		bool MovementStarted;

        void Reset()
        {
            if(!pInstance) return;

            m_uiLavaGoutTimer = urand(10*IN_MILLISECONDS,14*IN_MILLISECONDS);
			m_uiLavaGoutCount = 0;
            m_uiBlastNovaTimer = urand(10*IN_MILLISECONDS,25*IN_MILLISECONDS);
            me->SetRespawnDelay(7*DAY);
			nextPoint = 0;
			setStage(0);
        }
		
		void setStage(uint8 phase)
        {
            stage = phase;
        }

        uint8 getStage()
        {
            return stage;
        }

		void MovementInform(uint32 type, uint32 id)
		{
            if (!pInstance) return;

            if (type != POINT_MOTION_TYPE || !MovementStarted) return;

            if (id == nextPoint)
			{
				me->GetMotionMaster()->MovementExpired();
				MovementStarted = false;
			}
        }
		
		void StartMovement(uint32 id)
		{
            nextPoint = id;
            me->GetMotionMaster()->Clear();
            me->GetMotionMaster()->MovePoint(id, SpawnLoc[id].x, SpawnLoc[id].y, SpawnLoc[id].z);
            MovementStarted = true;
        }
		
		void UpdateAI(const uint32 diff)
        {
			
			if (pInstance && pInstance->GetData(TYPE_ZARITHRIAN) != IN_PROGRESS)
                me->ForcedDespawn();

            if (!UpdateVictim())
                return;

			switch (getStage())
            {
			case 0:
				if (me->GetPositionY() < 500.0f) StartMovement(1);
				else StartMovement(2);
				setStage(1);
				break;
			case 1:
				if (MovementStarted) return;
				if(Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
				{
					me->AddThreat(pTarget, 100.0f);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
					me->GetMotionMaster()->MoveChase(pTarget);
					setStage(2);
				}
				break;
			case 2:
				if (m_uiLavaGoutTimer <= diff)
				{
					if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
					{
						if (me->IsNonMeleeSpellCasted(false) && m_uiLavaGoutCount < 5)
						{
							if(GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL || GetDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
								DoCast(pTarget,SPELL_LAVA_GOUT_10);
							else DoCast(pTarget,SPELL_LAVA_GOUT_25);
							m_uiLavaGoutTimer = 2*IN_MILLISECONDS;
							m_uiLavaGoutCount += 1;
						}
					else 
						{
						m_uiLavaGoutTimer = urand(10*IN_MILLISECONDS,14*IN_MILLISECONDS);
						m_uiLavaGoutCount = 0;
						}
					}
				} else m_uiLavaGoutTimer -= diff;
				
				if (m_uiBlastNovaTimer <= diff)
				{
					if(GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL || GetDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
						DoCast(SPELL_BLAST_NOVA_10);
					else DoCast(SPELL_BLAST_NOVA_25);
					m_uiBlastNovaTimer = urand(10*IN_MILLISECONDS,25*IN_MILLISECONDS);
				} else m_uiBlastNovaTimer -= diff;
				
				DoMeleeAttackIfReady();

			}
          
        }
    };
};

class spell_intimdating_roar : public SpellScriptLoader
{
    public:
        spell_intimdating_roar() : SpellScriptLoader("spell_intimdating_roar") { }
		private:
            std::list<Unit *> playerList;
		
		class spell_intimdating_roar_SpellScript : public SpellScript
		{
			PrepareSpellScript(spell_intimdating_roar_SpellScript);
			
			void HandleDummy(SpellEffIndex /*effIndex*/)
            {
				if (Unit* target = GetHitUnit())
					GetCaster()->CastSpell(target, SPELL_IMTIMIDATING_ROAR,false);
			}

			void HandleOnHit()
			{
				if (Unit* target = GetHitUnit())
					GetCaster()->AddAura(SPELL_IMTIMIDATING_ROAR,target);
			}  
			
			void Register()
			{
				OnEffectHit += SpellEffectFn(spell_intimdating_roar_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
				OnHit += SpellHitFn(spell_intimdating_roar_SpellScript::HandleOnHit);
			}
		};
		SpellScript* GetSpellScript() const
		{
			return new spell_intimdating_roar_SpellScript();
		}
		
		class spell_intimdating_roarAuraScript : public AuraScript
        {
            PrepareAuraScript(spell_intimdating_roarAuraScript);
			
			void HandleAfterEffectApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
				Unit* target = GetTarget();
				target->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
				target->RemoveUnitMovementFlag(MOVEMENTFLAG_FORWARD | MOVEMENTFLAG_BACKWARD | MOVEMENTFLAG_STRAFE_LEFT | MOVEMENTFLAG_STRAFE_RIGHT);
				target->AddUnitMovementFlag(MOVEMENTFLAG_ROOT);
               
            }
			void HandleAfterEffectRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
			{
				Unit* target = GetTarget();
				target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
				target->RemoveUnitMovementFlag(MOVEMENTFLAG_ROOT);
			}
			
			void Register()
            {
				AfterEffectApply += AuraEffectApplyFn(spell_intimdating_roarAuraScript::HandleAfterEffectApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
				AfterEffectRemove += AuraEffectRemoveFn(spell_intimdating_roarAuraScript::HandleAfterEffectRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
			}
              
        };
		
		AuraScript* GetAuraScript() const
        {
            return new spell_intimdating_roarAuraScript();
        }
};


void AddSC_boss_zarithrian()
{
    new boss_zarithrian();
    new npc_onyx_flamecaller();
	new spell_intimdating_roar();
}