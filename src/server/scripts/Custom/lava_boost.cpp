#include "ScriptPCH.h"

enum LavaBoostSpells
{
    HEALING_WAVE                                           = 68115,
    LIGHTNING_BOLT                                         = 59024,
    BLOODLUST                                              = 41185,
    SUMMON_AIR_ELEMENTAL                                   = 31452,
    LAVA_BURST                                             = 66813,
    CHAIN_LIGHTNING                                        = 54531,
    FLAME_SHOCK                                            = 43303,
    EARTH_SHOCK                                            = 26194,
    LIGHTNING_RING                                         = 59848,
	SPELL_HEX											   = 66054,
	SPELL_EARTH_SHIELD									   = 66063,
	SKELE_TOTEM										       = 12506,
	LIGH_TOTEM										       = 28294,
	SCRO_TOTEM									           = 15038,
	ICE_TOTEM										       = 18975
};

// Lava Boost yells
#define SAY_LAVA_AGGRO "Zatim nemate strach, ale vse ma svuj cas!"
#define SAY_LAVA_SLAY "Uz se bojite?!"
#define SAY_LAVA_DEATH "Aaaa, jak je to mozne?!!!"
#define SAY_LAVA_BLOOD "Bloodlust!!!"


/*#########
# Lava Boost
#########*/
 class lava_boost : public CreatureScript
    {
    public:
        lava_boost() : CreatureScript("lava_boost") { }
struct lava_boostAI : public ScriptedAI
{
    lava_boostAI(Creature *c) : ScriptedAI(c) {}

    uint32 ChainTimer;
    uint32 LavaTimer;
    uint32 FlameTimer;
    uint32 ShockTimer;
	uint32 HealedTimer;
	uint32 AirTimer;
	uint32 HexTimer;
	uint32 Totems;
    bool Haste;
    

    void Reset()
    {
        ChainTimer = 8000;
        LavaTimer = 15000;
        FlameTimer = 4000;
        ShockTimer = 10000;       
        HealedTimer = 10000;
		AirTimer = 25000;
		HexTimer = 15000;
		Totems = 20000;
		Haste = false;
    }

    void EnterCombat(Unit *pWho)
    {
        me->MonsterYell(SAY_LAVA_AGGRO, LANG_UNIVERSAL, 0);
    }

    void KilledUnit(Unit* victim)
    {
        me->MonsterYell(SAY_LAVA_SLAY, LANG_UNIVERSAL, 0);
    }

    void JustDied(Unit *killer)
    {
        me->MonsterYell(SAY_LAVA_DEATH, LANG_UNIVERSAL, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

		// totemy
		if (Totems <= uiDiff)
        {
            me->InterruptNonMeleeSpells(false);
            DoCast(me, SKELE_TOTEM,true);
			DoCast(me, LIGH_TOTEM,true);
			DoCast(me, SCRO_TOTEM,true);
			DoCast(me, ICE_TOTEM,true);
			DoCast(me, SPELL_EARTH_SHIELD,true);
			Totems = 22000;
        } else Totems -= uiDiff;
		
		// Hex co 10-20 sec
		if (HexTimer <= uiDiff)
            {
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                    DoCast(pTarget,SPELL_HEX);
                HexTimer = urand(10000,20000);
            } else HexTimer -= uiDiff;

        // Chain Lightning každých 8 až 13 sekund
        if (ChainTimer <= uiDiff)
        {
            me->InterruptNonMeleeSpells(false);
            DoCast(me->getVictim(), CHAIN_LIGHTNING, true);
            ChainTimer = urand(8000,13000);
        } else ChainTimer -= uiDiff;

        // Každých 15 sekund cástí Lava Burst na náhodný cíl (damage 15-17k HP)
        if (LavaTimer <= uiDiff)
        {
            me->InterruptNonMeleeSpells(false);
            if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,1))
                DoCast(pTarget, LAVA_BURST);
				DoCast(me, LIGHTNING_RING);
            LavaTimer = 15000;
        } else LavaTimer -= uiDiff;

        // Každých 10 sekund cástí Earth Shock na náhodný cíl
        if (ShockTimer <= uiDiff)
        {
            me->InterruptNonMeleeSpells(false);
            if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,1))
                DoCast(pTarget, EARTH_SHOCK);         
            ShockTimer = 10000;
        } else ShockTimer -= uiDiff;

        // Každých 10 sekund dá Flame Shock na tanka
        if (FlameTimer <= uiDiff)
        {
            me->InterruptNonMeleeSpells(false);
            DoCast(me->getVictim(), FLAME_SHOCK);
            FlameTimer = 10000;
        } else FlameTimer -= uiDiff;

        // Když má pod 25% HP tak se co 10sec léèí
		if ((me->GetHealth()*100 / me->GetMaxHealth() <= 25))
        {
			if (HealedTimer <= uiDiff)
			{
				me->InterruptNonMeleeSpells(false);
				DoCast(me, HEALING_WAVE,true);
				HealedTimer = 5000;
			} else HealedTimer -= uiDiff;
        } 

        // Bloodlust na 50% a pøivolá 2 Air Elementaly
        if ((me->GetHealth()*100 / me->GetMaxHealth() <= 50) && !Haste)
        {
            me->InterruptNonMeleeSpells(false);
            DoCast(me, BLOODLUST);
            me->MonsterYell(SAY_LAVA_BLOOD, LANG_UNIVERSAL, 0);
            me->SummonCreature(SUMMON_AIR_ELEMENTAL, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 60000);
            me->SummonCreature(SUMMON_AIR_ELEMENTAL, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 60000);           
			Haste = true;
        }
		// Každých 25sec pøivolá air elementala
        if (AirTimer <= uiDiff)
        {
			me->InterruptNonMeleeSpells(false);
			me->SummonCreature(SUMMON_AIR_ELEMENTAL, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 60000);
            AirTimer = 25000;
        } else AirTimer -= uiDiff;

        DoSpellAttackIfReady(LIGHTNING_BOLT);
    }
};

CreatureAI *GetAI(Creature *creature) const
        {
            return new lava_boostAI(creature);
        }
    };

    void AddSC_lava_boost()
    {
        new lava_boost;
    }