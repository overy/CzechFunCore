#include "ScriptPCH.h"


enum SylvanasSpells
{
    SPELL_MULTISHOT                                        = 40872,
    SPELL_VOLLEY                                           = 38633,
    SUMMONED_SNAKE                                         = 29444,
    SPELL_BOLT_VOLLEY                                      = 34780,
    SPELL_BEWITCHING_AURA                                  = 29486,
    SPELL_REJUVENATION                                     = 71142,
    SPELL_ICE_TRAP                                         = 71249,
    SPELL_AURA_ROT                                         = 25818
};

// Might of Sylvanas yells
#define SAY_SYLVANAS_AGGRO "Quel'dorei nikdy nezahyne!"
#define SAY_SYLVANAS_SLAY "Shorel'aran!"
#define SAY_SYLVANAS_DEATH "Zemrela jsem se cti narozdil od vas!"
#define SAY_SYLVANAS_ICE "Co budete delat ted?"



/*#########
# Might of Sylvanas
#########*/
 class might_sylvanas : public CreatureScript
    {
    public:
        might_sylvanas() : CreatureScript("might_sylvanas") { }
struct might_sylvanasAI : public ScriptedAI
{
    might_sylvanasAI(Creature *c) : ScriptedAI(c) {}

    uint32 MultiTimer;
    uint32 VolleyTimer;
    uint32 SnakeTimer;
    uint32 PoisonTimer;
    uint32 TrapTimer;
    uint32 HealTimer;
    bool Haste;
    bool Healed;

    void Reset()
    {
        MultiTimer = 2000;
        VolleyTimer = 15000;
        SnakeTimer = 5000;
        PoisonTimer = 12000;
        TrapTimer = 20000;
        HealTimer = 25000;
        Haste = false;
        Healed = false;
    }

    void EnterCombat(Unit *pWho)
    {
        me->MonsterYell(SAY_SYLVANAS_AGGRO, LANG_UNIVERSAL, 0);
        me->AddAura(SPELL_BEWITCHING_AURA, me);
        me->AddAura(SPELL_AURA_ROT, me);
    }

    void KilledUnit(Unit* victim)
    {
        me->MonsterYell(SAY_SYLVANAS_SLAY, LANG_UNIVERSAL, 0);
    }

    void JustDied(Unit *killer)
    {
        me->MonsterYell(SAY_SYLVANAS_DEATH, LANG_UNIVERSAL, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        // Multishot každé 2 sec
        if (MultiTimer <= uiDiff)
        {
            if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                DoCast(pTarget, SPELL_MULTISHOT);
            MultiTimer = 4000;
        } else MultiTimer -= uiDiff;

        // Každých 10 sekund cástí Volley na náhodný cíl
        if (VolleyTimer <= uiDiff)
        {
            DoCastAOE(SPELL_VOLLEY);
            VolleyTimer = 15000;
        } else VolleyTimer -= uiDiff;

        // Každých 5 sekund cástí Snake Trap na náhodný cíl
        if (SnakeTimer <= uiDiff)
        {
            if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                for (uint8 i = 1; i <= 3; i++)
                {
                    me->SummonCreature(SUMMONED_SNAKE, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 60000);
                }
            SnakeTimer = 5000;
        } else SnakeTimer -= uiDiff;

        // Otraví oblast každých 10 sekund
        if (PoisonTimer <= uiDiff)
        {
            DoCastAOE(SPELL_BOLT_VOLLEY);
            PoisonTimer = 12000;
        } else PoisonTimer -= uiDiff;

        // Každých 20 sekund cástí Ice Trap na tanka
        if (TrapTimer <= uiDiff)
        {
            me->MonsterYell(SAY_SYLVANAS_ICE, LANG_UNIVERSAL, 0);
            DoCast(me->getVictim(), SPELL_ICE_TRAP);
            TrapTimer = 20000;
        } else TrapTimer -= uiDiff;

        // Každých 25 sekund cástí Rejuvenation
        if (HealTimer <= uiDiff)
        {
            DoCast(me, SPELL_REJUVENATION);
            HealTimer = 25000;
        } else HealTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};
	CreatureAI *GetAI(Creature *creature) const
        {
            return new might_sylvanasAI(creature);
        }
    };

    void AddSC_might_sylvanas()
    {
        new might_sylvanas;
    }