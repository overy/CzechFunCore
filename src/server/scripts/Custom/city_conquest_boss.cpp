#include "ScriptPCH.h"
#include <stdio.h>
#include <stdlib.h>
#include "../../game/CityConquest/CityConquestMgr.h"

static int entry;

struct city_conquest_bossAI : public ScriptedAI
{
    city_conquest_bossAI(Creature *c) : ScriptedAI(c)
	{
		sLog->outString("CQM: Boss loaded to world - %u", me->GetEntry());
		CityConquest.RegisterCreature(me, 1);
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

    void UpdateAI(const uint32 uiDiff)
    {
        DoMeleeAttackIfReady();
    }

	void JustDied(Unit* Killer)
    {
		QueryResult result
			= WorldDatabase.PQuery("SELECT city_id, boss_entry_A, boss_entry_H FROM city_capture_bosses WHERE boss_entry_A = %u OR boss_entry_H = %u OR "
			//                             0        1             2
			"spawner_entry = %u", entry, entry, entry);

		if (result)
		{
			Field *fields = result->Fetch();
			Cities::iterator l;
			for (l = CityConquest.cities.begin(); l != CityConquest.cities.end(); ++l)
			{
				City *ct = *l;
				if (ct->id == fields[0].GetInt32())
				{
					if (entry == fields[2].GetInt32() || entry == fields[1].GetInt32())
					{
						CityConquest.SwitchFaction(ct->id);
						return;
					}
				}
			}
		}
    }
};
class city_conquest_boss : public CreatureScript
{
public:
    city_conquest_boss() : CreatureScript("city_conquest_boss") { }

    CreatureAI *GetAI(Creature *creature) const
    {
    return new city_conquest_bossAI (creature);
	}
};

void AddSC_city_conquest_boss()
{
    new city_conquest_boss;
}
