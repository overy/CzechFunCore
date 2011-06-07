#include "ScriptPCH.h"


 #define        SPELL_glaive		   49481
 #define        SPELL_chainlighting    64213
 #define        SPELL_knockback        49398
 #define        SPELL_drainmana        46453

 #define        SPELL_arcanefield      47346
 #define        SPELL_arcaneblast      67999
 #define        SPELL_arcanebreath     63317
 #define        SPELL_fingerofdeath    31984

 #define        SPELL_bonestorm        69076
 #define        SPELL_oldwounds        66620
 #define        SPELL_spellreflection  47981
 #define        SPELL_fingerofdeath    31984

 #define        SPELL_elektroshock     64971
 #define        SPELL_chainlighting    64213
 #define        SPELL_thunderstorm     59154
 #define        SPELL_drainmana        46453

// trashcustom script
    class boss_trashcustom : public CreatureScript
    {
    public:
        boss_trashcustom() : CreatureScript("boss_trashcustom") { }

        struct boss_trashcustomAI : public ScriptedAI
        {
            boss_trashcustomAI(Creature* pCreature) : ScriptedAI(pCreature) {}

        uint32 m_uiglaive_Timer;
        uint32 m_uichainlighting_Timer;
        uint32 m_uiknockback_Timer;
        uint32 m_uidrainmana_Timer;
         
        void Reset()
        { 
            m_uiglaive_Timer = 5000;
            m_uichainlighting_Timer = 15001;
            m_uiknockback_Timer = 9000;
            m_uidrainmana_Timer = 20000;
        }

    void EnterCombat(Unit * target)
        {
        me->MonsterYell("Go away until you want to live",LANG_UNIVERSAL,NULL);
        }

   void KilledUnit(Unit * victim)
        {
        me->MonsterYell("Be glad you’re dead you would have expecter a worse fate",LANG_UNIVERSAL,NULL);
        }  

   void JustDied(Unit * killer)
        {
        me->MonsterYell("Leave this place",LANG_UNIVERSAL,NULL);
        }

    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            //glaive_Timer
            if (m_uiglaive_Timer <= uiDiff)
            {
               if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_glaive);

                m_uiglaive_Timer = 5000;
            }
            else
                m_uiglaive_Timer -= uiDiff;

          //chainlighting_Timer
            if (m_uichainlighting_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_chainlighting);
         
                m_uichainlighting_Timer = 15001;
            }
            else
               m_uichainlighting_Timer -= uiDiff;


            //knockback_timer
            if (m_uiknockback_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_knockback);

                m_uiknockback_Timer = 9000;
            }
            else
               m_uiknockback_Timer -= uiDiff;

        //drainmana_timer
            if (m_uidrainmana_Timer <= uiDiff)
            {
                if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_drainmana);

                m_uidrainmana_Timer = 20000;
            }
            else
                m_uidrainmana_Timer -= uiDiff;
           
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new boss_trashcustomAI(creature);

            }
    };


	// mag script
	class boss_mag : public CreatureScript
    {
    public:
        boss_mag() : CreatureScript("boss_mag") { }

        struct boss_magAI : public ScriptedAI
        {
            boss_magAI(Creature* pCreature) : ScriptedAI(pCreature) {}


        uint32 m_uiarcanefield_Timer;
        uint32 m_uiarcaneblast_Timer;
        uint32 m_uiarcanebreath_Timer;
        uint32 m_uifingerofdeath_Timer;
      
        void Reset()
        {
            m_uiarcanefield_Timer = 10000;
            m_uiarcaneblast_Timer = 5000;
            m_uiarcanebreath_Timer = 90000;
            m_uifingerofdeath_Timer = 200000;
        }

    void EnterCombat(Unit * target)
        {
        me->MonsterYell("Uzij si silu Arcane",LANG_UNIVERSAL,NULL);
       
    DoCast (me, SPELL_arcanefield);
}

        void KilledUnit(Unit * victim)
        {
        me->MonsterYell("On byl jeden a nebude jedinej",LANG_UNIVERSAL,NULL);
        }
     
        void JustDied(Unit * killer)
        {
        me->MonsterYell("AAAAaaa",LANG_UNIVERSAL,NULL);
        }

    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            //arcaneblast_Timer
            if (m_uiarcaneblast_Timer <= uiDiff)
            {
               if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_arcaneblast);

                m_uiarcaneblast_Timer = 5000;
            }
            else
                m_uiarcaneblast_Timer -= uiDiff;

            //arcanebreath_timer
            if (m_uiarcanebreath_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_arcanebreath);

                m_uiarcanebreath_Timer = 20000;
            }
            else
               m_uiarcanebreath_Timer -= uiDiff;

        //fingerofdeath_timer
            if (m_uifingerofdeath_Timer <= uiDiff)
            {
                if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_fingerofdeath);

                m_uifingerofdeath_Timer = 200000;
            }
            else
                m_uifingerofdeath_Timer -= uiDiff;
           
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new boss_magAI(creature);

            }
    };


	// warrior script
	class boss_warrior : public CreatureScript
    {
    public:
        boss_warrior() : CreatureScript("boss_warrior") { }

        struct boss_warriorAI : public ScriptedAI
        {
            boss_warriorAI(Creature* pCreature) : ScriptedAI(pCreature) {}

        uint32 m_uibonestorm_Timer;
        uint32 m_uioldwounds_Timer;
        uint32 m_uispellreflection_Timer;
        uint32 m_uifingerofdeath_Timer;

		void Reset()
        {
            m_uibonestorm_Timer = 3000;
            m_uioldwounds_Timer = 5000;
            m_uispellreflection_Timer = 90000;
            m_uifingerofdeath_Timer = 200000;
        }

    void EnterCombat(Unit * target)
        {
        me->MonsterYell("Ty se mi nemuzes rovnat",LANG_UNIVERSAL,NULL);
       
    DoCast (me, SPELL_bonestorm);
}

        void KilledUnit(Unit * victim)
        {
        me->MonsterYell("Brneni se ti brzo zacne cervenat",LANG_UNIVERSAL,NULL);
        }
     
        void JustDied(Unit * killer)
        {
        me->MonsterYell("vis kolik me ten set stal? a ty me ho rozbijes",LANG_UNIVERSAL,NULL);
        }

    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            //oldwounds_Timer
            if (m_uioldwounds_Timer <= uiDiff)
            {
               if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_oldwounds);

                m_uioldwounds_Timer = 5000;
            }
            else
                m_uioldwounds_Timer -= uiDiff;
        
            //spellreflection_timer
            if (m_uispellreflection_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_spellreflection);

                m_uispellreflection_Timer = 20000;
            }
            else
               m_uispellreflection_Timer -= uiDiff;

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
            return new boss_warriorAI(creature);

            }
    };


	// shocker script
	class boss_shocker : public CreatureScript
    {
    public:
        boss_shocker() : CreatureScript("boss_shocker") { }

        struct boss_shockerAI : public ScriptedAI
        {
            boss_shockerAI(Creature* pCreature) : ScriptedAI(pCreature) {}

        uint32 m_uielektroshock_Timer;
        uint32 m_uichainlighting_Timer;
        uint32 m_uithunderstorm_Timer;
        uint32 m_uidrainmana_Timer;
       
        void Reset()
        {
           
            m_uielektroshock_Timer = 5000;
            m_uichainlighting_Timer = 15001;
            m_uithunderstorm_Timer = 9000;
            m_uidrainmana_Timer = 20000;
        }

    void EnterCombat(Unit * target)
        {
        me->MonsterYell("warning high voltage ",LANG_UNIVERSAL,NULL);
        }

        void KilledUnit(Unit * victim)
        {
        me->MonsterYell("overload",LANG_UNIVERSAL,NULL);
        }
     
        void JustDied(Unit * killer)
        {
        me->MonsterYell("short-circuit",LANG_UNIVERSAL,NULL);
        }

    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            //elektroshock_Timer
            if (m_uielektroshock_Timer <= uiDiff)
            {
               if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_elektroshock);

                m_uielektroshock_Timer = 5000;
            }
            else
                m_uielektroshock_Timer -= uiDiff;

          //chainlighting_Timer
            if (m_uichainlighting_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_chainlighting);
         
                m_uichainlighting_Timer = 15001;
            }
            else
               m_uichainlighting_Timer -= uiDiff;


            //thunderstorm_timer
            if (m_uithunderstorm_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_thunderstorm);

                m_uithunderstorm_Timer = 9000;
            }
            else
               m_uithunderstorm_Timer -= uiDiff;

        //drainmana_timer
            if (m_uidrainmana_Timer <= uiDiff)
            {
                if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_drainmana);

                m_uidrainmana_Timer = 20000;
            }
            else
                m_uidrainmana_Timer -= uiDiff;
           
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new boss_shockerAI(creature);

            }
    };

    void AddSC_boss_trashcustom()
    {
        new boss_trashcustom;
		new boss_mag;
		new boss_warrior;
		new boss_shocker;
    }