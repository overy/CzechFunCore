    #include "ScriptPCH.h"

        enum Spells
        {
            Zajic                                       = 666690,
            SPELL_chaosbolt                             = 71108,
            SPELL_fellighting                           = 66528,
            SPELL_FelInferno                            = 67047,
            SPELL_shadowblast                           = 41078
        };

        // Demoncreator script
        class boss_Demoncreator : public CreatureScript
        {
        public:
            boss_Demoncreator() : CreatureScript("boss_Demoncreator") { }

            struct boss_DemoncreatorAI : public ScriptedAI
            {
                boss_DemoncreatorAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uichaosbolt_Timer;
            uint32 m_uifellighting_Timer;
            uint32 m_uiFelInferno_Timer;
            uint32 m_uishadowblast_Timer;
                    
            void Reset()
            {    
                m_uichaosbolt_Timer = 5000;
                m_uifellighting_Timer = 15001;
                m_uiFelInferno_Timer = 9000;
                m_uishadowblast_Timer = 20000;
            }

        void EnterCombat(Unit * target)
            {
                me->MonsterYell("GulDan nam vsem vladne ",LANG_UNIVERSAL,NULL);
            }

            void KilledUnit(Unit * victim)
            {
                me->MonsterYell("prach jsi a v prach se obratis",LANG_UNIVERSAL,NULL);
            }
         
            void JustDied(Unit * killer)
            {
                me->MonsterYell("AAAAaaaaaaaa Ma duse nyni zije v zajicovy",LANG_UNIVERSAL,NULL);
                me->SummonCreature(Zajic,me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0 ,TEMPSUMMON_TIMED_DESPAWN,900000 );           
            }

        void UpdateAI(const uint32 uiDiff)
        {
                if (!UpdateVictim())
                    return;

                //chaosbolt_Timer
                if (m_uichaosbolt_Timer <= uiDiff)
                {
                   if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(pTarget, SPELL_chaosbolt);
                    m_uichaosbolt_Timer = 5000;
                }
                else
                    m_uichaosbolt_Timer -= uiDiff;       

              //fellighting_Timer
                if (m_uifellighting_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_fellighting);             
                    m_uifellighting_Timer = 15001;
                }
                else
                   m_uifellighting_Timer -= uiDiff;

                //FelInferno_timer
                if (m_uiFelInferno_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_FelInferno);
                    m_uiFelInferno_Timer = 9000;
                }
                else
                   m_uiFelInferno_Timer -= uiDiff;

            //shadowblast_timer
                if (m_uishadowblast_Timer <= uiDiff)
                {
                    if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 1))
                        DoCast(pTarget, SPELL_shadowblast);
                    m_uishadowblast_Timer = 20000;
                }
                else
                    m_uishadowblast_Timer -= uiDiff;
               
        DoMeleeAttackIfReady();
                 }
         };

        CreatureAI *GetAI(Creature *creature) const
        {
                return new boss_DemoncreatorAI(creature);

        }
 };
        void AddSC_boss_Demoncreator()
        {
            new boss_Demoncreator;
        }
