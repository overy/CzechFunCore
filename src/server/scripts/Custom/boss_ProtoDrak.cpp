        #include "ScriptPCH.h"

        enum Spells
        {

            SPELL_stomp                  = 60880,             //dupne dá dmg a stun na 2 sec.
            SPELL_taillash               = 74531,            //odhazuje ocasem
            SPELL_fusearmor              = 64771,            //redukuje armor stackuje se 5stack=100%
            SPELL_fireball               = 63815,            //fireball klasickej
            SPELL_windbuffet             = 62666,           //odhodí
            SPELL_flamebreath            = 64021,           //breath
            SPELL_surgeofdarkness        = 62662            //dá si buff pøi kterým se musí kitovat
        };




        // ProtoDrak script

        class boss_ProtoDrak : public CreatureScript
        {
        public:
            boss_ProtoDrak() : CreatureScript("boss_ProtoDrak") { }

            struct boss_ProtoDrakAI : public ScriptedAI
            {
                boss_ProtoDrakAI(Creature* pCreature) : ScriptedAI(pCreature) {}


            uint32 m_uistomp_Timer;
            uint32 m_uitaillash_Timer;
            uint32 m_uifusearmor_Timer;
            uint32 m_uifireball_Timer;
            uint32 m_uiwindbuffet_Timer;
            uint32 m_uiflamebreath_Timer;
            uint32 m_uisurgeofdarkness_Timer;
         

           
            void Reset()
            {
                m_uistomp_Timer = 60000;
                m_uitaillash_Timer = 10000;
                m_uifusearmor_Timer = 12000;
                m_uifireball_Timer = 5000;
                m_uiwindbuffet_Timer = 60000;
                m_uiflamebreath_Timer = 90000;
                m_uisurgeofdarkness_Timer = 200000;
             


            }

        void EnterCombat(Unit * target)
            {
            me->MonsterYell("Ty jsi me probudil za to zemri",LANG_UNIVERSAL,NULL);
            }

            void KilledUnit(Unit * victim)
            {
            me->MonsterYell("Shor",LANG_UNIVERSAL,NULL);
            }
         
            void JustDied(Unit * killer)
            {
            me->MonsterYell("NOOOooooo",LANG_UNIVERSAL,NULL);
            }

        void UpdateAI(const uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                //fireball_Timer
                if (m_uifireball_Timer <= uiDiff)
                {
                   if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(pTarget, SPELL_fireball);

                    m_uifireball_Timer = 5000;
                }
                else
                    m_uifireball_Timer -= uiDiff;


                //fusearmor_Timer
                if (m_uifusearmor_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_fusearmor);
             
                    m_uifusearmor_Timer = 120000;
                }
                else
                   m_uifusearmor_Timer -= uiDiff;


              //windbuffet_Timer
                if (m_uiwindbuffet_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_windbuffet);
             
                    m_uiwindbuffet_Timer = 60000;
                }
                else
                   m_uiwindbuffet_Timer -= uiDiff;


                //flamebreath_timer
                if (m_uiflamebreath_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_flamebreath);

                    m_uiflamebreath_Timer = 20000;
                }
                else
                   m_uiflamebreath_Timer -= uiDiff;



                //taillash_Timer
                if (m_uitaillash_Timer <= uiDiff)
                {
                        DoCast(me->getVictim(), SPELL_taillash);

                    m_uitaillash_Timer = 10000;
                }
                else
                    m_uitaillash_Timer -= uiDiff;

                //stomp_Timer
                if (m_uistomp_Timer <= uiDiff)
                {
                        DoCast(me->getVictim(), SPELL_stomp);

                    m_uistomp_Timer = 60000;
                }
                else
                    m_uistomp_Timer -= uiDiff;



            //surgeofdarkness_timer
                if (m_uisurgeofdarkness_Timer <= uiDiff)
                {
                    if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(pTarget, SPELL_surgeofdarkness);

                    m_uisurgeofdarkness_Timer = 200000;
                }
                else
                    m_uisurgeofdarkness_Timer -= uiDiff;
               
                              DoMeleeAttackIfReady();   
                 }
        };

        CreatureAI *GetAI(Creature *creature) const
            {
                return new boss_ProtoDrakAI(creature);

                }
        };

        void AddSC_boss_ProtoDrak()
        {
            new boss_ProtoDrak;
        }
