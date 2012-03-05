#include "ScriptPCH.h"


// Likantropo yells
#define SAY_LIKANTROPO_AGGRO "Vsichni mi budete slouzit!"
#define SAY_LIKANTROPO_SLAY "Vsichni poznate muj hnev!"
#define SAY_LIKANTROPO_DEATH "Neeeee, ja se vratim!"
#define SAY_LIKANTROPO_MORPH "Ted se ukazte!"


enum LikantropoSpells
{
    ENRAGE                                                 = 48138,
    FRENZY                                                 = 48142,
    MORTAL_WOUND                                           = 59265,
    WORGEN_BITE                                            = 55266,
    WORGEN_CALL                                            = 53095,
    DECREPIT_FEVER                                         = 29998,
    SUMMON_WORGEN                                          = 27020,
	WORGEN												   = 27020
};



/*#########
# Likantropo
#########*/
 class likantropo : public CreatureScript
{
    public:
        likantropo() : CreatureScript("likantropo") { }

struct likantropoAI : public ScriptedAI
{
    likantropoAI(Creature* pCreature) : ScriptedAI(pCreature) {}

    uint32 EnrageTimer;
    uint32 WoundTimer;
    uint32 BiteTimer;
    uint32 FeverTimer;
	uint32 WorgenTimer;
    bool Enraged;
    bool Worgen;

    void Reset()
    {
        me->SetDisplayId(17263); // human form
        EnrageTimer = 15000;
        WoundTimer = 5000;
        BiteTimer = 45000;
        FeverTimer = 12000;
		WorgenTimer = 15000;
        Enraged = false;
        Worgen = false;
    }

    void EnterCombat(Unit * target)
    {
       me->MonsterYell(SAY_LIKANTROPO_AGGRO, LANG_UNIVERSAL, 0);
    }

    void KilledUnit(Unit * victim)
    {
        me->MonsterYell(SAY_LIKANTROPO_SLAY, LANG_UNIVERSAL, 0);
        // V p��pad� smrti hr��e vyvol� z jeho t�la worgena
        if (victim->GetTypeId() == TYPEID_PLAYER)
            victim->SummonCreature(SUMMON_WORGEN, victim->GetPositionX(), victim->GetPositionY(), victim->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 60000);
    }

    void JustDied(Unit *killer)
    {
        me->MonsterYell(SAY_LIKANTROPO_DEATH, LANG_UNIVERSAL, 0);
        me->SetDisplayId(17263); // human form
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

		// Summon worgena co 15 sekund 
		if (WorgenTimer <= uiDiff)
			{
				if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,1))
					pTarget->SummonCreature(WORGEN, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 60000);                 
				WorgenTimer = 15000;
			} else WorgenTimer -= uiDiff;
        // Mal� Enrage (d�lka 8 sekund), kter� zdvojn�sobuje damage cca ka�d�ch 20 sekund
        if (EnrageTimer <= uiDiff)
        {
            DoCast(me, ENRAGE);
            EnrageTimer = urand(20000,25000);
        } else EnrageTimer -= uiDiff;

        // Ka�d�ch 5 sekund c�st� Mortal Wound, kter� redukuje heal o 5% (max 15 stack)
        if (WoundTimer <= uiDiff)
        {
            DoCast(me->getVictim(), MORTAL_WOUND, true);
            WoundTimer = 5000;
        } else WoundTimer -= uiDiff;

        // Ka�d�ch 20 sekund c�st� Decrepit Fever, kter� redukuje bl�zk�m nep��tel�m HP o 50% po dobu 21 sekund a d� 3k dmg ka�d� 3 sekundy
        if (FeverTimer <= uiDiff)
        {
            DoCastAOE(DECREPIT_FEVER);
            FeverTimer = 20000;
        } else FeverTimer -= uiDiff;

        // Ka�d�ch 45 sekund pou�ije Whirlwind 
        if (BiteTimer <= uiDiff)
        {
            DoCast(me, WORGEN_BITE);
            if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,1))
                me->AddAura(WORGEN_CALL, pTarget);
            BiteTimer = 45000;
        } else BiteTimer -= uiDiff;

        // Na 80% HP se zm�n� na Worgena
        if ((me->GetHealth()*100 / me->GetMaxHealth() <= 80) && !Worgen)
        {
            me->SetDisplayId(26787);
            me->MonsterYell(SAY_LIKANTROPO_MORPH, LANG_UNIVERSAL, 0);
            DoCast(me, ENRAGE);
            EnrageTimer = urand(25000,35000);
            Worgen = true;
        }

        // Enrage na 15% HP (zvy�uje rychlost �toku o 50% a 50% po�kozen�)
        if ((me->GetHealth()*100 / me->GetMaxHealth() <= 15) && !Enraged)
        {
            DoCast(me, FRENZY);
            Enraged = true;
        }

        DoMeleeAttackIfReady();
    }
};


CreatureAI *GetAI(Creature *creature) const
        {
            return new likantropoAI(creature);
        }
    };

    void AddSC_likantropo()
    {
        new likantropo;
    }