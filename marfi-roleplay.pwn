#include <a_samp>
#include <a_mysql>
#include <sscanf2>
#include <streamer>
#include <YSI\y_commands>

main()
{

}
// ====================================================================================================== Defines
// MySQL
#define MYSQL_HOST "localhost"
#define MYSQL_USER "root"
#define MYSQL_DATABASE "sa-mp"
#define MYSQL_PASSWORD ""

// 
#define SPAWN_X 10.0
#define SPAWN_Y 10.0
#define SPAWN_Z 14.0
#define SPAWN_A 0.0

// Dialogs
#define DIALOG_LOGIN (0) // On login, typing password to enter the game
#define DIALOG_REGISTER (1) // On registration, first step for making account and typing password
#define DIALOG_SEX (2) // On registration, choose between Male and Female
#define DIALOG_AGE (3) // On registration, enter age
#define DIALOG_COUNTRY (4) // On registration, choose between Balkan countries
#define DIALOG_CITY (5) // On registration, choose between in-game cities

// Colors
#define COLOR_GREY 0xAFAFAFAA
// System Defined Colors
#define COLOR_ACTIVEBORDER 0xB4B4B4FF
#define COLOR_ACTIVECAPTION 0x99B4D1FF
#define COLOR_ACTIVECAPTIONTEXT 0x000000FF
#define COLOR_ALICEBLUE 0xF0F8FFFF
#define COLOR_ANTIQUEWHITE 0xFAEBD7FF
#define COLOR_APPWORKSPACE 0xABABABFF
#define COLOR_AQUA 0x00FFFFFF
#define COLOR_AQUAMARINE 0x7FFFD4FF
#define COLOR_AZURE 0xF0FFFFFF
#define COLOR_BEIGE 0xF5F5DCFF
#define COLOR_BISQUE 0xFFE4C4FF
#define COLOR_BLACK 0x000000FF
#define COLOR_BLANCHEDALMOND 0xFFEBCDFF
#define COLOR_BLUE 0x0000FFFF
#define COLOR_BLUEVIOLET 0x8A2BE2FF
#define COLOR_BROWN 0xA52A2AFF
#define COLOR_BURLYWOOD 0xDEB887FF
#define COLOR_BUTTONFACE 0xF0F0F0FF
#define COLOR_BUTTONHIGHLIGHT 0xFFFFFFFF
#define COLOR_BUTTONSHADOW 0xA0A0A0FF
#define COLOR_CADETBLUE 0x5F9EA0FF
#define COLOR_CHARTREUSE 0x7FFF00FF
#define COLOR_CHOCOLATE 0xD2691EFF
#define COLOR_CONTROL 0xF0F0F0FF
#define COLOR_CONTROLDARK 0xA0A0A0FF
#define COLOR_CONTROLDARKDARK 0x696969FF
#define COLOR_CONTROLLIGHT 0xE3E3E3FF
#define COLOR_CONTROLLIGHTLIGHT 0xFFFFFFFF
#define COLOR_CONTROLTEXT 0x000000FF
#define COLOR_CORAL 0xFF7F50FF
#define COLOR_CORNFLOWERBLUE 0x6495EDFF
#define COLOR_CORNSILK 0xFFF8DCFF
#define COLOR_CRIMSON 0xDC143CFF
#define COLOR_CYAN 0x00FFFFFF
#define COLOR_DARKBLUE 0x00008BFF
#define COLOR_DARKCYAN 0x008B8BFF
#define COLOR_DARKGOLDENROD 0xB8860BFF
#define COLOR_DARKGRAY 0xA9A9A9FF
#define COLOR_DARKGREEN 0x006400FF
#define COLOR_DARKKHAKI 0xBDB76BFF
#define COLOR_DARKMAGENTA 0x8B008BFF
#define COLOR_DARKOLIVEGREEN 0x556B2FFF
#define COLOR_DARKORANGE 0xFF8C00FF
#define COLOR_DARKORCHID 0x9932CCFF
#define COLOR_DARKRED 0x8B0000FF
#define COLOR_DARKSALMON 0xE9967AFF
#define COLOR_DARKSEAGREEN 0x8FBC8BFF
#define COLOR_DARKSLATEBLUE 0x483D8BFF
#define COLOR_DARKSLATEGRAY 0x2F4F4FFF
#define COLOR_DARKTURQUOISE 0x00CED1FF
#define COLOR_DARKVIOLET 0x9400D3FF
#define COLOR_DEEPPINK 0xFF1493FF
#define COLOR_DEEPSKYBLUE 0x00BFFFFF
#define COLOR_DESKTOP 0x000000FF
#define COLOR_DIMGRAY 0x696969FF
#define COLOR_DODGERBLUE 0x1E90FFFF
#define COLOR_FIREBRICK 0xB22222FF
#define COLOR_FLORALWHITE 0xFFFAF0FF
#define COLOR_FORESTGREEN 0x228B22FF
#define COLOR_FUCHSIA 0xFF00FFFF
#define COLOR_GAINSBORO 0xDCDCDCFF
#define COLOR_GHOSTWHITE 0xF8F8FFFF
#define COLOR_GOLD 0xFFD700FF
#define COLOR_GOLDENROD 0xDAA520FF
#define COLOR_GRADIENTACTIVECAPTION 0xB9D1EAFF
#define COLOR_GRADIENTINACTIVECAPTION 0xD7E4F2FF
#define COLOR_GRAY 0x808080FF
#define COLOR_GRAYTEXT 0x808080FF
#define COLOR_GREEN 0x008000FF
#define COLOR_GREENYELLOW 0xADFF2FFF
#define COLOR_HIGHLIGHT 0x3399FFFF
#define COLOR_HIGHLIGHTTEXT 0xFFFFFFFF
#define COLOR_HONEYDEW 0xF0FFF0FF
#define COLOR_HOTPINK 0xFF69B4FF
#define COLOR_HOTTRACK 0x0066CCFF
#define COLOR_INACTIVEBORDER 0xF4F7FCFF
#define COLOR_INACTIVECAPTION 0xBFCDDBFF
#define COLOR_INACTIVECAPTIONTEXT 0x434E54FF
#define COLOR_INDIANRED 0xCD5C5CFF
#define COLOR_INDIGO 0x4B0082FF
#define COLOR_INFO 0xFFFFE1FF
#define COLOR_INFOTEXT 0x000000FF
#define COLOR_IVORY 0xFFFFF0FF
#define COLOR_KHAKI 0xF0E68CFF
#define COLOR_LAVENDER 0xE6E6FAFF
#define COLOR_LAVENDERBLUSH 0xFFF0F5FF
#define COLOR_LAWNGREEN 0x7CFC00FF
#define COLOR_LEMONCHIFFON 0xFFFACDFF
#define COLOR_LIGHTBLUE 0xADD8E6FF
#define COLOR_LIGHTCORAL 0xF08080FF
#define COLOR_LIGHTCYAN 0xE0FFFFFF
#define COLOR_LIGHTGOLDENRODYELLOW 0xFAFAD2FF
#define COLOR_LIGHTGRAY 0xD3D3D3FF
#define COLOR_LIGHTGREEN 0x90EE90FF
#define COLOR_LIGHTPINK 0xFFB6C1FF
#define COLOR_LIGHTSALMON 0xFFA07AFF
#define COLOR_LIGHTSEAGREEN 0x20B2AAFF
#define COLOR_LIGHTSKYBLUE 0x87CEFAFF
#define COLOR_LIGHTSLATEGRAY 0x778899FF
#define COLOR_LIGHTSTEELBLUE 0xB0C4DEFF
#define COLOR_LIGHTYELLOW 0xFFFFE0FF
#define COLOR_LIME 0x00FF00FF
#define COLOR_LIMEGREEN 0x32CD32FF
#define COLOR_LINEN 0xFAF0E6FF
#define COLOR_MAGENTA 0xFF00FFFF
#define COLOR_MAROON 0x800000FF
#define COLOR_MEDIUMAQUAMARINE 0x66CDAAFF
#define COLOR_MEDIUMBLUE 0x0000CDFF
#define COLOR_MEDIUMORCHID 0xBA55D3FF
#define COLOR_MEDIUMPURPLE 0x9370DBFF
#define COLOR_MEDIUMSEAGREEN 0x3CB371FF
#define COLOR_MEDIUMSLATEBLUE 0x7B68EEFF
#define COLOR_MEDIUMSPRINGGREEN 0x00FA9AFF
#define COLOR_MEDIUMTURQUOISE 0x48D1CCFF
#define COLOR_MEDIUMVIOLETRED 0xC71585FF
#define COLOR_MENU 0xF0F0F0FF
#define COLOR_MENUBAR 0xF0F0F0FF
#define COLOR_MENUHIGHLIGHT 0x3399FFFF
#define COLOR_MENUTEXT 0x000000FF
#define COLOR_MIDNIGHTBLUE 0x191970FF
#define COLOR_MINTCREAM 0xF5FFFAFF
#define COLOR_MISTYROSE 0xFFE4E1FF
#define COLOR_MOCCASIN 0xFFE4B5FF
#define COLOR_NAVAJOWHITE 0xFFDEADFF
#define COLOR_NAVY 0x000080FF
#define COLOR_OLDLACE 0xFDF5E6FF
#define COLOR_OLIVE 0x808000FF
#define COLOR_OLIVEDRAB 0x6B8E23FF
#define COLOR_ORANGE 0xFFA500FF
#define COLOR_ORANGERED 0xFF4500FF
#define COLOR_ORCHID 0xDA70D6FF
#define COLOR_PALEGOLDENROD 0xEEE8AAFF
#define COLOR_PALEGREEN 0x98FB98FF
#define COLOR_PALETURQUOISE 0xAFEEEEFF
#define COLOR_PALEVIOLETRED 0xDB7093FF
#define COLOR_PAPAYAWHIP 0xFFEFD5FF
#define COLOR_PEACHPUFF 0xFFDAB9FF
#define COLOR_PERU 0xCD853FFF
#define COLOR_PINK 0xFFC0CBFF
#define COLOR_PLUM 0xDDA0DDFF
#define COLOR_POWDERBLUE 0xB0E0E6FF
#define COLOR_PURPLE 0x800080FF
#define COLOR_RED 0xFF0000FF
#define COLOR_ROSYBROWN 0xBC8F8FFF
#define COLOR_ROYALBLUE 0x4169E1FF
#define COLOR_SADDLEBROWN 0x8B4513FF
#define COLOR_SALMON 0xFA8072FF
#define COLOR_SANDYBROWN 0xF4A460FF
#define COLOR_SCROLLBAR 0xC8C8C8FF
#define COLOR_SEAGREEN 0x2E8B57FF
#define COLOR_SEASHELL 0xFFF5EEFF
#define COLOR_SIENNA 0xA0522DFF
#define COLOR_SILVER 0xC0C0C0FF
#define COLOR_SKYBLUE 0x87CEEBFF
#define COLOR_SLATEBLUE 0x6A5ACDFF
#define COLOR_SLATEGRAY 0x708090FF
#define COLOR_SNOW 0xFFFAFAFF
#define COLOR_SPRINGGREEN 0x00FF7FFF
#define COLOR_STEELBLUE 0x4682B4FF
#define COLOR_TAN 0xD2B48CFF
#define COLOR_TEAL 0x008080FF
#define COLOR_THISTLE 0xD8BFD8FF
#define COLOR_TOMATO 0xFF6347FF
#define COLOR_TRANSPARENT 0xFFFFFF00
#define COLOR_TURQUOISE 0x40E0D0FF
#define COLOR_VIOLET 0xEE82EEFF
#define COLOR_WHEAT 0xF5DEB3FF
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_WHITESMOKE 0xF5F5F5FF
#define COLOR_WINDOW 0xFFFFFFFF
#define COLOR_WINDOWFRAME 0x646464FF
#define COLOR_WINDOWTEXT 0x000000FF
#define COLOR_YELLOW 0xFFFF00FF
#define COLOR_YELLOWGREEN 0x9ACD32FF
#define STEALTH_ORANGE 0xFF880000
#define STEALTH_OLIVE 0x66660000
#define STEALTH_GREEN 0x33DD1100
#define STEALTH_PINK 0xFF22EE00
#define STEALTH_BLUE 0x0077BB00

// ====================================================================================================== Forwards
forward CheckPlayerData(playerid);
forward OnCheckPlayerData(playerid);
forward LoadPlayerData(playerid);
forward OnLoadPlayerData(playerid);
forward OnPlayerRegister(playerid);
forward OnAccountLoad(playerid);

forward SendRadiusMessage(Float:radius, playerid, string[], color1, color2, color3, color4, color5);
// ====================================================================================================== Variables
new MySQL:mysql;

// Players TABLE
enum PlayerData
{
	ID, // ID in the Table of Players
	Name[MAX_PLAYER_NAME], // Name of the player
	Password[65], // Encrypted password
	Salt[11], // Salt for encryption
	Sex, // Sex of the player (male | female)
	Age, // Age of the player
	Country, // Country from where players come
	City, // City where player will spawn
	Money,  // In-game money of the player
	Float:SpawnX, // Spawn location, coordinate X
	Float:SpawnY, // Spawn location, coordinate Y
	Float:SpawnZ, // Spawn location, coordinate Z
	Float:SpawnA // Spawn location, angle
};
new PlayerInfo[MAX_PLAYERS][PlayerData];

// ====================================================================================================== Stocks
stock isNumeric(string[])
{
	for(new i = 0; i < strlen(string); i++)
	{
		if(string[i] < '0' || string[i] > '9')
		{
			return 0; // It's not a number, return 0 (false)
		}
	}
	
	return 1; // It's a number, return 1 (true)
}
// ====================================================================================================== Functions
public CheckPlayerData(playerid)
{
	new query[128], playername[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playername, sizeof(playername));
	mysql_format(mysql, query, sizeof(query), "SELECT Password, Plan FROM Players WHERE NAME = '%e' LIMIT 1", playername);
	mysql_tquery(mysql, query, "OnCheckPlayerData", "i", playerid);
	
	return 1;
}

public OnCheckPlayerData(playerid)
{
// Check if result has atleast one row, that means player has an account, show him dialog for login
	if(cache_num_rows() > 0)
	{
		cache_get_value_name(0, "Password", PlayerInfo[playerid][Password], 65);
		cache_get_value_name(0, "Salt", PlayerInfo[playerid][Salt], 11);
		
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "Vas nalog je pronadjen. Molimo Vas upisite lozinku da se prijavite", "Dalje", "Izlaz");
	}
	// Otherwise, player is not registered, show him dialog for registration
	else
	{
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Registracija", "Vas nalog nije pronadjen. Molimo Vas upisite lozinku da se registrujete", "Dalje", "Izlaz");
	}
	
	return 1;
}

public LoadPlayerData(playerid)
{
	new query[128], playername[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playername, sizeof(playername));
	mysql_format(mysql, query, sizeof(query), "SELECT * FROM Players WHERE NAME = '%e' LIMIT 1", playername);
	mysql_tquery(mysql, query, "OnLoadPlayerData", "i", playerid);
	
	return 1;
}

public OnLoadPlayerData(playerid)
{
	// Check if result has atleast one row, that means player has an account, show him dialog for login
	if(cache_num_rows() > 0)
	{
		cache_get_value_name_int(0, "ID", PlayerInfo[playerid][ID]);
		cache_get_value_name(0, "Password", PlayerInfo[playerid][Password], 65);
		cache_get_value_name(0, "Salt", PlayerInfo[playerid][Salt], 11);
		cache_get_value_name_int(0, "Sex", PlayerInfo[playerid][Sex]);
		cache_get_value_name_int(0, "Age", PlayerInfo[playerid][Age]);
		cache_get_value_name_int(0, "Country", PlayerInfo[playerid][Country]);
		cache_get_value_name_int(0, "City", PlayerInfo[playerid][City]);
		cache_get_value_name_float(0, "SpawnX", PlayerInfo[playerid][SpawnX]);
		cache_get_value_name_float(0, "SpawnY", PlayerInfo[playerid][SpawnY]);
		cache_get_value_name_float(0, "SpawnZ", PlayerInfo[playerid][SpawnZ]);
	}
	return 1;
}

public OnAccountLoad(playerid)
{
	if(cache_num_rows() > 0)
	{
		cache_get_value_name_int(0, "ID", PlayerInfo[playerid][ID]);

		SendClientMessage(playerid, -1, "Dobrodosli nazad.");
	}
	
	return 1;
}

public OnPlayerRegister(playerid)
{
	PlayerInfo[playerid][ID] = cache_insert_id();
	printf("Korisnik se registrovao %d", PlayerInfo[playerid][ID]);
	SendClientMessage(playerid, -1, "Registrovali ste se na server.");
}

public SendRadiusMessage(Float:radius, playerid, string[], color1, color2, color3, color4, color5)
{
	new Float:X, Float:Y, Float:Z, Float:OX, Float:OY, Float:OZ, Float:MSGX, Float:MSGY, Float:MSGZ;
	new PlayerVirtualWorld = GetPlayerVirtualWorld(playerid);
	
	GetPlayerPos(playerid, OX, OY, OZ);
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(PlayerVirtualWorld != GetPlayerVirtualWorld(i)) return 1;
		GetPlayerPos(i, X, Y, Z);
		MSGX = (OX - X);
		MSGY = (OY - Y);
		MSGZ = (OZ - Z);
		if(((MSGX < radius/16) && (MSGX > -radius/16)) && ((MSGY < radius/16) && (MSGY > -radius/16)) && ((MSGZ < radius/16) && (MSGZ > -radius/16))) SendClientMessage(i, color1, string);
		else if(((MSGX < radius/8) && (MSGX > -radius/8)) && ((MSGY < radius/8) && (MSGY > -radius/8)) && ((MSGZ < radius/16) && (MSGZ > -radius/8))) SendClientMessage(i, color2, string);
		else if(((MSGX < radius/4) && (MSGX > -radius/4)) && ((MSGY < radius/4) && (MSGY > -radius/4)) && ((MSGZ < radius/16) && (MSGZ > -radius/4))) SendClientMessage(i, color3, string);
		else if(((MSGX < radius/2) && (MSGX > -radius/2)) && ((MSGY < radius/2) && (MSGY > -radius/2)) && ((MSGZ < radius/2) && (MSGZ > -radius/2))) SendClientMessage(i, color4, string);
		else if(((MSGX < radius) && (MSGX > -radius)) && ((MSGY < radius) && (MSGY > -radius)) && ((MSGZ < radius) && (MSGZ > -radius))) SendClientMessage(i, color5, string);
	}
	return 1;
}

public OnGameModeInit()
{
	// Disable other player markers on radar
	ShowPlayerMarkers(0);
	
	// Shows name, health and armor above player
	ShowNameTags(1);
	
	// Disables stunt bonuses
	EnableStuntBonusForAll(0);
	
	// Disable interior enter and exits
	DisableInteriorEnterExits();
	
	// Manually control vehicle parameters
	ManualVehicleEngineAndLights();

	new MySQLOpt:MYSQL_OPTIONS = mysql_init_options();
	mysql_set_option(MYSQL_OPTIONS, SERVER_PORT, 3307);
	
	mysql = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE, MYSQL_OPTIONS);
	
	if(mysql_errno(mysql) != 0 || mysql == MYSQL_INVALID_HANDLE)
	{
		print("Connection has failed");
		SendRconCommand("exit");
		return 1;
	}
	
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ]);
	SetPlayerCameraPos(playerid, PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ]);
	SetPlayerCameraLookAt(playerid, PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ]);
	
	return 1;
}

public OnPlayerConnect(playerid)
{
	new playername[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playername, sizeof(playername));
	CheckPlayerData(playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
    return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
    return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case DIALOG_LOGIN:
		{
			if(!response)
			{
				return Kick(playerid);
			}
			if(response)
			{
				new buffer[65], playername[MAX_PLAYER_NAME];
			
				SHA256_PassHash(inputtext, PlayerInfo[playerid][Salt], buffer, 65);
				
				if(strcmp(buffer, PlayerInfo[playerid][Password]) == 0)
				{
					GetPlayerName(playerid, playername, sizeof(playername));
					LoadPlayerData(playerid);
					
					// If player didnt pick Sex, show him dialog
					if(!PlayerInfo[playerid][Sex])
					{
						ShowPlayerDialog(playerid, DIALOG_SEX, DIALOG_STYLE_LIST, "Registracija - Pol", "Musko\nZensko", "U redu", "Izadji");
					}
					// If player didnt pick Age, show him dialog
					else if(!PlayerInfo[playerid][Age])
					{
						ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Registracija - Godine", "Unesite koliko imate godina", "U redu", "Izadji");
					}
					// If player didnt pick Country, show him dialog
					else if(!PlayerInfo[playerid][Country])
					{
						ShowPlayerDialog(playerid, DIALOG_COUNTRY, DIALOG_STYLE_LIST, "Registracija - Drzava", "Srbija\nCrna Gora\nBosna i Hercegovina\nHrvatska\nMakedonija\nOstalo", "U redu", "Izadji");
					}
					// If player didnt picky City, show him dialog
					else if(!PlayerInfo[playerid][City])
					{
						ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, "Registracija - Grad", "Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
					}
					// Otherwise, player is fully registered, spawn him
					else 
					{
						SetSpawnInfo(playerid, 0, 0, PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ], 360.0, 0, 0, 0, 0, 0, 0);
						SpawnPlayer(playerid);
					}
				}
				else
				{
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "Lozinka koju ste uneli nije ispravna, pokusajte ponovo", "Dalje", "Izlaz");
				}
			}
		}
		
		case DIALOG_REGISTER:
		{
			if(!response) 
			{
				return Kick(playerid);
			}
			
			if(strlen(inputtext) < 6 || strlen(inputtext) > 20)
			{
				ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, "Registracija", "Vas nalog nije pronadjen. \nMolimo Vas upisite lozinku da se registrujete", "Dalje", "Izlaz");
				return 1;
			}
			
			for (new i = 0; i < 10; i++) 
			{
				PlayerInfo[playerid][Salt][i] = random(100) + 50;
			}
			
			PlayerInfo[playerid][Salt][10] = 0;
			SHA256_PassHash(inputtext, PlayerInfo[playerid][Salt], PlayerInfo[playerid][Password], 65);
			
			new query[256], playername[MAX_PLAYER_NAME];
			GetPlayerName(playerid, playername, sizeof(playername));
			
			mysql_format(mysql, query, sizeof(query), "INSERT INTO Players SET \
														Name = '%e', \
														Password = '%e', \
														Salt = '%e'", playername, PlayerInfo[playerid][Password], PlayerInfo[playerid][Salt]);
			mysql_tquery(mysql, query, "OnPlayerRegister", "i", playerid);
			
			ShowPlayerDialog(playerid, DIALOG_SEX, DIALOG_STYLE_LIST, "Registracija - Pol", "Musko\nZensko", "U redu", "Izadji");
		}
		
		case DIALOG_SEX:
		{
			new query[256];
			
			if(!response) 
			{
				return Kick(playerid);
			}
			
			if(listitem == 0)
			{
				PlayerInfo[playerid][Sex] = 1;
				mysql_format(mysql, query, sizeof(query), "UPDATE Players \
															SET Sex = %d \
															WHERE ID = %d", PlayerInfo[playerid][Sex], PlayerInfo[playerid][ID]);											
				// Maybe this code could do once, test it later.											
				mysql_tquery(mysql, query, "", "");
				
				ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Registracija - Godine", "Unesite koliko imate godina", "U redu", "Izadji");
			}
			else if(listitem == 1)
			{
				PlayerInfo[playerid][Sex] = 2;
				mysql_format(mysql, query, sizeof(query), "UPDATE Players \
															SET Sex = %d \
															WHERE ID = %d", PlayerInfo[playerid][Sex], PlayerInfo[playerid][ID]);
				// Maybe this code could do once, test it later.
				mysql_tquery(mysql, query, "", "");
				
				ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Registracija - Godine", "Unesite koliko imate godina", "U redu", "Izadji");
			}
		}
		
		case DIALOG_AGE:
		{
			new query[256], years;
			
			if(!response)
			{
				return Kick(playerid);
			}
			
			if(!strlen(inputtext))
			{
				return ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Registracija - Godine", "Niste uneli koliko imate godina. \nMUnesite koliko imate godina.", "U redu", "Izadji");
			}
			
			if(!isNumeric(inputtext))
			{
				return ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Registracija - Godine", "Niste uneli koliko imate godina. \nUnesite koliko imate godina.", "U redu", "Izadji");
			}
			
			years = strval(inputtext);
			if(years < 7 || years > 99)
			{
				return ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Registracija - Godine", "Molimo Vas budite iskreni sa godinama. \nUnesite koliko imate godina.", "U redu", "Izadji");
			}
			
			mysql_format(mysql, query, sizeof(query), "UPDATE Players \
												SET Age = %d \
												WHERE ID = %d", years, PlayerInfo[playerid][ID]);
			mysql_tquery(mysql, query, "", "");
			
			ShowPlayerDialog(playerid, DIALOG_COUNTRY, DIALOG_STYLE_LIST, "Registracija - Drzava", "Srbija\nCrna Gora\nBosna i Hercegovina\nHrvatska\nMakedonija\nOstalo", "U redu", "Izadji");
		}
		
		case DIALOG_COUNTRY:
		{
			new query[256];
			
			if(!response)
			{
				return Kick(playerid);
			}
			
			switch(listitem)
			{
				// Serbia
				case 0:
				{
					PlayerInfo[playerid][Country] = 1;
					mysql_format(mysql, query, sizeof(query), "UPDATE Players \
																SET Country = %d \
																WHERE ID = %d", PlayerInfo[playerid][Country], PlayerInfo[playerid][ID]);									
					mysql_tquery(mysql, query, "", "");
					ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, "Registracija - Grad", "Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
					
				}
				// Montenegro
				case 1:
				{
					PlayerInfo[playerid][Country] = 2;
					mysql_format(mysql, query, sizeof(query), "UPDATE Players \
																SET Country = %d \
																WHERE ID = %d", PlayerInfo[playerid][Country], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query, "", "");
					ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, "Registracija - Grad", "Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
				}
				// Bosnia and Herzegovina
				case 2:
				{
					PlayerInfo[playerid][Country] = 3;
					mysql_format(mysql, query, sizeof(query), "UPDATE Players \
																SET Country = %d \
																WHERE ID = %d", PlayerInfo[playerid][Country], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query, "", "");
					ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, "Registracija - Grad", "Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
				}
				// Croatia
				case 3:
				{
					PlayerInfo[playerid][Country] = 4;
					mysql_format(mysql, query, sizeof(query), "UPDATE Players \
																SET Country = %d \
																WHERE ID = %d", PlayerInfo[playerid][Country], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query, "", "");
					ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, "Registracija - Grad", "Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
				}
				// Macedonia
				case 4:
				{
					PlayerInfo[playerid][Country] = 5;
					mysql_format(mysql, query, sizeof(query), "UPDATE Players \
																SET Country = %d \
																WHERE ID = %d", PlayerInfo[playerid][Country], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query, "", "");
					ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, "Registracija - Grad", "Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
				}
				// Other 
				case 5:
				{
					PlayerInfo[playerid][Country] = 6;
					mysql_format(mysql, query, sizeof(query), "UPDATE Players \
																SET Country = %d \
																WHERE ID = %d", PlayerInfo[playerid][Country], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query, "", "");
					ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, "Registracija - Grad", "Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
				}
			}
		}
		
		case DIALOG_CITY:
		{
			new query[256];
			
			if(!response)
			{
				return Kick(playerid);
			}
			
			switch(listitem)
			{
				// Los Santos
				case 0:
				{
					PlayerInfo[playerid][City] = 1;
					PlayerInfo[playerid][SpawnX] = 1642.2903;
					PlayerInfo[playerid][SpawnY] = -2333.3423;
					PlayerInfo[playerid][SpawnZ] = 13.5469;
					//PlayerInfo[playerid][SpawnA] = 0.0;
					mysql_format(mysql, query, sizeof(query), "UPDATE Players \
																SET City = %d, SpawnX = %f, SpawnY = %f, SpawnZ = %f \
																WHERE ID = %d", PlayerInfo[playerid][City], PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query, "", "");
					
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "Uspesno ste zavrsili kompletnu registraciju. \nMolimo Vas upisite lozinku da se prijavite.", "Dalje", "Izlaz");
					
				}
				// Las Venturas
				case 1:
				{
					PlayerInfo[playerid][City] = 2;
					PlayerInfo[playerid][SpawnX] = 1676.4181;
					PlayerInfo[playerid][SpawnY] = 1447.8713;
					PlayerInfo[playerid][SpawnZ] = 10.7845;
					//PlayerInfo[playerid][SpawnA] = 270.4988;
					
					mysql_format(mysql, query, sizeof(query), "UPDATE Players \
																SET City = %d, SpawnX = %f, SpawnY = %f, SpawnZ = %f \
																WHERE ID = %d", PlayerInfo[playerid][City], PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query, "", "");
					
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "Uspesno ste zavrsili kompletnu registraciju. \nMolimo Vas upisite lozinku da se prijavite.", "Dalje", "Izlaz");
				}
				// San Fierro
				case 2:
				{
					PlayerInfo[playerid][City] = 3;
					PlayerInfo[playerid][SpawnX] = 1410.8577;
					PlayerInfo[playerid][SpawnY] = -301.6284;
					PlayerInfo[playerid][SpawnZ] = 14.1484;
					//PlayerInfo[playerid][SpawnA] = 136.9096;
					mysql_format(mysql, query, sizeof(query), "UPDATE Players \
																SET City = %d, SpawnX = %f, SpawnY = %f, SpawnZ = %f \
																WHERE ID = %d", PlayerInfo[playerid][City], PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query, "", "");
					
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "Uspesno ste zavrsili kompletnu registraciju. \nMolimo Vas upisite lozinku da se prijavite.", "Dalje", "Izlaz");
				}
			}
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}