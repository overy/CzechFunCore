    #include "ScriptPCH.h"

    enum eEnums
    {
    //###########################
    // Mikulas - spelly
    //##########################

    //Inflicts 19000 to 21000 Shadow damage to enemies in front of the attacker.
    SPELL_ShadowCleave          =72493,

    //Curses all enemies in a 5 radius around the target, dealing 5655 to 6345 Shadow damage, slowing movement speed by 30%, //attack speed by 30%, and casting speed by 30%. Lasts 10 sec.
    SPELL_CurseOfFatigue        =59368,

    //Healing taken reduced by 15%.  30 seconds remaining
    SPELL_CurseBleed            =34073,

    //Hurls a bolt of dark magic at an enemy, inflicting Shadow damage. Value: 4500 to 5500
    SPELL_ShadowBolt            =56405,

    //#####################
    // Andel - spelly
    //####################

    //Hurls a bolt of light magic at an enemy, inflicting Holy damage. Value: 8954 to 10046   2 sec cast
    SPELL_HolyBolt              =57465,

    //Smites an enemy, inflicting 5625 to 6875 Holy damage. 1.25 sec cast
    SPELL_HolySmite             =67674,

    //Inflicts 7438 to 9562 holy damage to all Scourge in front of the caster.
    SPELL_HolyStrike            =54135,
    SPELL_Sleep                 =9159,

    //#####################
    // Cert - spelly
    //####################

    //6k dmg 1s cast
    SPELL_MagmaBlast            =20565,

    //Inflicts 4163 to 4837 Fire damage to enemies in a cone in front of the caster.
    SPELL_ConeOfFire            =36921,

    //Inflicts 4813 to 6187 Fire damage to all enemies within 8 yards of the target. 1s cast
    SPELL_FireBomb              =66313,


    ADD_ANDEL                   =78988,
    ADD_CERT                    =78999

        };



    //###########################
    // Mikulas script
    //##########################

    class boss_mikulas : public CreatureScript
    {
    public:
        boss_mikulas() : CreatureScript("boss_mikulas") { }

        struct boss_mikulasAI : public ScriptedAI
        {
            boss_mikulasAI(Creature* pCreature) : ScriptedAI(pCreature) {}

    uint32 m_uiShadowCleave_Timer;
    uint32 m_uiCurseOfFatigue_Timer;
    uint32 m_uiCurseBleed_Timer;
    uint32 m_uiShadowBolt_Timer;
    uint32 m_uiSummon_Timer;

    void Reset()
            {
               m_uiShadowCleave_Timer = 8000;
               m_uiCurseOfFatigue_Timer = 15000;
               m_uiCurseBleed_Timer = 10000;
               m_uiShadowBolt_Timer = 3900;
               m_uiSummon_Timer = 20000;
            }

    void EnterCombat(Unit * target)
        {
        me->MonsterYell("Útoooooooooooooooooooooooooook!!!",LANG_UNIVERSAL,NULL);
        }

    void KilledUnit(Unit * victim)
        {
        me->MonsterYell("Co to bylo za lamu?!?! Epic fiaaal!!",LANG_UNIVERSAL,NULL);
        }

    void JustDied(Unit * killer)
        {
        me->MonsterYell("Neeeeeeeeeeeeeeeeeeeeeeeee!!!!!!!!",LANG_UNIVERSAL,NULL);
        }

    void UpdateAI(const uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

    //Shadow cleave timer
                if (m_uiShadowCleave_Timer <= uiDiff)
                 {
                     DoCast(me->getVictim(), SPELL_ShadowCleave);

                    m_uiShadowCleave_Timer = 8000;
                }
                else
                    m_uiShadowCleave_Timer -= uiDiff;



    //Curse Of Fatigue Timer
                if (m_uiCurseOfFatigue_Timer <= uiDiff)
                {
                    if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 2))
                        DoCast(pTarget, SPELL_CurseOfFatigue);

                    m_uiCurseOfFatigue_Timer = 15000;
                }
                else
                    m_uiCurseOfFatigue_Timer -= uiDiff;


    //Curse bleed timer
                if (m_uiCurseBleed_Timer <= uiDiff)
                 {
                     DoCast(me->getVictim(), SPELL_CurseBleed);

                    m_uiCurseBleed_Timer = 10000;
                }
                else
                    m_uiCurseBleed_Timer -= uiDiff;

     
    //Shadow bolt timer
                if (m_uiShadowBolt_Timer <= uiDiff)
                 {
                     DoCast(me->getVictim(), SPELL_ShadowBolt);

                    m_uiShadowBolt_Timer = 3900;
                }
                else
                    m_uiShadowBolt_Timer -= uiDiff;

    //Summon timer
                if (m_uiSummon_Timer <= uiDiff)
                 {

                     me->MonsterYell("Cert a Andel prichazeji!!!",LANG_UNIVERSAL,NULL);

                     me->SummonCreature(ADD_ANDEL,me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0 ,TEMPSUMMON_CORPSE_DESPAWN);   
     
                     me->SummonCreature(ADD_CERT,me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0 ,TEMPSUMMON_CORPSE_DESPAWN);
         
                     m_uiSummon_Timer = 60000;
                }
                else

                    m_uiSummon_Timer -= uiDiff;


                  DoMeleeAttackIfReady();
            }
    };


    CreatureAI *GetAI(Creature *creature) const
        {
            return new boss_mikulasAI(creature);
        }
    };

    //#####################
    // Andel script
    //####################

    class boss_Andel : public CreatureScript
    {
    public:
        boss_Andel() : CreatureScript("boss_Andel") { }

        struct boss_AndelAI : public ScriptedAI
        {
            boss_AndelAI(Creature* pCreature) : ScriptedAI(pCreature) {}


    uint32 m_uiHolyBolt_Timer;
    uint32 m_uiHolySmite_Timer;
    uint32 m_uiHolyStrike_Timer;
    uint32 m_uiSleep_Timer;


    void Reset()
            {

                  m_uiHolyBolt_Timer = 4800;
                  m_uiHolySmite_Timer = 7100;
                  m_uiHolyStrike_Timer = 7000;
                  m_uiSleep_Timer = 2000;

            }

    void EnterCombat(Unit * target)
        {
        me->MonsterYell("MUHAHAHA!!!",LANG_UNIVERSAL,NULL);
        }

    void KilledUnit(Unit * victim)
        {
        me->MonsterYell("Mikulasi za toto chci rep plus!!",LANG_UNIVERSAL,NULL);
        }

    void JustDied(Unit * killer)
        {
        me->MonsterYell("WTF!",LANG_UNIVERSAL,NULL);
        }


    void UpdateAI(const uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

    //Holy Bolt timer
                if (m_uiHolyBolt_Timer <= uiDiff)
                 {
                     DoCast(me->getVictim(), SPELL_HolyBolt);

                    m_uiHolyBolt_Timer = 4800;
                }
                else
                    m_uiHolyBolt_Timer -= uiDiff;

    //Holy Smite timer
                if (m_uiHolySmite_Timer <= uiDiff)
                 {
                     DoCast(me->getVictim(), SPELL_HolySmite);

                    m_uiHolySmite_Timer = 7100;
                }
                else
                    m_uiHolySmite_Timer -= uiDiff;


    //Holy Strike timer
                if (m_uiHolyStrike_Timer <= uiDiff)
                 {
                     DoCast(me->getVictim(), SPELL_HolyStrike);

                    m_uiHolyStrike_Timer = 9300;
                }
                else
                    m_uiHolyStrike_Timer -= uiDiff;   


    //Sleep timer
               
                      if (m_uiSleep_Timer <= uiDiff)
             {
                           if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                           DoCast(pTarget, SPELL_Sleep);

                           m_uiSleep_Timer = 2000;
             }
                   else
                           m_uiSleep_Timer -= uiDiff;



      DoMeleeAttackIfReady();
            }
    };


    CreatureAI *GetAI(Creature *creature) const
        {
            return new boss_AndelAI(creature);
        }
    };


    //#####################
    // Cert script
    //####################


    class boss_Cert : public CreatureScript
    {
    public:
        boss_Cert() : CreatureScript("boss_Cert") { }

        struct boss_CertAI : public ScriptedAI
        {
            boss_CertAI(Creature* pCreature) : ScriptedAI(pCreature) {}


    uint32 m_uiMagmaBlast_Timer;
    uint32 m_uiConeOfFire_Timer;
    uint32 m_uiFireBomb_Timer;


    void Reset()
            {

                  m_uiMagmaBlast_Timer = 4000;
                  m_uiConeOfFire_Timer = 5100;
                  m_uiFireBomb_Timer = 6900;
                 
            }

    void EnterCombat(Unit * target)
        {
        me->MonsterYell("MUHAHAHA!!!",LANG_UNIVERSAL,NULL);
        }

    void KilledUnit(Unit * victim)
        {
        me->MonsterYell("Mikulasi za toto chci rep plus!!",LANG_UNIVERSAL,NULL);
        }

    void JustDied(Unit * killer)
        {
        me->MonsterYell("WTF!",LANG_UNIVERSAL,NULL);
        }

    void UpdateAI(const uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

    //Fire Bomb timer
               
                   if (m_uiFireBomb_Timer <= uiDiff)
             {
                           if  (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                           DoCast(pTarget, SPELL_FireBomb);

                           m_uiFireBomb_Timer = 6900;
             }
                   else
                           m_uiFireBomb_Timer -= uiDiff;

    //Cone of fire timer
                if (m_uiConeOfFire_Timer <= uiDiff)
                 {
                     DoCast(me->getVictim(), SPELL_ConeOfFire);

                    m_uiConeOfFire_Timer = 5100;
                }
                else
                    m_uiConeOfFire_Timer -= uiDiff;   

    //Magma blast timer
                if (m_uiMagmaBlast_Timer <= uiDiff)
                 {
                     DoCast(me->getVictim(), SPELL_MagmaBlast);

                    m_uiMagmaBlast_Timer = 4000;
                }
                else
                    m_uiMagmaBlast_Timer -= uiDiff;   


    DoMeleeAttackIfReady();
            }
    };


    CreatureAI *GetAI(Creature *creature) const
        {
            return new boss_CertAI(creature);
        }
    };


    void AddSC_boss_mikulas()
    {
        new boss_mikulas;
        new boss_Andel;
        new boss_Cert;

    }



