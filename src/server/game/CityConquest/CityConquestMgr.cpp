#include "ScriptPCH.h"
#include "Creature.h"
#include <stdio.h>
#include <time.h>
#include <list>
#include "CityConquestMgr.h"
#include "World.h"

CityConquestMgr CityConquest;

CityConquestMgr::CityConquestMgr(){}

City::City(){}

Coords::Coords(){}

Spawn::Spawn(){}

void CityConquestMgr::StartSiege(int id, int faction)
{
	if (CanStartSiege(id, faction))
	{
		City * city = GetCityFromId(id);
		if (city->summonerSet)
			SpawnBoss(id, faction);
		else
		{
			int t = time (NULL) + 1800;
			WorldDatabase.PExecute("UPDATE city_capture_bosses SET spawn_timer = %u WHERE city_id = %u", t, id);
		}

		city->active = true;

		char * fname;
		if (faction == 0)
			fname = "Aliance";
		else
			fname = "Horde";

		char * nm;
		nm = new char[city->name.size()+1];
		nm[city->name.size()] = 0;
		memcpy(nm, city->name.c_str(), city->name.size());

		char msg[500];
		sprintf(msg, "City Conquest: %s declared war to %s. Opposite team has got 30 minutes to engage commander of %s!", fname, nm, nm);
		sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);

		WorldDatabase.PExecute("REPLACE INTO city_capture_progress (city_id, time) VALUES (%u, %u)",
			id, time (NULL));

		//OpenPortal(id);
	}
}

void CityConquestMgr::EndSiege(int id)
{
	City *city = GetCityFromId(id);
	if (!city->active)
		return;
	city->active = false;
	WorldDatabase.PExecute("REPLACE INTO city_capture_progress (city_id, time) VALUES (%u, %u, %u)",
			id, time (NULL));

	WorldDatabase.PExecute("UPDATE city_capture_bosses SET spawn_timer =  1 WHERE city_id = %u", id);

	char * fname;
	if (city->controlled == 0)
		fname = "Aliance";
	else
		fname = "Horde";

	char * nm;
	nm = new char[city->name.size()+1];
	nm[city->name.size()] = 0;
	memcpy(nm, city->name.c_str(), city->name.size());

	char msg[255];
	sprintf(msg, "City Conquest: Battle for %s is over! %s is controlled by %s", nm, nm, fname);
	sWorld->SendWorldText(LANG_SYSTEMMESSAGE, msg);
}


void CityConquestMgr::SwitchFaction(int id)
{
	City * city = GetCityFromId(id);

	if (city->active)
	{
		Spawns::iterator l;
		for (l = city->spawns.begin(); l != city->spawns.end(); ++l)
		{
			Spawn *spawn = *l;
			if (city->controlled == 1)
			{
				spawn->creature->setFaction(spawn->faction_A);

				if(CreatureInfo const *cinfo = spawn->creature->GetCreatureInfo())
				{
					const_cast<CreatureInfo*>(cinfo)->faction_A = spawn->faction_A;
					const_cast<CreatureInfo*>(cinfo)->faction_H = spawn->faction_A;
				}
				WorldDatabase.PExecute("UPDATE creature_template SET faction_A = '%u', faction_H = '%u' WHERE entry = '%u'", spawn->faction_A, spawn->faction_A, spawn->creature->GetEntry());
			}
			else if (city->controlled == 0)
			{
				spawn->creature->setFaction(spawn->faction_H);

				if(CreatureInfo const *cinfo = spawn->creature->GetCreatureInfo())
				{
					const_cast<CreatureInfo*>(cinfo)->faction_A = spawn->faction_H;
					const_cast<CreatureInfo*>(cinfo)->faction_H = spawn->faction_H;
				}
				WorldDatabase.PExecute("UPDATE creature_template SET faction_A = '%u', faction_H = '%u' WHERE entry = '%u'", spawn->faction_H, spawn->faction_H, spawn->creature->GetEntry());
			}
		}
		if (city->controlled == 0)
			city->controlled = 1;
		else
			city->controlled = 0;
		WorldDatabase.PExecute("UPDATE city_capture_cities SET controlled = %u WHERE id = %u", city->controlled, city->id);
		EndSiege(id);
	}
}

void CityConquestMgr::SpawnBoss(int id, int faction)
{
	City * city = GetCityFromId(id);
	if (faction == 0)
		city->summoner->SummonCreature(city->boss_H, city->summoner->GetPositionX(), city->summoner->GetPositionY(), city->summoner->GetPositionZ(),
		city->summoner->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 1800000);
	else if (faction == 1)
		city->summoner->SummonCreature(city->boss_A, city->summoner->GetPositionX(), city->summoner->GetPositionY(), city->summoner->GetPositionZ(),
		city->summoner->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 1800000);

	WorldDatabase.PExecute("UPDATE city_capture_bosses SET spawn_timer =  1 WHERE city_id = %u", id);
}

City * CityConquestMgr::GetCityFromId(int id)
{
	Cities::iterator l;
	for (l = cities.begin(); l != cities.end(); ++l)
	{
		City *ct = *l;
		if (ct->id == id)
			return ct;
	}
	return new City();
}

bool CityConquestMgr::CanStartSiege(int id, int faction)
{
	City *city = GetCityFromId(id);
	if (city->active == true)
		return false;
	if (city->controlled == faction)
		return false;

	QueryResult result = WorldDatabase.PQuery("SELECT time FROM city_capture_progress WHERE city_id = %u", id);
	//														  0
	if (result)
	{
		Field *fields = result->Fetch();
		// 60 = 1 min, will be increased in release
		if (fields[0].GetInt32() + 3600 > time (NULL))
			return false;
	}

	return true;
}

void CityConquestMgr::LoadCities()
{
	QueryResult result = WorldDatabase.Query("SELECT id, minlevel, maxlevel, name, controlled, boss_entry_A, boss_entry_H FROM city_capture_cities LEFT JOIN city_capture_bosses ON id = city_id ORDER BY id ASC");
	//														  0   1         2         3     4           5             6
	if (result)
	{
		do
		{
			City *city = new City();
			Field *fields = result->Fetch();
			city->id = fields[0].GetInt32();
			city->minlevel = fields[1].GetInt32();
			city->maxlevel = fields[2].GetInt32();
			city->name = fields[3].GetString();
			city->controlled = fields[4].GetInt32();
			city->summonerSet = false;
			city->active = false; // todo activecheck
			city->boss_A = fields[5].GetInt32();
			city->boss_H = fields[6].GetInt32();
			// sLog->outString("CQM: City Loaded - %s", fields[3].GetString()); -- causes crash during startup (LordPsyan)
			cities.push_back(city);
			city->LoadPorts();

		}
		while (result->NextRow());
	}
}

void CityConquestMgr::RegisterCreature(Creature * creature, int type)
{
	QueryResult result;
	if (type == 0)
	{
		sLog->outString("CQM: Creature Registered - %u", creature->GetEntry());
		result
			= WorldDatabase.PQuery("SELECT city_id, faction_A, faction_H FROM city_capture_creatures WHERE entry = %u",
			//                             0        1          2
			creature->GetEntry());
		if (result)
		{
			Field *fields = result->Fetch();
			Cities::iterator l;
			for (l = cities.begin(); l != cities.end(); ++l)
			{
				City *ct = *l;
				if (ct->id == fields[0].GetInt32())
				{
					Spawn *spawn = new Spawn();
					spawn->creature = creature;
					spawn->faction_A = fields[1].GetInt32();
					spawn->faction_H = fields[2].GetInt32();

					spawn->creature->setFaction(spawn->faction_A);

					if (ct->controlled == 1)
					{
						spawn->creature->setFaction(spawn->faction_H);

						if(CreatureInfo const *cinfo = spawn->creature->GetCreatureInfo())
						{
							const_cast<CreatureInfo*>(cinfo)->faction_A = spawn->faction_H;
							const_cast<CreatureInfo*>(cinfo)->faction_H = spawn->faction_H;
						}
						WorldDatabase.PExecute("UPDATE creature_template SET faction_A = '%u', faction_H = '%u' WHERE entry = '%u'", spawn->faction_H, spawn->faction_H, spawn->creature->GetEntry());
					}
					else if (ct->controlled == 0)
					{
						spawn->creature->setFaction(spawn->faction_A);

						if(CreatureInfo const *cinfo = spawn->creature->GetCreatureInfo())
						{
							const_cast<CreatureInfo*>(cinfo)->faction_A = spawn->faction_A;
							const_cast<CreatureInfo*>(cinfo)->faction_H = spawn->faction_A;
						}
						WorldDatabase.PExecute("UPDATE creature_template SET faction_A = '%u', faction_H = '%u' WHERE entry = '%u'", spawn->faction_A, spawn->faction_A, spawn->creature->GetEntry());
					}

					ct->spawns.push_back(spawn);
					return;
				}
			}
		}
	}
	else if (type == 2)
	{
		sLog->outString("CQM: City Spawner attmpts to register - %u", creature->GetEntry());
		result
			= WorldDatabase.PQuery("SELECT city_id, spawner_entry, spawn_timer FROM city_capture_bosses WHERE spawner_entry = %u", creature->GetEntry());

		if (result)
		{
			sLog->outString("CQM: City Spawner passed first check - %u", creature->GetEntry());
			Field *fields = result->Fetch();
			Cities::iterator l;
			for (l = cities.begin(); l != cities.end(); ++l)
			{
				City *ct = *l;
				sLog->outString("CQM: City Spawner browses through cities - %u", creature->GetEntry());
				if (ct->id == fields[0].GetInt32())
				{
					if (creature->GetEntry() == fields[1].GetInt32())
					{
						sLog->outString("CQM: City Spawner Registered - %u", creature->GetEntry());
						if (!ct->summonerSet)
						{
							ct->summoner = creature;
							ct->summonerSet = true;
							if (fields[2].GetInt32() > time(NULL))
							{
								if (ct->controlled == 1)
									SpawnBoss(ct->id, 0);
								else
									SpawnBoss(ct->id, 1);
							}
							else
								EndSiege(ct->id);

						}
					}
					return;
				}
			}
		}

	}
}

void City::LoadPorts()
{
	QueryResult result = WorldDatabase.PQuery("SELECT x, y, z, o, map, side FROM city_capture_ports WHERE city_id = %u", id);
	//														  0  1  2  3  4    5
	if (result)
	{
		do
		{
			Field *fields = result->Fetch();
			Coords *coords = new Coords();
			coords->x = fields[0].GetFloat();
			coords->y = fields[1].GetFloat();
			coords->z = fields[2].GetFloat();
			coords->o = fields[3].GetFloat();
			coords->map = fields[4].GetInt32();
			if (fields[5].GetInt32() == 0)
				port_defense = coords;
			else if (fields[5].GetInt32() == 1)
				port_attack = coords;
		}
		while (result->NextRow());
	}
}
