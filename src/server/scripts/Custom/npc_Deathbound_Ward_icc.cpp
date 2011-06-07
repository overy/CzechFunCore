#include "ScriptPCH.h"

    enum Spells
    {

        
        SPELL_Disrupting_Shout                    = 71022,
        SPELL_Saber_Lash                            = 71021
        
    };






class npc_Deathbound_Ward_icc : public CreatureScript
    {
    public:
        npc_Deathbound_Ward_icc() : CreatureScript("npc_Deathbound_Ward_icc") { }

        struct npc_Deathbound_Ward_iccAI : public ScriptedAI
        {
            npc_Deathbound_Ward_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiDisrupting_Shout_Timer;
        uint32 m_uiSaber_Lash_Timer;
            

       
        void Reset()
        {
            m_uiDisrupting_Shout_Timer = 25000;       
            m_uiSaber_Lash_Timer = 8000;

        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiDisrupting_Shout_Timer <= uiDiff)
            {
                DoCastAOE(SPELL_Disrupting_Shout);
         
                m_uiDisrupting_Shout_Timer = 25000;
            }
            else
               m_uiDisrupting_Shout_Timer -= uiDiff;
 
         if (m_uiSaber_Lash_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_Saber_Lash);
         
                m_uiSaber_Lash_Timer = 8000;
            }
            else
               m_uiSaber_Lash_Timer -= uiDiff;



         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Deathbound_Ward_iccAI(creature);

            }
    };


 void AddSC_npc_Deathbound_Ward_icc()
    {
        new npc_Deathbound_Ward_icc();
    }