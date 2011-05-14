#include "ScriptPCH.h"
#include "../../game/CityConquest/CityConquestMgr.h"
#include <stdio.h>
#include <time.h>
#include <list>
#define START_OFFSET			2000
#define PORT_OFFSET				5000
#define GOSSIP_ACTION_MAIN		1000
#define GOSSIP_ACTION_SARTLIST	1003
#define GOSSIP_ACTION_PORTLIST	1001
#define GOSSIP_ACTION_CLOSE		1002

int GetActiveSieges(Player* pPlayer)
{
	int side = 1;
	if(pPlayer->TeamForRace(pPlayer->getRace())==ALLIANCE)
		side = 0;
	Cities::iterator l;
	int i = 0;
	for (l = CityConquest.cities.begin(); l != CityConquest.cities.end(); ++l)
	{
		City *ct = *l;
		if (ct->controlled != side && ct->active == true)
		{
			i++;
		}
	}
	return i;
}

int GetActiveSiegesAll(Player* pPlayer)
{
	Cities::iterator l;
	int i = 0;
	for (l = CityConquest.cities.begin(); l != CityConquest.cities.end(); ++l)
	{
		City *ct = *l;
		if (ct->active == true)
		{
			i++;
		}
	}
	return i;
}

void StartSiegeList(int beginAt, Player* pPlayer, Creature* pCreature)
{
	Cities::iterator l;
	int side = 1;
	if(pPlayer->TeamForRace(pPlayer->getRace())==ALLIANCE)
		side = 0;

	int i = 0;
	int lastid = 0;
	for (l = CityConquest.cities.begin(); l != CityConquest.cities.end(); ++l)
	{
		City *ct = *l;
		if (ct->controlled != side && ct->active == false && ct->minlevel <= pPlayer->getLevel() && ct->maxlevel >= pPlayer->getLevel() && CityConquest.CanStartSiege(ct->id, side) && ct->id >= beginAt)
		{
			if (i < 8)
				lastid = ct->id;
			if (i < 9)
			{
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, ct->name, GOSSIP_SENDER_MAIN, START_OFFSET + ct->id);
				i++;
			}
			else if (i == 9)
			{
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Next >>", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_SARTLIST + lastid);
				i++;
			}

		}
	}
	pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "<< Back", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_MAIN);
	pPlayer->SEND_GOSSIP_MENU(1, pCreature->GetGUID());
}

void TeleportList( Player* pPlayer, Creature* pCreature)
{
	Cities::iterator l;
	int side = 1;
	if(pPlayer->TeamForRace(pPlayer->getRace())==ALLIANCE)
		side = 0;

	for (l = CityConquest.cities.begin(); l != CityConquest.cities.end(); ++l)
	{
		City *ct = *l;
		if (ct->active == true)
		{
			char * nm;
			nm = new char[ct->name.size()+1];
			nm[ct->name.size()] = 0;
			memcpy(nm, ct->name.c_str(), ct->name.size());
			char msg[500];

			if (ct->controlled == side)
			{
				sprintf(msg, "Defend: %s", nm);

				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, msg, GOSSIP_SENDER_MAIN, PORT_OFFSET + ct->id);
			}
			else
			{
				sprintf(msg, "Attack: %s", nm);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, msg, GOSSIP_SENDER_MAIN, PORT_OFFSET + ct->id);
			}

		}
	}

	pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "<< Back", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_MAIN);
	pPlayer->SEND_GOSSIP_MENU(1, pCreature->GetGUID());
}

void MainMenu(Player* pPlayer, Creature* pCreature)
{
	
	if (GetActiveSieges(pPlayer) < 5)
		pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "New Conquest", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_SARTLIST + 1);
	    
	if (GetActiveSiegesAll(pPlayer) > 0)
		pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Aid in Conquest", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_PORTLIST);
	    
	pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Bye", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_CLOSE);
	pPlayer->SEND_GOSSIP_MENU(1, pCreature->GetGUID());
}
class city_conquest_portal : public CreatureScript
{
public:
    city_conquest_portal() : CreatureScript("city_conquest_portal") {}

bool OnGossipHello(Player* pPlayer, Creature* pCreature)
{
    MainMenu(pPlayer, pCreature);
	return true;
}

bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 action)
{
	pPlayer->PlayerTalkClass->ClearMenus();
	int id = 0;
	int side = 1;
		if(pPlayer->TeamForRace(pPlayer->getRace())==ALLIANCE)
			side = 0;

	if (action >= PORT_OFFSET)
	{
		id = action - PORT_OFFSET;
		Cities::iterator l;
		for (l = CityConquest.cities.begin(); l != CityConquest.cities.end(); ++l)
		{
			City *ct = *l;
			if (ct->id == id)
			{
				if (ct->controlled == side)
					pPlayer->TeleportTo(ct->port_defense->map, ct->port_defense->x, ct->port_defense->y, ct->port_defense->z, ct->port_defense->o, 0);
				else
					pPlayer->TeleportTo(ct->port_attack->map, ct->port_attack->x, ct->port_attack->y, ct->port_attack->z, ct->port_attack->o, 0);
				pPlayer->PlayerTalkClass->CloseGossip();
			}
		}
	}
	else if (action >= START_OFFSET)
	{
		int side = 1;
		if(pPlayer->TeamForRace(pPlayer->getRace())==ALLIANCE)
			side = 0;
		id = action - START_OFFSET;
		CityConquest.StartSiege(id, side);
		MainMenu(pPlayer, pCreature);
	}
	else if (action >= GOSSIP_ACTION_SARTLIST)
	{
		id = action - GOSSIP_ACTION_SARTLIST;
		StartSiegeList(id, pPlayer, pCreature);
	}
	else if (action == GOSSIP_ACTION_CLOSE)
	{
		pPlayer->PlayerTalkClass->CloseGossip();
	}
	else if (action == GOSSIP_ACTION_PORTLIST)
	{
		TeleportList(pPlayer, pCreature);
	}
	else if (action == GOSSIP_ACTION_MAIN)
	{
		MainMenu(pPlayer, pCreature);
	}

    return true;
}
};


void AddSC_city_conquest_portal()
{
    new city_conquest_portal;
}
