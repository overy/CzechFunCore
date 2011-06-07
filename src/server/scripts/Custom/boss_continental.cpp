    /*
    BOSS: CONTINENTAL -- meele boss, heal reduction, sleep on random target every 5 sec/5%,
    berserk in 7 min, every 30 sec enrage(+25%haste and dmg) etc ...
    BY DESSUS FOR CZECH FUN SERVER: FORTS.NO-IP.INFO
    */


    #include "ScriptPCH.h"

    enum eEnums
    {

    SPELL_Armor          =40935,
    SPELL_SLEEP          =9159,
    SPELL_MortalWound    =25646,
    SPELL_ShadowCleave   =72493,
    SPELL_Enrage         =28371,
    SPELL_Berserk        =61632,
    SPELL_HatefulStrike  =41926,
    SPELL_Whirlwind      =52027
    };




    // Continental script

    class boss_continental : public CreatureScript
    {
    public:
        boss_continental() : CreatureScript("boss_continental") { }

        struct boss_continentalAI : public ScriptedAI
        {
            boss_continentalAI(Creature* pCreature) : ScriptedAI(pCreature) {}


        uint32 m_uiSleep_Timer;
        uint32 m_uiMortalWound_Timer;
        uint32 m_uiShadowCleave_Timer;
        uint32 m_uiEnrage_Timer;
        uint32 m_uiBerserk_Timer;
        uint32 m_uiHatefulStrike_Timer;
       uint32 m_uiWhirlwind_Timer;
       uint32 m_uiArmor_Timer;

       
        void Reset()
        {
            m_uiSleep_Timer = 5000 + rand()%5000;
            m_uiMortalWound_Timer = 5100;
            m_uiShadowCleave_Timer = 9000;
            m_uiEnrage_Timer = 30000;
            m_uiBerserk_Timer = 420000;
            m_uiHatefulStrike_Timer = 13000;
          m_uiWhirlwind_Timer = 15600;
          m_uiArmor_Timer = 25000;


        }

    void EnterCombat(Unit * target)
        {
        me->MonsterYell("LOL?! Tito me maji zabit??? EPIC FAIL!!! .... No Problemo!",LANG_UNIVERSAL,NULL);
        }

        void KilledUnit(Unit * victim)
        {
        me->MonsterYell("A je dole! Kdo dalsi?!!",LANG_UNIVERSAL,NULL);
        }
     
        void JustDied(Unit * killer)
        {
        me->MonsterYell("HAHA ... stejne se RESPAWNU!",LANG_UNIVERSAL,NULL);
        }

    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            //Sleep_Timer
            if (m_uiSleep_Timer <= uiDiff)
            {
               if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_SLEEP);

                m_uiSleep_Timer = 5000 + rand()%5000;
            }
            else
                m_uiSleep_Timer -= uiDiff;


            //MortalWound_Timer
            if (m_uiMortalWound_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_MortalWound);
         
                m_uiMortalWound_Timer = 8000;
            }
            else
               m_uiMortalWound_Timer -= uiDiff;


          //Armor_Timer
            if (m_uiArmor_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_Armor);
         
                m_uiArmor_Timer = 25000;
            }
            else
               m_uiArmor_Timer -= uiDiff;


            //Whirlwind_timer
            if (m_uiWhirlwind_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_Whirlwind);

                m_uiWhirlwind_Timer = 20000;
            }
            else
               m_uiWhirlwind_Timer -= uiDiff;



            //ShadowCleave_Timer
            if (m_uiShadowCleave_Timer <= uiDiff)
            {
                    DoCast(me->getVictim(), SPELL_ShadowCleave);

                m_uiShadowCleave_Timer = 12000;
            }
            else
                m_uiShadowCleave_Timer -= uiDiff;

            //HatefulStrike_Timer
            if (m_uiHatefulStrike_Timer <= uiDiff)
            {
                    DoCast(me->getVictim(), SPELL_HatefulStrike);

                m_uiHatefulStrike_Timer = 15000;
            }
            else
                m_uiHatefulStrike_Timer -= uiDiff;



         //Enrage_timer
            if (m_uiEnrage_Timer <= uiDiff)
            {
                if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_Enrage);

                m_uiEnrage_Timer = 30000;
            }
            else
                m_uiEnrage_Timer -= uiDiff;




            //Berserk_timer
            if (m_uiBerserk_Timer <= uiDiff)
            {
                  DoCast(me, SPELL_Berserk, true);
                m_uiBerserk_Timer = 300000;
            }
            else
               m_uiBerserk_Timer -= uiDiff;

           
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new boss_continentalAI(creature);
        }
    };

    void AddSC_boss_continental()
    {
        new boss_continental;
    }






