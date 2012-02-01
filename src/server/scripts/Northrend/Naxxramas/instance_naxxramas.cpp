/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ScriptPCH.h"
#include "InstanceScript.h"
#include "ScriptedCreature.h"
#include "naxxramas.h"
#define  SOUND_KT 14484

const DoorData doorData[] =
{
    {GO_ROOM_ANUBREKHAN,    DATA_ANUBREKHAN, DOOR_TYPE_ROOM,     BOUNDARY_S},
    {GO_PASSAGE_ANUBREKHAN, DATA_ANUBREKHAN, DOOR_TYPE_PASSAGE,           0},
    {GO_PASSAGE_FAERLINA,   DATA_FAERLINA,   DOOR_TYPE_PASSAGE,           0},
    {GO_ROOM_MAEXXNA,       DATA_FAERLINA,   DOOR_TYPE_PASSAGE,           0},
    {GO_ROOM_MAEXXNA,       DATA_MAEXXNA,    DOOR_TYPE_ROOM,    BOUNDARY_SW},
    {GO_ROOM_NOTH,          DATA_NOTH,       DOOR_TYPE_ROOM,     BOUNDARY_N},
    {GO_PASSAGE_NOTH,       DATA_NOTH,       DOOR_TYPE_PASSAGE,  BOUNDARY_E},
    {GO_ROOM_HEIGAN,        DATA_NOTH,       DOOR_TYPE_PASSAGE,           0},
    {GO_ROOM_HEIGAN,        DATA_HEIGAN,     DOOR_TYPE_ROOM,     BOUNDARY_N},
    {GO_PASSAGE_HEIGAN,     DATA_HEIGAN,     DOOR_TYPE_PASSAGE,  BOUNDARY_E},
    {GO_ROOM_LOATHEB,       DATA_HEIGAN,     DOOR_TYPE_PASSAGE,           0},
    {GO_ROOM_LOATHEB,       DATA_LOATHEB,    DOOR_TYPE_ROOM,     BOUNDARY_W},
    {GO_ROOM_GROBBULUS,     DATA_PATCHWERK,  DOOR_TYPE_PASSAGE,           0},
    {GO_ROOM_GROBBULUS,     DATA_GROBBULUS,  DOOR_TYPE_ROOM,              0},
    {GO_PASSAGE_GLUTH,      DATA_GLUTH,      DOOR_TYPE_PASSAGE, BOUNDARY_NW},
    {GO_ROOM_THADDIUS,      DATA_GLUTH,      DOOR_TYPE_PASSAGE,           0},
    {GO_ROOM_THADDIUS,      DATA_THADDIUS,   DOOR_TYPE_ROOM,              0},
    {GO_ROOM_GOTHIK,        DATA_RAZUVIOUS,  DOOR_TYPE_PASSAGE,           0},
    {GO_ROOM_GOTHIK,        DATA_GOTHIK,     DOOR_TYPE_ROOM,     BOUNDARY_N},
    {GO_PASSAGE_GOTHIK,     DATA_GOTHIK,     DOOR_TYPE_PASSAGE,  BOUNDARY_S},
    {GO_ROOM_HORSEMEN,      DATA_GOTHIK,     DOOR_TYPE_PASSAGE,           0},
    {GO_ROOM_HORSEMEN,      DATA_HORSEMEN,   DOOR_TYPE_ROOM,    BOUNDARY_NE},
    {GO_PASSAGE_SAPPHIRON,  DATA_SAPPHIRON,  DOOR_TYPE_PASSAGE,  BOUNDARY_W},
    {GO_ROOM_KELTHUZAD,     DATA_KELTHUZAD,  DOOR_TYPE_ROOM,     BOUNDARY_S},
    {0,                                  0,  DOOR_TYPE_ROOM,              0}, // EOF
};

const MinionData minionData[] =
{
    //{16573,     DATA_ANUBREKHAN},     there is no spawn point in db, so we do not add them here
    {16506,     DATA_FAERLINA},
    {16505,     DATA_FAERLINA},
    {16803,     DATA_RAZUVIOUS},
    {16063,     DATA_HORSEMEN},
    {16064,     DATA_HORSEMEN},
    {16065,     DATA_HORSEMEN},
    {30549,     DATA_HORSEMEN},
    {0,         0, }
};

const float HeiganPos[2] = {2796, -3707};
const float HeiganEruptionSlope[3] =
{
    (-3685 - HeiganPos[1]) /(2724 - HeiganPos[0]),
    (-3647 - HeiganPos[1]) /(2749 - HeiganPos[0]),
    (-3637 - HeiganPos[1]) /(2771 - HeiganPos[0]),
};

// 0  H      x
//  1        ^
//   2       |
//    3  y<--o
inline uint32 GetEruptionSection(float x, float y)
{
    y -= HeiganPos[1];
    if (y < 1.0f)
        return 0;

    x -= HeiganPos[0];
    if (x > -1.0f)
        return 3;

    float slope = y/x;
    for (uint32 i = 0; i < 3; ++i)
        if (slope > HeiganEruptionSlope[i])
            return i;
    return 3;
}

class instance_naxxramas : public InstanceMapScript
{
public:
    instance_naxxramas() : InstanceMapScript("instance_naxxramas", 533) { }

    InstanceScript* GetInstanceScript(InstanceMap* map) const
    {
        return new instance_naxxramas_InstanceMapScript(map);
    }

    struct instance_naxxramas_InstanceMapScript : public InstanceScript
    {
        instance_naxxramas_InstanceMapScript(Map* map) : InstanceScript(map)
        {
            LoadDoorData(doorData);
            LoadMinionData(minionData);
            PlayerDeathCount = 0;
            HeiganPlayerDeathCount = 0;
            Step = 0;
            gothikDoorState = GO_STATE_ACTIVE;
            SlimeCheckTimer = 1000;
            GothikGateGUID = 0;
            HorsemenChestGUID = 0;
            SapphironGUID = 0;
            FaerlinaGUID = 0;
            ThaneGUID = 0;
            LadyGUID = 0;
            BaronGUID = 0;
            SirGUID = 0;
            ThaddiusGUID = 0;
            HeiganGUID = 0;
            FeugenGUID = 0;
            StalaggGUID = 0;
            KelthuzadGUID = 0;
            KelthuzadTriggerGUID = 0;   
            MrBigglesworthGUID = 0;
            KelthuzadspeakerGUID = 0;
            LichKingGUID = 0;
            AracPortalGUID = 0;
            PlagPortalGUID = 0;
            MiliPortalGUID = 0;
            ConsPortalGUID = 0;
            memset(PortalsGUID, 0, sizeof(PortalsGUID));
            memset(&Encounter, 0, sizeof(Encounter));
        }
        std::set<uint64> HeiganEruptionGUID[4];
        std::set<uint64> FaerlinaMinion;
        std::set<uint64> RazuviousMinion;
        std::set<uint64> Horsemen;
        uint64 GothikGateGUID;
        uint64 HorsemenChestGUID;
        uint64 SapphironGUID;
        uint64 FaerlinaGUID;
        uint64 ThaneGUID;
        uint64 LadyGUID;
        uint64 BaronGUID;
        uint64 SirGUID;

        uint64 ThaddiusGUID;
        uint64 HeiganGUID;
        uint64 FeugenGUID;
        uint64 StalaggGUID;

        uint64 AracPortalGUID;
        uint64 PlagPortalGUID;
        uint64 MiliPortalGUID;
        uint64 ConsPortalGUID;
		
        uint64 AracEyeGUID;
        uint64 PlagEyeGUID;
        uint64 MiliEyeGUID;
        uint64 ConsEyeGUID;
		
        uint64 KelthuzadGUID;
        uint64 KelthuzadTriggerGUID;
        uint64 KelthuzadspeakerGUID;
        uint64 MrBigglesworthGUID;
        uint64 LichKingGUID;
        uint64 PortalsGUID[4];

        uint32 SlimeCheckTimer;
        uint32 AbominationCount;
        uint32 StepTimer;
        uint32 Step;
        uint32 PlayerDeathCount;
        uint32 HeiganPlayerDeathCount;
        uint32 Encounter[MAX_BOSS_NUMBER];
        GOState gothikDoorState;

        time_t minHorsemenDiedTime;
        time_t maxHorsemenDiedTime;

        void OnPlayerKilled(Player *player) 
        {
            if(IsEncounterInProgress())
                PlayerDeathCount++;
            if(Encounter[DATA_HEIGAN] == IN_PROGRESS)
                HeiganPlayerDeathCount++;
        }		
		
        void OnCreatureCreate(Creature* creature)
        {
            switch (creature->GetEntry())
            {
                case NPC_SAPPHIRON:
                    SapphironGUID = creature->GetGUID();
                    break;
                case NPC_FAERLINA:
                    FaerlinaGUID = creature->GetGUID();
                    break;
                case NPC_THANE:
                    ThaneGUID = creature->GetGUID();
                    break;
                case NPC_LADY:
                    LadyGUID = creature->GetGUID();
                    break;
                case NPC_BARON:
                    BaronGUID = creature->GetGUID();
                    break;
                case NPC_SIR:
                    SirGUID = creature->GetGUID();
                    break;
                case NPC_THADDIUS:
                    ThaddiusGUID = creature->GetGUID();
                    break;
                case NPC_HEIGAN:
                    HeiganGUID = creature->GetGUID();
                    break;
                case NPC_FEUGEN:
                    FeugenGUID = creature->GetGUID();
                    break;
                case NPC_STALAGG:
                    StalaggGUID = creature->GetGUID();
                    break;
                case NPC_KEL_THUZAD:
                    KelthuzadGUID = creature->GetGUID();
                    break;
                case NPC_KEL_THUZAD_SPEAKER:
                    KelthuzadspeakerGUID = creature->GetGUID();
                    break;
                case NPC_MR_BIGGLESWORTH:
                    MrBigglesworthGUID = creature->GetGUID();
                    break;
                case NPC_LICH_KING:
                    LichKingGUID = creature->GetGUID();
                    break;
                default:
                    break;
            }
            AddMinion(creature, true);
        }

        void OnCreatureRemove(Creature* creature)
        {
            AddMinion(creature, false);
        }
		
        void OnGameObjectCreate(GameObject* go)
        {
            if (go->GetGOInfo()->displayId == 6785 || go->GetGOInfo()->displayId == 1287)
            {
                uint32 section = GetEruptionSection(go->GetPositionX(), go->GetPositionY());
                HeiganEruptionGUID[section].insert(go->GetGUID());

                return;
            }

            switch (go->GetEntry())
            {
                case GO_GOTHIK_GATE:
                    GothikGateGUID = go->GetGUID();
                    go->SetGoState(gothikDoorState);
                    break;
                case GO_HORSEMEN_CHEST:
                    HorsemenChestGUID = go->GetGUID();
                    break;
                case GO_HORSEMEN_CHEST_HERO:
                    HorsemenChestGUID = go->GetGUID();
                    break;
                case GO_KELTHUZAD_PORTAL01:
                    PortalsGUID[0] = go->GetGUID();
                    break;
                case GO_KELTHUZAD_PORTAL02:
                    PortalsGUID[1] = go->GetGUID();
                    break;
                case GO_KELTHUZAD_PORTAL03:
                    PortalsGUID[2] = go->GetGUID();
                    break;
                case GO_KELTHUZAD_PORTAL04:
                    PortalsGUID[3] = go->GetGUID();
                    break;
                case GO_KELTHUZAD_TRIGGER:
                    KelthuzadTriggerGUID = go->GetGUID();
                    break;
               case GO_ARAC_PORTAL:
                    AracPortalGUID = go->GetGUID();
                    break;
               case GO_PLAG_PORTAL:
                    PlagPortalGUID = go->GetGUID();
                    break;
                case GO_MILI_PORTAL:
                    MiliPortalGUID = go->GetGUID();
                    break;
                case GO_CONS_PORTAL:
                    ConsPortalGUID = go->GetGUID();
                    break;
                case GO_ARAC_EYE_RAMP:
                    AracEyeGUID = go->GetGUID();
                    if (Encounter[DATA_MAEXXNA] == DONE)
                        go->SetGoState(GO_STATE_ACTIVE);
                    break;
                case GO_PLAG_EYE_RAMP:
                    PlagEyeGUID = go->GetGUID();
                    if (Encounter[DATA_LOATHEB] == DONE)
                        go->SetGoState(GO_STATE_ACTIVE);
                    break;
                case GO_MILI_EYE_RAMP:
                    MiliEyeGUID = go->GetGUID();
                    if (Encounter[DATA_HORSEMEN] == DONE)
                        go->SetGoState(GO_STATE_ACTIVE);
                    break;
                case GO_CONS_EYE_RAMP:
                    ConsEyeGUID = go->GetGUID();
                    if (Encounter[DATA_THADDIUS] == DONE)
                        go->SetGoState(GO_STATE_ACTIVE);
                    break;
                default:
                    break;
            }
			
            AddDoor(go, true);
        }

        void OnGameObjectRemove(GameObject* go)
        {
            if (go->GetGOInfo()->displayId == 6785 || go->GetGOInfo()->displayId == 1287)
            {
                uint32 section = GetEruptionSection(go->GetPositionX(), go->GetPositionY());

                HeiganEruptionGUID[section].erase(go->GetGUID());
                return;
            }

            switch (go->GetEntry())
            {
                case GO_BIRTH:
                    if (SapphironGUID)
                    {
                        if (Creature* pSapphiron = instance->GetCreature(SapphironGUID))
                            pSapphiron->AI()->DoAction(DATA_SAPPHIRON_BIRTH);
                        return;
                    }
                    break;
                default:
                    break;
            }
			
            AddDoor(go, false);
        }

        uint32 GetData(uint32 type)
        {
            switch (type)
            {
                case DATA_PLAYER_DEATHS:
                {
                    if(InstanceFinished())
                       return PlayerDeathCount;
                    else return 1;
                }
                case DATA_ABOMINATION_KILLED:
                    return AbominationCount;
                case DATA_HEIGAN_PLAYER_DEATHS:
                    return HeiganPlayerDeathCount;
                default:
                    break;
            }
			
            return 0;
        }
		
        uint64 GetData64(uint32 type)
        {
            switch (type)
            {
                case DATA_FAERLINA:
                    return FaerlinaGUID;
                case DATA_THANE:
                    return ThaneGUID;
                case DATA_LADY:
                    return LadyGUID;
                case DATA_BARON:
                    return BaronGUID;
                case DATA_SIR:
                    return SirGUID;
                case DATA_THADDIUS:
                    return ThaddiusGUID;
                case DATA_HEIGAN:
                    return HeiganGUID;
                case DATA_FEUGEN:
                    return FeugenGUID;
                case DATA_STALAGG:
                    return StalaggGUID;
                case DATA_KELTHUZAD:
                    return KelthuzadGUID;
                case DATA_KELTHUZAD_TRIGGER:
                    return KelthuzadTriggerGUID;
                case DATA_KELTHUZAD_SPEAKER:
                    return KelthuzadspeakerGUID;
                case DATA_LICHKING:
                    return LichKingGUID;
                case DATA_KELTHUZAD_PORTAL01:
                    return PortalsGUID[0];
                case DATA_KELTHUZAD_PORTAL02:
                    return PortalsGUID[1];
                case DATA_KELTHUZAD_PORTAL03:
                    return PortalsGUID[2];
                case DATA_KELTHUZAD_PORTAL04:
                    return PortalsGUID[3];
                default:
                    break;
            }
			
            return 0;
        }
		
        bool SetBossState(uint32 type, EncounterState state)
        {
            if (!InstanceScript::SetBossState(type, state))
                return false;
				
            switch (type)
            {
                case DATA_ANUBREKHAN:
                case DATA_FAERLINA:
                case DATA_NOTH:
                case DATA_PATCHWERK:
                case DATA_GROBBULUS:
                case DATA_GLUTH:
                case DATA_RAZUVIOUS:
                case DATA_GOTHIK:
                case DATA_KELTHUZAD:
                    break;
                case DATA_SAPPHIRON:
                    if (state == DONE)
                    {
                        Step=1;
                        StepTimer = 100;
                        Event();
                    }
                    break;
                case DATA_MAEXXNA:
                {
                    if (state == DONE)
                        DoTaunt();
                    break;
                }
                case DATA_HEIGAN:
                    if (state == NOT_STARTED)
                        HeiganPlayerDeathCount = 0;
                    break;
                case DATA_LOATHEB:
                {
                    if (state == DONE)
                        DoTaunt();
                    break;
                }
                case DATA_THADDIUS:
                {
                    if (state == DONE)
                        DoTaunt();
                    break;
                }
                case DATA_HORSEMEN:
                {
                    if (state == DONE)
                    {
                        if (GameObject* HorsemenChest = instance->GetGameObject(HorsemenChestGUID))
                            HorsemenChest->SetRespawnTime(HorsemenChest->GetRespawnDelay());
                        DoTaunt();
                    }
                    break;
                }
                default:
                    break;
            }
			
            return true;
        }
		
        void SetData(uint32 type, uint32 data)
        {
            switch (type)
            {
                case DATA_HEIGAN_ERUPT:
                    HeiganErupt(data);
                    break;
                case DATA_GOTHIK_GATE:
                    if (GameObject* gothikGate = instance->GetGameObject(GothikGateGUID))
                        gothikGate->SetGoState(GOState(data));
                    gothikDoorState = GOState(data);
                    break;

                case DATA_HORSEMEN0:
                case DATA_HORSEMEN1:
                case DATA_HORSEMEN2:
                case DATA_HORSEMEN3:
                    if (data == NOT_STARTED)
                    {
                        minHorsemenDiedTime = 0;
                        maxHorsemenDiedTime = 0;
                    }
                    else if (data == DONE)
                    {
                        time_t now = time(NULL);

                        if (minHorsemenDiedTime == 0)
                            minHorsemenDiedTime = now;

                        maxHorsemenDiedTime = now;
                    }
                    break;
                case DATA_ABOMINATION_KILLED:
                    AbominationCount = data;
                    break;
                default:
                    break;
            }
        }
		
        void HeiganErupt(uint32 section)
        {
            for (uint32 i = 0; i < 4; ++i)
            {
                if (i == section)
                    continue;

                for (std::set<uint64>::const_iterator itr = HeiganEruptionGUID[i].begin(); itr != HeiganEruptionGUID[i].end(); ++itr)
                {
                    if (GameObject* pHeiganEruption = instance->GetGameObject(*itr))
                    {
                        pHeiganEruption->SendCustomAnim(pHeiganEruption->GetGoAnimProgress());
                        pHeiganEruption->CastSpell(NULL, SPELL_ERUPTION);
                    }
                }
            }
        }

        bool InstanceFinished()
        {
            for(int i = 0; i < MAX_BOSS_NUMBER; ++i)
                if(Encounter[i] != DONE)
                    return false;
            return true;
        }

        void DoTaunt()
        {
            Creature* pKelThuzade = instance->GetCreature(KelthuzadspeakerGUID);

                uint8 uiWingsCleared = 0;

                if (Encounter[DATA_HORSEMEN] == DONE)
                    ++uiWingsCleared;

                if (Encounter[DATA_THADDIUS] == DONE)
                    ++uiWingsCleared;

                if (Encounter[DATA_LOATHEB]  == DONE)
                    ++uiWingsCleared;

                if (Encounter[DATA_MAEXXNA]  == DONE)
                    ++uiWingsCleared;

                switch(uiWingsCleared)
                {
                       case 1: DoScriptText(SAY_KELTHUZAD_TAUNT1, pKelThuzade); break;
                       case 2: DoScriptText(SAY_KELTHUZAD_TAUNT2, pKelThuzade); break;
                       case 3: DoScriptText(SAY_KELTHUZAD_TAUNT3, pKelThuzade); break;
                       case 4: DoScriptText(SAY_KELTHUZAD_TAUNT4, pKelThuzade); break;
                }
        }
		
        void Event()
        {
			if(!Step)
               return;
			
            if (GetBossState(DATA_KELTHUZAD) == DONE)
                return;

            Creature* KelThuzad = instance->GetCreature(KelthuzadspeakerGUID);
            Creature* LichKing = instance->GetCreature(LichKingGUID);
			
            switch(Step)
            {
			       case 1:
                       JumpNextStep(10000);
                       break;
                   case 2:
                       DoScriptText(SAY_SAPP_DIALOG1, KelThuzad);
                       JumpNextStep(6000);
                       break;
                   case 3:
                       DoScriptText(SAY_SAPP_DIALOG2_LICH, LichKing);
                       JumpNextStep(16000);
                       break;
                   case 4:
                       DoScriptText(SAY_SAPP_DIALOG3, KelThuzad);
                       JumpNextStep(9000);
                       break;
                   case 5:
                       DoScriptText(SAY_SAPP_DIALOG4_LICH, LichKing);
                       JumpNextStep(7000);
                       break;
                   case 6:
                       DoScriptText(SAY_SAPP_DIALOG5, KelThuzad);
                       JumpNextStep(3000);
                       break;
            }
        }

        void JumpNextStep(uint32 Time)
        {
            StepTimer = Time;
            Step++;
        }
		
        void Update (uint32 diff)
        {
			if(!instance)
                return;

            if(StepTimer < diff)
                Event();
            else StepTimer -= diff;

            return;
        }
		
        bool CheckAchievementCriteriaMeet(uint32 criteria_id, Player const* /*source*/, Unit const* /*target = NULL*/, uint32 /*miscvalue1 = 0*/)
        {
            switch (criteria_id)
            {
                case 7600:  // Criteria for achievement 2176: And They Would All Go Down Together 15sec of each other 10-man
                    if (Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_10MAN_NORMAL && (maxHorsemenDiedTime - minHorsemenDiedTime) < 15)
                        return true;
                    return false;
                case 7601:  // Criteria for achievement 2177: And They Would All Go Down Together 15sec of each other 25-man
                    if (Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_25MAN_NORMAL && (maxHorsemenDiedTime - minHorsemenDiedTime) < 15)
                        return true;
                    return false;
                case 13233: // Criteria for achievement 2186: The Immortal (25-man)
                    if (Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_25MAN_NORMAL && InstanceFinished() && PlayerDeathCount == 0)
                        return true;
                    return false;
                case 13237: // Criteria for achievement 2187: The Undying (10-man)
                    if (Difficulty(instance->GetSpawnMode()) == RAID_DIFFICULTY_10MAN_NORMAL && InstanceFinished() && PlayerDeathCount == 0)
                        return true;
                    return false;
                    break;
            }
            return false;
        }

        std::string GetSaveData()
        {
            OUT_SAVE_INST_DATA;
			
            std::ostringstream saveStream;
            saveStream << "N X " << GetBossSaveData() << PlayerDeathCount << HeiganPlayerDeathCount;

            OUT_SAVE_INST_DATA_COMPLETE;
            return saveStream.str();
        }

        void Load(const char * str)
        {
            if (!str)
            {
                OUT_LOAD_INST_DATA_FAIL;
                return;
            }

            OUT_LOAD_INST_DATA(str);

            char dataHead1, dataHead2;

            std::istringstream loadStream(str);
            loadStream >> dataHead1 >> dataHead2;

            if(dataHead1 == 'N' && dataHead2 == 'X')
            {
                for(int i = 0; i < MAX_BOSS_NUMBER; ++i)
                {
                    uint32 tmpState;
                    loadStream >> tmpState;
                    if (tmpState == IN_PROGRESS || tmpState > SPECIAL)
                        tmpState = NOT_STARTED;
                    SetBossState(i, EncounterState(tmpState));
                }
                loadStream >> PlayerDeathCount >> HeiganPlayerDeathCount;
            }
            else
                OUT_LOAD_INST_DATA_FAIL;

            OUT_LOAD_INST_DATA_COMPLETE;
        }
    };
};

class mr_bigglesworth_npc : public CreatureScript
{
    public:
        mr_bigglesworth_npc(): CreatureScript("mr_bigglesworth_npc") {}

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mr_bigglesworth_npcAI (creature);
    }

    struct mr_bigglesworth_npcAI : public ScriptedAI
    {
        mr_bigglesworth_npcAI(Creature *c) : ScriptedAI(c)
        {
            instance = c->GetInstanceScript();
        }

        InstanceScript* instance;

        void JustDied(Unit* killer)
        {
            if (instance->GetBossState(DATA_KELTHUZAD) == DONE)
                return;
            if (Creature* KelThuzad = Unit::GetCreature(*me, instance ? instance->GetData64(DATA_KELTHUZAD) : 0))
            {
                KelThuzad->MonsterYellToZone(SAY_CAT_DIED, LANG_UNIVERSAL, 0);
                DoPlaySoundToSet(me, SOUND_KT);
            }
        }
    };
};

class go_naxxramas_portal : public GameObjectScript
{
    public:
        go_naxxramas_portal() : GameObjectScript("go_naxxramas_portal") {}

        bool OnGossipHello(Player* player, GameObject* go)
        {
             switch (go->GetEntry())
             {
              	case GO_ARAC_PORTAL:
                    player->TeleportTo(533, 3019.814941f, -3448.389160f, 302.194061f, 5.557699f);
                    break;
                case GO_MILI_PORTAL:
                    player->TeleportTo(533, 2991.749512f, -3420.202637f, 302.186279f, 2.290148f);
                    break;
                case GO_PLAG_PORTAL:
                    player->TeleportTo(533, 2991.559570f, -3448.530273f, 302.177795f, 3.955977f);
                    break;
                case GO_CONS_PORTAL:
                    player->TeleportTo(533, 3019.950928f, -3420.313232f, 302.184509f, 0.785320f);
                    break;
             }
             return true;
         }
 };
 
void AddSC_instance_naxxramas()
{
    new instance_naxxramas();
    new go_naxxramas_portal();
    new mr_bigglesworth_npc();
}
