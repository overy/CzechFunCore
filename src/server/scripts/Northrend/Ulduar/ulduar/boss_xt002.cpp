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

/*
    TODO:
        Achievments:
            Nerf Scrapbots - in Scrapbot script
            Nerf Gravity Bombs - (?) - Spellscript
            Must Deconstruct Faster - in XT-002 script / core

        Boombot explosion only hurt allies to the npc at the moment
        Boombot explosion visual

        If the boss is to close to a scrap pile -> no summon
        make the life sparks visible...
*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ulduar.h"

enum Spells
{
    SPELL_TYMPANIC_TANTRUM                      = 62776,
    SPELL_SEARING_LIGHT_10                      = 63018,
    SPELL_SEARING_LIGHT_25                      = 65121,

    SPELL_GRAVITY_BOMB_10                       = 63024,
    SPELL_GRAVITY_BOMB_25                       = 64234,

    SPELL_HEARTBREAK_10                         = 65737,
    SPELL_HEARTBREAK_25                         = 64193,

    SPELL_HEART_EXPOSED                         = 62789, //a little useless

    SPELL_ENRAGE                                = 26662,

    //------------------VOID ZONE--------------------
    SPELL_VOID_ZONE_10                          = 64203,
    SPELL_VOID_ZONE_25                          = 64235,
    SPELL_CONSUMPTION_10                        = 64208, // DBM
    SPELL_CONSUMPTION_25                        = 64206,

    // Life Spark
    SPELL_STATIC_CHARGED_10                     = 64227,
    SPELL_STATIC_CHARGED_25                     = 64236,
    SPELL_SHOCK                                 = 64230,

    //----------------XT-002 HEART-------------------
    SPELL_EXPOSED_HEART                         = 63849,
    SPELL_HEART_RIDE_XT002                      = 63852,

    //---------------XM-024 PUMMELLER----------------
    SPELL_ARCING_SMASH                          = 8374,
    SPELL_TRAMPLE                               = 5568,
    SPELL_UPPERCUT                              = 10966,

    //------------------BOOMBOT-----------------------
    SPELL_BOOM                                  = 62834,
    SPELL_EXPLOSION_VISUAL                      = 62987, // dont know if right

    //-----------------SCRAPBOT-----------------------
    SPELL_HEAL_XT002                            = 62832
};

enum Timers
{
    TIMER_TYMPANIC_TANTRUM                      = 60000,
    TIMER_SEARING_LIGHT                         = 20000,
    TIMER_SPAWN_LIFE_SPARK                      = 9000,
    TIMER_GRAVITY_BOMB                          = 20000,
    TIMER_HEART_PHASE                           = 30000,
    TIMER_ENRAGE                                = 600000,
    TIMER_GRAVITY_BOMB_AURA                     = 8900,

    TIMER_VOID_ZONE                             = 3000,

    // Life Spark
    TIMER_SHOCK                                 = 12000,

    // Pummeller
    // Timers may be off
    // Timers where completely off
    TIMER_ARCING_SMASH                          = 7000,
    TIMER_TRAMPLE                               = 2000,
    TIMER_UPPERCUT                              = 10000,

    TIMER_SPAWN_ADD                             = 12000
};

enum Creatures
{
    NPC_VOID_ZONE                               = 34001,
    NPC_LIFE_SPARK                              = 34004,
    NPC_XT002_HEART                             = 33329,
    NPC_XS013_SCRAPBOT                          = 33343,
    NPC_XM024_PUMMELLER                         = 33344,
    NPC_XE321_BOOMBOT                           = 33346
};

enum Actions
{
    ACTION_ENTER_HARD_MODE,
    ACTION_XT002_REACHED
};

enum XT002Data
{
    DATA_TRANSFERED_HEALTH                      = 0
};

enum Yells
{
    SAY_AGGRO                                   = -1603300,
    SAY_HEART_OPENED                            = -1603301,
    SAY_HEART_CLOSED                            = -1603302,
    SAY_TYMPANIC_TANTRUM                        = -1603303,
    SAY_SLAY_1                                  = -1603304,
    SAY_SLAY_2                                  = -1603305,
    SAY_BERSERK                                 = -1603306,
    SAY_DEATH                                   = -1603307,
    SAY_SUMMON                                  = -1603308
};

enum
{
    ACHIEV_TIMED_START_EVENT                    = 21027
};

enum Achievments
{
    ACHIEVEMENT_NERF_ENGINEERING_10             = 2931,
    ACHIEVEMENT_NERF_ENGINEERING_25             = 2932,
    ACHIEVEMENT_HEARTBREAKER_10                 = 3058,
    ACHIEVEMENT_HEARTBREAKER_25                 = 3059
};

/************************************************
-----------------SPAWN LOCATIONS-----------------
************************************************/
//Shared Z-level
#define SPAWN_Z                                 412
//Lower right
#define LR_X                                    796
#define LR_Y                                    -94
//Lower left
#define LL_X                                    796
#define LL_Y                                    57
//Upper right
#define UR_X                                    890
#define UR_Y                                    -82
//Upper left
#define UL_X                                    894
#define UL_Y                                    62

/*-------------------------------------------------------
 *
 *        XT-002 DECONSTRUCTOR
 *
 *///----------------------------------------------------
class boss_xt002 : public CreatureScript
{
public:
    boss_xt002() : CreatureScript("boss_xt002") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_xt002_AI(creature);
    }

    struct boss_xt002_AI : public BossAI
    {
        boss_xt002_AI(Creature* creature) : BossAI(creature, TYPE_XT002)
        {
        }

        uint32 uiSearingLightTimer;
        uint32 uiSpawnLifeSparkTimer;
        uint32 uiGravityBombTimer;
        uint32 uiGravityBombAuraTimer;
        uint32 uiTympanicTantrumTimer;
        uint32 uiHeartPhaseTimer;
        uint32 uiSpawnAddTimer;
        uint32 uiEnrageTimer;

        bool searing_light_active;
        uint64 uiSearingLightTarget;

        bool gravity_bomb_active;
        uint64 uiGravityBombTarget;

        uint8 phase;
        uint8 heart_exposed;
        bool enraged;

        uint32 transferHealth;
        bool enterHardMode;
        bool hardMode;

        bool nerfEngineering;

        void Reset()
        {
            _Reset();
            me->SetStandState(UNIT_STAND_STATE_STAND);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NOT_SELECTABLE);
            me->ResetLootMode();

            //Makes XT-002 to cast a light bomb 10 seconds after aggro.
            uiSearingLightTimer = TIMER_SEARING_LIGHT/2;
            uiSpawnLifeSparkTimer = TIMER_SPAWN_LIFE_SPARK;
            uiGravityBombTimer = TIMER_GRAVITY_BOMB;
            uiGravityBombAuraTimer = TIMER_GRAVITY_BOMB_AURA;
            uiHeartPhaseTimer = TIMER_HEART_PHASE;
            uiSpawnAddTimer = TIMER_SPAWN_ADD;
            uiEnrageTimer = TIMER_ENRAGE;

            // DBM
            uiTympanicTantrumTimer = RAID_MODE(35000, 50000);

            searing_light_active = false;
            gravity_bomb_active = false;
            enraged = false;
            hardMode = false;
            enterHardMode = false;

            nerfEngineering = true;

            phase = 1;
            heart_exposed = 0;

            if (instance)
                instance->DoStopTimedAchievement(ACHIEVEMENT_TIMED_TYPE_EVENT, ACHIEV_TIMED_START_EVENT);
        }

        void EnterCombat(Unit* /*who*/)
        {
            DoScriptText(SAY_AGGRO, me);
            _EnterCombat();

            if (instance)
                instance->DoStartTimedAchievement(ACHIEVEMENT_TIMED_TYPE_EVENT, ACHIEV_TIMED_START_EVENT);
        }

        void JustSummoned(Creature* summoned)
        {
            summons.Summon(summoned);
        }

        void DoAction(const int32 action)
        {
            switch (action)
            {
                case ACTION_ENTER_HARD_MODE:
                    if (!hardMode)
                    {
                        hardMode = true;
                        me->AddLootMode(LOOT_MODE_HARD_MODE_1);

                        // Enter hard mode
                        enterHardMode = true;
                        uiEnrageTimer = TIMER_ENRAGE;

                        // set max health
                        me->SetFullHealth();

                        // Get his heartbreak buff
                        me->CastSpell(me, RAID_MODE(SPELL_HEARTBREAK_10, SPELL_HEARTBREAK_25), true);
                    }
                    break;
                case ACTION_XT002_REACHED:
                    nerfEngineering = false;
                    break;
            }
        }

        void SetData(uint32 id, uint32 value)
        {
            switch (id)
            {
                case DATA_TRANSFERED_HEALTH:
                    transferHealth = value;
                    break;
            }
        }

        void KilledUnit(Unit * /*victim*/)
        {
            DoScriptText(RAND(SAY_SLAY_1, SAY_SLAY_2), me);
        }

        void JustDied(Unit * /*victim*/)
        {
            DoScriptText(SAY_DEATH, me);
            _JustDied();

            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_NOT_SELECTABLE);

            if (instance)
            {
                if (nerfEngineering)
                    instance->DoCompleteAchievement(RAID_MODE(ACHIEVEMENT_NERF_ENGINEERING_10, ACHIEVEMENT_NERF_ENGINEERING_25));

                if (hardMode)
                    instance->DoCompleteAchievement(RAID_MODE(ACHIEVEMENT_HEARTBREAKER_10, ACHIEVEMENT_HEARTBREAKER_25));
            }
        }

        void SpellHitTarget(Unit* target, const SpellEntry* spell)
        {
            if (!target->ToPlayer())
                return;

            switch (spell->Id)
            {
                case SPELL_SEARING_LIGHT_10:
                case SPELL_SEARING_LIGHT_25:
                {
                    if (hardMode)
                        searing_light_active = true;

                    uiSpawnLifeSparkTimer = TIMER_SPAWN_LIFE_SPARK;
                    uiSearingLightTarget = target->GetGUID();
                }
                break;
                case SPELL_GRAVITY_BOMB_10:
                case SPELL_GRAVITY_BOMB_25:
                {
                    if (hardMode)
                        gravity_bomb_active = true;

                    uiGravityBombAuraTimer = TIMER_GRAVITY_BOMB_AURA;
                    uiGravityBombTarget = target->GetGUID();
                }
                break;
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            _DoAggroPulse(diff);

            if (enterHardMode)
            {
                SetPhaseOne();
                enterHardMode = false;
            }

            // Handles spell casting. These spells only occur during phase 1 or hard mode
            if (phase == 1 || hardMode)
            {
                if (uiSearingLightTimer <= diff)
                {
                    DoCast(me, RAID_MODE(SPELL_SEARING_LIGHT_10, SPELL_SEARING_LIGHT_25), true);
                    uiSearingLightTimer = TIMER_SEARING_LIGHT;
                } else uiSearingLightTimer -= diff;

                if (uiGravityBombTimer <= diff)
                {
                    DoCast(me, RAID_MODE(SPELL_GRAVITY_BOMB_10, SPELL_GRAVITY_BOMB_25), true);
                    uiGravityBombTimer = TIMER_GRAVITY_BOMB;
                } else uiGravityBombTimer -= diff;

                if (uiTympanicTantrumTimer <= diff)
                {
                    DoScriptText(SAY_TYMPANIC_TANTRUM, me);
                    DoCast(SPELL_TYMPANIC_TANTRUM);
                    uiTympanicTantrumTimer = TIMER_TYMPANIC_TANTRUM;
                } else uiTympanicTantrumTimer -= diff;
            }

            if (!hardMode)
            {
                if (phase == 1)
                {
                    if (HealthBelowPct(100 - (heart_exposed + 1) * 25))
                        exposeHeart();

                    DoMeleeAttackIfReady();
                }
                else
                {
                    //Stop moving
                    //me->StopMoving();

                    //Start summoning adds
                    if (uiSpawnAddTimer <= diff)
                    {
                        DoScriptText(SAY_SUMMON, me);

                        // Spawn Pummeller
                        switch (rand() % 4)
                        {
                            case 0: me->SummonCreature(NPC_XM024_PUMMELLER, LR_X, LR_Y, SPAWN_Z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000); break;
                            case 1: me->SummonCreature(NPC_XM024_PUMMELLER, LL_X, LL_Y, SPAWN_Z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000); break;
                            case 2: me->SummonCreature(NPC_XM024_PUMMELLER, UR_X, UR_Y, SPAWN_Z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000); break;
                            case 3: me->SummonCreature(NPC_XM024_PUMMELLER, UL_X, UL_Y, SPAWN_Z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000); break;
                        }

                        // Spawn 5 Bombs
                        for (int8 n = 0; n < 5; n++)
                        {
                            //Some randomes are added so they wont spawn in a pile
                            switch(rand() % 4)
                            {
                                case 0: me->SummonCreature(NPC_XS013_SCRAPBOT, float(irand(LR_X - 3, LR_X + 3)), float(irand(LR_Y - 3, LR_Y + 3)), SPAWN_Z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000); break;
                                case 1: me->SummonCreature(NPC_XS013_SCRAPBOT, float(irand(LL_X - 3, LL_X + 3)), float(irand(LL_Y - 3, LL_Y + 3)), SPAWN_Z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000); break;
                                case 2: me->SummonCreature(NPC_XS013_SCRAPBOT, float(irand(UR_X - 3, UR_X + 3)), float(irand(UR_Y - 3, UR_Y + 3)), SPAWN_Z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000); break;
                                case 3: me->SummonCreature(NPC_XS013_SCRAPBOT, float(irand(UL_X - 3, UL_X + 3)), float(irand(UL_Y - 3, UL_Y + 3)), SPAWN_Z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000); break;
                            }
                        }

                        //Spawn 5 Scrapbots
                        switch (rand() % 4)
                        {
                            case 0: me->SummonCreature(NPC_XE321_BOOMBOT, LR_X, LR_Y, SPAWN_Z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000); break;
                            case 1: me->SummonCreature(NPC_XE321_BOOMBOT, LL_X, LL_Y, SPAWN_Z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000); break;
                            case 2: me->SummonCreature(NPC_XE321_BOOMBOT, UR_X, UR_Y, SPAWN_Z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000); break;
                            case 3: me->SummonCreature(NPC_XE321_BOOMBOT, UL_X, UL_Y, SPAWN_Z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000); break;
                        }

                        uiSpawnAddTimer = TIMER_SPAWN_ADD;
                    } else uiSpawnAddTimer -= diff;

                    // Is the phase over?
                    if (uiHeartPhaseTimer <= diff)
                    {
                        DoScriptText(SAY_HEART_CLOSED, me);
                        SetPhaseOne();
                    }
                    else uiHeartPhaseTimer -= diff;
                }
            }
            else
            {
                // Adding life sparks when searing light debuff runs out if hard mode
                if (searing_light_active)
                {
                    if (uiSpawnLifeSparkTimer <= diff)
                    {
                        Unit* searingLightTarget = me->GetUnit(*me, uiSearingLightTarget);
                        if (searingLightTarget && searingLightTarget->isAlive())
                            me->SummonCreature(NPC_LIFE_SPARK, *searingLightTarget);

                        uiSpawnLifeSparkTimer = TIMER_SPAWN_LIFE_SPARK;
                        searing_light_active = false;
                    } else uiSpawnLifeSparkTimer -= diff;
                }

                if (gravity_bomb_active)
                {
                    if (uiGravityBombAuraTimer <= diff)
                    {
                        Unit* gravityBombTarget = me->GetUnit(*me, uiGravityBombTarget);
                        if (gravityBombTarget && gravityBombTarget->isAlive())
                            me->SummonCreature(NPC_VOID_ZONE, *gravityBombTarget, TEMPSUMMON_TIMED_DESPAWN, 180000);

                        uiGravityBombAuraTimer = TIMER_GRAVITY_BOMB_AURA;
                        gravity_bomb_active = false;
                    } else uiGravityBombAuraTimer -= diff;
                }

                DoMeleeAttackIfReady();
            }

            //Enrage stuff
            if (!enraged)
            {
                if (uiEnrageTimer <= diff)
                {
                    DoScriptText(SAY_BERSERK, me);
                    DoCast(me, SPELL_ENRAGE);
                    enraged = true;
                } else uiEnrageTimer -= diff;
            }else
            {
                if (!me->HasAura(SPELL_ENRAGE))
                    DoCast(me, SPELL_ENRAGE);
            }
        }

        // NOT BLIZZLIKE ... Heart is Spawned the whole Encounter ... VX - 002 is a vehicle
        void exposeHeart()
        {
            me->GetMotionMaster()->MoveIdle();
            me->SetStandState(UNIT_STAND_STATE_SUBMERGED);

            // Make untargetable
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_NOT_SELECTABLE);

            // Summon the heart npc
            if (Creature* heart = me->SummonCreature(NPC_XT002_HEART, *me, TEMPSUMMON_TIMED_DESPAWN, TIMER_HEART_PHASE))
            {
                heart->EnterVehicle(me, 1);
                heart->ClearUnitState(UNIT_STAT_ONVEHICLE); // Hack
                heart->SetInCombatWithZone();
                heart->CastSpell(heart, SPELL_EXPOSED_HEART, false);
            }

            // Start "end of phase 2 timer"
            uiHeartPhaseTimer = TIMER_HEART_PHASE;

            // Phase 2 has offically started
            phase = 2;
            heart_exposed++;

            // Reset the add spawning timer
            uiSpawnAddTimer = TIMER_SPAWN_ADD;

            DoScriptText(SAY_HEART_OPENED, me);
        }

        void SetPhaseOne()
        {
            me->SetStandState(UNIT_STAND_STATE_STAND);
            me->GetMotionMaster()->MoveChase(me->getVictim());

            uiSearingLightTimer = TIMER_SEARING_LIGHT / 2;
            uiGravityBombTimer = TIMER_GRAVITY_BOMB;
            uiTympanicTantrumTimer = TIMER_TYMPANIC_TANTRUM;
            uiSpawnAddTimer = TIMER_SPAWN_ADD;

            if (!hardMode)
                me->ModifyHealth(-((int32)transferHealth));

            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_NOT_SELECTABLE);
            phase = 1;
        }
    };
};

/*-------------------------------------------------------
 *
 *        XT-002 HEART
 *
 *///----------------------------------------------------
class mob_xt002_heart : public CreatureScript
{
public:
    mob_xt002_heart() : CreatureScript("mob_xt002_heart") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_xt002_heartAI(creature);
    }

    struct mob_xt002_heartAI : public Scripted_NoMovementAI
    {
        mob_xt002_heartAI(Creature* creature) : Scripted_NoMovementAI(creature)
        {
            _instance = creature->GetInstanceScript();
            //me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_STUNNED);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
            //DoCast(me, SPELL_EXPOSED_HEART);
        }

        InstanceScript* _instance;

        void JustDied(Unit * /*victim*/)
        {
            if (_instance)
                if (Creature* pXT002 = me->GetCreature(*me, _instance->GetData64(TYPE_XT002)))
                    if (pXT002->AI())
                        pXT002->AI()->DoAction(ACTION_ENTER_HARD_MODE);

            //removes the aura
            me->RemoveAurasDueToSpell(SPELL_EXPOSED_HEART);
        }

        void DamageTaken(Unit * /*pDone*/, uint32 &damage)
        {
            if (Creature* pXT002 = me->GetCreature(*me, _instance->GetData64(TYPE_XT002)))
                if (pXT002->AI())
                {
                    uint32 health = me->GetHealth();
                    if (health <= damage)
                        health = 0;
                    else
                        health -= damage;
                    pXT002->AI()->SetData(DATA_TRANSFERED_HEALTH, me->GetMaxHealth() - health);
                }
        }

        void UpdateAI(const uint32 diff) { }
    };
};

/*-------------------------------------------------------
 *
 *        XS-013 SCRAPBOT
 *
 *///----------------------------------------------------
class mob_scrapbot : public CreatureScript
{
public:
    mob_scrapbot() : CreatureScript("mob_scrapbot") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_scrapbotAI(creature);
    }

    struct mob_scrapbotAI : public ScriptedAI
    {
        mob_scrapbotAI(Creature* creature) : ScriptedAI(creature)
        {
            _instance = me->GetInstanceScript();
            casted = false;
        }

        InstanceScript* _instance;
        bool casted;

        void Reset()
        {
            me->SetReactState(REACT_PASSIVE);

            if (Creature* pXT002 = me->GetCreature(*me, _instance->GetData64(TYPE_XT002)))
                me->GetMotionMaster()->MoveFollow(pXT002, 1, float(2*M_PI*rand_norm()));
        }

        void UpdateAI(const uint32 /*diff*/)
        {
            if (Creature* pXT002 = me->GetCreature(*me, _instance->GetData64(TYPE_XT002)))
            {
                if (!casted)
                    if (me->GetDistance2d(pXT002) <= 2)
                    {
                        // TODO Send raid message
                        casted = true;
                        // Increase health with 1 percent
                        pXT002->CastSpell(pXT002, SPELL_HEAL_XT002, true);
                        //pXT002->ModifyHealth(int32(pXT002->CountPctFromMaxHealth(1)));
                        pXT002->AI()->DoAction(ACTION_XT002_REACHED);
                        // Despawns the scrapbot
                        me->DespawnOrUnsummon(500);
                    }
            }
        }
    };

};

/*-------------------------------------------------------
 *
 *        XM-024 PUMMELLER
 *
 *///----------------------------------------------------
class mob_pummeller : public CreatureScript
{
public:
    mob_pummeller() : CreatureScript("mob_pummeller") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_pummellerAI(creature);
    }

    struct mob_pummellerAI : public ScriptedAI
    {
        mob_pummellerAI(Creature* creature) : ScriptedAI(creature) { }

        uint32 uiArcingSmashTimer;
        uint32 uiTrampleTimer;
        uint32 uiUppercutTimer;

        void Reset()
        {
            uiArcingSmashTimer = TIMER_ARCING_SMASH;
            uiTrampleTimer = TIMER_TRAMPLE;
            uiUppercutTimer = TIMER_UPPERCUT;

            if (Unit* target = SelectPlayerTargetInRange(500.0f))
                me->AI()->AttackStart(target);
        }


        Unit* SelectPlayerTargetInRange(float range)
        {
            Player* target = NULL;
            Trinity::AnyPlayerInObjectRangeCheck u_check(me, range);
            Trinity::PlayerSearcher<Trinity::AnyPlayerInObjectRangeCheck> searcher(me, target, u_check);
            me->VisitNearbyObject(range, searcher);
            return target;
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (me->IsWithinMeleeRange(me->getVictim()))
            {
                if (uiArcingSmashTimer <= diff)
                {
                    DoCast(me->getVictim(), SPELL_ARCING_SMASH);
                    uiArcingSmashTimer = TIMER_ARCING_SMASH;
                } else uiArcingSmashTimer -= diff;

                if (uiTrampleTimer <= diff)
                {
                    DoCast(me->getVictim(), SPELL_TRAMPLE);
                    uiTrampleTimer = TIMER_TRAMPLE;
                } else uiTrampleTimer -= diff;

                if (uiUppercutTimer <= diff)
                {
                    DoCast(me->getVictim(), SPELL_UPPERCUT);
                    uiUppercutTimer = TIMER_UPPERCUT;
                } else uiUppercutTimer -= diff;
            }

            DoMeleeAttackIfReady();
        }
    };

};

/*-------------------------------------------------------
 *
 *        XE-321 BOOMBOT
 *
 *///----------------------------------------------------
class mob_boombot : public CreatureScript
{
public:
    mob_boombot() : CreatureScript("mob_boombot") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_boombotAI(creature);
    }

    struct mob_boombotAI : public ScriptedAI
    {
        mob_boombotAI(Creature* creature) : ScriptedAI(creature)
        {
            boomed = false;
        }

        bool boomed;

        Unit* SelectPlayerTargetInRange(float range)
        {
            Player* target = NULL;
            Trinity::AnyPlayerInObjectRangeCheck u_check(me, range);
            Trinity::PlayerSearcher<Trinity::AnyPlayerInObjectRangeCheck> searcher(me, target, u_check);
            me->VisitNearbyObject(range, searcher);
            return target;
        }

        void Reset()
        {
            if (Unit* target = SelectPlayerTargetInRange(500.0f))
                AttackStart(target);
        }

        void DamageTaken(Unit * /*attacker*/, uint32 &amount)
        {
            if (boomed)
                return;

            if ((me->GetHealth() - amount) < (me->GetMaxHealth()/2))
            {
                boomed = true;
                DoCast(me, SPELL_BOOM, true);
            }
        }

        void UpdateAI(const uint32 /*diff*/) { }
    };

};

/*-------------------------------------------------------
 *
 *        VOID ZONE
 *
 *///----------------------------------------------------
class mob_void_zone : public CreatureScript
{
public:
    mob_void_zone() : CreatureScript("mob_void_zone") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_void_zoneAI(creature);
    }

    struct mob_void_zoneAI : public ScriptedAI
    {
        mob_void_zoneAI(Creature* creature) : ScriptedAI(creature)
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
        }

        uint32 voidZoneTimer;

        void Reset()
        {
            voidZoneTimer = TIMER_VOID_ZONE;
        }

        void UpdateAI(const uint32 diff)
        {
            if (voidZoneTimer <= diff)
            {
                int32 dmg = RAID_MODE(5000, 7500);
                me->CastCustomSpell(me, RAID_MODE(SPELL_CONSUMPTION_10, SPELL_CONSUMPTION_25), &dmg, 0, 0, false);
                voidZoneTimer = TIMER_VOID_ZONE;
            } else voidZoneTimer -= diff;
        }
    };
};

/*-------------------------------------------------------
 *
 *        LIFE SPARK
 *
 *///----------------------------------------------------
class mob_life_spark : public CreatureScript
{
public:
    mob_life_spark() : CreatureScript("mob_life_spark") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_life_sparkAI(creature);
    }

    struct mob_life_sparkAI : public ScriptedAI
    {
        mob_life_sparkAI(Creature* creature) : ScriptedAI(creature) { }

        uint32 shockTimer;

        void Reset()
        {
            DoCast(me, RAID_MODE(SPELL_STATIC_CHARGED_10, SPELL_STATIC_CHARGED_25));
            shockTimer = 0; // first one is immediate.
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (shockTimer <= diff)
            {
                if (me->IsWithinMeleeRange(me->getVictim()))
                {
                    DoCastVictim(SPELL_SHOCK);
                    shockTimer = TIMER_SHOCK;
                }
            }
            else shockTimer -= diff;
        }
    };
};

class spell_gravity_bomb_targeting : public SpellScriptLoader
{
    public:
        spell_gravity_bomb_targeting() : SpellScriptLoader("spell_gravity_bomb_targeting") { }

        class spell_gravity_bomb_targeting_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_gravity_bomb_targeting_SpellScript);

            void FilterTargets(std::list<Unit*>& unitList)
            {
                unitList.remove(GetTargetUnit());
            }

            void Register()
            {
                OnUnitTargetSelect += SpellUnitTargetFn(spell_gravity_bomb_targeting_SpellScript::FilterTargets, EFFECT_0, TARGET_DST_CASTER);
                OnUnitTargetSelect += SpellUnitTargetFn(spell_gravity_bomb_targeting_SpellScript::FilterTargets, EFFECT_1, TARGET_DST_CASTER);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_gravity_bomb_targeting_SpellScript();
        }
};

void AddSC_boss_xt002()
{
    new mob_xt002_heart();
    new mob_scrapbot();
    new mob_pummeller();
    new mob_boombot();
    new mob_void_zone();
    new mob_life_spark();
    new boss_xt002();
    new spell_gravity_bomb_targeting();
}
