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
// TODO:  Trash mobs,second clone health, spawn of halion
// need testing

#include "ScriptPCH.h"
#include "ruby_sanctum.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellAuraEffects.h"


struct Locations
{
    float x, y, z;
};

static Locations SpawnLoc[]=
{
    {3152.329834f, 359.41757f, 85.301605f},    // Baltharus target point
    {3153.06f, 389.486f, 86.2596f},            // Baltharus initial point
};

enum Equipment
{
    EQUIP_MAIN           = 49888,
    EQUIP_OFFHAND        = EQUIP_NO_CHANGE,
    EQUIP_RANGED         = EQUIP_NO_CHANGE,
    EQUIP_DONE           = EQUIP_NO_CHANGE,
};
enum BossSpells
{
    SPELL_BLADE_TEMPEST              = 75125, // every 22 secs
    SPELL_ENERVATING_BRAND           = 74502, // friendlys in 12yards = 74505
    SPELL_ENERVATING_BRAND_TRIGGER   = 74505, // aura on players of enervating brand
    SPELL_SIPHONED_MIGHT             = 74507, // buff for baltharus
    SPELL_REPELLING_WAVE             = 74509, // once if call clone
    SPELL_SABER_LASH                 = 40504, // every 10-15 secs
    SPELL_CLEAR_DEBUFFS              = 34098, // clears all debuffs on baltharus
    SPELL_SUMMON_CLONE               = 74511, // summons npc 39899 (Clone)
    SPELL_SUMMON_CLONE_VISUAL        = 64195, // visual for spawn of the clone
    SPELL_CHANNEL_SPELL              = 76221, // Channeling dummy spell
};

/*######
## boss_baltharus
######*/

class boss_baltharus : public CreatureScript
{
public:
    boss_baltharus() : CreatureScript("boss_baltharus") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_baltharusAI(pCreature);
    }

    struct boss_baltharusAI : public ScriptedAI
    {
        boss_baltharusAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            pInstance = (InstanceScript*)pCreature->GetInstanceScript();
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
            Reset();
        }

        InstanceScript* pInstance;
        Creature* pDummyTarget;
        Creature* pClone;
        bool inCombat;
        bool intro;
        uint8 uiStage;

		uint32 m_uiSiphonedTimer;
		uint32 m_uiBladeTempestTimer;
		uint32 m_uiEnevatingTimer;
		uint32 m_uiSaberLashTimer;

        void Reset()
        {
            if(!pInstance)
                return;

            if (me->isAlive()) pInstance->SetData(TYPE_BALTHARUS, NOT_STARTED);
            me->SetRespawnDelay(7*DAY);

            uiStage = 0;
            pClone = NULL;
            inCombat = false;
            if(intro == true) intro = true;
			else
			{
				intro = false;
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			}

			m_uiSiphonedTimer = 2*IN_MILLISECONDS;
			m_uiBladeTempestTimer = 22*IN_MILLISECONDS;
            m_uiEnevatingTimer = urand(25*IN_MILLISECONDS,30*IN_MILLISECONDS);
            m_uiSaberLashTimer = urand(10*IN_MILLISECONDS,15*IN_MILLISECONDS);

			if (pDummyTarget = me->SummonCreature(NPC_BALTHARUS_TARGET, SpawnLoc[0].x, SpawnLoc[0].y, SpawnLoc[0].z, 0.0f, TEMPSUMMON_MANUAL_DESPAWN, 1000))
            {
                pDummyTarget->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                pDummyTarget->GetMotionMaster()->MoveIdle();
				DoCast(pDummyTarget, SPELL_CHANNEL_SPELL);
            } 

            if(Creature* pTarget = me->GetMap()->GetCreature( pInstance->GetData64(NPC_XERESTRASZA)))
			{
                me->SetUInt64Value(UNIT_FIELD_TARGET, pTarget->GetGUID());
				DoCast(pDummyTarget, SPELL_CHANNEL_SPELL);
			}
        }

        void JustReachedHome()
        {
            if (!pInstance) return;

            pInstance->SetData(TYPE_BALTHARUS, FAIL);
			DoCast(pDummyTarget, SPELL_CHANNEL_SPELL);
        }

        void MoveInLineOfSight(Unit* pWho) 
        {
            if(!pInstance || intro ||
                pWho->GetTypeId() != TYPEID_PLAYER ||
                !pWho->IsWithinDistInMap(me, 60.0f)) return;

			if(pInstance && intro == false && pWho->GetTypeId() == TYPEID_PLAYER && pWho->IsWithinDistInMap(me, 60.0f))
			{
				pInstance->SetData(TYPE_EVENT, 10);
				DoScriptText(-1666305,me);
				intro = true;
			}
		}

        void JustDied(Unit* pKiller)
        {
            if (!pInstance) return;

            DoScriptText(-1666303,me);
            pInstance->SetData(TYPE_BALTHARUS, DONE);
        }

        void KilledUnit(Unit* pVictim)
        {
        switch (urand(0,1)) {
            case 0:
                   DoScriptText(-1666301,me,pVictim);
                   break;
            case 1:
                   DoScriptText(-1666302,me,pVictim);
                   break;
            }
        }

        void JustSummoned(Creature* summoned)
        {
            if(!pInstance || !summoned) return;

            if ( summoned->GetEntry() != NPC_BALTHARUS_TARGET )
            {
                 if (!pClone) pClone = summoned;
                 else if (!pClone->isAlive()) pClone = summoned;
                 pClone->SetInCombatWithZone();
				 pClone->CastSpell(pClone,SPELL_SUMMON_CLONE_VISUAL,true);
				 pClone = NULL;
            }
        }

        void SummonedCreatureJustDied(Creature* summoned)
        {
             if (!pInstance || !summoned) return;

             if (summoned == pClone) pClone = NULL;
        }

        void EnterCombat(Unit* pWho)
        {
            if (!pInstance) return;
            if (pWho->GetTypeId() != TYPEID_PLAYER) return;

            SetEquipmentSlots(false, EQUIP_MAIN, EQUIP_OFFHAND, EQUIP_RANGED);

            inCombat = true;
            me->InterruptNonMeleeSpells(true);
            SetCombatMovement(true);
            pInstance->SetData(TYPE_BALTHARUS, IN_PROGRESS);
            DoScriptText(-1666300,me);
        }

        void DamageTaken(Unit* pDoneBy, uint32 &uiDamage)
        {
            if (!pInstance) return;

            if (!me || !me->isAlive())
                return;

            if(pDoneBy->GetGUID() == me->GetGUID()) 
              return;
        }

        void UpdateAI(const uint32 diff)
        {
            if (!pInstance) return;				
 
            if (!UpdateVictim())
                return;

           switch (uiStage)
            {
                case 0:
                     if ( HealthBelowPct(67)) uiStage = 1;
                     break;

                case 1:
                     if (GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL || GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
					 {
						 me->InterruptNonMeleeSpells(true);
                         DoCast(SPELL_REPELLING_WAVE);
					 }
                     uiStage = 2;
                     break;

                case 2:
                     if (me->IsNonMeleeSpellCasted(false))  return;
					 if (GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL || GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
					 {
						 DoCast(me,SPELL_CLEAR_DEBUFFS);
						 DoScriptText(-1666304,me,pClone);
						 DoCast(SPELL_SUMMON_CLONE);
					 }
					 uiStage = 3;
				

                case 3:
                     if ( HealthBelowPct(51)) uiStage = 4;
                     break;

                case 4:
                     if (GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL || GetDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
					 {
						 me->InterruptNonMeleeSpells(true);
                         DoCast(SPELL_REPELLING_WAVE);
					 }
                     uiStage = 5;
                     break;

                case 5:
                     if (me->IsNonMeleeSpellCasted(false))  return;
					 if (GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL || GetDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
					 {
						 DoCast(me,SPELL_CLEAR_DEBUFFS);
						 DoScriptText(-1666304,me,pClone);
						 DoCast(SPELL_SUMMON_CLONE);
					 }
					 uiStage = 6;

                case 6:
                     if ( HealthBelowPct(34)) uiStage = 7;
                     break;

                case 7:
                     if (GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL || GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
					 {
						 me->InterruptNonMeleeSpells(true);
                         DoCast(SPELL_REPELLING_WAVE);
					 }
                     uiStage = 8;
                     break;

                case 8:
                     if (me->IsNonMeleeSpellCasted(false))  return;
					 if (GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL || GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
					 {
						 DoCast(me,SPELL_CLEAR_DEBUFFS);
						 DoScriptText(-1666304,me,pClone);
						 DoCast(SPELL_SUMMON_CLONE);
					 }
					 uiStage = 9;

                case 9:
                default:
                     break;
            }

			 if (m_uiBladeTempestTimer <= diff)
            {
                DoCast(me,SPELL_BLADE_TEMPEST);
                m_uiBladeTempestTimer = 22*IN_MILLISECONDS;
            } else m_uiBladeTempestTimer -= diff;

            if (m_uiEnevatingTimer <= diff)
            {
				for (uint8 i = 0; i < RAID_MODE<uint8>(4, 8, 6, 10); i++)
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 45.0f, true))
						DoCast(target, SPELL_ENERVATING_BRAND);
				m_uiEnevatingTimer = urand(25*IN_MILLISECONDS,30*IN_MILLISECONDS);
            } else m_uiEnevatingTimer -= diff;
			
			if (m_uiSaberLashTimer <= diff)
            {
                DoCast(SPELL_SABER_LASH);
                m_uiSaberLashTimer = urand(10*IN_MILLISECONDS,15*IN_MILLISECONDS);
            } else m_uiSaberLashTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};



/*######
## mob_baltharus_clone
######*/

class mob_baltharus_clone : public CreatureScript
{
public:
    mob_baltharus_clone() : CreatureScript("mob_baltharus_clone") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_baltharus_cloneAI(pCreature);
    }

    struct mob_baltharus_cloneAI : public ScriptedAI
    {
        mob_baltharus_cloneAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            pInstance = (InstanceScript*)pCreature->GetInstanceScript();
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
			Reset();
        }

        InstanceScript* pInstance;

		uint32 m_uiSiphonedTimer;
        uint32 m_uiBladeTempestTimer;
        uint32 m_uiEnevatingTimer;
        uint32 m_uiSaberLashTimer;

        void Reset()
        {
            if(!pInstance) return;

			m_uiSiphonedTimer = 2*IN_MILLISECONDS;
            m_uiBladeTempestTimer = 22*IN_MILLISECONDS;
            m_uiEnevatingTimer = urand(10*IN_MILLISECONDS,20*IN_MILLISECONDS);
            m_uiSaberLashTimer = urand(10*IN_MILLISECONDS,15*IN_MILLISECONDS);

            me->SetRespawnDelay(7*DAY);
        }

        void KilledUnit(Unit* pVictim)
        {
        switch (urand(0,1)) {
            case 0:
                   DoScriptText(-1666301,me,pVictim);
                   break;
            case 1:
                   DoScriptText(-1666302,me,pVictim);
                   break;
            }
        }

        void JustDied(Unit* pKiller)
        {
            if (!pInstance) return;
			me->ForcedDespawn();
        }

        void EnterCombat(Unit* pWho)
        {
            if (!pInstance) return;

            SetEquipmentSlots(false, EQUIP_MAIN, EQUIP_OFFHAND, EQUIP_RANGED);

            me->SetInCombatWithZone();
			{
				Creature* pBaltharus = me->GetMap()->GetCreature(pInstance->GetData64(NPC_BALTHARUS));
				me->SetHealth(pBaltharus->GetHealth());
			}
        }

        void UpdateAI(const uint32 diff)
        {

            if (!pInstance) return;

            if (pInstance->GetData(TYPE_BALTHARUS) != IN_PROGRESS)
                me->ForcedDespawn();

            if (!UpdateVictim())
                return;

            if (m_uiBladeTempestTimer <= diff)
            {
                DoCast(me,SPELL_BLADE_TEMPEST);
                m_uiBladeTempestTimer = 22*IN_MILLISECONDS;
            } else m_uiBladeTempestTimer -= diff;

            if (m_uiEnevatingTimer <= diff)
            {
				for (uint8 i = 0; i < RAID_MODE<uint8>(4, 8, 8, 10); i++)
					if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 45.0f, true))
						DoCast(target, SPELL_ENERVATING_BRAND);
				m_uiEnevatingTimer = urand(25*IN_MILLISECONDS,30*IN_MILLISECONDS);
            } else m_uiEnevatingTimer -= diff;
			
			if (m_uiSaberLashTimer <= diff)
            {
                DoCast(SPELL_SABER_LASH);
                m_uiSaberLashTimer = urand(10*IN_MILLISECONDS,15*IN_MILLISECONDS);
            } else m_uiSaberLashTimer -= diff;


            DoMeleeAttackIfReady();
        }
    };
};


/*######
##  mob_xerestrasza
######*/

static Locations SpawnLocXer[]=
{
    {3155.540039f, 342.391998f, 84.596802f},   // 0 - start point
    {3152.329834f, 359.41757f, 85.301605f},    // 1 - second say
    {3152.078369f, 383.939178f, 86.337875f},   // 2 - other says and staying
    {3154.99f, 535.637f, 72.8887f},            // 3 - Halion spawn point
};

class mob_xerestrasza : public CreatureScript
{
public:
    mob_xerestrasza() : CreatureScript("mob_xerestrasza") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_xerestraszaAI(pCreature);
    }

    struct mob_xerestraszaAI : public ScriptedAI
    {
        mob_xerestraszaAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            pInstance = (InstanceScript*)pCreature->GetInstanceScript();
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
			me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
            Reset();
        }

        InstanceScript* pInstance;
        uint32 nextEvent;
        uint32 nextPoint;
        uint32 UpdateTimer;
        bool movementstarted;
        bool onSessionEvent;

        void Reset()
        {
            if(!pInstance) return;
            nextEvent = 0;
            nextPoint = 0;
            movementstarted = false;
            UpdateTimer = 2000;
            me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            pInstance->SetData(TYPE_XERESTRASZA, NOT_STARTED);
            me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
            me->SetSpeed(MOVE_WALK, 0.8f, true);
            me->SetRespawnDelay(7*DAY);
       }

        void MovementInform(uint32 type, uint32 id)
        {
            if (type != POINT_MOTION_TYPE || !movementstarted) return;
            if (id == nextPoint) 
            {
                movementstarted = false;
                pInstance->SetData(TYPE_EVENT,nextEvent);
                me->GetMotionMaster()->MovementExpired();
            }
        }

        void StartMovement(uint32 id, uint32 _nextEvent)
        {
            nextPoint = id;
            nextEvent = _nextEvent;
            me->GetMotionMaster()->Clear();
            me->GetMotionMaster()->MovePoint(id, SpawnLocXer[id].x, SpawnLocXer[id].y, SpawnLocXer[id].z);
            pInstance->SetData(TYPE_EVENT,0);
            movementstarted = true;
        }

        void AttackStart(Unit *who)
        {
            //ignore all attackstart commands
            return;
        }

        void MoveInLineOfSight(Unit *who)
        {
            if(!pInstance || !who || who->GetTypeId() != TYPEID_PLAYER) 
                return;

            if (pInstance->GetData(TYPE_BALTHARUS) != DONE
                || pInstance->GetData(TYPE_XERESTRASZA) != NOT_STARTED) return;

            if(!who->IsWithinDistInMap(me, 60.0f)) return;

            pInstance->SetData(TYPE_XERESTRASZA, IN_PROGRESS);
            pInstance->SetData(TYPE_EVENT, 30);
            onSessionEvent = true;
        }

        void UpdateAI(const uint32 diff)
        {
            if(!pInstance) return;

            if (pInstance->GetData(TYPE_EVENT_NPC) == NPC_XERESTRASZA)
            {
                UpdateTimer = pInstance->GetData(TYPE_EVENT_TIMER);
                if (UpdateTimer <= diff)
                {
                    switch (pInstance->GetData(TYPE_EVENT))
                    {
// Xerestrasza intro
                        case 10:
                              UpdateTimer = 7000;
                              pInstance->SetData(TYPE_EVENT, 20);
                              break;
                        case 20:
							  DoScriptText(-1666000,me);
							  UpdateTimer = 6000;
							  pInstance->SetData(TYPE_EVENT,25);
							  break;
						case 25:
							{
							  Creature* pBaltharus = me->GetMap()->GetCreature(pInstance->GetData64(NPC_BALTHARUS));
							  if(pBaltharus && pBaltharus->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
								  pBaltharus->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
							}
							pInstance->SetData(TYPE_EVENT,0);
							break;
// Xerestrasza event
                        case 30:
                             // me->SetActive(true);
                              DoScriptText(-1666001,me);
                              StartMovement(1,40);
                              break;
                        case 40:
                              DoScriptText(-1666002,me);
                              StartMovement(2,50);
                              break;
                        case 50:
                              DoScriptText(-1666003,me);
                              UpdateTimer = 10000;
                              pInstance->SetData(TYPE_EVENT,60);
                              break;
                        case 60:
                              DoScriptText(-1666004,me);
                              UpdateTimer = 12000;
                              pInstance->SetData(TYPE_EVENT,70);
                              break;
                        case 70:
                              DoScriptText(-1666005,me);
                              UpdateTimer = 10000;
                              pInstance->SetData(TYPE_EVENT,80);
                              break;
                        case 80:
                              DoScriptText(-1666006,me);
                              UpdateTimer = 10000;
                              pInstance->SetData(TYPE_EVENT,90);
                              break;
                        case 90:
                              DoScriptText(-1666007,me);
                              UpdateTimer = 10000;
                              pInstance->SetData(TYPE_EVENT,100);
                              break;
                        case 100:
                              DoScriptText(-1666008,me);
                              UpdateTimer = 7000;
                              pInstance->SetData(TYPE_EVENT,110);
                              break;
                        case 110:
                              UpdateTimer = 2000;
                              pInstance->SetData(TYPE_EVENT,0);
                              pInstance->SetData(TYPE_XERESTRASZA, DONE);
                              me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                              me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
							  // me->SetActive(false);
                              break;
// Halion spawn
                        case 200:
                              //me->SetActive(true);
                              {
                              Creature* pHalion = me->GetMap()->GetCreature(pInstance->GetData64(NPC_HALION_REAL));
                              if (pInstance->GetData(TYPE_BALTHARUS) == DONE &&
                                  pInstance->GetData(TYPE_RAGEFIRE) == DONE &&
                                  pInstance->GetData(TYPE_XERESTRASZA) == DONE &&
                                  pInstance->GetData(TYPE_ZARITHRIAN) == DONE &&
                                  pInstance->GetData(TYPE_HALION) != DONE)
                                  {
                                  if (!pHalion)
                                      pHalion = me->SummonCreature(NPC_HALION_REAL, SpawnLocXer[3].x, SpawnLocXer[3].y, SpawnLocXer[3].z, 6.23f, TEMPSUMMON_MANUAL_DESPAWN, HOUR*IN_MILLISECONDS);
                                  if (pHalion && !pHalion->isAlive())
                                      pHalion->Respawn();
                                  if (pHalion)
                                      pHalion->SetCreatorGUID(0);
								  if (pHalion)
                                      pHalion->SetReactState(REACT_PASSIVE);
                                  }
                              }
                              UpdateTimer = 4000;
                              pInstance->SetData(TYPE_EVENT,210);
                              break;
                        case 210:
                              //me->SetActive(false);
                              UpdateTimer = 2000;
                              pInstance->SetData(TYPE_EVENT,0);
                              break;

                        default:
                          break;
                    }
                 } else UpdateTimer -= diff;
                 pInstance->SetData(TYPE_EVENT_TIMER, UpdateTimer);
            }
        }
    };
};

class spell_baltharus_enervating_brand : public SpellScriptLoader
{
    public:
        spell_baltharus_enervating_brand() : SpellScriptLoader("spell_baltharus_enervating_brand") { }

        class spell_baltharus_enervating_brand_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_baltharus_enervating_brand_AuraScript);

            void HandleTriggerSpell(AuraEffect const* aurEff)
            {
                PreventDefaultAction();
                Unit* target = GetTarget();
                uint32 triggerSpellId = GetSpellInfo()->Effects[aurEff->GetEffIndex()].TriggerSpell;
                target->CastSpell(target, triggerSpellId, true);

                if (Unit* caster = GetCaster())
                    if (target->GetDistance(caster) <= 12.0f)
                        target->CastSpell(caster, SPELL_SIPHONED_MIGHT, true);
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_baltharus_enervating_brand_AuraScript::HandleTriggerSpell, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_baltharus_enervating_brand_AuraScript();
        }
};

class EnervatingBrandSelector
{
    public:
        explicit EnervatingBrandSelector(Unit* caster) : _caster(caster) {}

        bool operator()(Unit* unit)
        {
            if (_caster->GetDistance(unit) > 12.0f)
                return true;

            if (unit->GetTypeId() != TYPEID_PLAYER)
                return true;

            return false;
        }

    private:
        Unit* _caster;
};

class spell_baltharus_enervating_brand_trigger : public SpellScriptLoader
{
    public:
        spell_baltharus_enervating_brand_trigger() : SpellScriptLoader("spell_baltharus_enervating_brand_trigger") { }

        class spell_baltharus_enervating_brand_trigger_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_baltharus_enervating_brand_trigger_SpellScript);

            void FilterTargets(std::list<Unit*>& unitList)
            {
                unitList.remove_if(EnervatingBrandSelector(GetCaster()));
                unitList.push_back(GetCaster());
            }

            void Register()
            {
                OnUnitTargetSelect += SpellUnitTargetFn(spell_baltharus_enervating_brand_trigger_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ALLY);
                OnUnitTargetSelect += SpellUnitTargetFn(spell_baltharus_enervating_brand_trigger_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ALLY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_baltharus_enervating_brand_trigger_SpellScript();
        }
};

void AddSC_boss_baltharus()
{
    new boss_baltharus();
    new mob_baltharus_clone();
    new mob_xerestrasza();
	new spell_baltharus_enervating_brand();
    new spell_baltharus_enervating_brand_trigger();
}
