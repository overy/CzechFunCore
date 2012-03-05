    #include "ScriptPCH.h"

    enum Spells
       {
          SPELL_jump                                      = 61724,
          SPELL_drainlife                                 = 70213,
          SPELL_fusearmor                                 = 64771,
          SPELL_curseofdoom                               = 64157,
          SPELL_shadownova                                = 71106,
          SPELL_shadowbreath                              = 59126,
          SPELL_AURA                                      = 69491,
          SPELL_duse                                      = 69859
       };

    class boss_zajac : public CreatureScript
    {
       public:
          boss_zajac() : CreatureScript("boss_zajac") { }

    struct boss_zajacAI : public ScriptedAI
    {
       boss_zajacAI(Creature* pCreature) : ScriptedAI(pCreature) {}     

       uint32 m_uijump_Timer;
       uint32 m_uidrainlife_Timer;
       uint32 m_uifusearmor_Timer;
       uint32 m_uicurseofdoom_Timer;
       uint32 m_uishadownova_Timer;
       uint32 m_uishadowbreath_Timer;
       bool AURAs;

       void Reset()
       {
          me->SetDisplayId(6302);
          m_uijump_Timer = 60000;
          m_uidrainlife_Timer = 48000;
          m_uifusearmor_Timer = 12000;
          m_uicurseofdoom_Timer = 5000;
          m_uishadownova_Timer = 18000;
          m_uishadowbreath_Timer = 90000;
          AURAs = false;
       }

        void EnterCombat(Unit * target)
        {
            me->MonsterYell("I'm not a rabbit, I'm dark rabbit",LANG_UNIVERSAL,NULL);
        }

        void KilledUnit(Unit * victim)
        {
            me->MonsterYell("forsake the light embrace the darkness",LANG_UNIVERSAL,NULL);
        }
             
        void JustDied(Unit * killer)
        {
            me->MonsterYell("Hell no surprise to me anymore",LANG_UNIVERSAL,NULL);
        }

       void UpdateAI(const uint32 uiDiff)
       {
          if (!UpdateVictim())
             return;

            //curseofdoom_Timer
            if (m_uicurseofdoom_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_curseofdoom);
                m_uicurseofdoom_Timer = 19000;
            }
            else m_uicurseofdoom_Timer -= uiDiff;

            //fusearmor_Timer
            if (m_uifusearmor_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_fusearmor,true);
                m_uifusearmor_Timer = 19000;
            }
            else m_uifusearmor_Timer -= uiDiff;

            //shadownova_Timer
            if (m_uishadownova_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_shadownova);
                m_uishadownova_Timer = 20000;
            }
            else m_uishadownova_Timer -= uiDiff;

            //shadowbreath_timer
            if (m_uishadowbreath_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_shadowbreath);
                m_uishadowbreath_Timer = 10000;
            }
            else m_uishadowbreath_Timer -= uiDiff;

            //drainlife_Timer
            if (m_uidrainlife_Timer <= uiDiff)
            {
             DoCast(me->getVictim(), SPELL_drainlife);
                m_uidrainlife_Timer = 48000;
            }
            else m_uidrainlife_Timer -= uiDiff;

            if ((me->GetHealth()*100 / me->GetMaxHealth() <= 30) && !AURAs)
            {
                DoCast(me, SPELL_AURA,true);
                DoCast(me, SPELL_duse,true);
                me->SetDisplayId(5927);
                AURAs = true; 
                //jump_Timer
                if (m_uijump_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_jump);
                    m_uijump_Timer = 28000;
                }
                else m_uijump_Timer -= uiDiff;
            }

         DoMeleeAttackIfReady();
      }
    };

       CreatureAI *GetAI(Creature *creature) const
       {
           return new boss_zajacAI(creature);
       }
    };

        void AddSC_boss_zajac()
        {
            new boss_zajac;
        }