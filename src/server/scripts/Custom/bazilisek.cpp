    #include "ScriptPCH.h"

    enum Spells
    {

        SPELL_cripplingpoison                           = 25809,
        SPELL_taillash                                      = 74531,
        SPELL_necroticpoison                           = 28776,
        SPELL_venombolt                                 = 59839,
        SPELL_poisonnova                                = 59842,
        SPELL_poisonbreath                              = 59271,
        SPELL_fingerofdeath                             = 31984
    };




    // bazilisek script

    class bazilisek : public CreatureScript
    {
    public:
        bazilisek() : CreatureScript("bazilisek") { }

        struct bazilisekAI : public ScriptedAI
        {
            bazilisekAI(Creature* pCreature) : ScriptedAI(pCreature) {}


        uint32 m_uicripplingpoison_Timer;
        uint32 m_uitaillash_Timer;
        uint32 m_uinecroticpoison_Timer;
        uint32 m_uivenombolt_Timer;
        uint32 m_uipoisonnova_Timer;
        uint32 m_uipoisonbreath_Timer;
        uint32 m_uifingerofdeath_Timer;
     

       
        void Reset()
        {
            m_uicripplingpoison_Timer = 60000;
            m_uitaillash_Timer = 10000;
            m_uinecroticpoison_Timer = 12000;
            m_uivenombolt_Timer = 5000;
            m_uipoisonnova_Timer = 15000;
            m_uipoisonbreath_Timer = 90000;
            m_uifingerofdeath_Timer = 200000;
         


        }

    void EnterCombat(Unit * target)
        {
        me->MonsterYell("pohled do oci baziliska pusobi okamzitou smrt",LANG_UNIVERSAL,NULL);
        }

        void KilledUnit(Unit * victim)
        {
        me->MonsterYell("Hej ty podivej se mi do oci, vidis ani to nebolelo",LANG_UNIVERSAL,NULL);
        }
     
        void JustDied(Unit * killer)
        {
        me->MonsterYell("ja sice zemru...ale me dilo pokracuje",LANG_UNIVERSAL,NULL);
        }

    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            //venombolt_Timer
            if (m_uivenombolt_Timer <= uiDiff)
            {
               if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_venombolt);

                m_uivenombolt_Timer = 5000;
            }
            else
                m_uivenombolt_Timer -= uiDiff;


            //necroticpoison_Timer
            if (m_uinecroticpoison_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_necroticpoison);
         
                m_uinecroticpoison_Timer = 120000;
            }
            else
               m_uinecroticpoison_Timer -= uiDiff;


          //poisonnova_Timer
            if (m_uipoisonnova_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_poisonnova);
         
                m_uipoisonnova_Timer = 20000;
            }
            else
               m_uipoisonnova_Timer -= uiDiff;


            //poisonbreath_timer
            if (m_uipoisonbreath_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_poisonbreath);

                m_uipoisonbreath_Timer = 20000;
            }
            else
               m_uipoisonbreath_Timer -= uiDiff;



            //taillash_Timer
            if (m_uitaillash_Timer <= uiDiff)
            {
                    DoCast(me->getVictim(), SPELL_taillash);

                m_uitaillash_Timer = 10000;
            }
            else
                m_uitaillash_Timer -= uiDiff;

            //cripplingpoison_Timer
            if (m_uicripplingpoison_Timer <= uiDiff)
            {
                    DoCast(me->getVictim(), SPELL_cripplingpoison);

                m_uicripplingpoison_Timer = 60000;
            }
            else
                m_uicripplingpoison_Timer -= uiDiff;



        //fingerofdeath_timer
            if (m_uifingerofdeath_Timer <= uiDiff)
            {
                if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_fingerofdeath);

                m_uifingerofdeath_Timer = 200000;
            }
            else
                m_uifingerofdeath_Timer -= uiDiff;
           
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new bazilisekAI(creature);

            }
    };

    void AddSC_bazilisek()
    {
        new bazilisek;
    }