#ifndef CITYCONQUESTMGR_H
#define CITYCONQUESTMGR_H
extern WorldDatabaseWorkerPool WorldDatabase;

class Coords
{
public:
	float x;
	float y;
	float z;
	float o;
	int map;
	Coords(void);
};

class Spawn
{
public:
	Creature *creature;
	int faction_A;
	int faction_H;
	Spawn(void);
private:
	void GetCreatureData(int entry);
};

typedef std::list<Spawn *> Spawns;

class City
{
public:
	int id;
	Spawns spawns;
	int boss_A;
	int boss_H;
	bool summonerSet;
	Creature * summoner;
	Coords * port_defense;
	Coords * port_attack;
	int controlled;
	//	0 aliance
	//  1 horde
	int minlevel;
	int maxlevel;
	std::string name;
	bool active;
	//   true - siege in progress
	//   false - not under siege
	City(void);
	void LoadPorts(void);									// done


};

typedef std::list<City *> Cities;

class CityConquestMgr
{
public:
	Cities cities;
	CityConquestMgr(void);
	void LoadCities(void); // done
	void RegisterCreature(Creature *creature, int type);	// done
	//                                            0 normal
	//                                            1 boss
	//                                            2 spawner
	bool CanStartSiege(int id, int faction);				// done
	//							   0 aliance
	//                             1 horde
	void StartSiege(int id, int faction);				    // done
	void SpawnBoss(int id, int faction);					// done
	//						   0 aliance
	//                         1 horde
	void EndSiege(int id);									// done
	void OpenPortal(int id);								// todo
	void SwitchFaction(int id);				                // done
	//							   0 aliance
	//                             1 horde
	City * GetCityFromId(int id);							// done
};

extern CityConquestMgr CityConquest;

#endif
