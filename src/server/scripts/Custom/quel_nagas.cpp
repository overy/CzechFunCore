#include "ScriptPCH.h"

enum QuelNagasSpells
{
    SPELL_MAGIC_BARRIER                                    = 38112,
    SPELL_TOXIC_SPORES                                     = 38575,
    TOXIC_SPORES_TRIGGER                                   = 22207,
    SUMMONED_MURLOC                                        = 27649,
    SPELL_POISON_BOLT_VOLLEY                               = 54098,
    SPELL_ENTANGLE                                         = 38316,
    SPELL_WRATH                                            = 63259
};

// Quel'Nagas yells
#define SAY_NAGAS_AGGRO "Ja s vama zatocim cervi bidni!"
#define SAY_NAGAS_SLAY "Myslíte ze mate sanci?"
#define SAY_NAGAS_DEATH "Nemuzu tomu uverit!"
#define SAY_NAGAS_SUMMON "Murloci!!!"


/*#########
# Quel'Nagas
#########*/
class quel_nagas : public CreatureScript
    {
    public:
        quel_nagas() : CreatureScript("quel_nagas") { }
struct quel_nagasAI : public ScriptedAI
{
    quel_nagasAI(Creature *c) : ScriptedAI(c) {}

    uint32 Phase2Timer;
    uint32 Phase1Timer;
    uint32 SporeTimer;
    uint32 PoisonTimer;
    uint32 RootTimer;
    bool Phase1;

    void Reset()
    {
        Phase2Timer = 60000;
        Phase1Timer = 90000;
        SporeTimer = 6000;
        PoisonTimer = 15000;
        RootTimer = 25000;
        Phase1 = true;
    }

    void EnterCombat(Unit *pWho)
    {
        me->MonsterYell(SAY_NAGAS_AGGRO, LANG_UNIVERSAL, 0);
    }

    void KilledUnit(Unit* victim)
    {
        me->MonsterYell(SAY_NAGAS_SLAY, LANG_UNIVERSAL, 0);
    }

    void JustDied(Unit *killer)
    {
        me->MonsterYell(SAY_NAGAS_DEATH, LANG_UNIVERSAL, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        // Summon Phase
        if (Phase2Timer <= uiDiff)
        {
            Phase1 = false;
            me->InterruptNonMeleeSpells(false);
            me->SetReactState(REACT_PASSIVE);
            me->AttackStop();
            me->RemoveAllAuras();
            // V 2 fázi pøivolá 2-3 murloky
            if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                for (uint8 i = 1; i <= 3; i++)
                {
                    me->SummonCreature(SUMMONED_MURLOC, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 60000);
                }
            me->AddAura(SPELL_MAGIC_BARRIER, me);
            me->MonsterYell(SAY_NAGAS_SUMMON, LANG_UNIVERSAL, 0);
            Phase2Timer = 90000;
        } else Phase2Timer -= uiDiff;

        // Normal Phase
        if (Phase1Timer <= uiDiff)
        {
            Phase1 = true;
            me->InterruptNonMeleeSpells(false);
            me->SetReactState(REACT_AGGRESSIVE);
            me->RemoveAurasDueToSpell(SPELL_MAGIC_BARRIER);
            DoZoneInCombat();
            if (me->getThreatManager().isThreatListEmpty())
                EnterEvadeMode();
            Phase1Timer = 90000;
        } else Phase1Timer -= uiDiff;

        if (Phase1)
        {
            // Každých 15 sekund vyvolá Toxickou spóru na náhodného hráèe
            if (SporeTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(false);
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                {
                    Creature* trig = me->SummonCreature(TOXIC_SPORES_TRIGGER, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 30000);
                    if (trig)
                    {
                        trig->setFaction(14);
                        trig->CastSpell(trig, SPELL_TOXIC_SPORES,true);
                    }
                }                
                SporeTimer = 15000;
            } else SporeTimer -= uiDiff;

            // Otraví oblast každých 10 sekund
            if (PoisonTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(false);
                DoCastAOE(SPELL_POISON_BOLT_VOLLEY);
                PoisonTimer = 10000;
            } else PoisonTimer -= uiDiff;

            // Koøeny na náhodný cíl každých 25 sekund
            if (RootTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(false);
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_ENTANGLE);
                RootTimer = 25000;
            } else RootTimer -= uiDiff;
        }

        DoSpellAttackIfReady(SPELL_WRATH);
		DoMeleeAttackIfReady();
    }
};

CreatureAI *GetAI(Creature *creature) const
        {
            return new quel_nagasAI(creature);
        }
    };

    void AddSC_quel_nagas()
    {
        new quel_nagas;
    }

