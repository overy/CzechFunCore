#include "ScriptPCH.h"
#include <stdio.h>
#include <stdlib.h>
#include "../../game/CityConquest/CityConquestMgr.h"

static int entry;

struct city_conquest_spawnerAI : public ScriptedAI
{
    city_conquest_spawnerAI(Creature *c) : ScriptedAI(c)
	{
		sLog->outString("CQM: Generic creature loaded to world - %u", me->GetEntry());
		CityConquest.RegisterCreature(me, 2);
		entry = me->GetEntry();
	}

    void Reset()
    {

    }

    void EnterCombat(Unit* pWho)
    {

    }

    void EnterEvadeMode()
    {
    }

	void SummonedCreatureDespawn(Creature *pSummoned)
    {
		QueryResult result
			= WorldDatabase.PQuery("SELECT city_id FROM city_capture_bosses WHERE  "
			//                             0
			"spawner_entry = %u", entry);

		if (result)
		{
			Field *fields = result->Fetch();
			CityConquest.EndSiege(fields[0].GetInt32());
		}

    }


    void UpdateAI(const uint32 uiDiff)
    {
        DoMeleeAttackIfReady();
    }
};

class city_conquest_spawner : public CreatureScript
{
public:
    city_conquest_spawner() : CreatureScript("city_conquest_spawner") {}

	CreatureAI *GetAI(Creature *creature) const
    {
    return new city_conquest_spawnerAI (creature);
	}
};

void AddSC_city_conquest_spawner()
{
    new city_conquest_spawner;
}