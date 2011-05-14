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

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ulduar.h"

enum Spells
{
    SPELL_ASCEND                    = 64487,
    SPELL_BERSERK                   = 47008,
    SPELL_BIG_BANG_10               = 64443,
    SPELL_BIG_BANG_25               = 64584,
    SPELL_COSMIC_SMASH_10           = 62301,
    SPELL_COSMIC_SMASH_25           = 64598,
    SPELL_PHASE_PUNCH               = 64412,
    SPELL_PHASE_PUNCH_PHASE         = 64417,
    SPELL_QUANTUM_STRIKE_10         = 64395,
    SPELL_QUANTUM_STRIKE_25         = 64592,
    SPELL_BLACK_HOLE_CREDIT         = 65312,
    SPELL_BLACK_HOLE_EXPLOSION_10   = 64122,
    SPELL_BLACK_HOLE_EXPLOSION_25   = 65108,
    SPELL_BLACK_HOLE_SPAWN_VISUAL   = 62003,
    SPELL_BLACK_HOLE_STATE          = 64135,
    SPELL_BLACK_HOLE_TRIGGER        = 62185,
    SPELL_BLACK_HOLE_PHASE          = 62168,
    SPELL_DESPAWN_BLACK_HOLE        = 64391,
    SPELL_ARCANE_BARAGE_10          = 64599,
    SPELL_ARCANE_BARAGE_25          = 64607,

    SPELL_VOID_ZONE_VISUAL          = 64469,
    SPELL_DUAL_WIELD                = 42459,
    SPELL_BOSS_FINISHED             = 65184,
};

enum Creatures
{
    CREATURE_COLLAPSING_STAR        = 32955,
    CREATURE_BLACK_HOLE             = 32953,
    CREATURE_LIVING_CONSTELLATION   = 33052,
    CREATURE_DARK_MATTER            = 33089,
    CREATURE_AZEROTH                = 34246,
    CREATURE_COSMIC_SMASH_TRIGGER   = 33104,
    CREATURE_COSMIC_SMASH_TARGET    = 33105,
    CREATURE_UNLEASHED_DARK_MATTER  = 34097
};

enum Yells
{
    SAY_AGGRO                                   = -1603000,
    SAY_SLAY_1                                  = -1603001,
    SAY_SLAY_2                                  = -1603002,
    SAY_ENGAGED_FOR_FIRST_TIME                  = -1603003,
    SAY_PHASE_2                                 = -1603004,
    SAY_SUMMON_COLLAPSING_STAR                  = -1603005,
    SAY_DEATH_1                                 = -1603006,
    SAY_DEATH_2                                 = -1603007,
    SAY_DEATH_3                                 = -1603008,
    SAY_DEATH_4                                 = -1603009,
    SAY_DEATH_5                                 = -1603010,
    SAY_BERSERK                                 = -1603011,
    SAY_BIG_BANG_1                              = -1603012,
    SAY_BIG_BANG_2                              = -1603013,
    SAY_TIMER_1                                 = -1603014,
    SAY_TIMER_2                                 = -1603015,
    SAY_TIMER_3                                 = -1603016,
    SAY_SUMMON_1                                = -1603017,
    SAY_SUMMON_2                                = -1603018,
    SAY_SUMMON_3                                = -1603019,
};

enum Events
{
    EVENT_NONE,
    EVENT_ASCEND,
    EVENT_BERSERK,
    EVENT_BIGBANG,
    EVENT_COSMICSMASH,
    EVENT_PHASEPUNCH,
    EVENT_QUANTUMSTRIKE,
    EVENT_COLLAPSINGSTAR,
    EVENT_LIVINGCONSTELLATION,
    EVENT_DARKMATTER
};

static Position Locations[]=
{
    {1632.36f, -310.09f, 417.33f, 0.0f},  // room center
    {1632.44f, -301.55f, 417.33f, 0.0f},  // azeroth
    {1632.36f, -310.09f, 385.0f, 0.0f}    // cosmic smash trigger
};

static Position collapsingLocations[]=
{
    {1616.25f, -293.081f, 417.321f, 5.51543f},
    {1647.26f, -292.592f, 417.322f, 3.93168f},
    {1617.38f, -324.447f, 417.321f, 0.81718f},
    {1647.45f, -323.651f, 417.321f, 2.39740f}
};

static Position constellationLocations[]=
{
    {1649.30f, -295.34f, 458.13f, 0.0f},
    {1612.22f, -294.84f, 458.13f, 0.0f},
    {1629.95f, -327.90f, 458.13f, 0.0f}
};

#define EQUIP_ID_MAIN_HAND  45620
#define EQUIP_ID_OFF_HAND   45607

class boss_algalon : public CreatureScript
{
public:
    boss_algalon() : CreatureScript("boss_algalon") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_algalonAI(pCreature);
    }

    struct boss_algalonAI : public BossAI
    {
        boss_algalonAI(Creature* c) : BossAI(c, TYPE_ALGALON)
        {
            summon = false;

            // spell gets triggered from caster, should be triggered from destination?
            SpellEntry* tempSpell;
            tempSpell = GET_SPELL(RAID_MODE(62311, 64596));
            if (tempSpell)
                tempSpell->rangeIndex = 13;
        }

        uint8 starCount;
        uint32 phase;
        uint32 stepTimer;
        uint32 step;
        bool summon;
        bool wipeRaid;

        void Reset()
        {
            _Reset();

            if (summon)
                me->setFaction(7);

            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

            phase = 1;
            stepTimer = 0;
            starCount = 0;
            wipeRaid = false;

            DoCast(me, SPELL_DUAL_WIELD, true);
            me->SetAttackTime(OFF_ATTACK, 1400);
            me->SetStatFloatValue(UNIT_FIELD_MINOFFHANDDAMAGE, float(RAID_MODE(15000, 30000)));
            me->SetStatFloatValue(UNIT_FIELD_MAXOFFHANDDAMAGE, float(RAID_MODE(18000, 35000)));
        }

        void EnterCombat(Unit* who)
        {
            _EnterCombat();
            me->setFaction(14);

            if (summon)
            {
                me->InterruptSpell(CURRENT_CHANNELED_SPELL);
                DoZoneInCombat();
                SetEquipmentSlots(false, EQUIP_ID_MAIN_HAND, EQUIP_ID_OFF_HAND, EQUIP_NO_CHANGE);
            }
            else
            {
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetReactState(REACT_PASSIVE);
                step = 1;
            }

            events.ScheduleEvent(EVENT_BERSERK, 6*MINUTE*IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_BIGBANG, 90*IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_PHASEPUNCH, 15*IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_QUANTUMSTRIKE, urand(4*IN_MILLISECONDS, 14*IN_MILLISECONDS));
            events.ScheduleEvent(EVENT_COSMICSMASH, 25*IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_COLLAPSINGSTAR, 15*IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_LIVINGCONSTELLATION, 50*IN_MILLISECONDS);
        }

        void FinishEncounter()
        {
            if (instance)
                instance->DoUpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, SPELL_BOSS_FINISHED);
        }

        void KilledUnit(Unit * /*victim*/)
        {
            DoScriptText(RAND(SAY_SLAY_1, SAY_SLAY_2), me);
        }

        void JumpToNextStep(uint32 timer)
        {
            stepTimer = timer;
            ++step;
        }

        void JustSummoned(Creature* summon)
        {
            summons.Summon(summon);

            switch (summon->GetEntry())
            {
                case CREATURE_COLLAPSING_STAR:
                    ++starCount;
                    summon->SetReactState(REACT_PASSIVE);
                    summon->GetMotionMaster()->MoveRandom(15.0f);
                    summon->SetInCombatWithZone();
                    break;
                case CREATURE_LIVING_CONSTELLATION:
                    summon->SetInCombatWithZone();
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        summon->AI()->AttackStart(target);
                    break;
                case CREATURE_UNLEASHED_DARK_MATTER:
                    if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO, 0))
                        summon->AI()->AttackStart(target);
                    break;
                default:
                    break;
            }
        }

        void SummonedCreatureDies(Creature* summon, Unit* /*killer*/)
        {
            switch (summon->GetEntry())
            {
                case CREATURE_COLLAPSING_STAR:
                    --starCount;
                    me->SummonCreature(CREATURE_BLACK_HOLE, summon->GetPositionX(), summon->GetPositionY(), summon->GetPositionZ());
                    break;
                default:
                    break;
            }
        }

        void SpellHitTarget(Unit* target, const SpellEntry* spell)
        {
            if (spell->Id == SPELL_PHASE_PUNCH)
                if (Aura* phasePunch = target->GetAura(SPELL_PHASE_PUNCH))
                    if (phasePunch->GetStackAmount() > 4)
                    {
                        target->CastSpell(target, SPELL_PHASE_PUNCH_PHASE, true);
                        target->CombatStop();
                        target->getHostileRefManager().deleteReferences();
                    }
        }

        void EnterEvadeMode()
        {
            if (!wipeRaid)
            {
                summons.DespawnAll();

                // remove players from phase
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_PHASE_PUNCH_PHASE);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_BLACK_HOLE_PHASE);

                wipeRaid = true;
                me->InterruptNonMeleeSpells(true);
                DoCast(SPELL_ASCEND);
                return;
            }

            if (me->HasUnitState(UNIT_STAT_CASTING))
                return;

            _EnterEvadeMode();
            me->GetMotionMaster()->MoveTargetedHome();
            Reset();
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (phase == 1 && HealthBelowPct(20))
            {
                phase = 2;
                DoScriptText(SAY_PHASE_2, me);
                summons.DespawnAll();
                events.CancelEvent(EVENT_COLLAPSINGSTAR);
                events.CancelEvent(EVENT_LIVINGCONSTELLATION);
                events.ScheduleEvent(EVENT_DARKMATTER, 5*IN_MILLISECONDS);

                // summon 4 unstable black holes
                for (uint8 i = 0; i < 4; ++i)
                    me->SummonCreature(CREATURE_BLACK_HOLE, collapsingLocations[i]);
            }

            if (HealthBelowPct(2))
            {
                me->SummonGameObject(GO_GIFT_OF_THE_OBSERVER, 1634.258667f, -295.101166f,417.321381f,0,0,0,0,0,0);

                // All of them. or random?
                DoScriptText(SAY_DEATH_1, me);
                DoScriptText(SAY_DEATH_2, me);
                DoScriptText(SAY_DEATH_3, me);
                DoScriptText(SAY_DEATH_4, me);
                DoScriptText(SAY_DEATH_5, me);

                me->DisappearAndDie();
                _JustDied();
                return;
            }

            if (!summon)
            {
                if (stepTimer <= diff)
                {
                    switch (step)
                    {
                        case 1:
                            DoScriptText(SAY_SUMMON_1, me);
                            JumpToNextStep(7500);
                            break;
                        case 2:
                            DoScriptText(SAY_SUMMON_2, me);
                            JumpToNextStep(6000);
                            break;
                        case 3:
                            DoScriptText(SAY_SUMMON_3, me);
                            JumpToNextStep(11000);
                            break;
                        case 4:
                            DoScriptText(SAY_ENGAGED_FOR_FIRST_TIME, me);
                            JumpToNextStep(11000);
                            break;
                        case 5:
                            DoScriptText(SAY_AGGRO, me);
                            JumpToNextStep(7000);
                            break;
                        case 6:
                            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            me->SetReactState(REACT_AGGRESSIVE);
                            SetEquipmentSlots(false, EQUIP_ID_MAIN_HAND, EQUIP_ID_OFF_HAND, EQUIP_NO_CHANGE);
                            summon = true;
                            break;
                    }
                } else stepTimer -= diff;
                return;
            }

            _DoAggroPulse(diff);
            events.Update(diff);

            if (me->HasUnitState(UNIT_STAT_CASTING))
                return;

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_BIGBANG:
                        DoScriptText(RAND(SAY_BIG_BANG_1, SAY_BIG_BANG_2), me);
                        DoCast(RAID_MODE(SPELL_BIG_BANG_10, SPELL_BIG_BANG_25));
                        events.ScheduleEvent(EVENT_BIGBANG, 90*IN_MILLISECONDS);
                        break;
                    case EVENT_PHASEPUNCH:
                        DoCast(me->getVictim(), SPELL_PHASE_PUNCH, true);
                        events.ScheduleEvent(EVENT_PHASEPUNCH, 15*IN_MILLISECONDS);
                        break;
                    case EVENT_QUANTUMSTRIKE:
                        DoCast(me->getVictim(), RAID_MODE(SPELL_QUANTUM_STRIKE_10, SPELL_QUANTUM_STRIKE_25));
                        events.ScheduleEvent(EVENT_QUANTUMSTRIKE, urand(4*IN_MILLISECONDS, 14*IN_MILLISECONDS));
                        break;
                    case EVENT_COSMICSMASH:
                        DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0), RAID_MODE(SPELL_COSMIC_SMASH_10, SPELL_COSMIC_SMASH_25));
                        events.ScheduleEvent(EVENT_COSMICSMASH, 25*IN_MILLISECONDS);
                        break;
                    case EVENT_COLLAPSINGSTAR:
                        DoScriptText(SAY_SUMMON_COLLAPSING_STAR, me);
                        for (uint8 i = starCount; i < 4; ++i)
                            me->SummonCreature(CREATURE_COLLAPSING_STAR, collapsingLocations[i], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3*IN_MILLISECONDS);
                        events.ScheduleEvent(EVENT_COLLAPSINGSTAR, 45*IN_MILLISECONDS);
                        break;
                    case EVENT_LIVINGCONSTELLATION:
                        for (uint8 i = 0; i < 3; ++i)
                            me->SummonCreature(CREATURE_LIVING_CONSTELLATION, constellationLocations[i], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 1*IN_MILLISECONDS);
                        events.ScheduleEvent(EVENT_LIVINGCONSTELLATION, 50*IN_MILLISECONDS);
                        break;
                    case EVENT_DARKMATTER:
                        for (uint8 i = 0; i < 4; ++i)
                            me->SummonCreature(CREATURE_UNLEASHED_DARK_MATTER, collapsingLocations[i], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3*IN_MILLISECONDS);
                        events.ScheduleEvent(EVENT_DARKMATTER, 20*IN_MILLISECONDS);
                        break;
                    case EVENT_BERSERK:
                        DoScriptText(SAY_BERSERK, me);
                        DoCast(me, SPELL_BERSERK, true);
                        events.ScheduleEvent(EVENT_ASCEND, 3*IN_MILLISECONDS);
                        break;
                    case EVENT_ASCEND:
                        DoCast(SPELL_ASCEND);
                        events.ScheduleEvent(EVENT_ASCEND, 10*IN_MILLISECONDS);
                        break;
                    default:
                        break;
                }
            }

            DoMeleeAttackIfReady();
            //EnterEvadeIfOutOfCombatArea(diff);
        }
    };
};

class mob_collapsing_star : public CreatureScript
{
public:
    mob_collapsing_star() : CreatureScript("mob_collapsing_star") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_collapsing_starAI(creature);
    }

    struct mob_collapsing_starAI : public ScriptedAI
    {
        mob_collapsing_starAI(Creature* creature) : ScriptedAI(creature) { }

        uint32 loseHealthTimer;

        void Reset()
        {
            loseHealthTimer = 1*IN_MILLISECONDS;
        }

        void JustDied(Unit * /*killer*/)
        {
            DoCast(SPELL_BLACK_HOLE_CREDIT);
            DoCast(me, RAID_MODE(SPELL_BLACK_HOLE_EXPLOSION_10, SPELL_BLACK_HOLE_EXPLOSION_25), true);
        }

        void UpdateAI(const uint32 diff)
        {
            if (loseHealthTimer <= diff)
            {
                me->DealDamage(me, me->CountPctFromMaxHealth(1)); 
                loseHealthTimer = 1*IN_MILLISECONDS;
            } else loseHealthTimer -= diff;
        }
    };
};

class npc_living_constellation : public CreatureScript
{
public:
    npc_living_constellation() : CreatureScript("npc_living_constellation") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_living_constellationAI(creature);
    }

    struct npc_living_constellationAI : public ScriptedAI
    {
        npc_living_constellationAI(Creature* creature) : ScriptedAI(creature) { }

        uint32 arcaneBarrageTimer;

        void Reset()
        {
            me->SetFlying(true);
            me->SetSpeed(MOVE_FLIGHT, 0.7f);
            arcaneBarrageTimer = urand(5*IN_MILLISECONDS, 10*IN_MILLISECONDS);
        }

        void MoveInLineOfSight(Unit* who)
        {
            ScriptedAI::MoveInLineOfSight(who);

            if (who->GetTypeId() != TYPEID_UNIT)
                return;

            if (who->GetEntry() == CREATURE_BLACK_HOLE && who->GetDistance(me) < 5.0f)
            {
                who->ToCreature()->CastSpell(who, SPELL_DESPAWN_BLACK_HOLE, true);
                who->ToCreature()->ForcedDespawn();
                me->DealDamage(me, me->GetHealth());
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (arcaneBarrageTimer <= diff)
            {
                DoCast(RAID_MODE(SPELL_ARCANE_BARAGE_10, SPELL_ARCANE_BARAGE_25));
                arcaneBarrageTimer = 5*IN_MILLISECONDS;
            } else arcaneBarrageTimer -= diff;
        }
    };
};

class npc_black_hole : public CreatureScript
{
public:
    npc_black_hole() : CreatureScript("npc_black_hole") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_black_holeAI(creature);
    }

    struct npc_black_holeAI : public Scripted_NoMovementAI
    {
        npc_black_holeAI(Creature* creature) : Scripted_NoMovementAI(creature)
        {
            DoCast(me, SPELL_BLACK_HOLE_SPAWN_VISUAL, true);
            DoCast(me, SPELL_BLACK_HOLE_STATE, true);
            DoCast(me, SPELL_BLACK_HOLE_TRIGGER, true);
            DoCast(me, SPELL_VOID_ZONE_VISUAL, true);
            me->setFaction(14);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
            me->SetReactState(REACT_PASSIVE);
            me->SetInCombatWithZone();
        }

        void SpellHitTarget(Unit* target, const SpellEntry* spell)
        {
            if (spell->Id == SPELL_BLACK_HOLE_PHASE)
            {
                target->CombatStop();
                target->getHostileRefManager().deleteReferences();
            }
        }
    };
};

class go_planetarium_access : public GameObjectScript
{
public:
    go_planetarium_access() : GameObjectScript("go_planetarium_access") { }

    bool OnGossipHello(Player* player, GameObject* go)
    {
        InstanceScript* _instance = go->GetInstanceScript();

        if (player->HasItemCount(45796, 1) || player->HasItemCount(45798, 1))
        {
            _instance->SetBossState(TYPE_ALGALON, SPECIAL);
            go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_UNK1);
            go->SetGoState(GO_STATE_ACTIVE);
        }
        return true;
    }
};

// cast spell effects on same target
class spell_cosmic_smash : public SpellScriptLoader
{
    public:
        spell_cosmic_smash() : SpellScriptLoader("spell_cosmic_smash") { }

        class spell_cosmic_smash_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_cosmic_smash_SpellScript);

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
                OnUnitTargetSelect += SpellUnitTargetFn(spell_cosmic_smash_SpellScript::FilterTargetsInitial, EFFECT_0, TARGET_UNIT_AREA_ENEMY_SRC);
                OnUnitTargetSelect += SpellUnitTargetFn(spell_cosmic_smash_SpellScript::FilterTargetsSubsequent, EFFECT_1, TARGET_UNIT_AREA_ENEMY_SRC);
            }

            std::list<Unit*> sharedUnitList;
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_cosmic_smash_SpellScript();
        }
};

// set trigger summon location
class spell_cosmic_smash_summon_trigger : public SpellScriptLoader
{
    public:
        spell_cosmic_smash_summon_trigger() : SpellScriptLoader("spell_cosmic_smash_summon_trigger") { }

        class spell_cosmic_smash_summon_trigger_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_cosmic_smash_summon_trigger_SpellScript);

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                GetCaster()->SummonCreature(CREATURE_COSMIC_SMASH_TRIGGER, Locations[2], TEMPSUMMON_TIMED_DESPAWN, 7900);
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_cosmic_smash_summon_trigger_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SUMMON);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_cosmic_smash_summon_trigger_SpellScript();
        }
};

// set target summon location
class spell_cosmic_smash_summon_target : public SpellScriptLoader
{
    public:
        spell_cosmic_smash_summon_target() : SpellScriptLoader("spell_cosmic_smash_summon_target") { }

        class spell_cosmic_smash_summon_target_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_cosmic_smash_summon_target_SpellScript);

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                GetCaster()->SummonCreature(CREATURE_COSMIC_SMASH_TARGET, GetCaster()->GetPositionX(), GetCaster()->GetPositionY(),
                    GetCaster()->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN, 10*IN_MILLISECONDS);
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_cosmic_smash_summon_target_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SUMMON);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_cosmic_smash_summon_target_SpellScript();
        }
};

// set damage based on proximity
class spell_cosmic_smash_dmg : public SpellScriptLoader
{
    public:
        spell_cosmic_smash_dmg() : SpellScriptLoader("spell_cosmic_smash_dmg") { }

        class spell_cosmic_smash_dmg_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_cosmic_smash_dmg_SpellScript);

            void CalcDamage(SpellEffIndex /*effIndex*/)
            {
                if (!GetHitUnit() || !GetTargetDest())
                    return;

                float distance = GetHitUnit()->GetExactDist2d(GetTargetDest());
                if (distance < 3.4f)
                    return;

                SetHitDamage(int32(GetHitDamage() * 10.0f / pow(distance, 1.9f)));
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_cosmic_smash_dmg_SpellScript::CalcDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_cosmic_smash_dmg_SpellScript();
        }
};

// prevent target gets selected twice after spell destination is set
class spell_cosmic_smash_missile_target : public SpellScriptLoader
{
    public:
        spell_cosmic_smash_missile_target() : SpellScriptLoader("spell_cosmic_smash_missile_target") { }

        class spell_cosmic_smash_missile_target_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_cosmic_smash_missile_target_SpellScript);

            void FilterTarget(std::list<Unit*>& unitList)
            {
                for (std::list<Unit*>::iterator itr = unitList.begin() ; itr != unitList.end(); ++itr)
                {
                    if ((*itr)->isAlive())
                        (*itr)->Kill(*itr);
                }
            }

            void Register()
            {
                OnUnitTargetSelect += SpellUnitTargetFn(spell_cosmic_smash_missile_target_SpellScript::FilterTarget, EFFECT_0, TARGET_DST_NEARBY_ENTRY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_cosmic_smash_missile_target_SpellScript();
        }
};

void AddSC_boss_algalon()
{
    new boss_algalon();
    new mob_collapsing_star();
    new npc_living_constellation();
    new npc_black_hole();
    new go_planetarium_access();
    new spell_cosmic_smash();
    new spell_cosmic_smash_summon_trigger();
    new spell_cosmic_smash_summon_target();
    new spell_cosmic_smash_dmg();
    new spell_cosmic_smash_missile_target();
}
