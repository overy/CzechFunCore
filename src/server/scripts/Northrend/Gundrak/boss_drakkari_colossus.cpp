/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
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


#include "ScriptPCH.h"
#include "gundrak.h"

enum Spells
{
    SPELL_EMERGE                                  = 54850,
    SPELL_MIGHTY_BLOW                             = 54719,
    SPELL_MORTAL_STRIKE                           = 54715,
    SPELL_MERGE                                   = 54878,
    SPELL_SURGE                                   = 54801,
    SPELL_FREEZE_ANIM                             = 16245,
    SPELL_MOJO_VOLLEY                             = 54849,
    SPELL_MOJO_VOLLEY_TRIGGERED                   = 54847,
    H_SPELL_MOJO_VOLLEY                           = 59453,
    H_SPELL_MOJO_VOLLEY_TRIGGERED                 = 59452,
    SPELL_MOJO_PUDDLE                             = 59451,
    SPELL_MOJO_WAVE                               = 55626,
    H_SPELL_MOJO_WAVE                             = 58993
};

enum Emotes
{
    EMOTE_SURGE                                   = -1604008,
    EMOTE_SEEP                                    = -1604009,
    EMOTE_GLOW                                    = -1604010
};

enum Creatures
{
    CREATURE_MOJO                                 = 29830
};

static Position SpawnLoc[]=
{
  {1669.98f, 753.686f, 143.074f, 4.95674f},
  {1680.67f, 737.104f, 143.083f, 2.53073f},
  {1680.63f, 750.682f, 143.074f, 3.87463f},
  {1663.1f,  743.665f, 143.078f, 6.19592f},
  {1670.39f, 733.493f, 143.073f, 1.27409f}
};

class boss_drakkari_colossus : public CreatureScript
{
public:
    boss_drakkari_colossus() : CreatureScript("boss_drakkari_colossus") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_drakkari_colossusAI (pCreature);
    }

    struct boss_drakkari_colossusAI : public ScriptedAI
    {
        boss_drakkari_colossusAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            pInstance = pCreature->GetInstanceScript();

            // 100% too much?
            SpellEntry* tempSpell;
            tempSpell = GET_SPELL(SPELL_MORTAL_STRIKE);
            if (tempSpell)
                tempSpell->procChance = 50;
        }

        InstanceScript* pInstance;

        bool bHealth;
        bool bHealth1;

        uint8 MojoEventPhase;
        uint32 MightyBlowTimer;
        uint32 MojoEventTimer;
        uint64 MojoGUID[5];

        void Reset()
        {
            if (pInstance)
                pInstance->SetData(DATA_DRAKKARI_COLOSSUS_EVENT, NOT_STARTED);
            if (!me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE))
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);

            MightyBlowTimer = 10*IN_MILLISECONDS;
            bHealth = false;
            bHealth1 = false;

            DespawnMojo(); // make sure no mojo is left
            SpawnMojo();

            MojoEventPhase = 0;
            MojoEventTimer = 2*IN_MILLISECONDS;

            CreatureState(me, true);
        }

        void JustReachedHome()
        {
            DoCast(me, SPELL_FREEZE_ANIM);
        }

        void EnterCombat(Unit* /*who*/)
        {
            if (pInstance)
                pInstance->SetData(DATA_DRAKKARI_COLOSSUS_EVENT, IN_PROGRESS);
       
            me->RemoveAura(SPELL_FREEZE_ANIM);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);

            MojoEventPhase = 1;
        }
        
        void SpawnMojo()
        {
            Creature *pCreature = NULL;
            for (uint8 i = 0; i < 5; ++i)
            {
                pCreature = me->SummonCreature(CREATURE_MOJO, SpawnLoc[i], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 1*IN_MILLISECONDS);
                if (pCreature)
                {
                    MojoGUID[i] = pCreature->GetGUID();
                    pCreature->SetVisible(true);
                    pCreature->SetReactState(REACT_PASSIVE);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                }
            }
        }

        void DespawnMojo()
        {
            for (uint8 i = 0; i < 5; ++i)
            {
                if (MojoGUID[i])
                {
                    Creature* pCreature = Unit::GetCreature((*me), MojoGUID[i]);
                    if (pCreature && pCreature->isAlive())
                    {
                        pCreature->SetVisible(false);
                        pCreature->DespawnOrUnsummon();
                    }
                }
                MojoGUID[i] = 0;
            }
        }

        void CreatureState(Creature* pWho, bool bRestore = true)
        {
            if (!pWho)
                return;

            if (bRestore)
            {
                pWho->ClearUnitState(UNIT_STAT_STUNNED | UNIT_STAT_ROOT);
                pWho->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                pWho->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                if (pWho == me)
                    me->RemoveAura(SPELL_FREEZE_ANIM);
                DoCast(me,SPELL_MORTAL_STRIKE);
            }else
            {
                pWho->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                pWho->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                pWho->AddUnitState(UNIT_STAT_STUNNED | UNIT_STAT_ROOT);
                if (pWho == me)
                    DoCast(me,SPELL_FREEZE_ANIM);
            }
        }
       
        void EnterEvadeMode()
        {
            me->ClearUnitState(UNIT_STAT_STUNNED | UNIT_STAT_ROOT);
            _EnterEvadeMode();
            me->GetMotionMaster()->MoveTargetedHome();
            Reset();
        }

        void UpdateAI(const uint32 diff)
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            if (MojoEventPhase == 1)
            {
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MoveIdle();
                CreatureState(me, false);

                for (uint8 i = 0; i < 5; ++i)
                {
                    if (MojoGUID[i])
                    {
                        Creature* pCreature = Unit::GetCreature((*me), MojoGUID[i]);
                        if (pCreature && pCreature->isAlive())
                        {
                            pCreature->GetMotionMaster()->Clear();
                            pCreature->GetMotionMaster()->MovePoint(0,me->GetPositionX(),me->GetPositionY(),me->GetPositionZ());
                        }
                    }
                }
                MojoEventPhase = 2;
            }

            if (MojoEventPhase == 2)
            {
                if (MojoEventTimer <= diff)
                {
                    DespawnMojo();
                    CreatureState(me, true);
                    me->GetMotionMaster()->MoveChase(me->getVictim());
                    MojoEventPhase = 3;
                } else MojoEventTimer -= diff;
            }

            if (!bHealth && HealthBelowPct(50) && !HealthBelowPct(5))
            {
                CreatureState(me, false);
                DoCast(me, SPELL_EMERGE);
                bHealth = true;
                me->RemoveAllAuras();
            }

            if (!bHealth1 && HealthBelowPct(5))
            {
                CreatureState(me, false);
                DoCast(me, SPELL_EMERGE);
                bHealth1 = true;
                me->RemoveAllAuras();
            }

            if (me->HasUnitState(UNIT_STAT_STUNNED))
                return;

            if (MightyBlowTimer <= diff)
            {
                DoCast(me->getVictim(), SPELL_MIGHTY_BLOW, true);
                MightyBlowTimer = 15*IN_MILLISECONDS;
            } else MightyBlowTimer -= diff;

            DoMeleeAttackIfReady();
        }

        // can't die by damage
        void DamageTaken(Unit * /*done_by*/, uint32 &damage)
        {
            if (damage >= me->GetHealth())
                damage = me->GetHealth() - 1;
        }

        void JustDied(Unit* /*killer*/)
        {
            if (pInstance)
                pInstance->SetData(DATA_DRAKKARI_COLOSSUS_EVENT, DONE);
        }

        void JustSummoned(Creature* pSummon)
        {
            if (HealthBelowPct(5))
                pSummon->DealDamage(pSummon, uint32(pSummon->GetHealth() * 0.5), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            pSummon->AI()->AttackStart(me->getVictim());
        }
    };

};

class boss_drakkari_elemental : public CreatureScript
{
public:
    boss_drakkari_elemental() : CreatureScript("boss_drakkari_elemental") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_drakkari_elementalAI (pCreature);
    }

    struct boss_drakkari_elementalAI : public ScriptedAI
    {
        boss_drakkari_elementalAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            pInstance = pCreature->GetInstanceScript();
            
            SpellEntry* tempSpell;
            tempSpell = GET_SPELL(DUNGEON_MODE(SPELL_MOJO_VOLLEY_TRIGGERED, H_SPELL_MOJO_VOLLEY_TRIGGERED));
            if (tempSpell)
                tempSpell->MaxAffectedTargets = 1;
        }

        InstanceScript* pInstance;

        uint32 uiSurgeTimer;
        uint32 uiDisappearTimer;
        uint32 uiMojoWaveTimer;
        uint32 uiSwitchTimer;

        bool bGoToColossus;

        void Reset()
        {
            uiSurgeTimer = 15000;
            uiDisappearTimer = 2500;
            uiMojoWaveTimer = 7000;
            uiSwitchTimer = 2000;
            bGoToColossus = false;
        }

        void EnterEvadeMode()
        {
            if (Creature *pColossus = Unit::GetCreature(*me, pInstance ? pInstance->GetData64(DATA_DRAKKARI_COLOSSUS) : 0))
               CAST_AI(boss_drakkari_colossus::boss_drakkari_colossusAI, pColossus->AI())->CreatureState(pColossus, true);
        
            me->SetVisible(false);
            me->DisappearAndDie();
        }
   
        void EnterCombat(Unit* /*who*/)
        {
            DoCast(me, DUNGEON_MODE(SPELL_MOJO_VOLLEY,H_SPELL_MOJO_VOLLEY));
        }

        void UpdateAI(const uint32 diff)
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            if (!bGoToColossus && HealthBelowPct(50))
            {
                if (Creature *pColossus = Unit::GetCreature(*me, pInstance ? pInstance->GetData64(DATA_DRAKKARI_COLOSSUS) : 0))
                {
                    if (!CAST_AI(boss_drakkari_colossus::boss_drakkari_colossusAI,pColossus->AI())->HealthBelowPct(6))
                    {
                        me->InterruptNonMeleeSpells(true);
                        DoCast(pColossus, SPELL_MERGE);
                        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                        bGoToColossus = true;
                    }
                }
            }

            if (bGoToColossus)
            {
                if (uiDisappearTimer <= diff)
                {
                    if (Creature *pColossus = Unit::GetCreature(*me, pInstance ? pInstance->GetData64(DATA_DRAKKARI_COLOSSUS) : 0))
                    {
                        CAST_AI(boss_drakkari_colossus::boss_drakkari_colossusAI, pColossus->AI())->CreatureState(pColossus, true);
                        CAST_AI(boss_drakkari_colossus::boss_drakkari_colossusAI, pColossus->AI())->bHealth1 = false;
                    }
                    me->DisappearAndDie();
                } else uiDisappearTimer -= diff;
            }

            if (uiSurgeTimer <= diff)
            {
                DoCast(me->getVictim(), SPELL_SURGE);
                uiSurgeTimer = urand(15000, 25000);
            } else uiSurgeTimer -= diff;

            if (uiMojoWaveTimer <= diff)
            {
                if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                {
                    DoCast(pTarget, DUNGEON_MODE(SPELL_MOJO_WAVE, H_SPELL_MOJO_WAVE));
                    uiMojoWaveTimer = urand(10000, 20000);
                }
            } else uiMojoWaveTimer -= diff;
            
            // switch mojo volley max targets
            if (uiSwitchTimer <= diff)
            {
                uint8 maxTargets = urand(1, 2);
                SpellEntry* tempSpell;
                tempSpell = GET_SPELL(DUNGEON_MODE(SPELL_MOJO_VOLLEY_TRIGGERED, H_SPELL_MOJO_VOLLEY_TRIGGERED));
                if (tempSpell)
                    tempSpell->MaxAffectedTargets = maxTargets;

                uiSwitchTimer = 2*IN_MILLISECONDS;
            } else uiSwitchTimer -= diff;

            DoMeleeAttackIfReady();
        }

        void JustDied(Unit* /*killer*/)
        {
            if (Creature *pColossus = Unit::GetCreature(*me, pInstance ? pInstance->GetData64(DATA_DRAKKARI_COLOSSUS) : 0))
            {
                pColossus->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                pColossus->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                pColossus->Kill(pColossus);
            }
        }
    };

};

class npc_living_mojo : public CreatureScript
{
public:
    npc_living_mojo() : CreatureScript("npc_living_mojo") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_living_mojoAI (pCreature);
    }

    struct npc_living_mojoAI : public ScriptedAI
    {
        npc_living_mojoAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            pInstance = pCreature->GetInstanceScript();
        }

        InstanceScript* pInstance;

        uint32 uiMojoWaveTimer;
        uint32 uiMojoPuddleTimer;

        void Reset()
        {
            uiMojoWaveTimer = 5*IN_MILLISECONDS;
            uiMojoPuddleTimer = 10*IN_MILLISECONDS;
        }

        void UpdateAI(const uint32 diff)
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            if (uiMojoWaveTimer <= diff)
            {
                if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                {
                    DoCast(me->getVictim(), DUNGEON_MODE(SPELL_MOJO_WAVE, H_SPELL_MOJO_WAVE));
                    uiMojoWaveTimer = 10*IN_MILLISECONDS;
                }
            } else uiMojoWaveTimer -= diff;

            if (uiMojoPuddleTimer <= diff)
            {
                DoCast(H_SPELL_MOJO_VOLLEY_TRIGGERED);
                uiMojoPuddleTimer = DUNGEON_MODE(20*IN_MILLISECONDS, 10*IN_MILLISECONDS);
            } else uiMojoPuddleTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

class spell_mojo_volley_targeting : public SpellScriptLoader
{
    public:
        spell_mojo_volley_targeting() : SpellScriptLoader("spell_mojo_volley_targeting") { }

        class spell_mojo_volley_targeting_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_mojo_volley_targeting_SpellScript);

            void FilterTargetsInitial(std::list<Unit*>& unitList)
            {
                sharedUnitList = unitList;
            }

            void FilterTargetsSubsequent(std::list<Unit*>& unitList)
            {
                unitList = sharedUnitList;
            }

            void Register()
            {
                OnUnitTargetSelect += SpellUnitTargetFn(spell_mojo_volley_targeting_SpellScript::FilterTargetsInitial, EFFECT_0, TARGET_UNIT_AREA_ENEMY_SRC);
                OnUnitTargetSelect += SpellUnitTargetFn(spell_mojo_volley_targeting_SpellScript::FilterTargetsSubsequent, EFFECT_1, TARGET_UNIT_AREA_ENEMY_SRC);
            }

            std::list<Unit*> sharedUnitList;
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_mojo_volley_targeting_SpellScript();
        }
};

void AddSC_boss_drakkari_colossus()
{
    new boss_drakkari_colossus();
    new boss_drakkari_elemental();
    new npc_living_mojo();
    new spell_mojo_volley_targeting();
}
