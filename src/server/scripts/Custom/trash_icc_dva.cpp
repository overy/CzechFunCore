#include "ScriptPCH.h"

    enum Spells
    {
        // ## Deathspeaker Servant ##
        SPELL_CHAOS_BOLT_10M                       = 69576,    
        SPELL_CHAOS_BOLT_25M                       = 71108,
        SPELL_CONSUMING_SHADOWS                    = 69405,
        SPELL_CURSE_OF_AGONY_10M                   = 69404,
        SPELL_CURSE_OF_AGONY_25M                   = 71112,

        // ## Deathspeaker Disciple ##
        SPELL_SHADOW_BOLT                          = 69387,    
        SPELL_DARK_BLESSING                        = 69391,
        SPELL_SHADOW_MEND_10M                      = 69389,
        SPELL_SHADOW_MEND_25M                      = 71107,

        //## Deathspeaker Attendant ##
        SPELL_SHADOW_NOVA_10M                      = 69355,
        SPELL_SHADOW_NOVA_25M                      = 71106,

        //## Deathspeaker Zealot ##
        SPELL_SHADOW_CLEAVE                        = 69492,

        //## Deathspeaker High Priest ##
        SPELL_DARK_RECKONING                       = 69483,
        SPELL_AURA_OF_DARKNESS                     = 69491,

        //## Blighted Abomination ##
        SPELL_CLEAVE                               = 40504,
        SPELL_PLAGUE_CLOUD                         = 71150,
        SPELL_SCOURGE_HOOK                         = 71140,
 
        //## Vengeful Fleshreaper ##
        SPELL_Leaping_Face_Maul                    = 71164,

        //## Plague Scientist ##
        SPELL_PLAGUE_BLAST                         = 73079,
        SPELL_PLAGUE_STREAM                        = 69871,
        SPELL_SPRAY                                = 71103,

        //## Pustulating Horror ##
        SPELL_BOMB                                 = 71088,
        SPELL_PUS_10M                              = 71089,
        SPELL_PUS_25M                              = 71090,
 
        //## Darkfallen Archmage ##
        SPELL_AMPLIFY_10M                          = 70408,
        SPELL_AMPLIFY_25M                          = 72336,
        SPELL_BLAST_WAVE_10M                       = 70407,
        SPELL_BLAST_WAVE_25M                       = 71151,
        SPELL_FIREBALL_10M                         = 70409,
        SPELL_FIREBALL_25M                         = 71153,
        SPELL_POLYMORPH                            = 70410,

        //## Darkfallen Blood Knight ##
        SPELL_VAMPIRIC_AURA                        = 71736,
        SPELL_UNHOLY_STRIKE                        = 70437,

        //## Darkfallen Noble ##
        SPELL_BANISH                               = 70645,
        SPELL_SH_BOLT_10M                          = 72960,
        SPELL_SH_BOLT_25M                          = 72961,

        //## Darkfallen Advisor ##
        SPELL_LICH_10M                             = 72057,
        SPELL_LICH_25M                             = 72421,
        SPELL_MEELE                                = 72065,
        SPELL_SPELL                                = 72066,

        //## Darkfallen Commander ##
        SPELL_CHARGE_10M                           = 70449,
        SPELL_CHARGE_25M                           = 71155,
        SPELL_BATTLE_SHOUT                         = 70750,
        
        //## Darkfallen Lieutenant ##
        SPELL_VAM_CURSE                            = 70423,
        SPELL_REND_10M                             = 70435,
        SPELL_REND_25M                             = 71154,

        //## Darkfallen Tactician ##
        SPELL_SHADOWSTEP                           = 70431,
        SPELL_UH_STRIKE                            = 70437,
        SPELL_BLOOD_SAP                            = 70432,



    };



//#########  Deathspeaker Servant 10 man ##############

    class npc_Deathspeaker_Servant_low_icc : public CreatureScript
    {
    public:
        npc_Deathspeaker_Servant_low_icc() : CreatureScript("npc_Deathspeaker_Servant_low_icc") { }

        struct npc_Deathspeaker_Servant_low_iccAI : public ScriptedAI
        {
            npc_Deathspeaker_Servant_low_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiCHAOS_Timer;
        uint32 m_uiCONSUMING_Timer;
        uint32 m_uiCURSE_Timer;
            

       
        void Reset()
        {
            m_uiCHAOS_Timer = 2000;
            m_uiCONSUMING_Timer = 6000;
            m_uiCURSE_Timer = 9000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiCHAOS_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_CHAOS_BOLT_10M);
         
                m_uiCHAOS_Timer = 9000;
            }
            else
               m_uiCHAOS_Timer -= uiDiff;


            if (m_uiCONSUMING_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_CONSUMING_SHADOWS);
         
                m_uiCONSUMING_Timer = 15000;
            }
            else
               m_uiCONSUMING_Timer -= uiDiff;


            if (m_uiCURSE_Timer <= uiDiff)
            {
                 if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_CURSE_OF_AGONY_10M);
         
                m_uiCURSE_Timer = 17500;
            }
            else
               m_uiCURSE_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Deathspeaker_Servant_low_iccAI(creature);

            }
    };


//#########  Deathspeaker Servant 25 man ##############

    class npc_Deathspeaker_Servant_high_icc : public CreatureScript
    {
    public:
        npc_Deathspeaker_Servant_high_icc() : CreatureScript("npc_Deathspeaker_Servant_high_icc") { }

        struct npc_Deathspeaker_Servant_high_iccAI : public ScriptedAI
        {
            npc_Deathspeaker_Servant_high_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiCHAOS_Timer;
        uint32 m_uiCONSUMING_Timer;
        uint32 m_uiCURSE_Timer;
            

       
        void Reset()
        {
            m_uiCHAOS_Timer = 2000;
            m_uiCONSUMING_Timer = 6000;
            m_uiCURSE_Timer = 9000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiCHAOS_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_CHAOS_BOLT_25M);
         
                m_uiCHAOS_Timer = 6000;
            }
            else
               m_uiCHAOS_Timer -= uiDiff;


            if (m_uiCONSUMING_Timer <= uiDiff)
            {
            if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_CONSUMING_SHADOWS);
         
                m_uiCONSUMING_Timer = 10000;
            }
            else
               m_uiCONSUMING_Timer -= uiDiff;


            if (m_uiCURSE_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_CURSE_OF_AGONY_25M);
         
                m_uiCURSE_Timer = 15500;
            }
            else
               m_uiCURSE_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Deathspeaker_Servant_high_iccAI(creature);

            }
    };





//#########  Deathspeaker Disciple 10 man ##############

    class npc_Deathspeaker_Disciple_low_icc : public CreatureScript
    {
    public:
        npc_Deathspeaker_Disciple_low_icc() : CreatureScript("npc_Deathspeaker_Disciple_low_icc") { }

        struct npc_Deathspeaker_Disciple_low_iccAI : public ScriptedAI
        {
            npc_Deathspeaker_Disciple_low_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiBOLT_Timer;
        uint32 m_uiBLESSING_Timer;
        uint32 m_uiMEND_Timer;
            

       
        void Reset()
        {
            m_uiBOLT_Timer = 2000;
            m_uiBLESSING_Timer = 1000;
            m_uiMEND_Timer = 10000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiBOLT_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SHADOW_BOLT);
         
                m_uiBOLT_Timer = 7000;
            }
            else
               m_uiBOLT_Timer -= uiDiff;


            if (m_uiBLESSING_Timer <= uiDiff)
            {
                DoCast(me, SPELL_DARK_BLESSING);
         
                m_uiBLESSING_Timer = 15000;
            }
            else
               m_uiBLESSING_Timer -= uiDiff;


            if (m_uiMEND_Timer <= uiDiff)
            {
                 DoCast(me, SPELL_SHADOW_MEND_10M);
         
                m_uiMEND_Timer = 15000;
            }
            else
               m_uiMEND_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Deathspeaker_Disciple_low_iccAI(creature);

            }
    };


//#########  Deathspeaker Disciple 25 man ##############

    class npc_Deathspeaker_Disciple_high_icc : public CreatureScript
    {
    public:
        npc_Deathspeaker_Disciple_high_icc() : CreatureScript("npc_Deathspeaker_Disciple_high_icc") { }

        struct npc_Deathspeaker_Disciple_high_iccAI : public ScriptedAI
        {
            npc_Deathspeaker_Disciple_high_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiBOLT_Timer;
        uint32 m_uiBLESSING_Timer;
        uint32 m_uiMEND_Timer;
            

       
        void Reset()
        {
            m_uiBOLT_Timer = 2000;
            m_uiBLESSING_Timer = 1000;
            m_uiMEND_Timer = 12000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiBOLT_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SHADOW_BOLT);
         
                m_uiBOLT_Timer = 5000;
            }
            else
               m_uiBOLT_Timer -= uiDiff;


            if (m_uiBLESSING_Timer <= uiDiff)
            {
                DoCast(me, SPELL_DARK_BLESSING);
         
                m_uiBLESSING_Timer = 15000;
            }
            else
               m_uiBLESSING_Timer -= uiDiff;


            if (m_uiMEND_Timer <= uiDiff)
            {
                 DoCast(me, SPELL_SHADOW_MEND_25M);
         
                m_uiMEND_Timer = 18000;
            }
            else
               m_uiMEND_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Deathspeaker_Disciple_high_iccAI(creature);

            }
    };






//#########  Deathspeaker Attendant 10 man ##############

    class npc_Deathspeaker_Attendant_low_icc : public CreatureScript
    {
    public:
        npc_Deathspeaker_Attendant_low_icc() : CreatureScript("npc_Deathspeaker_Attendant_low_icc") { }

        struct npc_Deathspeaker_Attendant_low_iccAI : public ScriptedAI
        {
            npc_Deathspeaker_Attendant_low_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiBOLT_Timer;
        uint32 m_uiNOVA_Timer;

            

       
        void Reset()
        {
            m_uiBOLT_Timer = 2000;
            m_uiNOVA_Timer = 5000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiBOLT_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SHADOW_BOLT);
         
                m_uiBOLT_Timer = 5000;
            }
            else
               m_uiBOLT_Timer -= uiDiff;


            if (m_uiNOVA_Timer <= uiDiff)
            {
                DoCastAOE(SPELL_SHADOW_NOVA_10M);
         
                m_uiNOVA_Timer = 9000;
            }
            else
               m_uiNOVA_Timer -= uiDiff;


         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Deathspeaker_Attendant_low_iccAI(creature);

            }
    };





//#########  Deathspeaker Attendant 25 man ##############

    class npc_Deathspeaker_Attendant_high_icc : public CreatureScript
    {
    public:
        npc_Deathspeaker_Attendant_high_icc() : CreatureScript("npc_Deathspeaker_Attendant_high_icc") { }

        struct npc_Deathspeaker_Attendant_high_iccAI : public ScriptedAI
        {
            npc_Deathspeaker_Attendant_high_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiBOLT_Timer;
        uint32 m_uiNOVA_Timer;

            

       
        void Reset()
        {
            m_uiBOLT_Timer = 2000;
            m_uiNOVA_Timer = 5000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiBOLT_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SHADOW_BOLT);
         
                m_uiBOLT_Timer = 5000;
            }
            else
               m_uiBOLT_Timer -= uiDiff;


            if (m_uiNOVA_Timer <= uiDiff)
            {
                DoCastAOE(SPELL_SHADOW_NOVA_25M);
         
                m_uiNOVA_Timer = 9000;
            }
            else
               m_uiNOVA_Timer -= uiDiff;


         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Deathspeaker_Attendant_high_iccAI(creature);

            }
    };


//#########  Deathspeaker Zealot ##############

    class npc_Deathspeaker_Zealot_icc : public CreatureScript
    {
    public:
        npc_Deathspeaker_Zealot_icc() : CreatureScript("npc_Deathspeaker_Zealot_icc") { }

        struct npc_Deathspeaker_Zealot_iccAI : public ScriptedAI
        {
            npc_Deathspeaker_Zealot_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiCLEAVE_Timer;


       
        void Reset()
        {
            m_uiCLEAVE_Timer = 5000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiCLEAVE_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SHADOW_CLEAVE);
         
                m_uiCLEAVE_Timer = 5000;
            }
            else
               m_uiCLEAVE_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Deathspeaker_Zealot_iccAI(creature);

            }
    };




//#########  Deathspeaker High Priest ##############

    class npc_Deathspeaker_High_Priest_icc : public CreatureScript
    {
    public:
        npc_Deathspeaker_High_Priest_icc() : CreatureScript("npc_Deathspeaker_High_Priest_icc") { }

        struct npc_Deathspeaker_High_Priest_iccAI : public ScriptedAI
        {
            npc_Deathspeaker_High_Priest_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiRECKONING_Timer;
        uint32 m_uiAURA_Timer;
            

       
        void Reset()
        {
            m_uiRECKONING_Timer = 3000;
            m_uiAURA_Timer = 1000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiAURA_Timer <= uiDiff)
            {
                DoCast(me, SPELL_AURA_OF_DARKNESS);
         
                m_uiAURA_Timer = 18000;
            }
            else
               m_uiAURA_Timer -= uiDiff;


            if (m_uiRECKONING_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_DARK_RECKONING);
         
                m_uiRECKONING_Timer = 10000;
            }
            else
               m_uiRECKONING_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Deathspeaker_High_Priest_iccAI(creature);

            }
    };




//#########  Blighted Abomination ##############

    class npc_Blighted_Abomination_icc : public CreatureScript
    {
    public:
        npc_Blighted_Abomination_icc() : CreatureScript("npc_Blighted_Abomination_icc") { }

        struct npc_Blighted_Abomination_iccAI : public ScriptedAI
        {
            npc_Blighted_Abomination_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiCLOUD_Timer;
        uint32 m_uiCLEAVE_Timer;
        uint32 m_uiHOOK_Timer;
            

       
        void Reset()
        {
            m_uiCLOUD_Timer = 10000;
            m_uiCLEAVE_Timer = 4000;
            m_uiHOOK_Timer = 9000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiCLOUD_Timer <= uiDiff)
            {
                DoCastAOE(SPELL_PLAGUE_CLOUD);
         
                m_uiCLOUD_Timer = 20000;
            }
            else
               m_uiCLOUD_Timer -= uiDiff;


            if (m_uiHOOK_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_SCOURGE_HOOK);
         
                m_uiHOOK_Timer = 9000;
            }
            else
               m_uiHOOK_Timer -= uiDiff;

            if (m_uiCLEAVE_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_CLEAVE);
         
                m_uiCLEAVE_Timer = 6000;
            }
            else
               m_uiCLEAVE_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Blighted_Abomination_iccAI(creature);

            }
    };






//#########  Vengeful Fleshreaper ##############

    class npc_Vengeful_Fleshreapert_icc : public CreatureScript
    {
    public:
        npc_Vengeful_Fleshreapert_icc() : CreatureScript("npc_Vengeful_Fleshreapert_icc") { }

        struct npc_Vengeful_Fleshreapert_iccAI : public ScriptedAI
        {
            npc_Vengeful_Fleshreapert_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiJUMP_Timer;
            

       
        void Reset()
        {
            m_uiJUMP_Timer = urand(3000, 20000);
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

      

            if (m_uiJUMP_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_Leaping_Face_Maul);
         
                m_uiJUMP_Timer = urand(20000,40000);
            }
            else
               m_uiJUMP_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Vengeful_Fleshreapert_iccAI(creature);

            }
    };




//#########  Plague Scientist ##############

    class npc_Plague_Scientist_icc : public CreatureScript
    {
    public:
        npc_Plague_Scientist_icc() : CreatureScript("npc_Plague_Scientist_icc") { }

        struct npc_Plague_Scientist_iccAI : public ScriptedAI
        {
            npc_Plague_Scientist_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiBLAST_Timer;
        uint32 m_uiSTREAM_Timer;
        uint32 m_uiSPRAY_Timer;    

       
        void Reset()
        {
            m_uiBLAST_Timer = 2000;
            m_uiSTREAM_Timer = 1000;
            m_uiSPRAY_Timer = 1000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiSTREAM_Timer <= uiDiff)
            {
                DoCast(me, SPELL_PLAGUE_STREAM);
         
                m_uiSTREAM_Timer = 30000;
            }
            else
               m_uiSTREAM_Timer -= uiDiff;


            if (m_uiSPRAY_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_SPRAY);
         
                m_uiSPRAY_Timer = 8000;
            }
            else
               m_uiSPRAY_Timer -= uiDiff;

            if (m_uiBLAST_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_PLAGUE_BLAST);
         
                m_uiBLAST_Timer = 4000;
            }
            else
               m_uiBLAST_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Plague_Scientist_iccAI(creature);

            }
    };




//#########  Pustulating Horror 10M ##############

    class npc_Pustulating_Horror_low_icc : public CreatureScript
    {
    public:
        npc_Pustulating_Horror_low_icc() : CreatureScript("npc_Pustulating_Horror_low_icc") { }

        struct npc_Pustulating_Horror_low_iccAI : public ScriptedAI
        {
            npc_Pustulating_Horror_low_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiBOMB_Timer;
        uint32 m_uiPUS_Timer;
            

       
        void Reset()
        {
            m_uiBOMB_Timer = 20000;
            m_uiPUS_Timer = 2000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiBOMB_Timer <= uiDiff)
            {
                DoCastAOE(SPELL_BOMB);
         
                m_uiBOMB_Timer = 30000;
            }
            else
               m_uiBOMB_Timer -= uiDiff;


            if (m_uiPUS_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_PUS_10M);
         
                m_uiPUS_Timer = 9000;
            }
            else
               m_uiPUS_Timer -= uiDiff;

           

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Pustulating_Horror_low_iccAI(creature);

            }
    };




//#########  Pustulating Horror 25M ##############

    class npc_Pustulating_Horror_high_icc : public CreatureScript
    {
    public:
        npc_Pustulating_Horror_high_icc() : CreatureScript("npc_Pustulating_Horror_high_icc") { }

        struct npc_Pustulating_Horror_high_iccAI : public ScriptedAI
        {
            npc_Pustulating_Horror_high_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiBOMB_Timer;
        uint32 m_uiPUS_Timer;
            

       
        void Reset()
        {
            m_uiBOMB_Timer = 20000;
            m_uiPUS_Timer = 2000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiBOMB_Timer <= uiDiff)
            {
                DoCastAOE(SPELL_BOMB);
         
                m_uiBOMB_Timer = 30000;
            }
            else
               m_uiBOMB_Timer -= uiDiff;


            if (m_uiPUS_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_PUS_25M);
         
                m_uiPUS_Timer = 9000;
            }
            else
               m_uiPUS_Timer -= uiDiff;

           

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Pustulating_Horror_high_iccAI(creature);

            }
    };




//#########  Darkfallen Archmage 10 man ##############

    class npc_Darkfallen_Archmage_low_icc : public CreatureScript
    {
    public:
        npc_Darkfallen_Archmage_low_icc() : CreatureScript("npc_Darkfallen_Archmage_low_icc") { }

        struct npc_Darkfallen_Archmage_low_iccAI : public ScriptedAI
        {
            npc_Darkfallen_Archmage_low_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiAMPLIFY_Timer;
        uint32 m_uiBLAST_Timer;
        uint32 m_uiFIREBALL_Timer;
        uint32 m_uiPOLYMORPH_Timer;
            

       
        void Reset()
        {
            m_uiAMPLIFY_Timer = 2000;
            m_uiBLAST_Timer = 8000;
            m_uiFIREBALL_Timer = 4000;
            m_uiPOLYMORPH_Timer = 9000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiAMPLIFY_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_AMPLIFY_10M);
         
                m_uiAMPLIFY_Timer = 10000;
            }
            else
               m_uiAMPLIFY_Timer -= uiDiff;


            if (m_uiPOLYMORPH_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_POLYMORPH);
         
                m_uiPOLYMORPH_Timer = 15000;
            }
            else
               m_uiPOLYMORPH_Timer -= uiDiff;


            if (m_uiFIREBALL_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_FIREBALL_10M);
         
                m_uiFIREBALL_Timer = 11000;
            }
            else
               m_uiFIREBALL_Timer -= uiDiff;

            if (m_uiBLAST_Timer <= uiDiff)
            {
                DoCastAOE(SPELL_BLAST_WAVE_10M);
         
                m_uiBLAST_Timer = 21000;
            }
            else
               m_uiBLAST_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Darkfallen_Archmage_low_iccAI(creature);

            }
    };





//#########  Darkfallen Archmage 25 man ##############

    class npc_Darkfallen_Archmage_high_icc : public CreatureScript
    {
    public:
        npc_Darkfallen_Archmage_high_icc() : CreatureScript("npc_Darkfallen_Archmage_high_icc") { }

        struct npc_Darkfallen_Archmage_high_iccAI : public ScriptedAI
        {
            npc_Darkfallen_Archmage_high_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiAMPLIFY_Timer;
        uint32 m_uiBLAST_Timer;
        uint32 m_uiFIREBALL_Timer;
        uint32 m_uiPOLYMORPH_Timer;
            

       
        void Reset()
        {
            m_uiAMPLIFY_Timer = 2000;
            m_uiBLAST_Timer = 8000;
            m_uiFIREBALL_Timer = 4000;
            m_uiPOLYMORPH_Timer = 9000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiAMPLIFY_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_AMPLIFY_25M);
         
                m_uiAMPLIFY_Timer = 10000;
            }
            else
               m_uiAMPLIFY_Timer -= uiDiff;


            if (m_uiPOLYMORPH_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_POLYMORPH);
         
                m_uiPOLYMORPH_Timer = 15000;
            }
            else
               m_uiPOLYMORPH_Timer -= uiDiff;


            if (m_uiFIREBALL_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_FIREBALL_25M);
         
                m_uiFIREBALL_Timer = 11000;
            }
            else
               m_uiFIREBALL_Timer -= uiDiff;

            if (m_uiBLAST_Timer <= uiDiff)
            {
                DoCastAOE(SPELL_BLAST_WAVE_25M);
         
                m_uiBLAST_Timer = 21000;
            }
            else
               m_uiBLAST_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Darkfallen_Archmage_high_iccAI(creature);

            }
    };








//#########  Darkfallen Blood Knight ##############

    class npc_Darkfallen_Blood_Knight_icc : public CreatureScript
    {
    public:
        npc_Darkfallen_Blood_Knight_icc() : CreatureScript("npc_Darkfallen_Blood_Knight_icc") { }

        struct npc_Darkfallen_Blood_Knight_iccAI : public ScriptedAI
        {
            npc_Darkfallen_Blood_Knight_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiAURA_Timer;
        uint32 m_uiSTRIKE_Timer;
            

       
        void Reset()
        {
            m_uiAURA_Timer = 5000;
            m_uiSTRIKE_Timer = 6000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiSTRIKE_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_UNHOLY_STRIKE);
         
                m_uiSTRIKE_Timer = 6000;
            }
            else
               m_uiSTRIKE_Timer -= uiDiff;


            if (m_uiAURA_Timer <= uiDiff)
            {
                DoCast(me, SPELL_VAMPIRIC_AURA);
         
                m_uiAURA_Timer = 15000;
            }
            else
               m_uiAURA_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Darkfallen_Blood_Knight_iccAI(creature);

            }
    };







//#########  Darkfallen Noble 10M ##############

    class npc_Darkfallen_Noble_low_icc : public CreatureScript
    {
    public:
        npc_Darkfallen_Noble_low_icc() : CreatureScript("npc_Darkfallen_Noble_low_icc") { }

        struct npc_Darkfallen_Noble_low_iccAI : public ScriptedAI
        {
            npc_Darkfallen_Noble_low_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiBANISH_Timer;
        uint32 m_uiBOLT_Timer;
            

       
        void Reset()
        {
            m_uiBANISH_Timer = 3000;
            m_uiBOLT_Timer = 5000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiBOLT_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SH_BOLT_10M);
         
                m_uiBOLT_Timer = 5000;
            }
            else
               m_uiBOLT_Timer -= uiDiff;


            if (m_uiBANISH_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_BANISH);
         
                m_uiBANISH_Timer = 15000;
            }
            else
               m_uiBANISH_Timer -= uiDiff;

           

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Darkfallen_Noble_low_iccAI(creature);

            }
    };






//#########  Darkfallen Noble 25M ##############

    class npc_Darkfallen_Noble_high_icc : public CreatureScript
    {
    public:
        npc_Darkfallen_Noble_high_icc() : CreatureScript("npc_Darkfallen_Noble_high_icc") { }

        struct npc_Darkfallen_Noble_high_iccAI : public ScriptedAI
        {
            npc_Darkfallen_Noble_high_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiBANISH_Timer;
        uint32 m_uiBOLT_Timer;
            

       
        void Reset()
        {
            m_uiBANISH_Timer = 3000;
            m_uiBOLT_Timer = 5000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiBOLT_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SH_BOLT_25M);
         
                m_uiBOLT_Timer = 5000;
            }
            else
               m_uiBOLT_Timer -= uiDiff;


            if (m_uiBANISH_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_BANISH);
         
                m_uiBANISH_Timer = 15000;
            }
            else
               m_uiBANISH_Timer -= uiDiff;

           

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Darkfallen_Noble_high_iccAI(creature);

            }
    };




//#########  Darkfallen Advisor 10 man ##############

    class npc_Darkfallen_Advisor_low_icc : public CreatureScript
    {
    public:
        npc_Darkfallen_Advisor_low_icc() : CreatureScript("npc_Darkfallen_Advisor_low_icc") { }

        struct npc_Darkfallen_Advisor_low_iccAI : public ScriptedAI
        {
            npc_Darkfallen_Advisor_low_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiLICH_Timer;
        uint32 m_uiMEELE_Timer;
        uint32 m_uiSPELL_Timer;
            

       
        void Reset()
        {
            m_uiLICH_Timer = 2000;
            m_uiMEELE_Timer = 1000;
            m_uiSPELL_Timer = 7000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiLICH_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_LICH_10M);
         
                m_uiLICH_Timer = 4500;
            }
            else
               m_uiLICH_Timer -= uiDiff;


            if (m_uiMEELE_Timer <= uiDiff)
            {
                DoCast(me, SPELL_MEELE);
         
                m_uiMEELE_Timer = 12000;
            }
            else
               m_uiMEELE_Timer -= uiDiff;


            if (m_uiSPELL_Timer <= uiDiff)
            {
                 DoCast(me, SPELL_SPELL);
         
                m_uiSPELL_Timer = 12000;
            }
            else
               m_uiSPELL_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Darkfallen_Advisor_low_iccAI(creature);

            }
    };





//#########  Darkfallen Advisor 25 man ##############

    class npc_Darkfallen_Advisor_high_icc : public CreatureScript
    {
    public:
        npc_Darkfallen_Advisor_high_icc() : CreatureScript("npc_Darkfallen_Advisor_high_icc") { }

        struct npc_Darkfallen_Advisor_high_iccAI : public ScriptedAI
        {
            npc_Darkfallen_Advisor_high_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiLICH_Timer;
        uint32 m_uiMEELE_Timer;
        uint32 m_uiSPELL_Timer;
            

       
        void Reset()
        {
            m_uiLICH_Timer = 2000;
            m_uiMEELE_Timer = 1000;
            m_uiSPELL_Timer = 7000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiLICH_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_LICH_25M);
         
                m_uiLICH_Timer = 4500;
            }
            else
               m_uiLICH_Timer -= uiDiff;


            if (m_uiMEELE_Timer <= uiDiff)
            {
                DoCast(me, SPELL_MEELE);
         
                m_uiMEELE_Timer = 12000;
            }
            else
               m_uiMEELE_Timer -= uiDiff;


            if (m_uiSPELL_Timer <= uiDiff)
            {
                 DoCast(me, SPELL_SPELL);
         
                m_uiSPELL_Timer = 12000;
            }
            else
               m_uiSPELL_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Darkfallen_Advisor_high_iccAI(creature);

            }
    };




//#########  Darkfallen Commander 10 man ##############

    class npc_Darkfallen_Commander_low_icc : public CreatureScript
    {
    public:
        npc_Darkfallen_Commander_low_icc() : CreatureScript("npc_Darkfallen_Commander_low_icc") { }

        struct npc_Darkfallen_Commander_low_iccAI : public ScriptedAI
        {
            npc_Darkfallen_Commander_low_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiCHARGE_Timer;
        uint32 m_uiSHOUT_Timer;

            

       
        void Reset()
        {
            m_uiCHARGE_Timer = 4000;
            m_uiSHOUT_Timer = 8000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_uiSHOUT_Timer <= uiDiff)
            {
                DoCast(me, SPELL_BATTLE_SHOUT);
         
                m_uiSHOUT_Timer = 40000;
            }
            else
               m_uiSHOUT_Timer -= uiDiff;


          
            if (m_uiCHARGE_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_CHARGE_10M);
         
                m_uiCHARGE_Timer = 12000;
            }
            else
               m_uiCHARGE_Timer -= uiDiff;



         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Darkfallen_Commander_low_iccAI(creature);

            }
    };






//#########  Darkfallen Commander 25 man ##############

    class npc_Darkfallen_Commander_high_icc : public CreatureScript
    {
    public:
        npc_Darkfallen_Commander_high_icc() : CreatureScript("npc_Darkfallen_Commander_high_icc") { }

        struct npc_Darkfallen_Commander_high_iccAI : public ScriptedAI
        {
            npc_Darkfallen_Commander_high_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiCHARGE_Timer;
        uint32 m_uiSHOUT_Timer;

            

       
        void Reset()
        {
            m_uiCHARGE_Timer = 4000;
            m_uiSHOUT_Timer = 8000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;


            if (m_uiSHOUT_Timer <= uiDiff)
            {
                DoCast(me, SPELL_BATTLE_SHOUT);
         
                m_uiSHOUT_Timer = 30000;
            }
            else
               m_uiSHOUT_Timer -= uiDiff;


          
            if (m_uiCHARGE_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_CHARGE_25M);
         
                m_uiCHARGE_Timer = 12000;
            }
            else
               m_uiCHARGE_Timer -= uiDiff;



         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Darkfallen_Commander_high_iccAI(creature);

            }
    };


//#########  Darkfallen Lieutenant 10M ##############

    class npc_Darkfallen_Lieutenant_low_icc : public CreatureScript
    {
    public:
        npc_Darkfallen_Lieutenant_low_icc() : CreatureScript("npc_Darkfallen_Lieutenant_low_icc") { }

        struct npc_Darkfallen_Lieutenant_low_iccAI : public ScriptedAI
        {
            npc_Darkfallen_Lieutenant_low_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiREND_Timer;
        uint32 m_uiCURSE_Timer;
            

       
        void Reset()
        {
            m_uiREND_Timer = 10000;
            m_uiCURSE_Timer = 8000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            
            if (m_uiREND_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_REND_10M);
         
                m_uiREND_Timer = 25000;
            }
            else
               m_uiREND_Timer -= uiDiff;
            


            if (m_uiCURSE_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_VAM_CURSE);
         
                m_uiCURSE_Timer = 12000;
            }
            else
               m_uiCURSE_Timer -= uiDiff;

           

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Darkfallen_Lieutenant_low_iccAI(creature);

            }
    };



//#########  Darkfallen Lieutenant 25M ##############

    class npc_Darkfallen_Lieutenant_high_icc : public CreatureScript
    {
    public:
        npc_Darkfallen_Lieutenant_high_icc() : CreatureScript("npc_Darkfallen_Lieutenant_high_icc") { }

        struct npc_Darkfallen_Lieutenant_high_iccAI : public ScriptedAI
        {
            npc_Darkfallen_Lieutenant_high_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiREND_Timer;
        uint32 m_uiCURSE_Timer;
            

       
        void Reset()
        {
            m_uiREND_Timer = 10000;
            m_uiCURSE_Timer = 8000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            
            if (m_uiREND_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_REND_25M);
         
                m_uiREND_Timer = 25000;
            }
            else
               m_uiREND_Timer -= uiDiff;
            


            if (m_uiCURSE_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_VAM_CURSE);
         
                m_uiCURSE_Timer = 12000;
            }
            else
               m_uiCURSE_Timer -= uiDiff;

           

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Darkfallen_Lieutenant_high_iccAI(creature);

            }
    };





//#########  Darkfallen Tactician ##############

    class npc_Darkfallen_Tactician_icc : public CreatureScript
    {
    public:
        npc_Darkfallen_Tactician_icc() : CreatureScript("npc_Darkfallen_Tactician_icc") { }

        struct npc_Darkfallen_Tactician_iccAI : public ScriptedAI
        {
            npc_Darkfallen_Tactician_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        

        uint32 m_uiSHADOWSTEP_Timer;
        uint32 m_uiSAP_Timer;
        uint32 m_uiSTRIKE_Timer;
            

       
        void Reset()
        {
            m_uiSHADOWSTEP_Timer = 13000;
            m_uiSAP_Timer = 1000;
            m_uiSTRIKE_Timer = 4000;
        }

    
    void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

          
            if (m_uiSTRIKE_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_UH_STRIKE);
         
                m_uiSTRIKE_Timer = 6000;
            }
            else
               m_uiSTRIKE_Timer -= uiDiff;


            if (m_uiSAP_Timer <= uiDiff)
            {
                if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_BLOOD_SAP);
         
                m_uiSAP_Timer = 9000;
            }
            else
               m_uiSAP_Timer -= uiDiff;


            if (m_uiSHADOWSTEP_Timer <= uiDiff)
            {
                 if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                       DoCast(pTarget, SPELL_SHADOWSTEP);
                       
         
                m_uiSHADOWSTEP_Timer = 17500;
            }
            else
               m_uiSHADOWSTEP_Timer -= uiDiff;

         
                          DoMeleeAttackIfReady();   
             }
    };

    CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_Darkfallen_Tactician_iccAI(creature);

            }
    };









  void AddSC_trash_icc_dva()
    {
        new npc_Deathspeaker_Servant_low_icc();
        new npc_Deathspeaker_Servant_high_icc();
        new npc_Deathspeaker_Disciple_low_icc();
        new npc_Deathspeaker_Disciple_high_icc();
        new npc_Deathspeaker_Attendant_low_icc();
        new npc_Deathspeaker_Attendant_high_icc();
        new npc_Deathspeaker_Zealot_icc();
        new npc_Deathspeaker_High_Priest_icc();
        new npc_Blighted_Abomination_icc();
        new npc_Vengeful_Fleshreapert_icc();
        new npc_Plague_Scientist_icc();
        new npc_Pustulating_Horror_low_icc();
        new npc_Pustulating_Horror_high_icc();
        new npc_Darkfallen_Archmage_low_icc();
        new npc_Darkfallen_Archmage_high_icc();
        new npc_Darkfallen_Blood_Knight_icc();
        new npc_Darkfallen_Noble_low_icc();
        new npc_Darkfallen_Noble_high_icc();
        new npc_Darkfallen_Advisor_low_icc();
        new npc_Darkfallen_Advisor_high_icc();
        new npc_Darkfallen_Commander_low_icc();
        new npc_Darkfallen_Commander_high_icc();
        new npc_Darkfallen_Lieutenant_low_icc();
        new npc_Darkfallen_Lieutenant_high_icc();
        new npc_Darkfallen_Tactician_icc();

       
        
    }