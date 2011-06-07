#include "ScriptPCH.h"

    enum Spells
    {
        SPELL_Bone_Flurry                              = 70960,
        SPELL_Shattered_Bones                           = 70961
    };

class npc_The_Damned_icc : public CreatureScript
    {
    public:
        npc_The_Damned_icc() : CreatureScript("npc_The_Damned_icc") { }

        struct npc_The_Damned_iccAI : public ScriptedAI
        {
            npc_The_Damned_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiBone_Flurry_Timer;
            

       
        void Reset()
        {
            m_uiBone_Flurry_Timer = 20000;    
        }

    
void JustDied(Unit * killer)
        {
         DoCastAOE(SPELL_Shattered_Bones);
        }
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiBone_Flurry_Timer <= uiDiff)
            {
                DoCast(me, SPELL_Bone_Flurry);
         
                m_uiBone_Flurry_Timer = 30000;
            }
            else
               m_uiBone_Flurry_Timer -= uiDiff;
 
         
         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_The_Damned_iccAI(creature);

            }
};


void AddSC_npc_The_Damned_icc()
    {
        new npc_The_Damned_icc();
    }