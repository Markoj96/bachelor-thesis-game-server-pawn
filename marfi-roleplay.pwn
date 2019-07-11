#include <a_samp>
#include <a_mysql>
#include <sscanf2>
#include <streamer>
#include <YSI\y_commands>
#include <YSI\y_timers>

main()
{
	return 1;
}

// ====================================================================================================== Defines
// MySQL
#define MYSQL_HOST "localhost"
#define MYSQL_USER "root"
#define MYSQL_DATABASE "sa-mp"
#define MYSQL_PASSWORD ""

// Dialogs
#define DIALOG_LOGIN 0 // On login, typing password to enter the game
#define DIALOG_REGISTER 1 // On registration, first step for making account and typing password
#define DIALOG_SEX 2 // On registration, choose between Male and Female
#define DIALOG_AGE 3 // On registration, enter age
#define DIALOG_COUNTRY 4 // On registration, choose between Balkan countries
#define DIALOG_CITY 5 // On registration, choose between in-game cities

// Colors
#define COLOR_GREY 														0xAFAFAFAA
// System Defined Colors
#define COLOR_ACTIVEBORDER 												0xB4B4B4FF
#define COLOR_ACTIVECAPTION 											0x99B4D1FF
#define COLOR_ACTIVECAPTIONTEXT 										0x000000FF
#define COLOR_ALICEBLUE 												0xF0F8FFFF
#define COLOR_ANTIQUEWHITE 												0xFAEBD7FF
#define COLOR_APPWORKSPACE 												0xABABABFF
#define COLOR_AQUA 														0x00FFFFFF
#define COLOR_AQUAMARINE 												0x7FFFD4FF
#define COLOR_AZURE 													0xF0FFFFFF
#define COLOR_BEIGE 													0xF5F5DCFF
#define COLOR_BISQUE 													0xFFE4C4FF
#define COLOR_BLACK 													0x000000FF
#define COLOR_BLANCHEDALMOND 											0xFFEBCDFF
#define COLOR_BLUE 														0x0000FFFF
#define COLOR_BLUEVIOLET 												0x8A2BE2FF
#define COLOR_BROWN 													0xA52A2AFF
#define COLOR_BURLYWOOD 												0xDEB887FF
#define COLOR_BUTTONFACE 												0xF0F0F0FF
#define COLOR_BUTTONHIGHLIGHT 											0xFFFFFFFF
#define COLOR_BUTTONSHADOW 												0xA0A0A0FF
#define COLOR_CADETBLUE 												0x5F9EA0FF
#define COLOR_CHARTREUSE 												0x7FFF00FF
#define COLOR_CHOCOLATE 												0xD2691EFF
#define COLOR_CONTROL 													0xF0F0F0FF
#define COLOR_CONTROLDARK 												0xA0A0A0FF
#define COLOR_CONTROLDARKDARK 											0x696969FF
#define COLOR_CONTROLLIGHT 												0xE3E3E3FF
#define COLOR_CONTROLLIGHTLIGHT 										0xFFFFFFFF
#define COLOR_CONTROLTEXT 												0x000000FF
#define COLOR_CORAL 													0xFF7F50FF
#define COLOR_CORNFLOWERBLUE 											0x6495EDFF
#define COLOR_CORNSILK 													0xFFF8DCFF
#define COLOR_CRIMSON 													0xDC143CFF
#define COLOR_CYAN 														0x00FFFFFF
#define COLOR_DARKBLUE 													0x00008BFF
#define COLOR_DARKCYAN 													0x008B8BFF
#define COLOR_DARKGOLDENROD 											0xB8860BFF
#define COLOR_DARKGRAY 													0xA9A9A9FF
#define COLOR_DARKGREEN 												0x006400FF
#define COLOR_DARKKHAKI 												0xBDB76BFF
#define COLOR_DARKMAGENTA 												0x8B008BFF
#define COLOR_DARKOLIVEGREEN 											0x556B2FFF
#define COLOR_DARKORANGE 												0xFF8C00FF
#define COLOR_DARKORCHID 												0x9932CCFF
#define COLOR_DARKRED 													0x8B0000FF
#define COLOR_DARKSALMON 												0xE9967AFF
#define COLOR_DARKSEAGREEN 												0x8FBC8BFF
#define COLOR_DARKSLATEBLUE 											0x483D8BFF
#define COLOR_DARKSLATEGRAY 											0x2F4F4FFF
#define COLOR_DARKTURQUOISE 											0x00CED1FF
#define COLOR_DARKVIOLET 												0x9400D3FF
#define COLOR_DEEPPINK 													0xFF1493FF
#define COLOR_DEEPSKYBLUE 												0x00BFFFFF
#define COLOR_DESKTOP 													0x000000FF
#define COLOR_DIMGRAY 													0x696969FF
#define COLOR_DODGERBLUE 												0x1E90FFFF
#define COLOR_FIREBRICK 												0xB22222FF
#define COLOR_FLORALWHITE 												0xFFFAF0FF
#define COLOR_FORESTGREEN 												0x228B22FF
#define COLOR_FUCHSIA 													0xFF00FFFF
#define COLOR_GAINSBORO 												0xDCDCDCFF
#define COLOR_GHOSTWHITE 												0xF8F8FFFF
#define COLOR_GOLD 														0xFFD700FF
#define COLOR_GOLDENROD 												0xDAA520FF
#define COLOR_GRADIENTACTIVECAPTION 									0xB9D1EAFF
#define COLOR_GRADIENTINACTIVECAPTION 									0xD7E4F2FF
#define COLOR_GRAY 														0x808080FF
#define COLOR_GRAYTEXT 													0x808080FF
#define COLOR_GREEN 													0x008000FF
#define COLOR_GREENYELLOW 												0xADFF2FFF
#define COLOR_HIGHLIGHT 												0x3399FFFF
#define COLOR_HIGHLIGHTTEXT 											0xFFFFFFFF
#define COLOR_HONEYDEW 													0xF0FFF0FF
#define COLOR_HOTPINK 													0xFF69B4FF
#define COLOR_HOTTRACK 													0x0066CCFF
#define COLOR_INACTIVEBORDER 											0xF4F7FCFF
#define COLOR_INACTIVECAPTION 											0xBFCDDBFF
#define COLOR_INACTIVECAPTIONTEXT 										0x434E54FF
#define COLOR_INDIANRED	 												0xCD5C5CFF
#define COLOR_INDIGO 													0x4B0082FF
#define COLOR_INFO 														0xFFFFE1FF
#define COLOR_INFOTEXT 													0x000000FF
#define COLOR_IVORY 													0xFFFFF0FF
#define COLOR_KHAKI 													0xF0E68CFF
#define COLOR_LAVENDER 													0xE6E6FAFF
#define COLOR_LAVENDERBLUSH 											0xFFF0F5FF
#define COLOR_LAWNGREEN 												0x7CFC00FF
#define COLOR_LEMONCHIFFON 												0xFFFACDFF
#define COLOR_LIGHTBLUE 												0xADD8E6FF
#define COLOR_LIGHTCORAL 												0xF08080FF
#define COLOR_LIGHTCYAN 												0xE0FFFFFF
#define COLOR_LIGHTGOLDENRODYELLOW 										0xFAFAD2FF
#define COLOR_LIGHTGRAY  												0xD3D3D3FF
#define COLOR_LIGHTGREEN  												0x90EE90FF
#define COLOR_LIGHTPINK  												0xFFB6C1FF
#define COLOR_LIGHTSALMON  												0xFFA07AFF
#define COLOR_LIGHTSEAGREEN  											0x20B2AAFF
#define COLOR_LIGHTSKYBLUE  											0x87CEFAFF
#define COLOR_LIGHTSLATEGRAY  											0x778899FF
#define COLOR_LIGHTSTEELBLUE  											0xB0C4DEFF
#define COLOR_LIGHTYELLOW  												0xFFFFE0FF
#define COLOR_LIME  													0x00FF00FF
#define COLOR_LIMEGREEN  												0x32CD32FF
#define COLOR_LINEN  													0xFAF0E6FF
#define COLOR_MAGENTA  													0xFF00FFFF
#define COLOR_MAROON  													0x800000FF
#define COLOR_MEDIUMAQUAMARINE  										0x66CDAAFF
#define COLOR_MEDIUMBLUE  												0x0000CDFF
#define COLOR_MEDIUMORCHID  											0xBA55D3FF
#define COLOR_MEDIUMPURPLE  											0x9370DBFF
#define COLOR_MEDIUMSEAGREEN  											0x3CB371FF
#define COLOR_MEDIUMSLATEBLUE  											0x7B68EEFF
#define COLOR_MEDIUMSPRINGGREEN  										0x00FA9AFF
#define COLOR_MEDIUMTURQUOISE  											0x48D1CCFF
#define COLOR_MEDIUMVIOLETRED  											0xC71585FF
#define COLOR_MENU  													0xF0F0F0FF
#define COLOR_MENUBAR  													0xF0F0F0FF
#define COLOR_MENUHIGHLIGHT  											0x3399FFFF
#define COLOR_MENUTEXT  												0x000000FF
#define COLOR_MIDNIGHTBLUE  											0x191970FF
#define COLOR_MINTCREAM  												0xF5FFFAFF
#define COLOR_MISTYROSE  												0xFFE4E1FF
#define COLOR_MOCCASIN  												0xFFE4B5FF
#define COLOR_NAVAJOWHITE  												0xFFDEADFF
#define COLOR_NAVY  													0x000080FF
#define COLOR_OLDLACE  													0xFDF5E6FF
#define COLOR_OLIVE  													0x808000FF
#define COLOR_OLIVEDRAB  												0x6B8E23FF
#define COLOR_ORANGE  													0xFFA500FF
#define COLOR_ORANGERED  												0xFF4500FF
#define COLOR_ORCHID  													0xDA70D6FF
#define COLOR_PALEGOLDENROD  											0xEEE8AAFF
#define COLOR_PALEGREEN  												0x98FB98FF
#define COLOR_PALETURQUOISE  											0xAFEEEEFF
#define COLOR_PALEVIOLETRED  											0xDB7093FF
#define COLOR_PAPAYAWHIP  												0xFFEFD5FF
#define COLOR_PEACHPUFF  												0xFFDAB9FF
#define COLOR_PERU  													0xCD853FFF
#define COLOR_PINK  													0xFFC0CBFF
#define COLOR_PLUM  													0xDDA0DDFF
#define COLOR_POWDERBLUE  												0xB0E0E6FF
#define COLOR_PURPLE  													0x800080FF
#define COLOR_RED  														0xFF0000FF
#define COLOR_ROSYBROWN  												0xBC8F8FFF
#define COLOR_ROYALBLUE  												0x4169E1FF
#define COLOR_SADDLEBROWN  												0x8B4513FF
#define COLOR_SALMON  													0xFA8072FF
#define COLOR_SANDYBROWN  												0xF4A460FF
#define COLOR_SCROLLBAR  												0xC8C8C8FF
#define COLOR_SEAGREEN  												0x2E8B57FF
#define COLOR_SEASHELL  												0xFFF5EEFF
#define COLOR_SIENNA  													0xA0522DFF
#define COLOR_SILVER  													0xC0C0C0FF
#define COLOR_SKYBLUE  													0x87CEEBFF
#define COLOR_SLATEBLUE  												0x6A5ACDFF
#define COLOR_SLATEGRAY  												0x708090FF
#define COLOR_SNOW  													0xFFFAFAFF
#define COLOR_SPRINGGREEN  												0x00FF7FFF
#define COLOR_STEELBLUE  												0x4682B4FF
#define COLOR_TAN  														0xD2B48CFF
#define COLOR_TEAL  													0x008080FF
#define COLOR_THISTLE  													0xD8BFD8FF
#define COLOR_TOMATO  													0xFF6347FF
#define COLOR_TRANSPARENT  												0xFFFFFF00
#define COLOR_TURQUOISE  												0x40E0D0FF
#define COLOR_VIOLET  													0xEE82EEFF
#define COLOR_WHEAT  													0xF5DEB3FF
#define COLOR_WHITE  													0xFFFFFFFF
#define COLOR_WHITESMOKE  												0xF5F5F5FF
#define COLOR_WINDOW  													0xFFFFFFFF
#define COLOR_WINDOWFRAME  												0x646464FF
#define COLOR_WINDOWTEXT  												0x000000FF
#define COLOR_YELLOW  													0xFFFF00FF
#define COLOR_YELLOWGREEN  												0x9ACD32FF
#define STEALTH_ORANGE  												0xFF880000
#define STEALTH_OLIVE  													0x66660000
#define STEALTH_GREEN  													0x33DD1100
#define STEALTH_PINK  													0xFF22EE00
#define STEALTH_BLUE  													0x0077BB00
// ====================================================================================================== Forwards
forward CheckPlayerData(playerid);
forward OnCheckPlayerData(playerid);
forward LoadPlayerData(playerid);
forward OnLoadPlayerData(playerid);
forward OnPlayerRegister(playerid);
forward OnAccountLoad(playerid);

forward IsARentVehicle(vehicleid);
forward IsASalesVehicle(vehicleid);
forward IsAOwnedVehicle(vehicleid);
forward IsARentVehicle(vehicleid);
forward IsABike(vehicleid);
forward IsABoat(vehicleid);
forward IsAPlane(vehicleid);
forward IsATrain(vehicleid);

forward IsPlayerNearPump1(playerid);
forward IsPlayerNearPump2(playerid);
forward IsPlayerNearPump3(playerid);

forward AntiFreezePlayer(playerid);

forward SendRadiusMessage(Float:radius, playerid, string[], color1, color2, color3, color4, color5);

forward LoadVehicles();
forward OnVehiclesLoad();
forward InsertVehicle(vehicleOwner, vehicleModel);
forward SaveVehicle(vehicleid);
forward SetVehicleComponents(vehicleid);
forward RemoveVehicleComponents(vehicleid);
forward SaveVehicleComponents(vehicleid);
forward GetVehicleName(vehicleid, model[], len);

forward StartVehicleEngine(playerid, vehicleid);
forward CheckVehicleFuel();
// ====================================================================================================== Variables
new MySQL:mysql;

// Textdraws
new Text:FuelTD[MAX_PLAYERS];

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

//Vehicle TABLE
enum VehicleData
{
	ID, // ID in Table of Players
	Owned, // Is vehicle owned
	Owner, // ID of Owner (foreign key)
	Model, // Model of vehicle
	Float:ParkX, // Spawn location, coordinate X
	Float:ParkY, // Spawn location, coordinate Y
	Float:ParkZ, // Spawn location, coordinate Z
	Float:ParkA, // Spawn location, coordinate A
	Color1, // Color1 of vehicle
	Color2, // Color2 of vehicle
	Paintjob, // Paintjob of vehicle
	Locked, // If vehicle is locked
	Registration, // Vehicle registration table
	Spoiler, // Addons - spoiler
	Hood, // Addons - hood
	Roof, // Addons - roof
	Sideskirt, // Addons - sideskirt
	Lamps, // Addons - lamps
	Nitro, // Addons - nitro
	Exhaust, // Addons - exhaust
	Wheels, // Addons - wheels
	Stereo, // Addons - stereo
	Hydraulics, // Addons - hydraulics
	Front_bumper, // Addons - front bumper
	Rear_bumper, // Addons - rear bumper
	Vent_right, // Addons - vent right
	Vent_left // Addons - vent left
};
new VehicleInfo[MAX_VEHICLES][VehicleData];

// Player
new IsPlayerRentingVehicle[MAX_PLAYERS];
new RentedVehicle[MAX_PLAYERS];
new StartingVehicleEngine[MAX_PLAYERS];
new RefuellingVehicle[MAX_PLAYERS];
new RefillLitre[MAX_PLAYERS];
new HasBelt[MAX_PLAYERS];
new HasHelmet[MAX_PLAYERS];

// Vehicle
new VehicleEngine[MAX_VEHICLES];
new VehicleFuel[MAX_VEHICLES];
new VehicleHood[MAX_VEHICLES];
new VehicleTrunk[MAX_VEHICLES];

// Adding vehicles
new RentVehicle[25];
new SalesVehicle[89];
new OwnedVehicle[sizeof(VehicleInfo)];

// ====================================================================================================== Functions (Public & Stock)
// Money AntiCheat
stock SafeGivePlayerMoney(playerid, money)
{
	PlayerInfo[playerid][Money] += money;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, PlayerInfo[playerid][Money]);
	
	return PlayerInfo[playerid][Money];
}

stock SafeSetPlayerMoney(plyerid, money)
{
	PlayerInfo[playerid][Money] = money;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, PlayerInfo[playerid][Money]);
	
	return PlayerInfo[playerid][Money];
}

stock SafeResetPlayerMoney(playerid)
{
	PlayerInfo[playerid][Money] = 0;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, PlayerInfo[playerid][Money]);
	
	return PlayerInfo[playerid][Money];
}

stock SafeGetPlayerMoney(playerid)
{
	return PlayerInfo[playerid][Money];
}

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

public LoadVehicles()
{
	new query[256];
	
	mysql_format(mysql, query, sizeof(query), "SELECT * FROM Vehicles");
	mysql_tquery(mysql, query, "OnVehiclesLoad");
		
	return 0;
}

public OnVehiclesLoad()
{
	if(cache_num_rows() > 0)
	{
		for(new i = 0; i < cache_num_rows(); i++)
		{
			cache_get_value_name_int(i, "ID", VehicleInfo[i][ID]);
			cache_get_value_name_int(i, "Owned", VehicleInfo[i][Owned]);
			cache_get_value_name_int(i, "Owner", VehicleInfo[i][Owner]);
			cache_get_value_name_int(i, "Model", VehicleInfo[i][Model]);
			cache_get_value_name_float(i, "ParkX", VehicleInfo[i][ParkX]);
			cache_get_value_name_float(i, "ParkY", VehicleInfo[i][ParkY]);
			cache_get_value_name_float(i, "ParkZ", VehicleInfo[i][ParkZ]);
			cache_get_value_name_float(i, "ParkA", VehicleInfo[i][ParkA]);
			cache_get_value_name_int(i, "Color1", VehicleInfo[i][Color1]);
			cache_get_value_name_int(i, "Color2", VehicleInfo[i][Color2]);
			cache_get_value_name_int(i, "Paintjob", VehicleInfo[i][Paintjob]);
			cache_get_value_name_int(i, "Locked", VehicleInfo[i][Locked]);
			cache_get_value_name_int(i, "Registration", VehicleInfo[i][Registration]);
			cache_get_value_name_int(i, "Spoiler", VehicleInfo[i][Spoiler]);
			cache_get_value_name_int(i, "Hood", VehicleInfo[i][Hood]);
			cache_get_value_name_int(i, "Roof", VehicleInfo[i][Roof]);
			cache_get_value_name_int(i, "Sideskirt", VehicleInfo[i][Sideskirt]);
			cache_get_value_name_int(i, "Lamps", VehicleInfo[i][Lamps]);
			cache_get_value_name_int(i, "Nitro", VehicleInfo[i][Nitro]);
			cache_get_value_name_int(i, "Exhaust", VehicleInfo[i][Exhaust]);
			cache_get_value_name_int(i, "Wheels", VehicleInfo[i][Wheels]);
			cache_get_value_name_int(i, "Stereo", VehicleInfo[i][Stereo]);
			cache_get_value_name_int(i, "Hydraulics", VehicleInfo[i][Hydraulics]);
			cache_get_value_name_int(i, "Front_bumper", VehicleInfo[i][Front_bumper]);
			cache_get_value_name_int(i, "Rear_bumper", VehicleInfo[i][Rear_bumper]);
			cache_get_value_name_int(i, "Vent_right", VehicleInfo[i][Vent_right]);
			cache_get_value_name_int(i, "Vent_left", VehicleInfo[i][Vent_left]);
			
			if(VehicleInfo[i][Owned] == 1)
			{
				OwnedVehicle[i] = CreateVehicle(VehicleInfo[i][Model], VehicleInfo[i][ParkX], VehicleInfo[i][ParkY], VehicleInfo[i][ParkZ], VehicleInfo[i][ParkA], VehicleInfo[i][Color1], VehicleInfo[i][Color2], 0);
				SetVehicleComponents(i);
			}				
		}
	}
}

public InsertVehicle(vehicleOwner, vehicleModel) 
{
	new query[512];
	mysql_format(mysql, query, sizeof(query), "INSERT INTO Vehicles SET \
													Owned = 1, \
													Owner = %d, \
													Model = %d, \
													ParkX = 1590.59, \
													ParkY = -2319.39, \
													ParkZ = 13.3828, \
													ParkA = 80, \
													Color1 = 0, \
													Color2 = 0, \
													Paintjob = 0, \
													Locked = 0, \
													Registration = 0, \
													Spoiler = 0, \
													Hood = 0, \
													Roof = 0, \
													Sideskirt = 0, \
													Lamps = 0, \
													Nitro = 0, \
													Exhaust = 0, \
													Wheels = 0, \
													Stereo = 0, \
													Hydraulics = 0, \
													Front_bumper= 0, \
													Rear_bumper = 0, \
													Vent_right = 0, \
													Vent_left = 0",
													vehicleOwner,
													vehicleModel);
	mysql_tquery(mysql, query, "", "");
}

public SaveVehicle(vehicleid)
{
	new query[512];
	
	mysql_format(mysql, query, sizeof(query), "UPDATE Vehicles \
												SET Owned = %d, \
													Owner = %d, \
													Model = %d, \
													ParkX = %f, \
													ParkY = %f, \
													ParkZ = %f, \
													ParkA = %f, \
													Color1 = %d, \
													Color2 = %d, \
													Paintjob = %d, \
													Locked = %d, \
													Registration = %d, \
													Spoiler = %d, \
													Hood = %d, \
													Roof = %d, \
													Sideskirt = %d, \
													Lamps = %d, \
													Nitro = %d, \
													Exhaust = %d, \
													Wheels = %d, \
													Stereo = %d, \
													Hydraulics = %d, \
													Front_bumper= %d, \
													Rear_bumper = %d, \
													Vent_right = %d, \
													Vent_left = %d \												
												WHERE ID = %d", 
												VehicleInfo[vehicleid][ParkX], 
												VehicleInfo[vehicleid][ParkY], 
												VehicleInfo[vehicleid][ParkZ], 
												VehicleInfo[vehicleid][ParkA], 
												VehicleInfo[vehicleid][Color1], 
												VehicleInfo[vehicleid][Color2], 
												VehicleInfo[vehicleid][Paintjob],
												VehicleInfo[vehicleid][Locked],
												VehicleInfo[vehicleid][Registration],
												VehicleInfo[vehicleid][Spoiler],
												VehicleInfo[vehicleid][Hood],
												VehicleInfo[vehicleid][Roof],
												VehicleInfo[vehicleid][Sideskirt],
												VehicleInfo[vehicleid][Lamps],
												VehicleInfo[vehicleid][Nitro],
												VehicleInfo[vehicleid][Exhaust],
												VehicleInfo[vehicleid][Wheels],
												VehicleInfo[vehicleid][Stereo],
												VehicleInfo[vehicleid][Hydraulics],
												VehicleInfo[vehicleid][Front_bumper],
												VehicleInfo[vehicleid][Rear_bumper],
												VehicleInfo[vehicleid][Vent_right],
												VehicleInfo[vehicleid][Vent_left],
												VehicleInfo[vehicleid][ID]);
	mysql_tquery(mysql, query, "", "");

	return 0;
}

public SaveVehicleComponents(vehicleid)
{
	new spoiler, hood, roof, sideskirt, lamps, nitro, exhaust, wheels;
	new stereo, hydraulics, frontbumper, rearbumper, leftvent, rightvent;
	
	spoiler = GetVehicleComponentInSlot(vehicleid, 0);
	hood = GetVehicleComponentInSlot(vehicleid, 1);
	roof = GetVehicleComponentInSlot(vehicleid, 2);
	sideskirt = GetVehicleComponentInSlot(vehicleid, 3);
	lamps = GetVehicleComponentInSlot(vehicleid, 4);
	nitro = GetVehicleComponentInSlot(vehicleid, 5);
	exhaust = GetVehicleComponentInSlot(vehicleid, 6);
	wheels = GetVehicleComponentInSlot(vehicleid, 7);
	stereo = GetVehicleComponentInSlot(vehicleid, 8);
	hydraulics = GetVehicleComponentInSlot(vehicleid, 9);
	frontbumper = GetVehicleComponentInSlot(vehicleid, 10);
	rearbumper = GetVehicleComponentInSlot(vehicleid, 11);
	rightvent = GetVehicleComponentInSlot(vehicleid, 12);
	leftvent = GetVehicleComponentInSlot(vehicleid, 13);

	if(spoiler != 0) { VehicleInfo[vehicleid][Spoiler] = spoiler; }
	if(hood != 0) { VehicleInfo[vehicleid][Hood] = hood; }
	if(roof != 0) { VehicleInfo[vehicleid][Roof] = roof; }
	if(sideskirt != 0) { VehicleInfo[vehicleid][Sideskirt] = sideskirt; }
	if(lamps != 0) { VehicleInfo[vehicleid][Lamps] = lamps; }
	if(nitro != 0) { VehicleInfo[vehicleid][Nitro] = nitro; }
	if(exhaust != 0) { VehicleInfo[vehicleid][Exhaust] = exhaust; }
	if(wheels != 0) { VehicleInfo[vehicleid][Wheels] = wheels; }
	if(stereo != 0) { VehicleInfo[vehicleid][Stereo] = stereo; }
	if(hydraulics != 0) { VehicleInfo[vehicleid][Hydraulics] = hydraulics; }
	if(frontbumper != 0) { VehicleInfo[vehicleid][Front_bumper] = frontbumper; }
	if(rearbumper != 0) { VehicleInfo[vehicleid][Rear_bumper] = rearbumper; }
	if(rightvent != 0) { VehicleInfo[vehicleid][Vent_right] = rightvent; }
	if(leftvent != 0) { VehicleInfo[vehicleid][Vent_left] = leftvent; }
	
	SaveVehicle(vehicleid);
	return 0;
}

public SetVehicleComponents(vehicleid)
{
	if(VehicleInfo[vehicleid][Spoiler] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Spoiler]); }
	if(VehicleInfo[vehicleid][Hood] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Hood]); }
	if(VehicleInfo[vehicleid][Roof] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Roof]); }
	if(VehicleInfo[vehicleid][Sideskirt] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Sideskirt]); }
	if(VehicleInfo[vehicleid][Lamps] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Lamps]); }
	if(VehicleInfo[vehicleid][Nitro] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Nitro]); }
	if(VehicleInfo[vehicleid][Exhaust] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Exhaust]); }
	if(VehicleInfo[vehicleid][Wheels] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Wheels]); }
	if(VehicleInfo[vehicleid][Stereo] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Stereo]); }
	if(VehicleInfo[vehicleid][Hydraulics] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Hydraulics]); }
	if(VehicleInfo[vehicleid][Front_bumper] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Front_bumper]); }
	if(VehicleInfo[vehicleid][Rear_bumper] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Rear_bumper]); }
	if(VehicleInfo[vehicleid][Vent_right] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Vent_right]); }
	if(VehicleInfo[vehicleid][Vent_left] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Vent_left]); }
	
	return 0;
}

public RemoveVehicleComponents(vehicleid)
{
    VehicleInfo[vehicleid][Spoiler] = 0;
    VehicleInfo[vehicleid][Hood] = 0;
    VehicleInfo[vehicleid][Roof] = 0;
    VehicleInfo[vehicleid][Sideskirt] = 0;
    VehicleInfo[vehicleid][Lamps] = 0;
    VehicleInfo[vehicleid][Nitro] = 0;
    VehicleInfo[vehicleid][Exhaust] = 0;
    VehicleInfo[vehicleid][Wheels] = 0;
    VehicleInfo[vehicleid][Stereo] = 0;
    VehicleInfo[vehicleid][Hydraulics] = 0;
    VehicleInfo[vehicleid][Front_bumper] = 0;
    VehicleInfo[vehicleid][Rear_bumper] = 0;
    VehicleInfo[vehicleid][Vent_right] = 0;
    VehicleInfo[vehicleid][Vent_left] = 0;
	
    SaveVehicle(vehicleid);
	return 0;
}

public GetVehicleName(vehicleid, model[], len)
{
	new checking = GetVehicleModel(vehicleid);
	if(checking == 400) return format(model, len, "Landstalker", 0);
	else if(checking == 401) return format(model, len, "Bravura", 0);
	else if(checking == 402) return format(model, len, "Buffalo", 0);
	else if(checking == 403) return format(model, len, "Linerunner", 0);
	else if(checking == 404) return format(model, len, "Perenail", 0);
	else if(checking == 405) return format(model, len, "Sentinel", 0);
	else if(checking == 406) return format(model, len, "Dumper", 0);
	else if(checking == 407) return format(model, len, "Firetruck", 0);
	else if(checking == 408) return format(model, len, "Trashmaster", 0);
	else if(checking == 409) return format(model, len, "Stretch", 0);
	else if(checking == 410) return format(model, len, "Manana", 0);
	else if(checking == 411) return format(model, len, "Infernus", 0);
	else if(checking == 412) return format(model, len, "Vodooo", 0);
	else if(checking == 413) return format(model, len, "Pony", 0);
	else if(checking == 414) return format(model, len, "Mule", 0);
	else if(checking == 415) return format(model, len, "Cheetah", 0);
	else if(checking == 416) return format(model, len, "Ambulance", 0);
	else if(checking == 417) return format(model, len, "Leviathan", 0);
	else if(checking == 418) return format(model, len, "Moonbeam", 0);
	else if(checking == 419) return format(model, len, "Esperanto", 0);
	else if(checking == 420) return format(model, len, "Taxi", 0);
	else if(checking == 421) return format(model, len, "Washington", 0);
	else if(checking == 422) return format(model, len, "Bobcat", 0);
	else if(checking == 423) return format(model, len, "Mr Whoopee", 0);
	else if(checking == 424) return format(model, len, "BF Injection", 0);
	else if(checking == 425) return format(model, len, "Hunter", 0);
	else if(checking == 426) return format(model, len, "Premier", 0);
	else if(checking == 427) return format(model, len, "S.W.A.T Truck", 0);
	else if(checking == 428) return format(model, len, "Securicar", 0);
	else if(checking == 429) return format(model, len, "Banshee", 0);
	else if(checking == 430) return format(model, len, "Predator", 0);
	else if(checking == 431) return format(model, len, "Bus", 0);
	else if(checking == 432) return format(model, len, "Rhino", 0);
	else if(checking == 433) return format(model, len, "Barracks", 0);
	else if(checking == 434) return format(model, len, "Hotknife", 0);
	else if(checking == 435) return format(model, len, "Trailer", 0);
	else if(checking == 436) return format(model, len, "Previon", 0);
	else if(checking == 437) return format(model, len, "Coach", 0);
	else if(checking == 438) return format(model, len, "Cabbie", 0);
	else if(checking == 439) return format(model, len, "Stallion", 0);
	else if(checking == 440) return format(model, len, "Rumpo", 0);
	else if(checking == 441) return format(model, len, "RC Bandit", 0);
	else if(checking == 442) return format(model, len, "Romero", 0);
	else if(checking == 443) return format(model, len, "Packer", 0);
	else if(checking == 444) return format(model, len, "Monster", 0);
	else if(checking == 445) return format(model, len, "Admiral", 0);
	else if(checking == 446) return format(model, len, "Squalo", 0);
	else if(checking == 447) return format(model, len, "Seasparrow", 0);
	else if(checking == 448) return format(model, len, "Pizza Boy", 0);
	else if(checking == 449) return format(model, len, "Tram", 0);
	else if(checking == 450) return format(model, len, "Trailer 2", 0);
	else if(checking == 451) return format(model, len, "Turismo", 0);
	else if(checking == 452) return format(model, len, "Speeder", 0);
	else if(checking == 453) return format(model, len, "Refeer", 0);
	else if(checking == 454) return format(model, len, "Tropic", 0);
	else if(checking == 455) return format(model, len, "Flatbed", 0);
	else if(checking == 456) return format(model, len, "Yankee", 0);
	else if(checking == 457) return format(model, len, "Caddy", 0);
	else if(checking == 458) return format(model, len, "Solair", 0);
	else if(checking == 459) return format(model, len, "Top Fun", 0);
	else if(checking == 460) return format(model, len, "Skimmer", 0);
	else if(checking == 461) return format(model, len, "PCJ-600", 0);
	else if(checking == 462) return format(model, len, "Faggio", 0);
	else if(checking == 463) return format(model, len, "Freeway", 0);
	else if(checking == 464) return format(model, len, "RC Baron", 0);
	else if(checking == 465) return format(model, len, "RC Raider", 0);
	else if(checking == 466) return format(model, len, "Glendade", 0);
	else if(checking == 467) return format(model, len, "Oceanic", 0);
	else if(checking == 468) return format(model, len, "Sanchez", 0);
	else if(checking == 469) return format(model, len, "Sparrow", 0);
	else if(checking == 470) return format(model, len, "Patriot", 0);
	else if(checking == 471) return format(model, len, "Quad", 0);
	else if(checking == 472) return format(model, len, "Coastguard", 0);
	else if(checking == 473) return format(model, len, "Dinghy", 0);
	else if(checking == 474) return format(model, len, "Hermes", 0);
	else if(checking == 475) return format(model, len, "Sabre", 0);
	else if(checking == 476) return format(model, len, "Rustler", 0);
	else if(checking == 477) return format(model, len, "ZR-350", 0);
	else if(checking == 478) return format(model, len, "Walton", 0);
	else if(checking == 479) return format(model, len, "Regina", 0);
	else if(checking == 480) return format(model, len, "Comet", 0);
	else if(checking == 481) return format(model, len, "BMX", 0);
	else if(checking == 482) return format(model, len, "Burrito", 0);
	else if(checking == 483) return format(model, len, "Camper", 0);
	else if(checking == 484) return format(model, len, "Marquis", 0);
	else if(checking == 485) return format(model, len, "Baggage", 0);
	else if(checking == 486) return format(model, len, "Dozer", 0);
	else if(checking == 487) return format(model, len, "Maverick", 0);
	else if(checking == 488) return format(model, len, "News Maverick", 0);
	else if(checking == 489) return format(model, len, "Rancher", 0);
	else if(checking == 490) return format(model, len, "Federal Rancher", 0);
	else if(checking == 491) return format(model, len, "Virgo", 0);
	else if(checking == 492) return format(model, len, "Greenwood", 0);
	else if(checking == 493) return format(model, len, "Jetmax", 0);
	else if(checking == 494) return format(model, len, "Hotring", 0);
	else if(checking == 495) return format(model, len, "Sandking", 0);
	else if(checking == 496) return format(model, len, "Blista Compact", 0);
	else if(checking == 497) return format(model, len, "Police Maverick", 0);
	else if(checking == 498) return format(model, len, "Boxville", 0);
	else if(checking == 499) return format(model, len, "Benson", 0);
	else if(checking == 500) return format(model, len, "Mesa", 0);
	else if(checking == 501) return format(model, len, "RC Goblin", 0);
	else if(checking == 502) return format(model, len, "Hotring A", 0);
	else if(checking == 503) return format(model, len, "Hotring B", 0);
	else if(checking == 504) return format(model, len, "Blooding Banger", 0);
	else if(checking == 505) return format(model, len, "Rancher", 0);
	else if(checking == 506) return format(model, len, "Super GT", 0);
	else if(checking == 507) return format(model, len, "Elegant", 0);
	else if(checking == 508) return format(model, len, "Journey", 0);
	else if(checking == 509) return format(model, len, "Bike", 0);
	else if(checking == 510) return format(model, len, "Mountain Bike", 0);
	else if(checking == 511) return format(model, len, "Beagle", 0);
	else if(checking == 512) return format(model, len, "Cropduster", 0);
	else if(checking == 513) return format(model, len, "Stuntplane", 0);
	else if(checking == 514) return format(model, len, "Petrol", 0);
	else if(checking == 515) return format(model, len, "Roadtrain", 0);
	else if(checking == 516) return format(model, len, "Nebula", 0);
	else if(checking == 517) return format(model, len, "Majestic", 0);
	else if(checking == 518) return format(model, len, "Buccaneer", 0);
	else if(checking == 519) return format(model, len, "Shamal", 0);
	else if(checking == 520) return format(model, len, "Hydra", 0);
	else if(checking == 521) return format(model, len, "FCR-300", 0);
	else if(checking == 522) return format(model, len, "NRG-500", 0);
	else if(checking == 523) return format(model, len, "HPV-1000", 0);
	else if(checking == 524) return format(model, len, "Cement Truck", 0);
	else if(checking == 525) return format(model, len, "Towtruck", 0);
	else if(checking == 526) return format(model, len, "Fortune", 0);
	else if(checking == 527) return format(model, len, "Cadrona", 0);
	else if(checking == 528) return format(model, len, "Federal Truck", 0);
	else if(checking == 529) return format(model, len, "Williard", 0);
	else if(checking == 530) return format(model, len, "Fork Lift", 0);
	else if(checking == 531) return format(model, len, "Tractor", 0);
	else if(checking == 532) return format(model, len, "Combine", 0);
	else if(checking == 533) return format(model, len, "Feltzer", 0);
	else if(checking == 534) return format(model, len, "Remington", 0);
	else if(checking == 535) return format(model, len, "Slamvan", 0);
	else if(checking == 536) return format(model, len, "Blade", 0);
	else if(checking == 537) return format(model, len, "Freight", 0);
	else if(checking == 538) return format(model, len, "Streak", 0);
	else if(checking == 539) return format(model, len, "Vortex", 0);
	else if(checking == 540) return format(model, len, "Vincent", 0);
	else if(checking == 541) return format(model, len, "Bullet", 0);
	else if(checking == 542) return format(model, len, "Clover", 0);
	else if(checking == 543) return format(model, len, "Sadler", 0);
	else if(checking == 544) return format(model, len, "Stairs Firetruck", 0);
	else if(checking == 545) return format(model, len, "Hustler", 0);
	else if(checking == 546) return format(model, len, "Intruder", 0);
	else if(checking == 547) return format(model, len, "Primo", 0);
	else if(checking == 548) return format(model, len, "Cargobob", 0);
	else if(checking == 549) return format(model, len, "Tampa", 0);
	else if(checking == 550) return format(model, len, "Sunrise", 0);
	else if(checking == 551) return format(model, len, "Merit", 0);
	else if(checking == 552) return format(model, len, "Utility Van", 0);
	else if(checking == 553) return format(model, len, "Nevada", 0);
	else if(checking == 554) return format(model, len, "Yosemite", 0);
	else if(checking == 555) return format(model, len, "Windsor", 0);
	else if(checking == 556) return format(model, len, "Monster A", 0);
	else if(checking == 557) return format(model, len, "Monster B", 0);
	else if(checking == 558) return format(model, len, "Uranus", 0);
	else if(checking == 559) return format(model, len, "Jester", 0);
	else if(checking == 560) return format(model, len, "Sultan", 0);
	else if(checking == 561) return format(model, len, "Stratum", 0);
	else if(checking == 562) return format(model, len, "Elegy", 0);
	else if(checking == 563) return format(model, len, "Raindance", 0);
	else if(checking == 564) return format(model, len, "RC Tiger", 0);
	else if(checking == 565) return format(model, len, "Flash", 0);
	else if(checking == 566) return format(model, len, "Tahoma", 0);
	else if(checking == 567) return format(model, len, "Savanna", 0);
	else if(checking == 568) return format(model, len, "Bandito", 0);
	else if(checking == 569) return format(model, len, "Freight Flat", 0);
	else if(checking == 570) return format(model, len, "Streak", 0);
	else if(checking == 571) return format(model, len, "Kart", 0);
	else if(checking == 572) return format(model, len, "Mower", 0);
	else if(checking == 573) return format(model, len, "Duneride", 0);
	else if(checking == 574) return format(model, len, "Sweeper", 0);
	else if(checking == 575) return format(model, len, "Broadway", 0);
	else if(checking == 576) return format(model, len, "Tornado", 0);
	else if(checking == 577) return format(model, len, "AT-400", 0);
	else if(checking == 578) return format(model, len, "DFT-30", 0);
	else if(checking == 579) return format(model, len, "Huntley", 0);
	else if(checking == 580) return format(model, len, "Stafford", 0);
	else if(checking == 581) return format(model, len, "BF-400", 0);
	else if(checking == 582) return format(model, len, "Raindance", 0);
	else if(checking == 583) return format(model, len, "News Van", 0);
	else if(checking == 584) return format(model, len, "Tug", 0);
	else if(checking == 585) return format(model, len, "Petrol Tanker", 0);
	else if(checking == 586) return format(model, len, "Wayfarer", 0);
	else if(checking == 587) return format(model, len, "Euros", 0);
	else if(checking == 588) return format(model, len, "Hotdog", 0);
	else if(checking == 589) return format(model, len, "Club", 0);
	else if(checking == 590) return format(model, len, "Freight Box", 0);
	else if(checking == 591) return format(model, len, "Trailer 3", 0);
	else if(checking == 592) return format(model, len, "Andromada", 0);
	else if(checking == 593) return format(model, len, "Dodo", 0);
	else if(checking == 594) return format(model, len, "RC Cam", 0);
	else if(checking == 595) return format(model, len, "Launch", 0);
	else if(checking == 596) return format(model, len, "LSPD Patrol Car", 0);
	else if(checking == 597) return format(model, len, "FBI Patrol Car", 0);
	else if(checking == 598) return format(model, len, "NG Patrol Car", 0);
	else if(checking == 599) return format(model, len, "LSPD Patrol Ranger", 0);
	else if(checking == 600) return format(model, len, "Picador", 0);
	else if(checking == 601) return format(model, len, "S.W.A.T Tank", 0);
    else if(checking == 602) return format(model, len, "Alpha", 0);
	else if(checking == 603) return format(model, len, "Phoenix", 0);
	else if(checking == 609) return format(model, len, "Boxville", 0);
	
	return 0;
}

stock GetVehicleOwnerName(vehicleid)
{
	new query[256], playername[MAX_PLAYER_NAME];
	
	mysql_format(mysql, query, sizeof(query), "SELECT Name \
												FROM Players \
												WHERE ID = %d", VehicleInfo[vehicleid][ID]);
    mysql_tquery(mysql, query, "", "");

	if(cache_num_rows() > 0) 
	{
		cache_get_value_name(0, "Name", playername);
		
		return playername;
	}
	
	return 0;
}

public CheckPlayerData(playerid)
{
	new query[128], playername[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playername, sizeof(playername));
	mysql_format(mysql, query, sizeof(query), "SELECT Password, Salt FROM Players WHERE NAME = '%e' LIMIT 1", playername);
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

public IsASalesVehicle(vehicleid)
{
	for(new i = 0; i < sizeof(SalesVehicle); i++)
	{
	    if(vehicleid == SalesVehicle[i]) return 1;
	}
	return 0;
}

public IsAOwnedVehicle(vehicleid)
{
   for(new i = 0; i < sizeof(OwnedVehicle); i++)
   {
      if(vehicleid == OwnedVehicle[i]) return 1;
   }
   return 0;
}


public IsARentVehicle(vehicleid)
{
   for(new i = 0; i < sizeof(RentVehicle); i++)
   {
      if(vehicleid == RentVehicle[i]) return 1;
   }
   return 0;
}

public IsABike(vehicleid)
{
    new modelid = GetVehicleModel(vehicleid);
	if(modelid == 448 || modelid == 461 || modelid == 462 || modelid == 463 || modelid == 468 || modelid == 471 || modelid == 481 || modelid == 509 || modelid == 510 || modelid == 521 || modelid == 522 || modelid == 523 || modelid == 581 || modelid == 586)
	{
		return 1;
	}
	return 0;
}

public IsABoat(vehicleid)
{
    new modelid = GetVehicleModel(vehicleid);
	if(modelid == 430 || modelid == 446 || modelid == 452 || modelid == 453 || modelid == 454 || modelid == 472 || modelid == 473 || modelid == 484 || modelid == 493) return 1;
	return 0;
}

public IsAPlane(vehicleid)
{
    new modelid = GetVehicleModel(vehicleid);
	if(modelid == 460 || modelid == 464 || modelid == 476 || modelid == 511 || modelid == 512 || modelid == 513 || modelid == 519 || modelid == 520 || modelid == 553 || modelid == 577 || modelid == 592 || modelid == 593) return 1;
	return 0;
}

public IsATrain(vehicleid)
{
	new modelid = GetVehicleModel(vehicleid);
	if(modelid == 449 || modelid == 537 || modelid == 538 || modelid == 569 || modelid == 570 || modelid == 590) return 1;
    return 0;
}

public IsPlayerNearPump1(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 10.0, 1944.3260, -1772.9254, 13.3906)) return 1;
 	return 0;
}

public IsPlayerNearPump2(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 10.0, -90.5515, -1169.4578, 2.4079)) return 1;
 	return 0;
}

public IsPlayerNearPump3(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 10.0, 1004.0070, -939.3102, 42.1797)) return 1;
 	return 0;
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

public StartVehicleEngine(playerid, vehicleid)
{
	new engine, lights, alarm, doors, bonnet, boot, objective, playername[MAX_PLAYER_NAME], str[128];
	
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, 1, 1, alarm, doors, bonnet, boot, objective);

	VehicleEngine[vehicleid] = 1;
	StartingVehicleEngine[playerid] = 0;
	TogglePlayerControllable(playerid, 1);

	SendClientMessage(playerid, -1, "Motor vozila pokrenut.");
	
	GetPlayerName(playerid, playername, sizeof(playername));
	format(str, sizeof(str), "%s pali motor vozila.", playername);
	SendRadiusMessage(50.0, playerid, str, -1, -1, -1, -1, -1);
}

public CheckVehicleFuel()
{
	new engine, lights, alarm, doors, bonnet, boot, objective;
    for(new v = 0; v < MAX_VEHICLES; v++)
    {
   		GetVehicleParamsEx(v, engine, lights, alarm, doors, bonnet, boot, objective);
    	if(IsABoat(v)) VehicleFuel[v] += 1;
    	if(IsAPlane(v)) VehicleFuel[v] += 1;
    	if(VehicleEngine[v] == 1 && VehicleFuel[v] > 0) VehicleFuel[v] -= 1;
    	if(VehicleFuel[v] < 1)
		{
			SetVehicleParamsEx(v, 0, 0, alarm, doors, bonnet, boot, objective);
			VehicleEngine[v] = 0;
		}
	}
	return 1;
}

public AntiFreezePlayer(playerid)
{
    TogglePlayerControllable(playerid, 1);
	//FUEL
	if(RefuellingVehicle[playerid] == 1)
	{
	   	new VehicleID = GetPlayerVehicleID(playerid);
	   	VehicleFuel[VehicleID] += RefillLitre[playerid];
	   	RefuellingVehicle[playerid] = 9999;
	   	//PlayerInfo[playerid][pMoney] -= RefillLitre[playerid]*5;
	   	//GivePlayerMoney(playerid, -RefillLitre[playerid]*5);
	}
}

public OnPlayerRegister(playerid)
{
	PlayerInfo[playerid][ID] = cache_insert_id();
	printf("Korisnik se registrovao %d", PlayerInfo[playerid][ID]);
	SendClientMessage(playerid, -1, "Registrovali ste se na server.");
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
	
	// Load owned vehicles
	LoadVehicles();
	
	//------------------------------------------------------------------------ > RENT
	RentVehicle[0] = AddStaticVehicleEx(462,1560.3000500,-2309.0000000,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicle[1] = AddStaticVehicleEx(462,1560.3000500,-2312.3000500,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicle[2] = AddStaticVehicleEx(462,1560.3000500,-2315.6001000,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicle[3] = AddStaticVehicleEx(462,1560.3000500,-2318.8999000,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicle[4] = AddStaticVehicleEx(462,1560.3000500,-2322.1999500,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicle[5] = AddStaticVehicleEx(462,1560.3000500,-2325.5000000,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicle[6] = AddStaticVehicleEx(462,1560.3000500,-2328.6999500,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicle[7] = AddStaticVehicleEx(462,1560.3000500,-2332.0000000,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicle[8] = AddStaticVehicleEx(462,1560.3000500,-2335.3000500,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicle[9] = AddStaticVehicleEx(462,1560.3000500,-2338.5000000,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicle[10] = AddStaticVehicleEx(410, 1552.6835, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicle[11] = AddStaticVehicleEx(410, 1549.4233, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicle[12] = AddStaticVehicleEx(410, 1546.1617, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicle[13] = AddStaticVehicleEx(410, 1542.9518, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicle[14] = AddStaticVehicleEx(410, 1539.6881, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicle[15] = AddStaticVehicleEx(410, 1536.3673, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicle[16] = AddStaticVehicleEx(410, 1533.1079, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicle[17] = AddStaticVehicleEx(410, 1529.8678, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicle[18] = AddStaticVehicleEx(462,1180.0000000,-1337.6000000,13.2000000,270.0000000,-1,7,-1); //Faggio
	RentVehicle[19] = AddStaticVehicleEx(462,1184.5996000,-1337.5996000,13.2000000,270.0000000,-1,7,-1); //Faggio
	RentVehicle[20] = AddStaticVehicleEx(462,1184.5996000,-1340.5996000,13.2000000,270.0000000,-1,7,-1); //Faggio
	RentVehicle[21] = AddStaticVehicleEx(462,1180.0000000,-1340.5996000,13.2000000,270.0000000,-1,7,-1); //Faggio
	RentVehicle[22] = AddStaticVehicleEx(462,1175.4000000,-1337.6000000,13.2000000,270.0000000,-1,7,-1); //Faggio
	RentVehicle[23] = AddStaticVehicleEx(462,1175.4000000,-1340.5996000,13.2000000,270.0000000,-1,7,-1); //Faggio
	
	for(new v = 0; v < MAX_VEHICLES; v++)
	{
	    if(IsABike(v)) VehicleFuel[v] = 30;
	    else VehicleFuel[v] = 60;
	}
	
	SetTimer("CheckVehicleFuel", 60000, true);
	
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
	// Disable < > SPAWN dialog
	TogglePlayerSpectating(playerid, 0);
	
	new playername[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playername, sizeof(playername));
	CheckPlayerData(playerid);	
	
	IsPlayerRentingVehicle[playerid] = 0;
	RentedVehicle[playerid] = 0;
	StartingVehicleEngine[playerid] = 0;
	RefuellingVehicle[playerid] = 0;
	RefillLitre[playerid] = 0;
	HasBelt[playerid] = 0;
	HasHelmet[playerid] = 0;
	
	FuelTD[playerid] = TextDrawCreate(526.399963, 412.906738, "Gorivo: 100");
	TextDrawLetterSize(FuelTD[playerid], 0.449999, 1.600000);
	TextDrawAlignment(FuelTD[playerid], 1);
	TextDrawColor(FuelTD[playerid], 16711935);
	TextDrawSetShadow(FuelTD[playerid], 0);
	TextDrawSetOutline(FuelTD[playerid], 1);
	TextDrawBackgroundColor(FuelTD[playerid], 51);
	TextDrawFont(FuelTD[playerid], 1);
	TextDrawSetProportional(FuelTD[playerid], 1);
	
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	// If player rented a vehicle, respawn it
	if(IsPlayerRentingVehicle[playerid]) SetVehicleToRespawn(RentedVehicle[playerid]);
	
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
	new engine, lights, alarm, doors, bonnet, boot, objective;
	
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
   	SetVehicleParamsEx(vehicleid, 0, 0, alarm, doors, bonnet, boot, objective);
	
   	VehicleEngine[vehicleid] = 0;
   	VehicleHood[vehicleid] = 0;
	VehicleTrunk[vehicleid] = 0;
	
    if(IsAOwnedVehicle(vehicleid))
    {
        SetVehicleComponents(vehicleid);
        ChangeVehicleColor(vehicleid, VehicleInfo[vehicleid][Color1], VehicleInfo[vehicleid][Color2]);
        if(VehicleInfo[vehicleid][Paintjob] != 9999) ChangeVehiclePaintjob(vehicleid, VehicleInfo[vehicleid][Paintjob]);
    }
    return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	new Float:health;
	new Float:VehicleHealth,engine, lights, alarm, doors, bonnet, boot, objective;
	
	GetPlayerHealth(playerid, health);
	if(IsABike(vehicleid)) if(HasHelmet[playerid] == 0) SetPlayerHealth(playerid, floatround(health, floatround_round) -15);
	else if(HasBelt[playerid] == 0) SetPlayerHealth(playerid, floatround(health, floatround_round) -15);

 	if(VehicleEngine[vehicleid] == 1)
  	{
   		GetVehicleHealth(vehicleid, VehicleHealth);
	    if(VehicleHealth <= 500.0)
	    {
			GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
  			SetVehicleParamsEx(vehicleid, 0, 0, alarm, doors, bonnet, boot, objective);
			VehicleEngine[vehicleid] = 0;
  		}
	}
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
	new vehiclename[32], str[128];
	GetVehicleName(vehicleid, vehiclename, sizeof(vehiclename));
	
	if(IsAOwnedVehicle(vehicleid))
	{
	    format(str, sizeof(str), "Ulazite u %s (%d). Vlasnik: %s", vehiclename, vehicleid, VehicleInfo[vehicleid][Owner]);
	    SendClientMessage(playerid, -1, str);
		
	    if(VehicleInfo[vehicleid][Locked] == 1)
		{
			format(str, sizeof(str), "Vozilo: zakljucano");
			SetVehicleParamsForPlayer(vehicleid, playerid, 0, 1);
		}
	    else
		{
			format(str, sizeof(str), "Vozilo: otkljucano");
			SetVehicleParamsForPlayer(vehicleid, playerid, 0, 0);
		}
	    
		SendClientMessage(playerid, -1, str);
	}
	
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER)
	{
		new newcar, str[128];
		newcar = GetPlayerVehicleID(playerid);

		if(IsABike(newcar)) SendClientMessage(playerid, -1, "Ne zaboravite da stavite kacigu, da se ne bi povredili. /kaciga");
	    else SendClientMessage(playerid, -1, "Ne zaboravite da vezete pojas. /pojas");
		
		if(IsARentVehicle(newcar))
   		{
    		if (RentedVehicle[playerid] != newcar)
   			{
         		TogglePlayerControllable(playerid, 0);
   			}
   			else return 1;
  		}
		
		format(str, sizeof(str), "Gorivo: %i", VehicleFuel[newcar]);
		TextDrawSetString(FuelTD[playerid], str);
	    TextDrawShowForPlayer(playerid, FuelTD[playerid]);
	}
	else if(newstate == PLAYER_STATE_ONFOOT)
	{
		new playername[MAX_PLAYER_NAME], str[128];
		GetPlayerName(playerid, playername, sizeof(playername));
		
		if(HasBelt[playerid] == 1)
		{
		    HasBelt[playerid] = 9999;
		    format(str, sizeof(str), "Odvezali ste pojas.");
		    SendClientMessage(playerid, -1, str);
		    format(str, sizeof(str), "%s odvezuje svoj pojas.", playername);
		    SendRadiusMessage(10.0, playerid, str, -1, -1, -1, -1, -1);
		}

	    if(HasHelmet[playerid] == 1)
		{
		    HasHelmet[playerid] = 9999;
		    RemovePlayerAttachedObject(playerid, 1);
		    format(str, sizeof(str), "Skinuli ste kacigu.");
		    SendClientMessage(playerid, -1, str);
		    format(str, sizeof(str), "%s skida kacigu.", playername);
		    SendRadiusMessage(10.0, playerid, str, -1, -1, -1, -1, -1);
		}
		
	    TextDrawHideForPlayer(playerid, FuelTD[playerid]);
	}
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
	if(newkeys == KEY_YES)
	{
		new VehicleID, playername[MAX_PLAYER_NAME], Float:VehicleHealth, str[128];
		
		if(!IsPlayerInAnyVehicle(playerid)) return 1;
		VehicleID = GetPlayerVehicleID(playerid);
		if(IsASalesVehicle(VehicleID)) return 1;
		if(IsARentVehicle(VehicleID) && (IsPlayerRentingVehicle[playerid] == 0 || RentedVehicle[playerid] != VehicleID)) return 1;
		if(VehicleEngine[VehicleID] == 1) return 1;

		GetVehicleHealth(VehicleID, VehicleHealth);
	    if(VehicleHealth <= 500.0) return SendClientMessage(playerid, -1, "GRESKA: Ne mozete upaliti motor vozila. Motor je ostecen!");
	    if(StartingVehicleEngine[playerid] == 1) return SendClientMessage(playerid, -1, "GRESKA: Vec pokusavate da upalite motor vozila!");
	    StartingVehicleEngine[playerid] = 1;
		TogglePlayerControllable(playerid, 0);
		SetTimerEx("StartVehicleEngine", 3500, false, "ii", playerid, VehicleID);
	    GameTextForPlayer(playerid, "~w~Pokretanje motora vozila...", 3500, 3);

	    GetPlayerName(playerid, playername, sizeof(playername));
    	format(str, sizeof(str), "%s okrece kljuc i pokusava da upali motor vozila.", playername);
    	SendRadiusMessage(50.0, playerid, str, -1, -1, -1, -1, -1);
	}
	
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
					
					printf("Sex je %d \n", PlayerInfo[playerid][Sex]);
					printf("Age je %d \n", PlayerInfo[playerid][Age]);
					printf("Country je %d \n", PlayerInfo[playerid][Country]);
					printf("City je %d \n", PlayerInfo[playerid][City]);
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


// ====================================================================================================== Commands
YCMD:avehicle(playerid, params[], help)
{
	#pragma unused help 
	
	new VehicleID, vehicle, color1, color2, Float:X, Float:Y, Float:Z;
	
	if(sscanf(params, "iii", vehicle, color1, color2))
	{
		return SendClientMessage(playerid, -1, "[KORISCENJE]: /avehicle [id_vozila] [boja1] [boja2]");
	}
	
	GetPlayerPos(playerid, X, Y, Z);
	VehicleID = CreateVehicle(vehicle, X+1, Y+1, Z, 270.0, color1, color2, -1);
	VehicleEngine[VehicleID] = 0;
	VehicleFuel[VehicleID] = 30;
	return 1;
}

/* YCMD:(playerid, params[], help)
{
	#pragma unused help
	
	
	
	return 1;
}*/

// Command that respawns all rent vehicles
// TO:DO - Check if player is admin
YCMD:respawnujrentvozila(playerid, params[], help)
{
	#pragma unused help
	
	for(new i = 0; i < MAX_VEHICLES; i++) 
	{
		if(!IsARentVehicle(i)) continue;
		
		new bool:PlayerInVehicle = false;
		for(new j = 0; j < MAX_PLAYERS; j++)
		{
			if(!IsPlayerConnected(j)) continue;
			if(!IsPlayerInVehicle(j, i)) continue;
			
			PlayerInVehicle = true;
		}
		
		if(!PlayerInVehicle) SetVehicleToRespawn(i);
	}
	
	return 1;
}

YCMD:iznajmivozilo(playerid, params[], help)
{
	#pragma unused help
	
	new VehicleID;
	
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "[GRESKA]: Niste u vozilu!");
	
	VehicleID = GetPlayerVehicleID(playerid);
	if(!IsARentVehicle(VehicleID)) return SendClientMessage(playerid, -1, "[GRESKA]: Niste u vozilu za iznajmljivanje!");
	//if(GetPlayerMoney(playerid) < 50) return SendClientMessage(playerid, -1 ,"[GRESKA]: Nemate dovoljno novca da iznajmite vozilo!");
	if(IsPlayerRentingVehicle[playerid]) return SendClientMessage(playerid, -1, "[GRESKA]: Vec ste iznajmili neko vozilo!");
	
	for(new i = 0; i < MAX_PLAYERS; i++) 
	{
		if(RentedVehicle[i] == VehicleID) return SendClientMessage(playerid, -1, "[GRESKA]: Neko je vec iznajmio ovo vozilo!");
	}
	
	IsPlayerRentingVehicle[playerid] = 1;
	RentedVehicle[playerid] = VehicleID;
   	TogglePlayerControllable(playerid, 1);
	
	SendClientMessage(playerid, -1, "Iznajmili ste vozilo. Da vratite vozilo kucajte: /vrativozilo");
	
	return 1;
}

YCMD:vrativozilo(playerid, params[], help)
{
	#pragma unused help

	new VehicleID = GetPlayerVehicleID(playerid);
	
	if(!IsPlayerRentingVehicle[playerid]) return SendClientMessage(playerid, -1, "[GRESKA]: Nemate iznajmljeno vozilo.");
	
	if(VehicleID == RentedVehicle[playerid]) TogglePlayerControllable(playerid, 1);
	SetVehicleToRespawn(RentedVehicle[playerid]);
	IsPlayerRentingVehicle[playerid] = 0;
	RentedVehicle[playerid] = 0;
	
	SendClientMessage(playerid, -1, "Vratili ste iznajmljeno vozilo.");
	
	return 1;
}

YCMD:motor(playerid, params[], help)
{
	#pragma unused help
	
	new playername[MAX_PLAYER_NAME], VehicleID, engine, lights, alarm, doors, bonnet, boot, objective, Float:VehicleHealth, str[128];
	
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "GRESKA: Niste u vozilu!");
	VehicleID = GetPlayerVehicleID(playerid);
	GetVehicleParamsEx(VehicleID, engine, lights, alarm, doors, bonnet, boot, objective);
	if(IsASalesVehicle(VehicleID)) return SendClientMessage(playerid, -1, "GRESKA: Ne mozete pokrenuti motor ovog vozila!");
	if(IsARentVehicle(VehicleID) && (IsPlayerRentingVehicle[playerid] == 0 || RentedVehicle[playerid] != VehicleID)) return SendClientMessage(playerid, -1, "GRESKA: Ne mozete pokrenuti motor ovog vozila!");
	if(VehicleFuel[VehicleID] == 0) return SendClientMessage(playerid, -1, "GRESKA: Rezervoar je prazan!");
	if(RefuellingVehicle[playerid] == 1) return SendClientMessage(playerid, -1, "GRESKA: Sipanje goriva u toku!");
	if(VehicleEngine[VehicleID] == 0)
	{
    	GetVehicleHealth(VehicleID, VehicleHealth);
	    if(VehicleHealth <= 500.0) return SendClientMessage(playerid, -1, "GRESKA: Ne mozete upaliti motor vozila. Motor je ostecen!");
	    if(StartingVehicleEngine[playerid] == 1) return SendClientMessage(playerid, -1, "GRESKA: Vec pokusavate da pokrenete motor vozila!");
	    StartingVehicleEngine[playerid] = 1;
    	TogglePlayerControllable(playerid, 0);
		SetTimerEx("StartVehicleEngine", 3500, false, "ii", playerid, VehicleID);
	    GameTextForPlayer(playerid, "~w~Pokretanje motora vozila...", 3500, 3);

	    GetPlayerName(playerid, playername, sizeof(playername));
    	format(str, sizeof(str), "%s okrece kljuc i pokusava da upali motor vozila.", playername);
    	SendRadiusMessage(50.0, playerid, str, -1, -1, -1, -1, -1);
	}
	else
	{
	    SetVehicleParamsEx(VehicleID, 0, 0, alarm, doors, bonnet, boot, objective);
    	VehicleEngine[VehicleID] = 0;

    	SendClientMessage(playerid, -1, "Ugasili ste motor vozila.");
		
    	GetPlayerName(playerid, playername, sizeof(playername));
    	format(str, sizeof(str), "%s gasi motor vozila.", playername);
    	SendRadiusMessage(50.0, playerid, str, -1, -1, -1, -1, -1);
 	}
    return 1;
}

YCMD:sipajgorivo(playerid, params[], help)
{
	#pragma unused help
	
	new VehicleID, litre, pump1, pump2, pump3;
	
	if(sscanf(params, "i", litre)) return SendClientMessage(playerid, -1, "KORISCENJE: /sipajgorivo [litara] (x5$)");
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "GRESKA: Niste u vozilu!");
	VehicleID = GetPlayerVehicleID(playerid);
	
	pump1 = IsPlayerNearPump1(playerid);
	pump2 = IsPlayerNearPump2(playerid);
	pump3 = IsPlayerNearPump3(playerid);
	
	if(pump1 != -1 && pump1 != 0)
	{
		if(VehicleEngine[VehicleID] == 1) return SendClientMessage(playerid, -1, "Morate prvo ugasiti motor! (/engine)");
		//if(GetPlayerMoney(playerid) < litre*5) return SendClientMessage(playerid, -1, "GRESKA: Nemate dovoljno novca da sipate gorivo! (litar 5$)");
		if(IsABike(VehicleID) && litre + VehicleFuel[VehicleID] > 30) return SendClientMessage(playerid, -1, "GRESKA: Ne mozete da sipate toliko goriva! (30l rezervoar)");
		else if(litre + VehicleFuel[VehicleID] > 60) return SendClientMessage(playerid, -1, "GRESKA: Ne mozete da sipate toliko goriva! (60l rezervoar)");
		
		TogglePlayerControllable(playerid, 0);
		GameTextForPlayer(playerid, "~w~PUNJENJE GORIVA...", 10000, 3);
		SetTimerEx("AntiFreezePlayer", litre, false, "i", playerid);
		RefuellingVehicle[playerid] = 1;
		RefillLitre[playerid] = litre;
	}
	else if(pump2 != -1 && pump2 != 0)
	{
		if(VehicleEngine[VehicleID] == 1) return SendClientMessage(playerid, -1, "Morate prvo ugasiti motor! (/engine)");
		//if(GetPlayerMoney(playerid) < litre*5) return SendClientMessage(playerid, -1, "GRESKA: Nemate dovoljno novca da sipate gorivo! (litar 5$)");
		if(IsABike(VehicleID) && litre + VehicleFuel[VehicleID] > 30) return SendClientMessage(playerid, -1, "GRESKA: Ne mozete da sipate toliko goriva! (30l rezervoar)");
		else if(litre + VehicleFuel[VehicleID] > 60) return SendClientMessage(playerid, -1, "GRESKA: Ne mozete da sipate toliko goriva! (60l rezervoar)");
		
		TogglePlayerControllable(playerid, 0);
		GameTextForPlayer(playerid, "~w~PUNJENJE GORIVA...", 10000, 3);
		SetTimerEx("AntiFreezePlayer", litre, false, "i", playerid);
		RefuellingVehicle[playerid] = 1;
		RefillLitre[playerid] = litre;
	}
	else if(pump3 != -1 && pump3 != 0)
	{
		if(VehicleEngine[VehicleID] == 1) return SendClientMessage(playerid, -1, "Morate prvo ugasiti motor! (/engine)");
		//if(GetPlayerMoney(playerid) < litre*5) return SendClientMessage(playerid, -1, "GRESKA: Nemate dovoljno novca da sipate gorivo! (litar 5$)");
		if(IsABike(VehicleID) && litre + VehicleFuel[VehicleID] > 30) return SendClientMessage(playerid, -1, "GRESKA: Ne mozete da sipate toliko goriva! (30l rezervoar)");
		else if(litre + VehicleFuel[VehicleID] > 60) return SendClientMessage(playerid, -1, "GRESKA: Ne mozete da sipate toliko goriva! (60l rezervoar)");
		
		TogglePlayerControllable(playerid, 0);
		GameTextForPlayer(playerid, "~w~PUNJENJE GORIVA...", 10000, 3);
		SetTimerEx("AntiFreezePlayer", litre, false, "i", playerid);
		RefuellingVehicle[playerid] = 1;
		RefillLitre[playerid] = litre;
	}
	else return SendClientMessage(playerid, -1, "GRESKA: Niste na pump!");
	return 1;
}

YCMD:pojas(playerid, params[], help)
{
	#pragma unused help
	
 	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "GRESKA: Niste u vozilu!");
	new str[128], VehicleID = GetPlayerVehicleID(playerid), playername[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playername, sizeof(playername));
	if(IsABike(VehicleID)) return SendClientMessage(playerid, -1, "GRESKA: Na motoru ste, koristite kacigu! (/kaciga)");
	if(HasBelt[playerid] == 0)
	{
	    HasBelt[playerid] = 1;

	    format(str, sizeof(str), "Vezali ste pojas.");
	    SendClientMessage(playerid, -1, str);

	    format(str, sizeof(str), "%s vezuje svoj pojas.", playername);
	    SendRadiusMessage(10.0, playerid, str, -1, -1, -1, -1, -1);
	}
	else
	{
	    HasBelt[playerid] = 0;

	    format(str, sizeof(str), "Odvezali ste pojas.");
	    SendClientMessage(playerid, -1, str);

	    format(str, sizeof(str), "%s odvezuje svoj pojas.", playername);
	    SendRadiusMessage(10.0, playerid, str, -1, -1, -1, -1, -1);
	}
	return 1;
}

YCMD:kaciga(playerid, params[], help)
{
	#pragma unused help
	
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "GRESKA: Niste u vozilu!");
	new str[128], VehicleID = GetPlayerVehicleID(playerid), playername[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playername, sizeof(playername));
	if(!IsABike(VehicleID)) return SendClientMessage(playerid, -1, "GRESKA: Niste na motoru, vezite pojas! (/pojas)");
	if(HasHelmet[playerid] == 0)
	{
	    HasHelmet[playerid] = 1;
	    SetPlayerAttachedObject(playerid, 1, 18645, 2, 0.086220, 0.028146, 0.000000, 91.219810, 85.847640, 0.000000, 1.000000, 1.000000, 1.000000 );

	   	format(str, sizeof(str), "Stavili ste kacigu.");
	    SendClientMessage(playerid, -1, str);

	    format(str, sizeof(str), "%s stavlja kacigu na glavu.", playername);
	    SendRadiusMessage(10.0, playerid, str, -1, -1, -1, -1, -1);
	}
	else
	{
	    HasHelmet[playerid] = 0;
	    RemovePlayerAttachedObject(playerid, 1);

 		format(str, sizeof(str), "Skinuli ste kacigu.");
	    SendClientMessage(playerid, -1, str);

	    format(str, sizeof(str), "%s skida kacigu.", playername);
	    SendRadiusMessage(10.0, playerid, str, -1, -1, -1, -1, -1);
	}
	return 1;
}

// Timers
task TimerPerSec[1000]() 
{
	new str[128];
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(!IsPlayerConnected(i)) return 1;
		
		//FUEL
		for(new v = 0; v < MAX_VEHICLES; v++)
		{
			if(IsPlayerInVehicle(i, v))
			{
				format(str, sizeof(str), "Gorivo: %i", VehicleFuel[v]);
				TextDrawSetString(FuelTD[i], str);
				TextDrawShowForPlayer(i, FuelTD[i]);
			}
		}
	}
	
	return 1;
}