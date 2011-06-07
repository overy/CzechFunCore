#include "ScriptPCH.h"

    enum Spells
    {

        SPELL_SHIELD_BASH                       = 70964,    
     
    };




    class npc_Ancient_Skeletal_Soldier_icc : public CreatureScript
    {
    public:
        npc_Ancient_Skeletal_Soldier_icc() : CreatureScript("npc_Ancient_Skeletal_Soldier_icc") { }

        struct npc_Ancient_Skeletal_Soldier_iccAI : public ScriptedAI
        {
            npc_Ancient_Skeletal_Soldier_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiBASH_Timer;
            

       
        void Reset()
        {
            m_uiBASH_Timer = 10000;       

        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiBASH_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SHIELD_BASH);
         
                m_uiBASH_Timer = 10000;
            }
            else
               m_uiBASH_Timer -= uiDiff;


         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Ancient_Skeletal_Soldier_iccAI(creature);

            }
    };


  void AddSC_npc_Ancient_Skeletal_Soldier_icc()
    {
        new npc_Ancient_Skeletal_Soldier_icc();
    }