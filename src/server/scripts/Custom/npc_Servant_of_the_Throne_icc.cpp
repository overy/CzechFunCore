#include "ScriptPCH.h"

    enum Spells
    {

        SPELL_Glacial_Blast                           = 71029
    };


class npc_Servant_of_the_Throne_icc : public CreatureScript
    {
    public:
        npc_Servant_of_the_Throne_icc() : CreatureScript("npc_Servant_of_the_Throne_icc") { }

        struct npc_Servant_of_the_Throne_iccAI : public ScriptedAI
        {
            npc_Servant_of_the_Throne_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiGlacial_Blast_Timer;
            

       
        void Reset()
        {
            m_uiGlacial_Blast_Timer = 8000;       

        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiGlacial_Blast_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_Glacial_Blast);
         
                m_uiGlacial_Blast_Timer = 10000;
            }
            else
               m_uiGlacial_Blast_Timer -= uiDiff;


         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Servant_of_the_Throne_iccAI(creature);

            }
    };


void AddSC_npc_Servant_of_the_Throne_icc()
    {
        new npc_Servant_of_the_Throne_icc();
    }