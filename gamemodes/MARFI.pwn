#include <a_samp>
#include <a_mysql>
#include <sscanf2>
#include <streamer>
#include <YSI\y_commands>
#include <YSI\y_timers>
#include <bcrypt>

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

// BCrypt
#define BCRYPT_COST 12

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
// Message Colors
#define TEXT_COLOR_GREY 												"{AFAFAF}"
// Message System Defined Colors
#define TEXT_COLOR_ACTIVEBORDER 										"{B4B4B4}"
#define TEXT_COLOR_ACTIVECAPTION 										"{99B4D1}"
#define TEXT_COLOR_ACTIVECAPTIONTEXT 									"{000000}"
#define TEXT_COLOR_ALICEBLUE 											"{F0F8FF}"
#define TEXT_COLOR_ANTIQUEWHITE 										"{FAEBD7}"
#define TEXT_COLOR_APPWORKSPACE 										"{ABABAB}"
#define TEXT_COLOR_AQUA 												"{00FFFF}"
#define TEXT_COLOR_AQUAMARINE 											"{7FFFD4}"
#define TEXT_COLOR_AZURE 												"{F0FFFF}"
#define TEXT_COLOR_BEIGE 												"{F5F5DC}"
#define TEXT_COLOR_BISQUE 												"{FFE4C4}"
#define TEXT_COLOR_BLACK 												"{000000}"
#define TEXT_COLOR_BLANCHEDALMOND 										"{FFEBCD}"
#define TEXT_COLOR_BLUE 												"{0000FF}"
#define TEXT_COLOR_BLUEVIOLET 											"{8A2BE2}"
#define TEXT_COLOR_BROWN 												"{A52A2A}"
#define TEXT_COLOR_BURLYWOOD 											"{DEB887}"
#define TEXT_COLOR_BUTTONFACE 											"{F0F0F0}"
#define TEXT_COLOR_BUTTONHIGHLIGHT 										"{FFFFFF}"
#define TEXT_COLOR_BUTTONSHADOW 										"{A0A0A0}"
#define TEXT_COLOR_CADETBLUE 											"{5F9EA0}"
#define TEXT_COLOR_CHARTREUSE 											"{7FFF00}"
#define TEXT_COLOR_CHOCOLATE 											"{D2691E}"
#define TEXT_COLOR_CONTROL 												"{F0F0F0}"
#define TEXT_COLOR_CONTROLDARK 											"{A0A0A0}"
#define TEXT_COLOR_CONTROLDARKDARK 										"{696969}"
#define TEXT_COLOR_CONTROLLIGHT 										"{E3E3E3}"
#define TEXT_COLOR_CONTROLLIGHTLIGHT 									"{FFFFFF}"
#define TEXT_COLOR_CONTROLTEXT 											"{000000}"
#define TEXT_COLOR_CORAL 												"{FF7F50}"
#define TEXT_COLOR_CORNFLOWERBLUE 										"{6495ED}"
#define TEXT_COLOR_CORNSILK 											"{FFF8DC}"
#define TEXT_COLOR_CRIMSON 												"{DC143C}"
#define TEXT_COLOR_CYAN 												"{00FFFF}"
#define TEXT_COLOR_DARKBLUE 											"{00008B}"
#define TEXT_COLOR_DARKCYAN 											"{008B8B}"
#define TEXT_COLOR_DARKGOLDENROD 										"{B8860B}"
#define TEXT_COLOR_DARKGRAY 											"{A9A9A9}"
#define TEXT_COLOR_DARKGREEN 											"{006400}"
#define TEXT_COLOR_DARKKHAKI 											"{BDB76B}"
#define TEXT_COLOR_DARKMAGENTA 											"{8B008B}"
#define TEXT_COLOR_DARKOLIVEGREEN 										"{556B2F}"
#define TEXT_COLOR_DARKORANGE 											"{FF8C00}"
#define TEXT_COLOR_DARKORCHID 											"{9932CC}"
#define TEXT_COLOR_DARKRED 												"{8B0000}"
#define TEXT_COLOR_DARKSALMON 											"{E9967A}"
#define TEXT_COLOR_DARKSEAGREEN 										"{8FBC8B}"
#define TEXT_COLOR_DARKSLATEBLUE 										"{483D8B}"
#define TEXT_COLOR_DARKSLATEGRAY 										"{2F4F4F}"
#define TEXT_COLOR_DARKTURQUOISE 										"{00CED1}"
#define TEXT_COLOR_DARKVIOLET 											"{9400D3}"
#define TEXT_COLOR_DEEPPINK 											"{FF1493}"
#define TEXT_COLOR_DEEPSKYBLUE 											"{00BFFF}"
#define TEXT_COLOR_DESKTOP 												"{000000}"
#define TEXT_COLOR_DIMGRAY 												"{696969}"
#define TEXT_COLOR_DODGERBLUE 											"{1E90FF}"
#define TEXT_COLOR_FIREBRICK 											"{B22222}"
#define TEXT_COLOR_FLORALWHITE 											"{FFFAF0}"
#define TEXT_COLOR_FORESTGREEN 											"{228B22}"
#define TEXT_COLOR_FUCHSIA 												"{FF00FF}"
#define TEXT_COLOR_GAINSBORO 											"{DCDCDC}"
#define TEXT_COLOR_GHOSTWHITE 											"{F8F8FF}"
#define TEXT_COLOR_GOLD 												"{FFD700}"
#define TEXT_COLOR_GOLDENROD 											"{DAA520}"
#define TEXT_COLOR_GRADIENTACTIVECAPTION 								"{B9D1EA}"
#define TEXT_COLOR_GRADIENTINACTIVECAPTION 								"{D7E4F2}"
#define TEXT_COLOR_GRAY 												"{808080}"
#define TEXT_COLOR_GRAYTEXT 											"{808080}"
#define TEXT_COLOR_GREEN 												"{008000}"
#define TEXT_COLOR_GREENYELLOW 											"{ADFF2F}"
#define TEXT_COLOR_HIGHLIGHT 											"{3399FF}"
#define TEXT_COLOR_HIGHLIGHTTEXT 										"{FFFFFF}"
#define TEXT_COLOR_HONEYDEW 											"{F0FFF0}"
#define TEXT_COLOR_HOTPINK 												"{FF69B4}"
#define TEXT_COLOR_HOTTRACK 											"{0066CC}"
#define TEXT_COLOR_INACTIVEBORDER 										"{F4F7FC}"
#define TEXT_COLOR_INACTIVECAPTION 										"{BFCDDB}"
#define TEXT_COLOR_INACTIVECAPTIONTEXT 									"{434E54}"
#define TEXT_COLOR_INDIANRED	 										"{CD5C5C}"
#define TEXT_COLOR_INDIGO 												"{4B0082}"
#define TEXT_COLOR_INFO 												"{FFFFE1}"
#define TEXT_COLOR_INFOTEXT 											"{000000}"
#define TEXT_COLOR_IVORY 												"{FFFFF0}"
#define TEXT_COLOR_KHAKI 												"{F0E68C}"
#define TEXT_COLOR_LAVENDER 											"{E6E6FA}"
#define TEXT_COLOR_LAVENDERBLUSH 										"{FFF0F5}"
#define TEXT_COLOR_LAWNGREEN 											"{7CFC00}"
#define TEXT_COLOR_LEMONCHIFFON 										"{FFFACD}"
#define TEXT_COLOR_LIGHTBLUE 											"{ADD8E6}"
#define TEXT_COLOR_LIGHTCORAL 											"{F08080}"
#define TEXT_COLOR_LIGHTCYAN 											"{E0FFFF}"
#define TEXT_COLOR_LIGHTGOLDENRODYELLOW 								"{FAFAD2}"
#define TEXT_COLOR_LIGHTGRAY  											"{D3D3D3}"
#define TEXT_COLOR_LIGHTGREEN  											"{90EE90}"
#define TEXT_COLOR_LIGHTPINK  											"{FFB6C1}"
#define TEXT_COLOR_LIGHTSALMON  										"{FFA07A}"
#define TEXT_COLOR_LIGHTSEAGREEN  										"{20B2AA}"
#define TEXT_COLOR_LIGHTSKYBLUE  										"{87CEFA}"
#define TEXT_COLOR_LIGHTSLATEGRAY  										"{778899}"
#define TEXT_COLOR_LIGHTSTEELBLUE  										"{B0C4DE}"
#define TEXT_COLOR_LIGHTYELLOW  										"{FFFFE0}"
#define TEXT_COLOR_LIME  												"{00FF00}"
#define TEXT_COLOR_LIMEGREEN  											"{32CD32}"
#define TEXT_COLOR_LINEN  												"{FAF0E6}"
#define TEXT_COLOR_MAGENTA  											"{FF00FF}"
#define TEXT_COLOR_MAROON  												"{800000}"
#define TEXT_COLOR_MEDIUMAQUAMARINE  									"{66CDAA}"
#define TEXT_COLOR_MEDIUMBLUE  											"{0000CD}"
#define TEXT_COLOR_MEDIUMORCHID  										"{BA55D3}"
#define TEXT_COLOR_MEDIUMPURPLE  										"{9370DB}"
#define TEXT_COLOR_MEDIUMSEAGREEN  										"{3CB371}"
#define TEXT_COLOR_MEDIUMSLATEBLUE  									"{7B68EE}"
#define TEXT_COLOR_MEDIUMSPRINGGREEN  									"{00FA9A}"
#define TEXT_COLOR_MEDIUMTURQUOISE  									"{48D1CC}"
#define TEXT_COLOR_MEDIUMVIOLETRED  									"{C71585}"
#define TEXT_COLOR_MENU  												"{F0F0F0}"
#define TEXT_COLOR_MENUBAR  											"{F0F0F0}"
#define TEXT_COLOR_MENUHIGHLIGHT  										"{3399FF}"
#define TEXT_COLOR_MENUTEXT  											"{000000}"
#define TEXT_COLOR_MIDNIGHTBLUE  										"{191970}"
#define TEXT_COLOR_MINTCREAM  											"{F5FFFA}"
#define TEXT_COLOR_MISTYROSE  											"{FFE4E1}"
#define TEXT_COLOR_MOCCASIN  											"{FFE4B5}"
#define TEXT_COLOR_NAVAJOWHITE  										"{FFDEAD}"
#define TEXT_COLOR_NAVY  												"{000080}"
#define TEXT_COLOR_OLDLACE  											"{FDF5E6}"
#define TEXT_COLOR_OLIVE  												"{808000}"
#define TEXT_COLOR_OLIVEDRAB  											"{6B8E23}"
#define TEXT_COLOR_ORANGE  												"{FFA500}"
#define TEXT_COLOR_ORANGERED  											"{FF4500}"
#define TEXT_COLOR_ORCHID  												"{DA70D6}"
#define TEXT_COLOR_PALEGOLDENROD  										"{EEE8AA}"
#define TEXT_COLOR_PALEGREEN  											"{98FB98}"
#define TEXT_COLOR_PALETURQUOISE  										"{AFEEEE}"
#define TEXT_COLOR_PALEVIOLETRED  										"{DB7093}"
#define TEXT_COLOR_PAPAYAWHIP  											"{FFEFD5}"
#define TEXT_COLOR_PEACHPUFF  											"{FFDAB9}"
#define TEXT_COLOR_PERU  												"{CD853F}"
#define TEXT_COLOR_PINK  												"{FFC0CB}"
#define TEXT_COLOR_PLUM  												"{DDA0DD}"
#define TEXT_COLOR_POWDERBLUE  											"{B0E0E6}"
#define TEXT_COLOR_PURPLE  												"{800080}"
#define TEXT_COLOR_RED  												"{FF0000}"
#define TEXT_COLOR_ROSYBROWN  											"{BC8F8F}"
#define TEXT_COLOR_ROYALBLUE  											"{4169E1}"
#define TEXT_COLOR_SADDLEBROWN  										"{8B4513}"
#define TEXT_COLOR_SALMON  												"{FA8072}"
#define TEXT_COLOR_SANDYBROWN  											"{F4A460}"
#define TEXT_COLOR_SCROLLBAR  											"{C8C8C8}"
#define TEXT_COLOR_SEAGREEN  											"{2E8B57}"
#define TEXT_COLOR_SEASHELL  											"{FFF5EE}"
#define TEXT_COLOR_SIENNA  												"{A0522D}"
#define TEXT_COLOR_SILVER  												"{C0C0C0}"
#define TEXT_COLOR_SKYBLUE  											"{87CEEB}"
#define TEXT_COLOR_SLATEBLUE  											"{6A5ACD}"
#define TEXT_COLOR_SLATEGRAY  											"{708090}"
#define TEXT_COLOR_SNOW  												"{FFFAFA}"
#define TEXT_COLOR_SPRINGGREEN  										"{00FF7F}"
#define TEXT_COLOR_STEELBLUE  											"{4682B4}"
#define TEXT_COLOR_TAN  												"{D2B48C}"
#define TEXT_COLOR_TEAL  												"{008080}"
#define TEXT_COLOR_THISTLE  											"{D8BFD8}"
#define TEXT_COLOR_TOMATO  												"{FF6347}"
#define TEXT_COLOR_TRANSPARENT  										"{FFFFFF}"
#define TEXT_COLOR_TURQUOISE  											"{40E0D0}"
#define TEXT_COLOR_VIOLET  												"{EE82EE}"
#define TEXT_COLOR_WHEAT  												"{F5DEB3}"
#define TEXT_COLOR_WHITE  												"{FFFFFF}"
#define TEXT_COLOR_WHITESMOKE  											"{F5F5F5}"
#define TEXT_COLOR_WINDOW  												"{FFFFFF}"
#define TEXT_COLOR_WINDOWFRAME  										"{646464}"
#define TEXT_COLOR_WINDOWTEXT  											"{000000}"
#define TEXT_COLOR_YELLOW  												"{FFFF00}"
#define TEXT_COLOR_YELLOWGREEN  										"{9ACD32}"
#define TEXT_STEALTH_ORANGE  											"{FF8800}"
#define TEXT_STEALTH_OLIVE  											"{666600}"
#define TEXT_STEALTH_GREEN  											"{33DD11}"
#define TEXT_STEALTH_PINK  												"{FF22EE}"
#define TEXT_STEALTH_BLUE  												"{0077BB}"
// ====================================================================================================== Forwards
forward CheckPlayerData(playerid);
forward OnPlayerDataChecked(playerid);
forward SavePlayerData(playerid);
forward OnSavePlayerData(playerid);
forward OnPlayerRegister(playerid);
forward OnAccountLoad(playerid);
forward OnPasswordHashed(playerid);
forward OnPasswordChecked(playerid);

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
forward OnVehiclesLoaded();
forward InsertVehicle(vehicleOwner, vehicleModel);
forward SaveVehicle(vehicleid);
forward SetVehicleComponents(vehicleid);
forward RemoveVehicleComponents(vehicleid);
forward SaveVehicleComponents(vehicleid);
forward GetVehicleName(vehicleid, model[], len);

forward LoadVehiclesFuel();
forward StartVehicleEngine(playerid, vehicleid);
forward CheckVehicleFuel();
// ====================================================================================================== Variables
new MySQL:mysql;

// Server counters
new GlobalVehiclesCounter = 1;
new OwnedVehiclesCounter = 0;
// Textdraws
new Text:FuelTD[MAX_PLAYERS];

// Players TABLE
enum PlayerData
{
	ID, // ID in the Table of Players
	Name[MAX_PLAYER_NAME], // Name of the player
	Password[65], // Encrypted password
	Gender, // Gender of the player (male | female)
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
	Side_skirt, // Addons - sideskirt
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
new rent_vehicles[24];
new sale_vehicles[89];
new owned_vehicles[sizeof(VehicleInfo)];

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

stock GetPlayerGender(playerid)
{
    new gender[8];
	
    switch(PlayerInfo[playerid][Gender])
    {
        case 0: gender = "Musko";
        case 1: gender = "Zensko";
		default: gender = "/";
    }
	
    return gender;
}

stock GetPlayerCountry(playerid)
{
    new country[32];
	
    switch(PlayerInfo[playerid][Country])
    {
        case 0: country = "Srbija";
        case 1: country = "Crna Gora";
        case 2: country = "Bosna i Hercegovina";
        case 3: country = "Makedonija";
        case 4: country = "Hrvatska";
        case 5: country = "Ostalo";
		default: country = "/";
    }
	
    return country;
}

stock GetPlayerCity(playerid)
{
    new city[16];
	
    switch(PlayerInfo[playerid][City])
    {
        case 0: city = "Los Santos";
        case 1: city = "Las Venturas";
        case 2: city = "San Fierro";
		default: city = "/";
    }
	
    return city;
}

public CheckPlayerData(playerid)
{
	new query[128], player_name[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, player_name, sizeof(player_name));
	mysql_format(mysql, query, sizeof(query), "SELECT * FROM Users WHERE name = '%e' LIMIT 1", player_name);
	mysql_tquery(mysql, query, "OnPlayerDataChecked", "i", playerid);
	
	return 1;
}

public OnPlayerDataChecked(playerid)
{
	new message[256], player_name[MAX_PLAYER_NAME], player_password[65], player_age, player_sex[8], player_country[32], player_city[16];
	
	GetPlayerName(playerid, player_name, sizeof(player_name));
	
	// Check if result has atleast one row, that means player has an account, show him dialog for login
	if(cache_num_rows() > 0)
	{
		cache_get_value_name_int(0, "id", PlayerInfo[playerid][ID]);
		cache_get_value_name(0, "password_digest", player_password, 65);
		cache_get_value_name_int(0, "gender", PlayerInfo[playerid][Gender]);
		cache_get_value_name_int(0, "age", PlayerInfo[playerid][Age]);
		cache_get_value_name_int(0, "country", PlayerInfo[playerid][Country]);
		cache_get_value_name_int(0, "city", PlayerInfo[playerid][City]);
		cache_get_value_name_float(0, "spawnX", PlayerInfo[playerid][SpawnX]);
		cache_get_value_name_float(0, "spawnY", PlayerInfo[playerid][SpawnY]);
		cache_get_value_name_float(0, "spawnZ", PlayerInfo[playerid][SpawnZ]);
		
		PlayerInfo[playerid][Password] = player_password;
		player_age = PlayerInfo[playerid][Age];
		player_sex = GetPlayerGender(playerid);
		player_country = GetPlayerCountry(playerid);
		player_city = GetPlayerCity(playerid);
		
		format(message, sizeof(message), ""TEXT_COLOR_WHITE"Dobrodosli, Vas nalog je pronadjen. \n"TEXT_COLOR_RED"Ime_Prezime: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Pol: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Godina: "TEXT_COLOR_WHITE"%d \n"TEXT_COLOR_RED"Drzava: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Grad: "TEXT_COLOR_WHITE"%s \nUnesite Vasu lozinku da se prijavite", player_name, player_sex, player_age, player_country, player_city);
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, ""TEXT_COLOR_RED"Login", message, "Dalje", "Izlaz");
	}
	// Otherwise, player is not registered, show him dialog for registration
	else
	{
		format(message, sizeof(message), ""TEXT_COLOR_WHITE"Dobrodosli, Vas nalog nije pronadjen. \nUnesite zeljenu lozinku da se registrujete.");
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, ""TEXT_COLOR_RED"Registracija", message, "Dalje", "Izlaz");
	}
	
	return 1;
}

public SavePlayerData(playerid)
{
	return 1;
}

public OnSavePlayerData(playerid)
{
	return 1;
}

public OnPasswordHashed(playerid)
{
	new query[256], playername[MAX_PLAYER_NAME];
	
    bcrypt_get_hash(PlayerInfo[playerid][Password]);
	PlayerInfo[playerid][Password][2] = 'a'; // Hardcode -> $2a instead of $2y | BCrypt in rails cannot provide $2y
	
	GetPlayerName(playerid, playername, sizeof(playername));
	
	mysql_format(mysql, query, sizeof(query), "INSERT INTO Users SET \
												name = '%e', \
												password_digest = '%e'", playername, PlayerInfo[playerid][Password]);
	mysql_tquery(mysql, query, "OnPlayerRegister", "i", playerid);
	
	ShowPlayerDialog(playerid, DIALOG_SEX, DIALOG_STYLE_LIST, ""TEXT_COLOR_RED"Registracija - Pol", ""TEXT_COLOR_WHITE"Musko\nZensko", "U redu", "Izadji");
}

public OnPasswordChecked(playerid)
{
	new bool:match, message[256], player_name[MAX_PLAYER_NAME], player_age, player_sex[8], player_country[32], player_city[16];
	match = bcrypt_is_equal();
	
	if(match)
	{
		GetPlayerName(playerid, player_name, sizeof(player_name));
		
		// If player didnt pick Gender, show him dialog
		if(PlayerInfo[playerid][Gender] == 9999)
		{
			ShowPlayerDialog(playerid, DIALOG_SEX, DIALOG_STYLE_LIST, ""TEXT_COLOR_RED"Registracija - Pol", ""TEXT_COLOR_WHITE"Musko\nZensko", "U redu", "Izadji");
		}
		// If player didnt pick Age, show him dialog
		else if(PlayerInfo[playerid][Age] == 9999)
		{
			format(message, sizeof(message), ""TEXT_COLOR_WHITE"Unesite koliko imate godina");
			ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, ""TEXT_COLOR_RED"Registracija - Godine", message, "U redu", "Izadji");
		}
		// If player didnt pick Country, show him dialog
		else if(PlayerInfo[playerid][Country] == 9999)
		{
			ShowPlayerDialog(playerid, DIALOG_COUNTRY, DIALOG_STYLE_LIST, ""TEXT_COLOR_RED"Registracija - Drzava", ""TEXT_COLOR_WHITE"Srbija\nCrna Gora\nBosna i Hercegovina\nHrvatska\nMakedonija\nOstalo", "U redu", "Izadji");
		}
		// If player didnt picky City, show him dialog
		else if(PlayerInfo[playerid][City] == 9999)
		{
			ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, ""TEXT_COLOR_RED"Registracija - Grad", ""TEXT_COLOR_WHITE"Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
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
		player_age = PlayerInfo[playerid][Age];
		player_sex = GetPlayerGender(playerid);
		player_country = GetPlayerCountry(playerid);
		player_city = GetPlayerCity(playerid);
		
		format(message, sizeof(message), ""TEXT_COLOR_WHITE"Lozinka koju ste uneli nije ispravna. \n"TEXT_COLOR_RED"Ime_Prezime: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Pol: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Godina: "TEXT_COLOR_WHITE"%d \n"TEXT_COLOR_RED"Drzava: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Grad: "TEXT_COLOR_WHITE"%s \nPokusajte ponovo. \nUnesite Vasu lozinku da se prijavite", player_name, player_sex, player_age, player_country, player_city);
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, ""TEXT_COLOR_RED"Login", message, "Dalje", "Izlaz");
	}
}

public LoadVehicles()
{
	new query[256];
	
	mysql_format(mysql, query, sizeof(query), "SELECT * FROM Vehicles");
	mysql_tquery(mysql, query, "OnVehiclesLoaded");
	
	return 0;
}

public OnVehiclesLoaded()
{
	if(cache_num_rows() > 0)
	{
		for(new i = 0; i < cache_num_rows(); i++)
		{
			cache_get_value_name_int(i, "id", VehicleInfo[GlobalVehiclesCounter][ID]);
			cache_get_value_name_int(i, "owned", VehicleInfo[GlobalVehiclesCounter][Owned]);
			cache_get_value_name_int(i, "user_id", VehicleInfo[GlobalVehiclesCounter][Owner]);
			cache_get_value_name_int(i, "model", VehicleInfo[GlobalVehiclesCounter][Model]);
			cache_get_value_name_float(i, "parkX", VehicleInfo[GlobalVehiclesCounter][ParkX]);
			cache_get_value_name_float(i, "parkY", VehicleInfo[GlobalVehiclesCounter][ParkY]);
			cache_get_value_name_float(i, "parkZ", VehicleInfo[GlobalVehiclesCounter][ParkZ]);
			cache_get_value_name_float(i, "parkA", VehicleInfo[GlobalVehiclesCounter][ParkA]);
			cache_get_value_name_int(i, "color1", VehicleInfo[GlobalVehiclesCounter][Color1]);
			cache_get_value_name_int(i, "color2", VehicleInfo[GlobalVehiclesCounter][Color2]);
			cache_get_value_name_int(i, "paintjob", VehicleInfo[GlobalVehiclesCounter][Paintjob]);
			cache_get_value_name_int(i, "locked", VehicleInfo[GlobalVehiclesCounter][Locked]);
			cache_get_value_name_int(i, "registration", VehicleInfo[GlobalVehiclesCounter][Registration]);
			cache_get_value_name_int(i, "spoiler", VehicleInfo[GlobalVehiclesCounter][Spoiler]);
			cache_get_value_name_int(i, "hood", VehicleInfo[GlobalVehiclesCounter][Hood]);
			cache_get_value_name_int(i, "roof", VehicleInfo[GlobalVehiclesCounter][Roof]);
			cache_get_value_name_int(i, "side_skirt", VehicleInfo[GlobalVehiclesCounter][Side_skirt]);
			cache_get_value_name_int(i, "lamps", VehicleInfo[GlobalVehiclesCounter][Lamps]);
			cache_get_value_name_int(i, "nitro", VehicleInfo[GlobalVehiclesCounter][Nitro]);
			cache_get_value_name_int(i, "exhaust", VehicleInfo[GlobalVehiclesCounter][Exhaust]);
			cache_get_value_name_int(i, "wheels", VehicleInfo[GlobalVehiclesCounter][Wheels]);
			cache_get_value_name_int(i, "stereo", VehicleInfo[GlobalVehiclesCounter][Stereo]);
			cache_get_value_name_int(i, "hydraulics", VehicleInfo[GlobalVehiclesCounter][Hydraulics]);
			cache_get_value_name_int(i, "front_bumper", VehicleInfo[GlobalVehiclesCounter][Front_bumper]);
			cache_get_value_name_int(i, "rear_bumper", VehicleInfo[GlobalVehiclesCounter][Rear_bumper]);
			cache_get_value_name_int(i, "vent_right", VehicleInfo[GlobalVehiclesCounter][Vent_right]);
			cache_get_value_name_int(i, "vent_left", VehicleInfo[GlobalVehiclesCounter][Vent_left]);
			
			if(VehicleInfo[GlobalVehiclesCounter][Owned] == 1)
			{
				owned_vehicles[OwnedVehiclesCounter] = CreateVehicle(VehicleInfo[GlobalVehiclesCounter][Model], VehicleInfo[GlobalVehiclesCounter][ParkX], VehicleInfo[GlobalVehiclesCounter][ParkY], VehicleInfo[GlobalVehiclesCounter][ParkZ], VehicleInfo[GlobalVehiclesCounter][ParkA], VehicleInfo[GlobalVehiclesCounter][Color1], VehicleInfo[GlobalVehiclesCounter][Color2], 0);
				SetVehicleComponents(GlobalVehiclesCounter);
				OwnedVehiclesCounter++;
				GlobalVehiclesCounter++;		
			}			
		}
	}
	
	LoadVehiclesFuel();
}

public LoadVehiclesFuel()
{
	for(new i = 0; i < GlobalVehiclesCounter; i++)
	{
	    if(IsABike(i)) VehicleFuel[i] = 30;
	    else VehicleFuel[i] = 60;
	}
}

public InsertVehicle(vehicleOwner, vehicleModel) 
{
	new query[512];
	
	mysql_format(mysql, query, sizeof(query), "INSERT INTO Vehicles SET \
													owned = 1, \
													user_id = %d, \
													model = %d, \
													parkX = 1590.59, \
													parkY = -2319.39, \
													parkZ = 13.3828, \
													parkA = 80, \
													color1 = 0, \
													color2 = 0, \
													paintjob = 0, \
													locked = 0, \
													registration = 0, \
													spoiler = 0, \
													hood = 0, \
													roof = 0, \
													side_skirt = 0, \
													lamps = 0, \
													nitro = 0, \
													exhaust = 0, \
													wheels = 0, \
													stereo = 0, \
													hydraulics = 0, \
													front_bumper= 0, \
													rear_bumper = 0, \
													vent_right = 0, \
													vent_left = 0",
													vehicleOwner,
													vehicleModel);
	mysql_tquery(mysql, query);
}

public SaveVehicle(vehicleid)
{
	new query[512];
	
	mysql_format(mysql, query, sizeof(query), "UPDATE Vehicles \
												SET owned = %d, \
													user_id = %d, \
													parkX = %f, \
													parkY = %f, \
													parkZ = %f, \
													parkA = %f, \
													color1 = %d, \
													color2 = %d, \
													paintjob = %d, \
													locked = %d, \
													registration = %d, \
													spoiler = %d, \
													hood = %d, \
													roof = %d, \
													side_skirt = %d, \
													lamps = %d, \
													nitro = %d, \
													exhaust = %d, \
													wheels = %d, \
													stereo = %d, \
													hydraulics = %d, \
													front_bumper= %d, \
													rear_bumper = %d, \
													vent_right = %d, \
													vent_left = %d \												
												WHERE id = %d",
												VehicleInfo[vehicleid][Owned],
												VehicleInfo[vehicleid][Owner],												
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
												VehicleInfo[vehicleid][Side_skirt],
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
	mysql_pquery(mysql, query);

	return 1;
}

public SaveVehicleComponents(vehicleid)
{
	new spoiler, hood, roof, side_skirt, lamps, nitro, exhaust, wheels, stereo, hydraulics, front_bumper, rear_bumper, left_vent, right_vent;
	
	spoiler = GetVehicleComponentInSlot(vehicleid, 0);
	hood = GetVehicleComponentInSlot(vehicleid, 1);
	roof = GetVehicleComponentInSlot(vehicleid, 2);
	side_skirt = GetVehicleComponentInSlot(vehicleid, 3);
	lamps = GetVehicleComponentInSlot(vehicleid, 4);
	nitro = GetVehicleComponentInSlot(vehicleid, 5);
	exhaust = GetVehicleComponentInSlot(vehicleid, 6);
	wheels = GetVehicleComponentInSlot(vehicleid, 7);
	stereo = GetVehicleComponentInSlot(vehicleid, 8);
	hydraulics = GetVehicleComponentInSlot(vehicleid, 9);
	front_bumper = GetVehicleComponentInSlot(vehicleid, 10);
	rear_bumper = GetVehicleComponentInSlot(vehicleid, 11);
	right_vent = GetVehicleComponentInSlot(vehicleid, 12);
	left_vent = GetVehicleComponentInSlot(vehicleid, 13);

	if(spoiler != 0) { VehicleInfo[vehicleid][Spoiler] = spoiler; }
	if(hood != 0) { VehicleInfo[vehicleid][Hood] = hood; }
	if(roof != 0) { VehicleInfo[vehicleid][Roof] = roof; }
	if(side_skirt != 0) { VehicleInfo[vehicleid][Side_skirt] = side_skirt; }
	if(lamps != 0) { VehicleInfo[vehicleid][Lamps] = lamps; }
	if(nitro != 0) { VehicleInfo[vehicleid][Nitro] = nitro; }
	if(exhaust != 0) { VehicleInfo[vehicleid][Exhaust] = exhaust; }
	if(wheels != 0) { VehicleInfo[vehicleid][Wheels] = wheels; }
	if(stereo != 0) { VehicleInfo[vehicleid][Stereo] = stereo; }
	if(hydraulics != 0) { VehicleInfo[vehicleid][Hydraulics] = hydraulics; }
	if(front_bumper != 0) { VehicleInfo[vehicleid][Front_bumper] = front_bumper; }
	if(rear_bumper != 0) { VehicleInfo[vehicleid][Rear_bumper] = rear_bumper; }
	if(right_vent != 0) { VehicleInfo[vehicleid][Vent_right] = right_vent; }
	if(left_vent != 0) { VehicleInfo[vehicleid][Vent_left] = left_vent; }
	
	SaveVehicle(vehicleid);
	
	return 1;
}

public SetVehicleComponents(vehicleid)
{
	if(VehicleInfo[vehicleid][Spoiler] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Spoiler]); }
	if(VehicleInfo[vehicleid][Hood] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Hood]); }
	if(VehicleInfo[vehicleid][Roof] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Roof]); }
	if(VehicleInfo[vehicleid][Side_skirt] >= 0) { AddVehicleComponent(vehicleid, VehicleInfo[vehicleid][Side_skirt]); }
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
	
	return 1;
}

public RemoveVehicleComponents(vehicleid)
{
    VehicleInfo[vehicleid][Spoiler] = 0;
    VehicleInfo[vehicleid][Hood] = 0;
    VehicleInfo[vehicleid][Roof] = 0;
    VehicleInfo[vehicleid][Side_skirt] = 0;
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
	return 1;
}

public GetVehicleName(vehicleid, model[], len)
{
	new model_id = GetVehicleModel(vehicleid);
	if(model_id == 400) return format(model, len, "Landstalker", 0);
	else if(model_id == 401) return format(model, len, "Bravura", 0);
	else if(model_id == 402) return format(model, len, "Buffalo", 0);
	else if(model_id == 403) return format(model, len, "Linerunner", 0);
	else if(model_id == 404) return format(model, len, "Perenail", 0);
	else if(model_id == 405) return format(model, len, "Sentinel", 0);
	else if(model_id == 406) return format(model, len, "Dumper", 0);
	else if(model_id == 407) return format(model, len, "Firetruck", 0);
	else if(model_id == 408) return format(model, len, "Trashmaster", 0);
	else if(model_id == 409) return format(model, len, "Stretch", 0);
	else if(model_id == 410) return format(model, len, "Manana", 0);
	else if(model_id == 411) return format(model, len, "Infernus", 0);
	else if(model_id == 412) return format(model, len, "Vodooo", 0);
	else if(model_id == 413) return format(model, len, "Pony", 0);
	else if(model_id == 414) return format(model, len, "Mule", 0);
	else if(model_id == 415) return format(model, len, "Cheetah", 0);
	else if(model_id == 416) return format(model, len, "Ambulance", 0);
	else if(model_id == 417) return format(model, len, "Leviathan", 0);
	else if(model_id == 418) return format(model, len, "Moonbeam", 0);
	else if(model_id == 419) return format(model, len, "Esperanto", 0);
	else if(model_id == 420) return format(model, len, "Taxi", 0);
	else if(model_id == 421) return format(model, len, "Washington", 0);
	else if(model_id == 422) return format(model, len, "Bobcat", 0);
	else if(model_id == 423) return format(model, len, "Mr Whoopee", 0);
	else if(model_id == 424) return format(model, len, "BF Injection", 0);
	else if(model_id == 425) return format(model, len, "Hunter", 0);
	else if(model_id == 426) return format(model, len, "Premier", 0);
	else if(model_id == 427) return format(model, len, "S.W.A.T Truck", 0);
	else if(model_id == 428) return format(model, len, "Securicar", 0);
	else if(model_id == 429) return format(model, len, "Banshee", 0);
	else if(model_id == 430) return format(model, len, "Predator", 0);
	else if(model_id == 431) return format(model, len, "Bus", 0);
	else if(model_id == 432) return format(model, len, "Rhino", 0);
	else if(model_id == 433) return format(model, len, "Barracks", 0);
	else if(model_id == 434) return format(model, len, "Hotknife", 0);
	else if(model_id == 435) return format(model, len, "Trailer", 0);
	else if(model_id == 436) return format(model, len, "Previon", 0);
	else if(model_id == 437) return format(model, len, "Coach", 0);
	else if(model_id == 438) return format(model, len, "Cabbie", 0);
	else if(model_id == 439) return format(model, len, "Stallion", 0);
	else if(model_id == 440) return format(model, len, "Rumpo", 0);
	else if(model_id == 441) return format(model, len, "RC Bandit", 0);
	else if(model_id == 442) return format(model, len, "Romero", 0);
	else if(model_id == 443) return format(model, len, "Packer", 0);
	else if(model_id == 444) return format(model, len, "Monster", 0);
	else if(model_id == 445) return format(model, len, "Admiral", 0);
	else if(model_id == 446) return format(model, len, "Squalo", 0);
	else if(model_id == 447) return format(model, len, "Seasparrow", 0);
	else if(model_id == 448) return format(model, len, "Pizza Boy", 0);
	else if(model_id == 449) return format(model, len, "Tram", 0);
	else if(model_id == 450) return format(model, len, "Trailer 2", 0);
	else if(model_id == 451) return format(model, len, "Turismo", 0);
	else if(model_id == 452) return format(model, len, "Speeder", 0);
	else if(model_id == 453) return format(model, len, "Refeer", 0);
	else if(model_id == 454) return format(model, len, "Tropic", 0);
	else if(model_id == 455) return format(model, len, "Flatbed", 0);
	else if(model_id == 456) return format(model, len, "Yankee", 0);
	else if(model_id == 457) return format(model, len, "Caddy", 0);
	else if(model_id == 458) return format(model, len, "Solair", 0);
	else if(model_id == 459) return format(model, len, "Top Fun", 0);
	else if(model_id == 460) return format(model, len, "Skimmer", 0);
	else if(model_id == 461) return format(model, len, "PCJ-600", 0);
	else if(model_id == 462) return format(model, len, "Faggio", 0);
	else if(model_id == 463) return format(model, len, "Freeway", 0);
	else if(model_id == 464) return format(model, len, "RC Baron", 0);
	else if(model_id == 465) return format(model, len, "RC Raider", 0);
	else if(model_id == 466) return format(model, len, "Glendade", 0);
	else if(model_id == 467) return format(model, len, "Oceanic", 0);
	else if(model_id == 468) return format(model, len, "Sanchez", 0);
	else if(model_id == 469) return format(model, len, "Sparrow", 0);
	else if(model_id == 470) return format(model, len, "Patriot", 0);
	else if(model_id == 471) return format(model, len, "Quad", 0);
	else if(model_id == 472) return format(model, len, "Coastguard", 0);
	else if(model_id == 473) return format(model, len, "Dinghy", 0);
	else if(model_id == 474) return format(model, len, "Hermes", 0);
	else if(model_id == 475) return format(model, len, "Sabre", 0);
	else if(model_id == 476) return format(model, len, "Rustler", 0);
	else if(model_id == 477) return format(model, len, "ZR-350", 0);
	else if(model_id == 478) return format(model, len, "Walton", 0);
	else if(model_id == 479) return format(model, len, "Regina", 0);
	else if(model_id == 480) return format(model, len, "Comet", 0);
	else if(model_id == 481) return format(model, len, "BMX", 0);
	else if(model_id == 482) return format(model, len, "Burrito", 0);
	else if(model_id == 483) return format(model, len, "Camper", 0);
	else if(model_id == 484) return format(model, len, "Marquis", 0);
	else if(model_id == 485) return format(model, len, "Baggage", 0);
	else if(model_id == 486) return format(model, len, "Dozer", 0);
	else if(model_id == 487) return format(model, len, "Maverick", 0);
	else if(model_id == 488) return format(model, len, "News Maverick", 0);
	else if(model_id == 489) return format(model, len, "Rancher", 0);
	else if(model_id == 490) return format(model, len, "Federal Rancher", 0);
	else if(model_id == 491) return format(model, len, "Virgo", 0);
	else if(model_id == 492) return format(model, len, "Greenwood", 0);
	else if(model_id == 493) return format(model, len, "Jetmax", 0);
	else if(model_id == 494) return format(model, len, "Hotring", 0);
	else if(model_id == 495) return format(model, len, "Sandking", 0);
	else if(model_id == 496) return format(model, len, "Blista Compact", 0);
	else if(model_id == 497) return format(model, len, "Police Maverick", 0);
	else if(model_id == 498) return format(model, len, "Boxville", 0);
	else if(model_id == 499) return format(model, len, "Benson", 0);
	else if(model_id == 500) return format(model, len, "Mesa", 0);
	else if(model_id == 501) return format(model, len, "RC Goblin", 0);
	else if(model_id == 502) return format(model, len, "Hotring A", 0);
	else if(model_id == 503) return format(model, len, "Hotring B", 0);
	else if(model_id == 504) return format(model, len, "Blooding Banger", 0);
	else if(model_id == 505) return format(model, len, "Rancher", 0);
	else if(model_id == 506) return format(model, len, "Super GT", 0);
	else if(model_id == 507) return format(model, len, "Elegant", 0);
	else if(model_id == 508) return format(model, len, "Journey", 0);
	else if(model_id == 509) return format(model, len, "Bike", 0);
	else if(model_id == 510) return format(model, len, "Mountain Bike", 0);
	else if(model_id == 511) return format(model, len, "Beagle", 0);
	else if(model_id == 512) return format(model, len, "Cropduster", 0);
	else if(model_id == 513) return format(model, len, "Stuntplane", 0);
	else if(model_id == 514) return format(model, len, "Petrol", 0);
	else if(model_id == 515) return format(model, len, "Roadtrain", 0);
	else if(model_id == 516) return format(model, len, "Nebula", 0);
	else if(model_id == 517) return format(model, len, "Majestic", 0);
	else if(model_id == 518) return format(model, len, "Buccaneer", 0);
	else if(model_id == 519) return format(model, len, "Shamal", 0);
	else if(model_id == 520) return format(model, len, "Hydra", 0);
	else if(model_id == 521) return format(model, len, "FCR-300", 0);
	else if(model_id == 522) return format(model, len, "NRG-500", 0);
	else if(model_id == 523) return format(model, len, "HPV-1000", 0);
	else if(model_id == 524) return format(model, len, "Cement Truck", 0);
	else if(model_id == 525) return format(model, len, "Towtruck", 0);
	else if(model_id == 526) return format(model, len, "Fortune", 0);
	else if(model_id == 527) return format(model, len, "Cadrona", 0);
	else if(model_id == 528) return format(model, len, "Federal Truck", 0);
	else if(model_id == 529) return format(model, len, "Williard", 0);
	else if(model_id == 530) return format(model, len, "Fork Lift", 0);
	else if(model_id == 531) return format(model, len, "Tractor", 0);
	else if(model_id == 532) return format(model, len, "Combine", 0);
	else if(model_id == 533) return format(model, len, "Feltzer", 0);
	else if(model_id == 534) return format(model, len, "Remington", 0);
	else if(model_id == 535) return format(model, len, "Slamvan", 0);
	else if(model_id == 536) return format(model, len, "Blade", 0);
	else if(model_id == 537) return format(model, len, "Freight", 0);
	else if(model_id == 538) return format(model, len, "Streak", 0);
	else if(model_id == 539) return format(model, len, "Vortex", 0);
	else if(model_id == 540) return format(model, len, "Vincent", 0);
	else if(model_id == 541) return format(model, len, "Bullet", 0);
	else if(model_id == 542) return format(model, len, "Clover", 0);
	else if(model_id == 543) return format(model, len, "Sadler", 0);
	else if(model_id == 544) return format(model, len, "Stairs Firetruck", 0);
	else if(model_id == 545) return format(model, len, "Hustler", 0);
	else if(model_id == 546) return format(model, len, "Intruder", 0);
	else if(model_id == 547) return format(model, len, "Primo", 0);
	else if(model_id == 548) return format(model, len, "Cargobob", 0);
	else if(model_id == 549) return format(model, len, "Tampa", 0);
	else if(model_id == 550) return format(model, len, "Sunrise", 0);
	else if(model_id == 551) return format(model, len, "Merit", 0);
	else if(model_id == 552) return format(model, len, "Utility Van", 0);
	else if(model_id == 553) return format(model, len, "Nevada", 0);
	else if(model_id == 554) return format(model, len, "Yosemite", 0);
	else if(model_id == 555) return format(model, len, "Windsor", 0);
	else if(model_id == 556) return format(model, len, "Monster A", 0);
	else if(model_id == 557) return format(model, len, "Monster B", 0);
	else if(model_id == 558) return format(model, len, "Uranus", 0);
	else if(model_id == 559) return format(model, len, "Jester", 0);
	else if(model_id == 560) return format(model, len, "Sultan", 0);
	else if(model_id == 561) return format(model, len, "Stratum", 0);
	else if(model_id == 562) return format(model, len, "Elegy", 0);
	else if(model_id == 563) return format(model, len, "Raindance", 0);
	else if(model_id == 564) return format(model, len, "RC Tiger", 0);
	else if(model_id == 565) return format(model, len, "Flash", 0);
	else if(model_id == 566) return format(model, len, "Tahoma", 0);
	else if(model_id == 567) return format(model, len, "Savanna", 0);
	else if(model_id == 568) return format(model, len, "Bandito", 0);
	else if(model_id == 569) return format(model, len, "Freight Flat", 0);
	else if(model_id == 570) return format(model, len, "Streak", 0);
	else if(model_id == 571) return format(model, len, "Kart", 0);
	else if(model_id == 572) return format(model, len, "Mower", 0);
	else if(model_id == 573) return format(model, len, "Duneride", 0);
	else if(model_id == 574) return format(model, len, "Sweeper", 0);
	else if(model_id == 575) return format(model, len, "Broadway", 0);
	else if(model_id == 576) return format(model, len, "Tornado", 0);
	else if(model_id == 577) return format(model, len, "AT-400", 0);
	else if(model_id == 578) return format(model, len, "DFT-30", 0);
	else if(model_id == 579) return format(model, len, "Huntley", 0);
	else if(model_id == 580) return format(model, len, "Stafford", 0);
	else if(model_id == 581) return format(model, len, "BF-400", 0);
	else if(model_id == 582) return format(model, len, "Raindance", 0);
	else if(model_id == 583) return format(model, len, "News Van", 0);
	else if(model_id == 584) return format(model, len, "Tug", 0);
	else if(model_id == 585) return format(model, len, "Petrol Tanker", 0);
	else if(model_id == 586) return format(model, len, "Wayfarer", 0);
	else if(model_id == 587) return format(model, len, "Euros", 0);
	else if(model_id == 588) return format(model, len, "Hotdog", 0);
	else if(model_id == 589) return format(model, len, "Club", 0);
	else if(model_id == 590) return format(model, len, "Freight Box", 0);
	else if(model_id == 591) return format(model, len, "Trailer 3", 0);
	else if(model_id == 592) return format(model, len, "Andromada", 0);
	else if(model_id == 593) return format(model, len, "Dodo", 0);
	else if(model_id == 594) return format(model, len, "RC Cam", 0);
	else if(model_id == 595) return format(model, len, "Launch", 0);
	else if(model_id == 596) return format(model, len, "LSPD Patrol Car", 0);
	else if(model_id == 597) return format(model, len, "FBI Patrol Car", 0);
	else if(model_id == 598) return format(model, len, "NG Patrol Car", 0);
	else if(model_id == 599) return format(model, len, "LSPD Patrol Ranger", 0);
	else if(model_id == 600) return format(model, len, "Picador", 0);
	else if(model_id == 601) return format(model, len, "S.W.A.T Tank", 0);
    else if(model_id == 602) return format(model, len, "Alpha", 0);
	else if(model_id == 603) return format(model, len, "Phoenix", 0);
	else if(model_id == 609) return format(model, len, "Boxville", 0);
	
	return 0;
}

stock GetVehicleOwnerName(vehicleid)
{
	new query[256], player_name[MAX_PLAYER_NAME];
	
	mysql_format(mysql, query, sizeof(query), "SELECT Name \
												FROM Users \
												WHERE ID = %d", VehicleInfo[vehicleid][Owner]);
    mysql_query(mysql, query);
	cache_get_value_name(0, "Name", player_name);
	
	return player_name;
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
	for(new i = 0; i < sizeof(sale_vehicles); i++)
	{
	    if(vehicleid == sale_vehicles[i]) return 1;
	}
	
	return 0;
}

public IsAOwnedVehicle(vehicleid)
{
   for(new i = 0; i < sizeof(owned_vehicles); i++)
   {
      if(vehicleid == owned_vehicles[i]) return 1;
   }
   
   return 0;
}


public IsARentVehicle(vehicleid)
{
   for(new i = 0; i < sizeof(rent_vehicles); i++)
   {
      if(vehicleid == rent_vehicles[i]) return 1;
   }
   
   return 0;
}

public IsABike(vehicleid)
{
    new model_id = GetVehicleModel(vehicleid);
	
	if(model_id == 448 
		|| model_id == 461 
		|| model_id == 462 
		|| model_id == 463 
		|| model_id == 468 
		|| model_id == 471 
		|| model_id == 481 
		|| model_id == 509 
		|| model_id == 510 
		|| model_id == 521 
		|| model_id == 522 
		|| model_id == 523 
		|| model_id == 581 
		|| model_id == 586)
	{
		return 1;
	}
	
	return 0;
}

public IsABoat(vehicleid)
{
    new model_id = GetVehicleModel(vehicleid);
	
	if(model_id == 430 
		|| model_id == 446 
		|| model_id == 452 
		|| model_id == 453 
		|| model_id == 454 
		|| model_id == 472 
		|| model_id == 473 
		|| model_id == 484 
		|| model_id == 493)
	{
		return 1;
	}
		
	return 0;
}

public IsAPlane(vehicleid)
{
    new model_id = GetVehicleModel(vehicleid);
	
	if(model_id == 460 
		|| model_id == 464 
		|| model_id == 476 
		|| model_id == 511 
		|| model_id == 512 
		|| model_id == 513 
		|| model_id == 519 
		|| model_id == 520 
		|| model_id == 553 
		|| model_id == 577 
		|| model_id == 592 
		|| model_id == 593)
	{
		return 1;
	}
	
	return 0;
}

public IsATrain(vehicleid)
{
	new model_id = GetVehicleModel(vehicleid);
	
	if(model_id == 449 
		|| model_id == 537 
		|| model_id == 538 
		|| model_id == 569 
		|| model_id == 570 
		|| model_id == 590) 
	{
		return 1; 
	}
	
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
	
    for(new i = 0; i < MAX_VEHICLES; i++)
    {
   		GetVehicleParamsEx(i, engine, lights, alarm, doors, bonnet, boot, objective);
    	if(IsABoat(i)) VehicleFuel[i] += 1;
    	if(IsAPlane(i)) VehicleFuel[i] += 1;
    	if(VehicleEngine[i] == 1 && VehicleFuel[i] > 0) VehicleFuel[i] -= 1;
    	if(VehicleFuel[i] < 1)
		{
			SetVehicleParamsEx(i, 0, 0, alarm, doors, bonnet, boot, objective);
			VehicleEngine[i] = 0;
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
	AddPlayerClass(0, 1642.2903, -2333.3423, 13.5469, 360.0, 0, 0, 0, 0, 0, 0);
	
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
	
	//------------------------------------------------------------------------ > RENT
	rent_vehicles[0] = AddStaticVehicleEx(462,1560.3000500,-2309.0000000,13.2000000,90.0000000,-1,7,-1); //Faggio
	rent_vehicles[1] = AddStaticVehicleEx(462,1560.3000500,-2312.3000500,13.2000000,90.0000000,-1,7,-1); //Faggio
	rent_vehicles[2] = AddStaticVehicleEx(462,1560.3000500,-2315.6001000,13.2000000,90.0000000,-1,7,-1); //Faggio
	rent_vehicles[3] = AddStaticVehicleEx(462,1560.3000500,-2318.8999000,13.2000000,90.0000000,-1,7,-1); //Faggio
	rent_vehicles[4] = AddStaticVehicleEx(462,1560.3000500,-2322.1999500,13.2000000,90.0000000,-1,7,-1); //Faggio
	rent_vehicles[5] = AddStaticVehicleEx(462,1560.3000500,-2325.5000000,13.2000000,90.0000000,-1,7,-1); //Faggio
	rent_vehicles[6] = AddStaticVehicleEx(462,1560.3000500,-2328.6999500,13.2000000,90.0000000,-1,7,-1); //Faggio
	rent_vehicles[7] = AddStaticVehicleEx(462,1560.3000500,-2332.0000000,13.2000000,90.0000000,-1,7,-1); //Faggio
	rent_vehicles[8] = AddStaticVehicleEx(462,1560.3000500,-2335.3000500,13.2000000,90.0000000,-1,7,-1); //Faggio
	rent_vehicles[9] = AddStaticVehicleEx(462,1560.3000500,-2338.5000000,13.2000000,90.0000000,-1,7,-1); //Faggio
	rent_vehicles[10] = AddStaticVehicleEx(410, 1552.6835, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	rent_vehicles[11] = AddStaticVehicleEx(410, 1549.4233, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	rent_vehicles[12] = AddStaticVehicleEx(410, 1546.1617, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	rent_vehicles[13] = AddStaticVehicleEx(410, 1542.9518, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	rent_vehicles[14] = AddStaticVehicleEx(410, 1539.6881, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	rent_vehicles[15] = AddStaticVehicleEx(410, 1536.3673, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	rent_vehicles[16] = AddStaticVehicleEx(410, 1533.1079, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	rent_vehicles[17] = AddStaticVehicleEx(410, 1529.8678, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	rent_vehicles[18] = AddStaticVehicleEx(462,1180.0000000,-1337.6000000,13.2000000,270.0000000,-1,7,-1); //Faggio
	rent_vehicles[19] = AddStaticVehicleEx(462,1184.5996000,-1337.5996000,13.2000000,270.0000000,-1,7,-1); //Faggio
	rent_vehicles[20] = AddStaticVehicleEx(462,1184.5996000,-1340.5996000,13.2000000,270.0000000,-1,7,-1); //Faggio
	rent_vehicles[21] = AddStaticVehicleEx(462,1180.0000000,-1340.5996000,13.2000000,270.0000000,-1,7,-1); //Faggio
	rent_vehicles[22] = AddStaticVehicleEx(462,1175.4000000,-1337.6000000,13.2000000,270.0000000,-1,7,-1); //Faggio
	rent_vehicles[23] = AddStaticVehicleEx(462,1175.4000000,-1340.5996000,13.2000000,270.0000000,-1,7,-1); //Faggio
	GlobalVehiclesCounter += 24;
	
	// Load owned vehicles
	LoadVehicles(); 
	
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
	new vehicle_name[32], vehicle_owned[64], str[128];
	GetVehicleName(vehicleid, vehicle_name, sizeof(vehicle_name));
	vehicle_owned = GetVehicleOwnerName(vehicleid);
	
	if(IsAOwnedVehicle(vehicleid))
	{
	    format(str, sizeof(str), "Ulazite u %s (%d). Vlasnik: %s", vehicle_name, vehicleid, vehicle_owned);
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
	else
	{
	    format(str, sizeof(str), "Ulazite u %s (%d). Vlasnik: Drzava", vehicle_name, vehicleid);
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
			
			// SHA256_PassHash(inputtext, PlayerInfo[playerid][Salt], buffer, 65);
			printf("Input text je %s \n", inputtext);
			printf("Password je %s \n", PlayerInfo[playerid][Password]);
			bcrypt_check(inputtext, PlayerInfo[playerid][Password], "OnPasswordChecked", "d", playerid);		
		}
		
		case DIALOG_REGISTER:
		{
			
			if(!response) 
			{
				return Kick(playerid);
			}
			
			if(strlen(inputtext) < 6 || strlen(inputtext) > 20)
			{
				ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, ""TEXT_COLOR_RED"Registracija", ""TEXT_COLOR_WHITE"Lozinka mora biti izmedju 6 i 20 karaktera. \nMolimo Vas upisite lozinku da se registrujete", "Dalje", "Izlaz");
				return 1;
			}
			
			bcrypt_hash(inputtext, BCRYPT_COST, "OnPasswordHashed", "d", playerid);
		}
		
		case DIALOG_SEX:
		{
			new query[256], message[256];
			
			if(!response) 
			{
				return Kick(playerid);
			}
			
			if(listitem == 0)
			{
				PlayerInfo[playerid][Gender] = 0;
				mysql_format(mysql, query, sizeof(query), "UPDATE Users \
															SET gender = %d \
															WHERE id = %d", PlayerInfo[playerid][Gender], PlayerInfo[playerid][ID]);																						
				mysql_tquery(mysql, query);
			
				format(message, sizeof(message), ""TEXT_COLOR_WHITE"Unesite koliko imate godina");
				ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, ""TEXT_COLOR_RED"Registracija - Godine", message, "U redu", "Izadji");
			}
			else if(listitem == 1)
			{
				PlayerInfo[playerid][Gender] = 1;
				mysql_format(mysql, query, sizeof(query), "UPDATE Users \
															SET gender = %d \
															WHERE id = %d", PlayerInfo[playerid][Gender], PlayerInfo[playerid][ID]);
				mysql_tquery(mysql, query);
				
				format(message, sizeof(message), ""TEXT_COLOR_WHITE"Unesite koliko imate godina");
				ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, ""TEXT_COLOR_RED"Registracija - Godine", message, "U redu", "Izadji");
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
				return ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, ""TEXT_COLOR_RED"Registracija - Godine", ""TEXT_COLOR_WHITE"Niste uneli koliko imate godina. \nUnesite koliko imate godina.", "U redu", "Izadji");
			}
			
			if(!isNumeric(inputtext))
			{
				return ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, ""TEXT_COLOR_RED"Registracija - Godine", ""TEXT_COLOR_WHITE"Niste uneli koliko imate godina. \nUnesite koliko imate godina.", "U redu", "Izadji");
			}
			
			years = strval(inputtext);
			if(years < 7 || years > 99)
			{
				return ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, ""TEXT_COLOR_RED"Registracija - Godine", ""TEXT_COLOR_WHITE"Opseg godina mora biti izmedju 7 i 99. \nUnesite koliko imate godina.", "U redu", "Izadji");
			}
			
			PlayerInfo[playerid][Age] = years;
			mysql_format(mysql, query, sizeof(query), "UPDATE Users \
														SET age = %d \
														WHERE id = %d", years, PlayerInfo[playerid][ID]);
			mysql_tquery(mysql, query);
			ShowPlayerDialog(playerid, DIALOG_COUNTRY, DIALOG_STYLE_LIST, ""TEXT_COLOR_RED"Registracija - Drzava", ""TEXT_COLOR_WHITE"Srbija\nCrna Gora\nBosna i Hercegovina\nHrvatska\nMakedonija\nOstalo", "U redu", "Izadji");
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
					PlayerInfo[playerid][Country] = 0;
					mysql_format(mysql, query, sizeof(query), "UPDATE Users \
																SET country = %d \
																WHERE id = %d", PlayerInfo[playerid][Country], PlayerInfo[playerid][ID]);									
					mysql_tquery(mysql, query);
					ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, ""TEXT_COLOR_RED"Registracija - Grad", ""TEXT_COLOR_WHITE"Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
					
				}
				// Montenegro
				case 1:
				{
					PlayerInfo[playerid][Country] = 1;
					mysql_format(mysql, query, sizeof(query), "UPDATE Users \
																SET country = %d \
																WHERE id = %d", PlayerInfo[playerid][Country], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query);
					ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, ""TEXT_COLOR_RED"Registracija - Grad", ""TEXT_COLOR_WHITE"Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
				}
				// Bosnia and Herzegovina
				case 2:
				{
					PlayerInfo[playerid][Country] = 2;
					mysql_format(mysql, query, sizeof(query), "UPDATE Users \
																SET country = %d \
																WHERE id = %d", PlayerInfo[playerid][Country], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query);
					ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, ""TEXT_COLOR_RED"Registracija - Grad", ""TEXT_COLOR_WHITE"Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
				}
				// Croatia
				case 3:
				{
					PlayerInfo[playerid][Country] = 3;
					mysql_format(mysql, query, sizeof(query), "UPDATE Users \
																SET country = %d \
																WHERE id = %d", PlayerInfo[playerid][Country], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query);
					ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, ""TEXT_COLOR_RED"Registracija - Grad", ""TEXT_COLOR_WHITE"Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
				}
				// Macedonia
				case 4:
				{
					PlayerInfo[playerid][Country] = 4;
					mysql_format(mysql, query, sizeof(query), "UPDATE Users \
																SET country = %d \
																WHERE id = %d", PlayerInfo[playerid][Country], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query);
					ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, ""TEXT_COLOR_RED"Registracija - Grad", ""TEXT_COLOR_WHITE"Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
				}
				// Other 
				case 5:
				{
					PlayerInfo[playerid][Country] = 5;
					mysql_format(mysql, query, sizeof(query), "UPDATE Users \
																SET country = %d \
																WHERE id = %d", PlayerInfo[playerid][Country], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query);
					ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, ""TEXT_COLOR_RED"Registracija - Grad", ""TEXT_COLOR_WHITE"Los Santos\nLas Venturas\nSan Fierro", "U redu", "Izadji");
				}
			}
		}
		
		case DIALOG_CITY:
		{
			new query[256], message[256], player_name[MAX_PLAYER_NAME], player_age, player_sex[8], player_country[32], player_city[16];
			
			if(!response)
			{
				return Kick(playerid);
			}
			
			GetPlayerName(playerid, player_name, sizeof(player_name));
			
			switch(listitem)
			{
				// Los Santos
				case 0:
				{
					PlayerInfo[playerid][City] = 0;
					PlayerInfo[playerid][SpawnX] = 1642.2903;
					PlayerInfo[playerid][SpawnY] = -2333.3423;
					PlayerInfo[playerid][SpawnZ] = 13.5469;
					//PlayerInfo[playerid][SpawnA] = 0.0;
					mysql_format(mysql, query, sizeof(query), "UPDATE Users \
																SET city = %d, spawnX = %f, spawnY = %f, spawnZ = %f \
																WHERE id = %d", PlayerInfo[playerid][City], PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query);
					
					player_age = PlayerInfo[playerid][Age];
					player_sex = GetPlayerGender(playerid);
					player_country = GetPlayerCountry(playerid);
					player_city = GetPlayerCity(playerid);
					
					format(message, sizeof(message), ""TEXT_COLOR_WHITE"Uspesno ste zavrsili registraciju. \n"TEXT_COLOR_RED"Ime_Prezime: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Pol: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Godina: "TEXT_COLOR_WHITE"%d \n"TEXT_COLOR_RED"Drzava: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Grad: "TEXT_COLOR_WHITE"%s \nUnesite Vasu lozinku da se prijavite", player_name, player_sex, player_age, player_country, player_city);
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, ""TEXT_COLOR_RED"Login", message, "Dalje", "Izlaz");					
				}
				// Las Venturas
				case 1:
				{
					PlayerInfo[playerid][City] = 1;
					PlayerInfo[playerid][SpawnX] = 1676.4181;
					PlayerInfo[playerid][SpawnY] = 1447.8713;
					PlayerInfo[playerid][SpawnZ] = 10.7845;
					//PlayerInfo[playerid][SpawnA] = 270.4988;
					
					mysql_format(mysql, query, sizeof(query), "UPDATE Users \
																SET city = %d, spawnX = %f, spawnY = %f, spawnZ = %f \
																WHERE id = %d", PlayerInfo[playerid][City], PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query);
					
					format(message, sizeof(message), ""TEXT_COLOR_WHITE"Uspesno ste zavrsili registraciju. \n"TEXT_COLOR_RED"Ime_Prezime: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Pol: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Godina: "TEXT_COLOR_WHITE"%d \n"TEXT_COLOR_RED"Drzava: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Grad: "TEXT_COLOR_WHITE"%s \nUnesite Vasu lozinku da se prijavite", player_name, player_sex, player_age, player_country, player_city);
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, ""TEXT_COLOR_RED"Login", message, "Dalje", "Izlaz");	
				}
				// San Fierro
				case 2:
				{
					PlayerInfo[playerid][City] = 2;
					PlayerInfo[playerid][SpawnX] = 1410.8577;
					PlayerInfo[playerid][SpawnY] = -301.6284;
					PlayerInfo[playerid][SpawnZ] = 14.1484;
					//PlayerInfo[playerid][SpawnA] = 136.9096;
					mysql_format(mysql, query, sizeof(query), "UPDATE Users \
																SET city = %d, spawnX = %f, spawnY = %f, spawnZ = %f \
																WHERE id = %d", PlayerInfo[playerid][City], PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query);
					
					player_age = PlayerInfo[playerid][Age];
					player_sex = GetPlayerGender(playerid);
					player_country = GetPlayerCountry(playerid);
					player_city = GetPlayerCity(playerid);
		
					format(message, sizeof(message), ""TEXT_COLOR_WHITE"Uspesno ste zavrsili registraciju. \n"TEXT_COLOR_RED"Ime_Prezime: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Pol: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Godina: "TEXT_COLOR_WHITE"%d \n"TEXT_COLOR_RED"Drzava: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Grad: "TEXT_COLOR_WHITE"%s \nUnesite Vasu lozinku da se prijavite", player_name, player_sex, player_age, player_country, player_city);
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, ""TEXT_COLOR_RED"Login", message, "Dalje", "Izlaz");	
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