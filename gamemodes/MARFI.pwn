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

#define DIALOG_BUY_VEHICLE 10 // Vehicle sell(buy) offer

#define DIALOG_BUY_HOUSE 20 //

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
forward SavePlayer(playerid);
forward OnPlayerSaved(playerid);
forward OnPlayerRegistered(playerid);
forward OnAccountLoad(playerid);
forward OnPasswordHashed(playerid);
forward OnPasswordChecked(playerid);

forward AntiRoleplayName(playerid, playerName[]);

forward IsARentVehicle(vehicleID);
forward IsASaleVehicle(vehicleID);
forward IsAOwnedVehicle(vehicleID);
forward IsALSPoliceCar(vehicleID);
forward IsABike(vehicleID);
forward IsABoat(vehicleID);
forward IsAPlane(vehicleID);
forward IsATrain(vehicleID);

forward IsPlayerNearPump1(playerid);
forward IsPlayerNearPump2(playerid);
forward IsPlayerNearPump3(playerid);

forward KickPlayer(playerid);
forward AntiFreezePlayer(playerid);

forward SendRadiusMessage(Float:radius, playerid, string[], color1, color2, color3, color4, color5);

forward LoadVehicles();
forward OnVehiclesLoaded();
forward InsertVehicle(vehicle_owner, vehicle_model);
forward OnVehicleInserted(vehicleID);
forward DeleteVehicle(vehicleID);
forward SaveVehicle(vehicleID);
forward SetVehicleComponents(vehicleID);
forward RemoveVehicleComponents(vehicleID);
forward SaveVehicleComponents(vehicleID);
forward GetVehiclePrice(vehicleID);
forward GetVehicleName(vehicleID, model[], len);
forward VehicleStopOffer(playerid, target);
forward LoadVehiclesFuel();
forward StartVehicleEngine(playerid, vehicleID);
forward CheckVehicleFuel();

forward LoadHouses();
forward OnHousesLoaded();
forward InsertHouse(house_id); 
forward OnHouseInserted(house_id);
forward DeleteHouse(house_id); 
forward SaveHouse(house_id);
forward HouseStopOffer(playerid, target);

forward LoadBusinesses();
forward OnBusinessesLoaded();
forward InsertBusiness(business_id);
forward OnBusinessInserted(business_id);
forward DeleteBusiness(business_id);
forward SaveBusiness(business_id);
forward BusinessStopOffer(playerid, target);

forward LoadRentVehicles();
forward LoadSaleVehicles();
forward LoadLosSantosCityHallExterior();
forward LoadLosSantosCityHallInterior();
forward LoadLosSantosParking();
forward LoadLosSantosAirport();
forward LoadLosSantosPoliceDepartment();
forward LoadLosSantosPoliceCars();
forward LoadLosSantosTaxiJob();
forward LoadLosSantosSmugglerJob();

forward closeLspdCellRoomDoor();
forward closeLspdCell1();
forward closeLspdCell2();
forward closeLspdCell3();
forward closeLspdDoor1();
forward closeLspdDoor2();
forward closeLspdWindow();
forward closeLspdGarage();
forward closeLspdGarageDoor();
// ====================================================================================================== Variables
new MySQL:mysql;

// Server counters
new GlobalVehiclesCounter = 1;
new OwnedVehiclesCounter = 0;
new GlobalHousesCounter = 1;
new GlobalBusinessesCounter = 1;
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
	Skin,
	Banned,
	BannedTime,
	IdentityCard,
	Float:SpawnX, // Spawn location, coordinate X
	Float:SpawnY, // Spawn location, coordinate Y
	Float:SpawnZ, // Spawn location, coordinate Z
	Float:SpawnA, // Spawn location, angle
	BankAccount,
	BankMoney,
	BankCredit,
	Admin,
	Donator,
	DonatorPoints,
	Level,
	Respect,
	Hours,
	Playtime,
	PayCheck,
	Dead,
	Kills,
	Deaths,
	Job,
	JobContract,
	Mobile,
	MobileNumber,
	MobileCredit,
	AddressBook,
	Tut,
	OnTut,
	DetectivePoints,
	DetectiveLevel,
	TruckmanPoints,
	TruckmanLevel,
	TaxiPoints,
	TaxiLevel,
	MechanicPoints,
	MechanicLevel,
	Drugs,
	Materials,
	OLeader,
	OMember,
	ORank,
	OSkin,
	Wanted,
	WantedTimes,
	Arrested,
	ArrestedTime,
	ArrestedTimes,
	DrivingLicence,
	FlyingLicence,
	SailingLicence,
	Muted,
	MutedTime,
	PistolSkill,
	SilencedSkill,
	DesertSkill,
	ShotgunSkill,
	SawnoffSkill,
	CombatSkill,
	UziSkill,
	MP5Skill,
	AK47Skill,
	M4Skill,
	SniperSkill,
	FightingStyle
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

// House TABLE
enum HouseData
{
	ID,
	Owned,
	Owner,
	Price,
	Locked,
	Float:EnterX,
	Float:EnterY,
	Float:EnterZ,
	Float:EnterA,
	Float:ExitX,
	Float:ExitY,
	Float:ExitZ,
	Float:ExitA,
	OutsideInterior,
	OutsideVirtualWorld,
	InsideInterior,
	InsideVirtualWorld,
	Icon,
	Slot1,
	Slot1_ammo,
	Slot2,
	Slot2_ammo,
	Slot3,
	Slot3_ammo,
	Materials,
	Drugs
}
new HouseInfo[2000][HouseData];

enum BusinessData
{
	ID,
    Owned,
    Price,
    Owner,
    Type,
    Locked,
    Money,
    EnterFee,
    Float:EnterX,
    Float:EnterY,
    Float:EnterZ,
    Float:EnterA,
    Float:ExitX,
    Float:ExitY,
    Float:ExitZ,
    Float:ExitA,
    OutsideInterior,
    OutsideVirtualWorld,
    InsideInterior,
    InsideVirtualWorld,
    Icon,
    ExitIcon,
    Name[128]
}
new BusinessInfo[100][BusinessData];

// Player
new IsPlayerRentingVehicle[MAX_PLAYERS];
new RentedVehicle[MAX_PLAYERS];
new StartingVehicleEngine[MAX_PLAYERS];
new RefuellingVehicle[MAX_PLAYERS];
new RefillLitre[MAX_PLAYERS];
new HasBelt[MAX_PLAYERS];
new HasHelmet[MAX_PLAYERS];
new iCall[MAX_PLAYERS];
new Caller[MAX_PLAYERS];
new CalledPlayer[MAX_PLAYERS];
new InCall[MAX_PLAYERS];
new AdvertisementTime[MAX_PLAYERS];

// Vehicle
new VehicleEngine[MAX_VEHICLES];
new VehicleFuel[MAX_VEHICLES];
new VehicleHood[MAX_VEHICLES];
new VehicleTrunk[MAX_VEHICLES];
new VehicleSellOffer[MAX_PLAYERS];
new VehicleBuyOffer[MAX_PLAYERS];
new VehicleForOffer[MAX_PLAYERS];
new VehiclePlayerOffer[MAX_PLAYERS];
new VehicleOfferPrice[MAX_PLAYERS];

// House
new HouseSellOffer[MAX_PLAYERS];
new HouseBuyOffer[MAX_PLAYERS];
new HouseForOffer[MAX_PLAYERS];
new HousePlayerOffer[MAX_PLAYERS];
new HouseOfferPrice[MAX_PLAYERS];
new InHouse[MAX_PLAYERS];

//Business
new BusinessSellOffer[MAX_PLAYERS];
new BusinessBuyOffer[MAX_PLAYERS];
new BusinessForOffer[MAX_PLAYERS];
new BusinessPlayerOffer[MAX_PLAYERS];
new BusinessOfferPrice[MAX_PLAYERS];
new InBusiness[MAX_PLAYERS];

// Adding vehicles
new RentVehicles[24];
new SaleVehicles[89];
new OwnedVehicles[sizeof(VehicleInfo)];
new LSPoliceCars[13];

new Text3D:SaleVehicleLabels[MAX_VEHICLES]; // Labels for sale vehicles
new Text3D:HouseLabelArray[sizeof(HouseInfo)]; // Labels for houses
new Text3D:BusinessLabels[sizeof(HouseInfo)]; // Labels for business

// Doors, gates, windows etc..
// LSPD
new lspdCellRoomDoor;
new lspdCellRoomDoorOpened;
new lspdCell1;
new lspdCell1Opened;
new lspdCell2;
new lspdCell2Opened;
new lspdCell3;
new lspdCell3Opened;
new lspdDoor1;
new lspdDoor1Opened;
new lspdDoor2;
new lspdDoor2Opened;
new lspdWindow;
new lspdWindowOpened;
new lspdGarage;
new lspdGarageOpened;
new lspdGarageDoor;
new lspdGarageDoorOpened;
new InLSPDPoliceHQ[MAX_PLAYERS];

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

stock GetVehicleRegistration(vehicleID)
{
	new registration[4];
	switch(VehicleInfo[vehicleID][Registration])
	{
	    case 1: registration = "Da";
	    case 0: registration = "Ne";
	}
	return registration;
}

stock IsPlayerNearHouseEnter(playerid)
{
    for(new i = 0; i < sizeof(HouseInfo); i++)
    {
        if(IsPlayerInRangeOfPoint(playerid, 5.0, HouseInfo[i][EnterX], HouseInfo[i][EnterY], HouseInfo[i][EnterZ])) return i;
    }
	
    return -1;
}

stock IsPlayerNearBusinessEnter(playerid)
{
    for(new i = 0; i < sizeof(BusinessInfo); i++)
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, BusinessInfo[i][EnterX], BusinessInfo[i][EnterY], BusinessInfo[i][EnterZ])) return i;
    }
    return -1;
}

public CheckPlayerData(playerid)
{
	new query[128], playerName[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playerName, sizeof(playerName));
	mysql_format(mysql, query, sizeof(query), "SELECT * FROM Users WHERE name = '%e' LIMIT 1", playerName);
	mysql_tquery(mysql, query, "OnPlayerDataChecked", "i", playerid);
	
	return 1;
}

public OnPlayerDataChecked(playerid)
{
	new message[256], playerName[MAX_PLAYER_NAME], player_password[65], player_age, player_sex[8], player_country[32], player_city[16];
	
	GetPlayerName(playerid, playerName, sizeof(playerName));
	
	// Check if result has atleast one row, that means player has an account, show him dialog for login
	if(cache_num_rows() > 0)
	{
		cache_get_value_name_int(0, "id", PlayerInfo[playerid][ID]);
		cache_get_value_name(0, "password_digest", player_password, 65);
		cache_get_value_name_int(0, "gender", PlayerInfo[playerid][Gender]);
		cache_get_value_name_int(0, "age", PlayerInfo[playerid][Age]);
		cache_get_value_name_int(0, "country", PlayerInfo[playerid][Country]);
		cache_get_value_name_int(0, "city", PlayerInfo[playerid][City]);
		cache_get_value_name_int(0, "money", PlayerInfo[playerid][Money]);
		cache_get_value_name_int(0, "skin", PlayerInfo[playerid][Skin]);
		cache_get_value_name_int(0, "banned", PlayerInfo[playerid][Banned]);
		cache_get_value_name_int(0, "banned_time", PlayerInfo[playerid][BannedTime]);
		cache_get_value_name_float(0, "spawnX", PlayerInfo[playerid][SpawnX]);
		cache_get_value_name_float(0, "spawnY", PlayerInfo[playerid][SpawnY]);
		cache_get_value_name_float(0, "spawnZ", PlayerInfo[playerid][SpawnZ]);
		cache_get_value_name_int(0, "bank_account", PlayerInfo[playerid][BankAccount]);
		cache_get_value_name_int(0, "bank_money", PlayerInfo[playerid][BankMoney]);
		cache_get_value_name_int(0, "bank_credit", PlayerInfo[playerid][BankCredit]);
		cache_get_value_name_int(0, "admin", PlayerInfo[playerid][Admin]);
		cache_get_value_name_int(0, "donator", PlayerInfo[playerid][Donator]);
		cache_get_value_name_int(0, "donator_points", PlayerInfo[playerid][DonatorPoints]);
		cache_get_value_name_int(0, "level", PlayerInfo[playerid][Level]);
		cache_get_value_name_int(0, "respect", PlayerInfo[playerid][Respect]);
		cache_get_value_name_int(0, "hours", PlayerInfo[playerid][Hours]);
		cache_get_value_name_int(0, "play_time", PlayerInfo[playerid][Playtime]);
		cache_get_value_name_int(0, "paycheck", PlayerInfo[playerid][PayCheck]);
		cache_get_value_name_int(0, "dead", PlayerInfo[playerid][Dead]);
		cache_get_value_name_int(0, "kills", PlayerInfo[playerid][Kills]);
		cache_get_value_name_int(0, "deaths", PlayerInfo[playerid][Deaths]);
		cache_get_value_name_int(0, "job", PlayerInfo[playerid][Job]);
		cache_get_value_name_int(0, "job_contract", PlayerInfo[playerid][JobContract]);
		cache_get_value_name_int(0, "mobile", PlayerInfo[playerid][Mobile]);
		cache_get_value_name_int(0, "mobile_number", PlayerInfo[playerid][MobileNumber]);
		cache_get_value_name_int(0, "mobile_credit", PlayerInfo[playerid][MobileCredit]);
		cache_get_value_name_int(0, "address_book", PlayerInfo[playerid][AddressBook]);
		cache_get_value_name_int(0, "tut", PlayerInfo[playerid][Tut]);
		cache_get_value_name_int(0, "on_tut", PlayerInfo[playerid][OnTut]);
		cache_get_value_name_int(0, "detective_points", PlayerInfo[playerid][DetectivePoints]);
		cache_get_value_name_int(0, "detective_level", PlayerInfo[playerid][DetectiveLevel]);
		cache_get_value_name_int(0, "truckman_points", PlayerInfo[playerid][TruckmanPoints]);
		cache_get_value_name_int(0, "truckman_level", PlayerInfo[playerid][TruckmanLevel]);
		cache_get_value_name_int(0, "taxi_points", PlayerInfo[playerid][TaxiPoints]);
		cache_get_value_name_int(0, "taxi_level", PlayerInfo[playerid][TaxiLevel]);
		cache_get_value_name_int(0, "mechanic_points", PlayerInfo[playerid][MechanicPoints]);
		cache_get_value_name_int(0, "mechanic_level", PlayerInfo[playerid][MechanicLevel]);
		cache_get_value_name_int(0, "drugs", PlayerInfo[playerid][Drugs]);
		cache_get_value_name_int(0, "materials", PlayerInfo[playerid][Materials]);
		cache_get_value_name_int(0, "org_leader", PlayerInfo[playerid][OLeader]);
		cache_get_value_name_int(0, "org_member", PlayerInfo[playerid][OMember]);
		cache_get_value_name_int(0, "org_rank", PlayerInfo[playerid][ORank]);
		cache_get_value_name_int(0, "org_skin", PlayerInfo[playerid][OSkin]);
		cache_get_value_name_int(0, "wanted", PlayerInfo[playerid][Wanted]);
		cache_get_value_name_int(0, "wanted_times", PlayerInfo[playerid][WantedTimes]);
		cache_get_value_name_int(0, "arrested", PlayerInfo[playerid][Arrested]);
		cache_get_value_name_int(0, "arrested_time", PlayerInfo[playerid][ArrestedTime]);
		cache_get_value_name_int(0, "arrested_times", PlayerInfo[playerid][ArrestedTimes]);
		cache_get_value_name_int(0, "driving_licence", PlayerInfo[playerid][DrivingLicence]);
		cache_get_value_name_int(0, "flying_licence", PlayerInfo[playerid][FlyingLicence]);
		cache_get_value_name_int(0, "sailing_licence", PlayerInfo[playerid][SailingLicence]);
		cache_get_value_name_int(0, "muted", PlayerInfo[playerid][Muted]);
		cache_get_value_name_int(0, "muted_time", PlayerInfo[playerid][MutedTime]);
		cache_get_value_name_int(0, "pistol_skill", PlayerInfo[playerid][PistolSkill]);
		cache_get_value_name_int(0, "silenced_skill", PlayerInfo[playerid][SilencedSkill]);
		cache_get_value_name_int(0, "desert_skill", PlayerInfo[playerid][DesertSkill]);
		cache_get_value_name_int(0, "shotgun_skill", PlayerInfo[playerid][ShotgunSkill]);
		cache_get_value_name_int(0, "sawnoff_skil", PlayerInfo[playerid][SawnoffSkill]);
		cache_get_value_name_int(0, "combat_skill", PlayerInfo[playerid][CombatSkill]);
		cache_get_value_name_int(0, "uzi_skill", PlayerInfo[playerid][UziSkill]);
		cache_get_value_name_int(0, "mp5_skill", PlayerInfo[playerid][MP5Skill]);
		cache_get_value_name_int(0, "ak47_skill", PlayerInfo[playerid][AK47Skill]);
		cache_get_value_name_int(0, "m4_skill", PlayerInfo[playerid][M4Skill]);
		cache_get_value_name_int(0, "sniper_skill", PlayerInfo[playerid][SniperSkill]);
		cache_get_value_name_int(0, "fighting_style", PlayerInfo[playerid][FightingStyle]);
		
		PlayerInfo[playerid][Password] = player_password;
		player_age = PlayerInfo[playerid][Age];
		player_sex = GetPlayerGender(playerid);
		player_country = GetPlayerCountry(playerid);
		player_city = GetPlayerCity(playerid);
		
		format(message, sizeof(message), ""TEXT_COLOR_WHITE"Dobrodosli, Vas nalog je pronadjen. \n"TEXT_COLOR_RED"Ime_Prezime: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Pol: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Godina: "TEXT_COLOR_WHITE"%d \n"TEXT_COLOR_RED"Drzava: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Grad: "TEXT_COLOR_WHITE"%s \nUnesite Vasu lozinku da se prijavite", playerName, player_sex, player_age, player_country, player_city);
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

public SavePlayer(playerid)
{
	new query[512];
	
	mysql_format(mysql, query, sizeof(query), "UPDATE Users \
												SET gender = %d, \
													age = %d, \
													country = %d, \
													city = %d, \
													money = %d, \
													spawnX = %f, \
													spawnY = %f, \
													spawnZ = %f, \
													bank_account = %d, \
													bank_money = %d, \
													bank_credit = %d, \
													admin = %d, \
													donator = %d, \
													donator_points = %d, \
													level = %d, \
													respect = %d, \
													hours = %d, \
													play_time = %d, \
													paycheck = %d, \
													dead = %d, \
													kills = %d, \
													deaths = %d, \
													job = %d, \
													job_contract = %d, \
													mobile = %d, \
													mobile_number = %d, \
													mobile_credit = %d \													
												WHERE id = %d",
												PlayerInfo[playerid][Gender],
												PlayerInfo[playerid][Age],												
												PlayerInfo[playerid][Country], 
												PlayerInfo[playerid][City], 
												PlayerInfo[playerid][Money], 
												PlayerInfo[playerid][SpawnX], 
												PlayerInfo[playerid][SpawnY],  
												PlayerInfo[playerid][SpawnZ],
												PlayerInfo[playerid][BankAccount],
												PlayerInfo[playerid][BankMoney],
												PlayerInfo[playerid][BankCredit],
												PlayerInfo[playerid][Admin],
												PlayerInfo[playerid][Donator],
												PlayerInfo[playerid][DonatorPoints],
												PlayerInfo[playerid][Level],
												PlayerInfo[playerid][Respect],
												PlayerInfo[playerid][Hours],
												PlayerInfo[playerid][Playtime],
												PlayerInfo[playerid][PayCheck],
												PlayerInfo[playerid][Dead],
												PlayerInfo[playerid][Kills],
												PlayerInfo[playerid][Deaths],
												PlayerInfo[playerid][Job],
												PlayerInfo[playerid][JobContract],
												PlayerInfo[playerid][Mobile],
												PlayerInfo[playerid][MobileNumber],
												PlayerInfo[playerid][MobileCredit],
												PlayerInfo[playerid][ID]);
	mysql_pquery(mysql, query);
	
	mysql_format(mysql, query, sizeof(query), "UPDATE Users \
												SET address_book = %d, \
													tut = %d, \
													on_tut = %d, \
													detective_points = %d, \
													detective_level = %d, \
													truckman_points = %d, \
													truckman_level = %d, \
													taxi_points = %d, \
													taxi_level = %d, \
													mechanic_points = %d, \
													mechanic_level = %d, \
													drugs = %d, \
													materials = %d, \
													org_leader = %d, \
													org_member = %d, \
													org_rank = %d, \
													org_skin = %d, \
													wanted = %d, \
													wanted_times = %d \												
												WHERE id = %d",
												PlayerInfo[playerid][AddressBook],
												PlayerInfo[playerid][Tut],
												PlayerInfo[playerid][OnTut],
												PlayerInfo[playerid][DetectivePoints],
												PlayerInfo[playerid][DetectiveLevel],
												PlayerInfo[playerid][TruckmanPoints],
												PlayerInfo[playerid][TruckmanLevel],
												PlayerInfo[playerid][TaxiPoints],
												PlayerInfo[playerid][TaxiLevel],
												PlayerInfo[playerid][MechanicPoints],
												PlayerInfo[playerid][MechanicLevel],
												PlayerInfo[playerid][Drugs],
												PlayerInfo[playerid][Materials],
												PlayerInfo[playerid][OLeader],
												PlayerInfo[playerid][OMember],
												PlayerInfo[playerid][ORank],
												PlayerInfo[playerid][OSkin],
												PlayerInfo[playerid][Wanted],
												PlayerInfo[playerid][WantedTimes],
												PlayerInfo[playerid][ID]);
	mysql_pquery(mysql, query);
	
	mysql_format(mysql, query, sizeof(query), "UPDATE Users \
												SET arrested = %d, \
													arrested_time = %d, \
													arrested_times = %d, \
													driving_licence = %d, \
													flying_licence = %d, \
													sailing_licence = %d, \
													muted = %d, \
													muted_time = %d, \
													pistol_skill = %d, \
													silenced_skill = %d, \
													desert_skill = %d, \
													shotgun_skill = %d, \
													sawnoff_skil = %d, \
													combat_skill = %d, \
													uzi_skill = %d, \
													mp5_skill = %d, \
													ak47_skill = %d, \
													m4_skill = %d, \
													sniper_skill = %d, \
													fighting_style = %d \													
												WHERE id = %d",
												PlayerInfo[playerid][Arrested],
												PlayerInfo[playerid][ArrestedTime],
												PlayerInfo[playerid][ArrestedTimes],
												PlayerInfo[playerid][DrivingLicence],
												PlayerInfo[playerid][FlyingLicence],
												PlayerInfo[playerid][SailingLicence],
												PlayerInfo[playerid][Muted],
												PlayerInfo[playerid][MutedTime],
												PlayerInfo[playerid][PistolSkill],
												PlayerInfo[playerid][SilencedSkill],
												PlayerInfo[playerid][DesertSkill],
												PlayerInfo[playerid][ShotgunSkill],
												PlayerInfo[playerid][SawnoffSkill],
												PlayerInfo[playerid][CombatSkill],
												PlayerInfo[playerid][UziSkill],
												PlayerInfo[playerid][MP5Skill],
												PlayerInfo[playerid][AK47Skill],
												PlayerInfo[playerid][M4Skill],
												PlayerInfo[playerid][SniperSkill],
												PlayerInfo[playerid][FightingStyle],
												PlayerInfo[playerid][ID]);
	mysql_pquery(mysql, query);
	
	mysql_format(mysql, query, sizeof(query), "UPDATE Users \
												SET identity_card = %d, \
													banned = %d, \
													banned_time = %d, \
													skin = %d \													
												WHERE id = %d",
												PlayerInfo[playerid][IdentityCard],
												PlayerInfo[playerid][Banned],
												PlayerInfo[playerid][BannedTime],
												PlayerInfo[playerid][Skin],
												PlayerInfo[playerid][ID]);
	mysql_pquery(mysql, query);

	return 1;
}

public OnPlayerSaved(playerid)
{
	return 1;
}

public OnPasswordHashed(playerid)
{
	new query[256], playername[MAX_PLAYER_NAME];
	
    bcrypt_get_hash(PlayerInfo[playerid][Password]);
	PlayerInfo[playerid][Password][2] = 'a'; // Hardcode -> $2a instead of $2y | BCrypt in rails cannot provehicleIDe $2y
	
	GetPlayerName(playerid, playername, sizeof(playername));
	
	mysql_format(mysql, query, sizeof(query), "INSERT INTO Users SET \
												name = '%e', \
												password_digest = '%e'", playername, PlayerInfo[playerid][Password]);
	mysql_tquery(mysql, query, "OnPlayerRegistered", "i", playerid);
	
	ShowPlayerDialog(playerid, DIALOG_SEX, DIALOG_STYLE_LIST, ""TEXT_COLOR_RED"Registracija - Pol", ""TEXT_COLOR_WHITE"Musko\nZensko", "U redu", "Izadji");
}

public OnPasswordChecked(playerid)
{
	new bool:match, message[256], playerName[MAX_PLAYER_NAME], player_age, player_sex[8], player_country[32], player_city[16];
	match = bcrypt_is_equal();
	
	if(match)
	{
		GetPlayerName(playerid, playerName, sizeof(playerName));
		
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
		
		format(message, sizeof(message), ""TEXT_COLOR_WHITE"Lozinka koju ste uneli nije ispravna. \n"TEXT_COLOR_RED"Ime_Prezime: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Pol: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Godina: "TEXT_COLOR_WHITE"%d \n"TEXT_COLOR_RED"Drzava: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Grad: "TEXT_COLOR_WHITE"%s \nPokusajte ponovo. \nUnesite Vasu lozinku da se prijavite", playerName, player_sex, player_age, player_country, player_city);
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
				OwnedVehicles[GlobalVehiclesCounter] = CreateVehicle(VehicleInfo[GlobalVehiclesCounter][Model], VehicleInfo[GlobalVehiclesCounter][ParkX], VehicleInfo[GlobalVehiclesCounter][ParkY], VehicleInfo[GlobalVehiclesCounter][ParkZ], VehicleInfo[GlobalVehiclesCounter][ParkA], VehicleInfo[GlobalVehiclesCounter][Color1], VehicleInfo[GlobalVehiclesCounter][Color2], 0);
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

public InsertVehicle(vehicle_owner, vehicle_model) 
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
													color1 = 1, \
													color2 = 1, \
													paintjob = 9999, \
													locked = 1, \
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
													vehicle_owner,
													vehicle_model);
	mysql_tquery(mysql, query);
}

public SaveVehicle(vehicleID)
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
												VehicleInfo[vehicleID][Owned],
												VehicleInfo[vehicleID][Owner],												
												VehicleInfo[vehicleID][ParkX], 
												VehicleInfo[vehicleID][ParkY], 
												VehicleInfo[vehicleID][ParkZ], 
												VehicleInfo[vehicleID][ParkA], 
												VehicleInfo[vehicleID][Color1], 
												VehicleInfo[vehicleID][Color2], 
												VehicleInfo[vehicleID][Paintjob],
												VehicleInfo[vehicleID][Locked],
												VehicleInfo[vehicleID][Registration],
												VehicleInfo[vehicleID][Spoiler],
												VehicleInfo[vehicleID][Hood],
												VehicleInfo[vehicleID][Roof],
												VehicleInfo[vehicleID][Side_skirt],
												VehicleInfo[vehicleID][Lamps],
												VehicleInfo[vehicleID][Nitro],
												VehicleInfo[vehicleID][Exhaust],
												VehicleInfo[vehicleID][Wheels],
												VehicleInfo[vehicleID][Stereo],
												VehicleInfo[vehicleID][Hydraulics],
												VehicleInfo[vehicleID][Front_bumper],
												VehicleInfo[vehicleID][Rear_bumper],
												VehicleInfo[vehicleID][Vent_right],
												VehicleInfo[vehicleID][Vent_left],
												VehicleInfo[vehicleID][ID]);
	mysql_pquery(mysql, query, "OnVehicleInserted", "i", vehicleID);

	return 1;
}

public OnVehicleInserted(vehicleID)
{
	VehicleInfo[vehicleID][ID] = cache_insert_id();
}


public DeleteVehicle(vehicleID) 
{
	new query[512];
	
	mysql_format(mysql, query, sizeof(query), "DELETE FROM Vehicles \
												WHERE id = %d",
													VehicleInfo[vehicleID][ID]);
	mysql_tquery(mysql, query);
}

public SaveVehicleComponents(vehicleID)
{
	new spoiler, hood, roof, side_skirt, lamps, nitro, exhaust, wheels, stereo, hydraulics, front_bumper, rear_bumper, left_vent, right_vent;
	
	spoiler = GetVehicleComponentInSlot(vehicleID, 0);
	hood = GetVehicleComponentInSlot(vehicleID, 1);
	roof = GetVehicleComponentInSlot(vehicleID, 2);
	side_skirt = GetVehicleComponentInSlot(vehicleID, 3);
	lamps = GetVehicleComponentInSlot(vehicleID, 4);
	nitro = GetVehicleComponentInSlot(vehicleID, 5);
	exhaust = GetVehicleComponentInSlot(vehicleID, 6);
	wheels = GetVehicleComponentInSlot(vehicleID, 7);
	stereo = GetVehicleComponentInSlot(vehicleID, 8);
	hydraulics = GetVehicleComponentInSlot(vehicleID, 9);
	front_bumper = GetVehicleComponentInSlot(vehicleID, 10);
	rear_bumper = GetVehicleComponentInSlot(vehicleID, 11);
	right_vent = GetVehicleComponentInSlot(vehicleID, 12);
	left_vent = GetVehicleComponentInSlot(vehicleID, 13);

	if(spoiler != 0) { VehicleInfo[vehicleID][Spoiler] = spoiler; }
	if(hood != 0) { VehicleInfo[vehicleID][Hood] = hood; }
	if(roof != 0) { VehicleInfo[vehicleID][Roof] = roof; }
	if(side_skirt != 0) { VehicleInfo[vehicleID][Side_skirt] = side_skirt; }
	if(lamps != 0) { VehicleInfo[vehicleID][Lamps] = lamps; }
	if(nitro != 0) { VehicleInfo[vehicleID][Nitro] = nitro; }
	if(exhaust != 0) { VehicleInfo[vehicleID][Exhaust] = exhaust; }
	if(wheels != 0) { VehicleInfo[vehicleID][Wheels] = wheels; }
	if(stereo != 0) { VehicleInfo[vehicleID][Stereo] = stereo; }
	if(hydraulics != 0) { VehicleInfo[vehicleID][Hydraulics] = hydraulics; }
	if(front_bumper != 0) { VehicleInfo[vehicleID][Front_bumper] = front_bumper; }
	if(rear_bumper != 0) { VehicleInfo[vehicleID][Rear_bumper] = rear_bumper; }
	if(right_vent != 0) { VehicleInfo[vehicleID][Vent_right] = right_vent; }
	if(left_vent != 0) { VehicleInfo[vehicleID][Vent_left] = left_vent; }
	
	SaveVehicle(vehicleID);
	
	return 1;
}

public SetVehicleComponents(vehicleID)
{
	if(VehicleInfo[vehicleID][Spoiler] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Spoiler]); }
	if(VehicleInfo[vehicleID][Hood] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Hood]); }
	if(VehicleInfo[vehicleID][Roof] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Roof]); }
	if(VehicleInfo[vehicleID][Side_skirt] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Side_skirt]); }
	if(VehicleInfo[vehicleID][Lamps] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Lamps]); }
	if(VehicleInfo[vehicleID][Nitro] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Nitro]); }
	if(VehicleInfo[vehicleID][Exhaust] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Exhaust]); }
	if(VehicleInfo[vehicleID][Wheels] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Wheels]); }
	if(VehicleInfo[vehicleID][Stereo] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Stereo]); }
	if(VehicleInfo[vehicleID][Hydraulics] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Hydraulics]); }
	if(VehicleInfo[vehicleID][Front_bumper] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Front_bumper]); }
	if(VehicleInfo[vehicleID][Rear_bumper] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Rear_bumper]); }
	if(VehicleInfo[vehicleID][Vent_right] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Vent_right]); }
	if(VehicleInfo[vehicleID][Vent_left] >= 0) { AddVehicleComponent(vehicleID, VehicleInfo[vehicleID][Vent_left]); }
	
	return 1;
}

public RemoveVehicleComponents(vehicleID)
{
    VehicleInfo[vehicleID][Spoiler] = 0;
    VehicleInfo[vehicleID][Hood] = 0;
    VehicleInfo[vehicleID][Roof] = 0;
    VehicleInfo[vehicleID][Side_skirt] = 0;
    VehicleInfo[vehicleID][Lamps] = 0;
    VehicleInfo[vehicleID][Nitro] = 0;
    VehicleInfo[vehicleID][Exhaust] = 0;
    VehicleInfo[vehicleID][Wheels] = 0;
    VehicleInfo[vehicleID][Stereo] = 0;
    VehicleInfo[vehicleID][Hydraulics] = 0;
    VehicleInfo[vehicleID][Front_bumper] = 0;
    VehicleInfo[vehicleID][Rear_bumper] = 0;
    VehicleInfo[vehicleID][Vent_right] = 0;
    VehicleInfo[vehicleID][Vent_left] = 0;
	
    SaveVehicle(vehicleID);
	return 1;
}

public GetVehiclePrice(vehicleID)
{
	new model = GetVehicleModel(vehicleID);
	if(model == 400) return 3700; // LANDSTALKER
	else if(model == 401) return 3000; // BRAVURA
	else if(model == 402) return 5000; // BUFFALO
	else if(model == 403) return 20000; // LINERUNER
	else if(model == 404) return 3000; // PERENNIEL
	else if(model == 405) return 3700; // SENTINEL
	else if(model == 406) return 9999; // DUMPER (NO SALE)
	else if(model == 407) return 9999; // FIRETRUCK (NO SALE)
	else if(model == 408) return 9999; // TRASHMASTER (NO SALE)
	else if(model == 409) return 10000; // STRETCH
	else if(model == 410) return 3000; // MANANA
	else if(model == 411) return 9999; // INFERNUS (DONATE)
	else if(model == 412) return 2200; // VOODOO
	else if(model == 413) return 2500; // PONY
	else if(model == 414) return 9999; // MULE (NO SALE)
	else if(model == 415) return 9999; // CHEETAH (DONATE)
	else if(model == 416) return 9999; // AMBULANCE (NO SALE)
	else if(model == 417) return 9999; // LEVIATHAN (HELICOPTER)
	else if(model == 418) return 2900; // MOONBEAM
	else if(model == 419) return 2200; // ESPERANTO
	else if(model == 420) return 10000; // TAXI
	else if(model == 421) return 4700; // WASHINGTON
	else if(model == 422) return 3000; // BOBCAT
	else if(model == 423) return 10000; // MR WHOOPE
	else if(model == 424) return 7000; // BF INJECTION
	else if(model == 425) return 9999; // HUNTER (NO SALE)
	else if(model == 426) return 4300; // PREMIER
	else if(model == 427) return 9999; // ENFORCER (NO SALE)
	else if(model == 428) return 5000; // SECURICAR (NO SALE)
	else if(model == 429) return 7500; // BANSHEE
	else if(model == 430) return 9999; // BOAT
	else if(model == 431) return 9999; // BUS (NO SALE)
	else if(model == 432) return 9999; // TANK (NO SALE)
	else if(model == 433) return 9999; // ARMY VEHICLE (NO SALE)
	else if(model == 434) return 10000; // HOTKNIFE
	else if(model == 435) return 9999; // TRAILER (NO SALE)
	else if(model == 436) return 3000; // PREVION
	else if(model == 437) return 9999; // BUS (NO SALE)
	else if(model == 438) return 6000; // CABBIE (TAXI)
	else if(model == 439) return 3000; // STALLION
	else if(model == 440) return 2500; // RUMPO
	else if(model == 441) return 9999; // RC BANDIT (NO SALE)
	else if(model == 442) return 9999; // ROMERO
	else if(model == 443) return 20000; // PACKER (NO SALE)
	else if(model == 444) return 9999; // MONSTER (NO SALE)
	else if(model == 445) return 4300; // ADMIRAL
	else if(model == 446) return 9999; // BOAT
	else if(model == 447) return 9999; // SEASPARROW (HELICOPTER)
	else if(model == 448) return 9999; // PIZZA
	else if(model == 449) return 9999; // TRAM (NO SALE)
	else if(model == 450) return 9999; // TRAILER (NO SALE)
	else if(model == 451) return 9999; // TURISMO (DONATE)
	else if(model == 452) return 9999; // SPEEDER (BOAT)
	else if(model == 453) return 9999; // REEFER (BOAT)
	else if(model == 454) return 9999; // TROPIC (BOAT)
	else if(model == 455) return 10000; // FLATBED (NO SALE)
	else if(model == 456) return 10000; // YANKEE (NO SALE)
	else if(model == 457) return 9999; // CADDY (NO SALE)
	else if(model == 458) return 4700; // SOLAIR
	else if(model == 459) return 9999; // TOPFUN VAN
	else if(model == 460) return 9999; // SKIPPER (AIRPLANE)
	else if(model == 461) return 3800; // PCJ-600 (BIKE)
	else if(model == 462) return 1500; // FAGGIO (BIKE)
	else if(model == 463) return 3700; // FREEWAY (BIKE)
	else if(model == 464) return 9999; // RC BARON (NO SALE)
	else if(model == 465) return 9999; // RC RAIDER (NO SALE)
	else if(model == 466) return 3000; // GLENDALE
	else if(model == 467) return 3000; // OCEANIC
	else if(model == 468) return 3000; // SANCHEZ (BIKE)
	else if(model == 469) return 9999; // SPARROW (HELICOPTER)
	else if(model == 470) return 7000; // PATRIOT (NO SALE)
	else if(model == 471) return 2700; // QUAD (BIKE)
	else if(model == 472) return 9999; // COASTGUARD (BOAT)
	else if(model == 473) return 9999; // DINGHY (BOAT)
	else if(model == 474) return 3000; // HERMES
	else if(model == 475) return 3000; // SABRE
	else if(model == 476) return 9999; // RUSTLER (AIRPLANE)
	else if(model == 477) return 9000; // ZR-350
	else if(model == 478) return 3000; // WALTON
	else if(model == 479) return 3800; // REGINA
	else if(model == 480) return 6700; // COMET
	else if(model == 481) return 650; // BMX (BIKE)
	else if(model == 482) return 2700; // BURRITO
	else if(model == 483) return 4000; // CAMPER
	else if(model == 484) return 9999; // MARQUIS (BOAT)
	else if(model == 485) return 9999; // BAGGAGE (NO SALE)
	else if(model == 486) return 9999; // BAGGER (NO SALE)
	else if(model == 487) return 9999; // MAVERICK (HELICOPTER)
	else if(model == 488) return 9999; // SAN NEWS MAVERICK (NO SALE)
	else if(model == 489) return 4000; // RANCHER
	else if(model == 490) return 9999; // FBI RANCHER (NO SALE)
	else if(model == 491) return 3300; // VIRGO
	else if(model == 492) return 4500; // GREENVOD
	else if(model == 493) return 9999; // JETMAX (BOAT)
	else if(model == 494) return 9999; // HOTRING (NO SALE)
	else if(model == 495) return 9000; // SANDKING
	else if(model == 496) return 1800; // BLISTA COMPACT
	else if(model == 497) return 9999; // POLICE MAVERICK (NO SALE)
	else if(model == 498) return 9999; // BOXVILLE (NO SALE)
	else if(model == 499) return 9999; // BENSON (NO SALE)
	else if(model == 500) return 3300; // MESA
	else if(model == 501) return 9999; // RC GOBLIN (NO SALE)
	else if(model == 502) return 9999; // HOTRING (NO SALE)
	else if(model == 503) return 9999; // HOTRING (NO SALE)
	else if(model == 504) return 9999; // BLOODRING RANGER (NO SALE)
	else if(model == 505) return 7000; // RANCHER
	else if(model == 506) return 10000; // SUPER GT
	else if(model == 507) return 4500; // ELEGANT
	else if(model == 508) return 7500; // JOURNEY (NO SALE)
	else if(model == 509) return 600; // BIKE (BIKE)
	else if(model == 510) return 850; // MOUNTAIN BIKE (BIKE)
	else if(model == 511) return 9999; // BEAGLE (AIRPLANE)
	else if(model == 512) return 9999; // CROPDUSTER (AIRPLANE)
	else if(model == 513) return 9999; // STUNTPLANE (AIRPLANE)
	else if(model == 514) return 9999; // TANKER
	else if(model == 515) return 9999; // ROADTRAIN
	else if(model == 516) return 3500; // NEBULA
	else if(model == 517) return 3500; // MAJESTIC
	else if(model == 518) return 2500; // BUCCANEER
	else if(model == 519) return 9999; // SHAMAL (AIRPLANE)
	else if(model == 520) return 9999; // HYDRA (NO SALE)
	else if(model == 521) return 4500; // FCR-900 (BIKE)
	else if(model == 522) return 9999; // NRG (NO SALE)
	else if(model == 523) return 9999; // PD BIKE (NO SALE)
	else if(model == 524) return 9999; // TRUCK
	else if(model == 525) return 9999; // TRUCK
	else if(model == 526) return 3700; // FORTUNE
	else if(model == 527) return 3700; // CADRONA
	else if(model == 528) return 9999; // FBI TRUCK (NO SALE)
	else if(model == 529) return 4000; // WILLARD
	else if(model == 530) return 9999; // FORKLIFT (NO SALE)
	else if(model == 531) return 9999; // TRACTOR (NO SALE)
	else if(model == 532) return 9999; // COMBINE (NO SALE)
	else if(model == 533) return 2500; // FELTZER
	else if(model == 534) return 2800; // REMINGTON
	else if(model == 535) return 3100; // SLAMVAN
	else if(model == 536) return 3500; // BLADE
	else if(model == 537) return 9999; // TRAIN (NO SALE)
	else if(model == 538) return 9999; // TRAIN (NO SALE)
	else if(model == 539) return 10000; // VORTEX
	else if(model == 540) return 2700; // VINCENT
	else if(model == 541) return 9999; // BULLET (DONATE)
	else if(model == 542) return 3200; // CLOVER
	else if(model == 543) return 3000; // SADLER
	else if(model == 544) return 9999; // FIRETRUCK (NO SALE)
	else if(model == 545) return 2000; // HUSTLER
	else if(model == 546) return 3000; // INTRUDER
	else if(model == 547) return 3000; // PRIMO
	else if(model == 548) return 9999; // CARGOBOB (HELICOPTER)
	else if(model == 549) return 3900; // TAMPA
	else if(model == 550) return 3000; // SUNRISE
	else if(model == 551) return 19000; // MERIT
	else if(model == 552) return 20000; // UTILITY VAN (NO SALE)
	else if(model == 553) return 200; // NEVADA (AIRPLANE)
	else if(model == 554) return 3300; // YOSEMITE
	else if(model == 555) return 3000; // WINDSOR
	else if(model == 556) return 40000; // MONSTER A (NO SALE)
	else if(model == 557) return 40000; // MONSTER B (NO SALE)
	else if(model == 558) return 6000; // URANUS
	else if(model == 559) return 7000; // JESTER
	else if(model == 560) return 9500; // STRATUM
	else if(model == 561) return 6500; // SULTAN
	else if(model == 562) return 10000; // ELEGY
	else if(model == 563) return 200; // RAINDANCE (HELICOPTER)
	else if(model == 564) return 500; // RC TIGER (NO SALE)
	else if(model == 565) return 7500; // FLASH
	else if(model == 566) return 35000; // TAHOMA
	else if(model == 567) return 4000; // SAVANNA
	else if(model == 568) return 10000; // BANDITO
	else if(model == 569) return 5000; // FREIGHT FLAT TRAILER (NO SALE)
	else if(model == 570) return 5000; // STREAK TRAILER (NO SALE)
	else if(model == 571) return 3000; // KART
	else if(model == 572) return 15000; // MOWER (NO SALE)
	else if(model == 553) return 40000; // DUNE
	else if(model == 574) return 15000; // SWEEPER (NO SALE)
	else if(model == 575) return 19000; // BROADWAY
	else if(model == 576) return 19000; // TORNADO
	else if(model == 577) return 200; // AT400 (AIRPLANE)
	else if(model == 578) return 5000; // DFT-30 (NO SALE)
	else if(model == 579) return 17000; // HUNTLEY
	else if(model == 580) return 4000; // STAFFORD
	else if(model == 581) return 3200; // BF-400 (BIKE)
	else if(model == 582) return 20000; // NEWSVAN (NO SALE)
	else if(model == 583) return 15000; // TUG (NO SALE)
	else if(model == 584) return 35000; // PETROL TRAILER (NO SALE)
	else if(model == 585) return 35000; // EMPEROR
	else if(model == 586) return 2700; // WAYFARER (BIKE)
	else if(model == 587) return 3500; // EUROS
	else if(model == 588) return 10000; // HOTDOG
	else if(model == 589) return 3000; // CLUB
	else if(model == 590) return 35000; // FREIGHT BOX TRAILER (NO SALE)
	else if(model == 591) return 35000; // ARTICLE TRAILER (NO SALE)
	else if(model == 592) return 200; // ANDROMADA (AIRPLANE)
	else if(model == 593) return 200; // DODO
	else if(model == 594) return 500; // RC CAM (NO SALE)
	else if(model == 595) return 200; // LAUNCH (BOAT)
	else if(model == 596) return 25000; // POLICE CAR (LShowPlayerDialog) (NO SALE)
	else if(model == 597) return 25000; // POLICE CAR (SFPD) (NO SALE)
	else if(model == 598) return 25000; // POLICE CAR (LVPD) (NO SALE)
	else if(model == 599) return 25000; // POLICE RANGER (NO SALE)
	else if(model == 600) return 26000; // PICADOR
	else if(model == 601) return 40000; // S.W.A.T. (NO SALE)
	else if(model == 602) return 3700; // ALPHA
	else if(model == 603) return 4500; // PHOENIX
	else if(model == 604) return 9000; // GLENDALE SHIT (NO SALE)
	else if(model == 605) return 9000; // SADLER SHIT (NO SALE)
	else if(model == 606) return 9000; // BAGGAGE TRAILER A (NO SALE)
	else if(model == 607) return 9000; // BAGGAGE TRAILER B (NO SALE)
	else if(model == 608) return 9000; // TUG STAIRS TRAILER (NO SALE)
	else if(model == 609) return 22000; // BOXVILLE (NO SALE)
	else if(model == 610) return 9000; // FARM TRAILER (NO SALE)
	else if(model == 611) return 9000; // UTILITY TRAILER  (NO SALE)
	else return 0;
}

public GetVehicleName(vehicleID, model[], len)
{
	new model_id = GetVehicleModel(vehicleID);
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
	else if(model_id == 596) return format(model, len, "LShowPlayerDialog Patrol Car", 0);
	else if(model_id == 597) return format(model, len, "FBI Patrol Car", 0);
	else if(model_id == 598) return format(model, len, "NG Patrol Car", 0);
	else if(model_id == 599) return format(model, len, "LShowPlayerDialog Patrol Ranger", 0);
	else if(model_id == 600) return format(model, len, "Picador", 0);
	else if(model_id == 601) return format(model, len, "S.W.A.T Tank", 0);
    else if(model_id == 602) return format(model, len, "Alpha", 0);
	else if(model_id == 603) return format(model, len, "Phoenix", 0);
	else if(model_id == 609) return format(model, len, "Boxville", 0);
	
	return 0;
}

public VehicleStopOffer(playerid, target)
{
    VehicleSellOffer[playerid] = 9999;
	VehicleBuyOffer[playerid] = 9999;
 	VehicleForOffer[playerid] = 9999;
	VehiclePlayerOffer[playerid] = 9999;
	VehicleOfferPrice[playerid] = 0;

	VehicleSellOffer[target] = 9999;
	VehicleBuyOffer[target] = 9999;
 	VehicleForOffer[target] = 9999;
	VehiclePlayerOffer[target] = 9999;
	VehicleOfferPrice[target] = 0;
}

public HouseStopOffer(playerid, target)
{
    HouseSellOffer[playerid] = 9999;
	HouseBuyOffer[playerid] = 9999;
 	HouseForOffer[playerid] = 9999;
	HousePlayerOffer[playerid] = 9999;
	HouseOfferPrice[playerid] = 0;

	HouseSellOffer[target] = 9999;
	HouseBuyOffer[target] = 9999;
 	HouseForOffer[target] = 9999;
	HousePlayerOffer[target] = 9999;
	HouseOfferPrice[target] = 0;
}

public BusinessStopOffer(playerid, target)
{
    BusinessSellOffer[playerid] = 9999;
	BusinessBuyOffer[playerid] = 9999;
 	BusinessForOffer[playerid] = 9999;
	BusinessPlayerOffer[playerid] = 9999;
	BusinessOfferPrice[playerid] = 0;

	BusinessSellOffer[target] = 9999;
	BusinessBuyOffer[target] = 9999;
 	BusinessForOffer[target] = 9999;
	BusinessPlayerOffer[target] = 9999;
	BusinessOfferPrice[target] = 0;
}

stock GetVehicleOwnerName(vehicleID)
{
	new query[256], playerName[MAX_PLAYER_NAME];
	
	mysql_format(mysql, query, sizeof(query), "SELECT Name \
												FROM Users \
												WHERE ID = %d", VehicleInfo[vehicleID][Owner]);
    mysql_query(mysql, query);
	cache_get_value_name(0, "Name", playerName);
	
	return playerName;
}

stock GetHouseOwnerName(house_id)
{
	new query[256], playerName[MAX_PLAYER_NAME];
	
	mysql_format(mysql, query, sizeof(query), "SELECT Name \
												FROM Users \
												WHERE ID = %d", HouseInfo[house_id][Owner]);
    mysql_query(mysql, query);
	cache_get_value_name(0, "Name", playerName);
	
	return playerName;
}

stock GetBusinessOwnerName(business_id)
{
	new query[256], playerName[MAX_PLAYER_NAME];
	
	mysql_format(mysql, query, sizeof(query), "SELECT Name \
												FROM Users \
												WHERE ID = %d", BusinessInfo[business_id][Owner]);
    mysql_query(mysql, query);
	cache_get_value_name(0, "Name", playerName);
	
	return playerName;
}

public LoadHouses()
{
	new query[256];
	
	mysql_format(mysql, query, sizeof(query), "SELECT * FROM houses");
	mysql_tquery(mysql, query, "OnHousesLoaded");
	
	return 0;
}

public OnHousesLoaded()
{
	if(cache_num_rows() > 0)
	{
		for(new i = 0; i < cache_num_rows(); i++)
		{
			cache_get_value_name_int(i, "id", HouseInfo[GlobalHousesCounter][ID]);
			cache_get_value_name_int(i, "owned", HouseInfo[GlobalHousesCounter][Owned]);
			cache_get_value_name_int(i, "user_id", HouseInfo[GlobalHousesCounter][Owner]);
			cache_get_value_name_int(i, "price", HouseInfo[GlobalHousesCounter][Price]);
			cache_get_value_name_int(i, "locked", HouseInfo[GlobalHousesCounter][Locked]);
			cache_get_value_name_float(i, "enterX", HouseInfo[GlobalHousesCounter][EnterX]);
			cache_get_value_name_float(i, "enterY", HouseInfo[GlobalHousesCounter][EnterY]);
			cache_get_value_name_float(i, "enterZ", HouseInfo[GlobalHousesCounter][EnterZ]);
			cache_get_value_name_float(i, "enterA", HouseInfo[GlobalHousesCounter][EnterA]);
			cache_get_value_name_float(i, "exitX", HouseInfo[GlobalHousesCounter][ExitX]);
			cache_get_value_name_float(i, "exitY", HouseInfo[GlobalHousesCounter][ExitY]);
			cache_get_value_name_float(i, "exitZ", HouseInfo[GlobalHousesCounter][ExitZ]);
			cache_get_value_name_float(i, "exitA", HouseInfo[GlobalHousesCounter][ExitA]);
			cache_get_value_name_int(i, "outside_interior", HouseInfo[GlobalHousesCounter][OutsideInterior]);
			cache_get_value_name_int(i, "outside_virtual_world", HouseInfo[GlobalHousesCounter][OutsideVirtualWorld]);
			cache_get_value_name_int(i, "inside_interior", HouseInfo[GlobalHousesCounter][InsideInterior]);
			cache_get_value_name_int(i, "inside_virtual_world", HouseInfo[GlobalHousesCounter][InsideVirtualWorld]);
			cache_get_value_name_int(i, "slot1", HouseInfo[GlobalHousesCounter][Slot1]);
			cache_get_value_name_int(i, "slot1_ammo", HouseInfo[GlobalHousesCounter][Slot1_ammo]);
			cache_get_value_name_int(i, "slot2", HouseInfo[GlobalHousesCounter][Slot2]);
			cache_get_value_name_int(i, "slot2_ammo", HouseInfo[GlobalHousesCounter][Slot2_ammo]);
			cache_get_value_name_int(i, "slot3", HouseInfo[GlobalHousesCounter][Slot2]);
			cache_get_value_name_int(i, "slot3_ammo", HouseInfo[GlobalHousesCounter][Slot2_ammo]);
			cache_get_value_name_int(i, "materials", HouseInfo[GlobalHousesCounter][Materials]);
			cache_get_value_name_int(i, "drugs", HouseInfo[GlobalHousesCounter][Drugs]);
			
			if(HouseInfo[GlobalHousesCounter][Owned] == 0)
			{
				new message[256];
				format(message, sizeof(message), ""TEXT_COLOR_WHITE" Ova kuca nema vlasnika !\n "TEXT_COLOR_RED"ID kuce"TEXT_COLOR_WHITE": %d \n "TEXT_COLOR_RED"Cena kuce"TEXT_COLOR_WHITE": %d \n Da kupite ovu kucu \n kucajte "TEXT_COLOR_RED"/buyhouse", HouseInfo[GlobalHousesCounter][ID], HouseInfo[GlobalHousesCounter][Price]);
				HouseInfo[GlobalHousesCounter][Icon] = CreatePickup(1273, 1, HouseInfo[GlobalHousesCounter][EnterX], HouseInfo[GlobalHousesCounter][EnterY], HouseInfo[GlobalHousesCounter][EnterZ], HouseInfo[GlobalHousesCounter][OutsideVirtualWorld]);
				HouseLabelArray[GlobalHousesCounter] = Create3DTextLabel(message, -1, HouseInfo[GlobalHousesCounter][EnterX], HouseInfo[GlobalHousesCounter][EnterY], HouseInfo[GlobalHousesCounter][EnterZ], 10.0, HouseInfo[GlobalHousesCounter][OutsideVirtualWorld], 0);
				GlobalHousesCounter++;
			}
			else
			{
				new message[256];
				format(message, sizeof(message), ""TEXT_COLOR_WHITE" Ova kuca ima vlasnika !\n "TEXT_COLOR_RED"Vlasnik kuce"TEXT_COLOR_WHITE": %s\n "TEXT_COLOR_RED"ID Kuce"TEXT_COLOR_WHITE": %d", GetHouseOwnerName(GlobalHousesCounter), HouseInfo[GlobalHousesCounter][ID]);
				HouseInfo[GlobalHousesCounter][Icon] = CreatePickup(1272, 1, HouseInfo[GlobalHousesCounter][EnterX], HouseInfo[GlobalHousesCounter][EnterY], HouseInfo[GlobalHousesCounter][EnterZ], HouseInfo[GlobalHousesCounter][OutsideVirtualWorld]);
				HouseLabelArray[GlobalHousesCounter] = Create3DTextLabel(message, -1, HouseInfo[GlobalHousesCounter][EnterX], HouseInfo[GlobalHousesCounter][EnterY], HouseInfo[GlobalHousesCounter][EnterZ], 10.0, HouseInfo[GlobalHousesCounter][OutsideVirtualWorld], 0);
				GlobalHousesCounter++;
			}		
		}
	}
}

public InsertHouse(house_id) 
{
	new query[512];
	
	mysql_format(mysql, query, sizeof(query), "INSERT INTO Houses SET \
													owned = 0, \
													user_id = %d, \
													price = %d, \
													locked = 1, \
													enterX = %f, \
													enterY = %f, \
													enterZ = %f, \
													enterA = %f, \
													exitX = %f, \
													exitY = %f, \
													exitZ = %f, \
													exitA = %f, \
													outside_interior = %d, \
													outside_virtual_world = %d, \
													inside_interior = %d, \
													inside_virtual_world = %d, \
													slot1 = 0, \
													slot1_ammo = 0, \
													slot2 = 0, \
													slot2_ammo = 0, \
													slot3 = 0, \
													slot3_ammo = 0, \
													materials = 0, \
													drugs = 0",
													HouseInfo[house_id][Owner],
													HouseInfo[house_id][Price],
													HouseInfo[house_id][EnterX],
													HouseInfo[house_id][EnterY],
													HouseInfo[house_id][EnterZ],
													HouseInfo[house_id][EnterA],
													HouseInfo[house_id][ExitX],
													HouseInfo[house_id][ExitY],
													HouseInfo[house_id][ExitZ],
													HouseInfo[house_id][ExitA],
													HouseInfo[house_id][OutsideInterior],
													HouseInfo[house_id][OutsideVirtualWorld],
													HouseInfo[house_id][InsideInterior],
													HouseInfo[house_id][InsideVirtualWorld]);
	mysql_tquery(mysql, query, "OnHouseInserted", "i", house_id);
}

public OnHouseInserted(house_id)
{
	new message[512];
	
	HouseInfo[house_id][ID] = cache_insert_id();
	
	if(HouseInfo[house_id][Icon]) DestroyPickup(HouseInfo[house_id][Icon]);
    HouseInfo[house_id][Icon] = CreatePickup(1273, 1, HouseInfo[house_id][EnterX], HouseInfo[house_id][EnterY], HouseInfo[house_id][EnterZ], HouseInfo[house_id][OutsideVirtualWorld]);

	format(message, sizeof(message), ""TEXT_COLOR_WHITE" Ova kuca nema vlasnika !\n "TEXT_COLOR_BLUE"ID kuce"TEXT_COLOR_WHITE": %d \n "TEXT_COLOR_BLUE"Cena kuce"TEXT_COLOR_WHITE": %d \n "TEXT_COLOR_RED"Da kupite ovu kucu \n kucajte /h buy", house_id, HouseInfo[house_id][Price]);
    HouseLabelArray[house_id] = Create3DTextLabel(message, -1, HouseInfo[house_id][EnterX], HouseInfo[house_id][EnterY], HouseInfo[house_id][EnterZ], 20.0, HouseInfo[house_id][OutsideVirtualWorld]);
}

public DeleteHouse(house_id) 
{
	new query[512];
	
	mysql_format(mysql, query, sizeof(query), "DELETE FROM Houses \
												WHERE id = %d",
													HouseInfo[house_id][ID]);
	mysql_tquery(mysql, query);
}

public SaveHouse(house_id)
{
	new query[512];
	
	mysql_format(mysql, query, sizeof(query), "UPDATE Houses \
												SET owned = %d, \
													user_id = %d, \
													price = %d, \
													locked = %d, \
													enterX = %f, \
													enterY = %f, \
													enterZ = %f, \
													enterA = %f, \
													exitX = %f, \
													exitY = %f, \
													exitZ = %f, \
													exitA = %f, \
													outside_interior = %d, \
													outside_virtual_world = %d, \
													inside_interior = %d, \
													inside_virtual_world = %d, \
													slot1 = %d, \
													slot1_ammo = %d, \
													slot2 = %d, \
													slot2_ammo = %d, \
													slot3 = %d, \
													slot3_ammo = %d, \
													materials = %d, \
													drugs = %d \												
												WHERE id = %d",
												HouseInfo[house_id][Owned],
												HouseInfo[house_id][Owner],												
												HouseInfo[house_id][Price],
												HouseInfo[house_id][Locked],
												HouseInfo[house_id][EnterX], 
												HouseInfo[house_id][EnterY], 
												HouseInfo[house_id][EnterZ], 
												HouseInfo[house_id][EnterA], 
												HouseInfo[house_id][ExitX],
												HouseInfo[house_id][ExitY],
												HouseInfo[house_id][ExitZ],
												HouseInfo[house_id][ExitA],
												HouseInfo[house_id][OutsideInterior],
												HouseInfo[house_id][OutsideVirtualWorld],
												HouseInfo[house_id][InsideInterior],
												HouseInfo[house_id][InsideVirtualWorld],
												HouseInfo[house_id][Slot1],
												HouseInfo[house_id][Slot1_ammo],
												HouseInfo[house_id][Slot2],
												HouseInfo[house_id][Slot2_ammo],
												HouseInfo[house_id][Slot3],
												HouseInfo[house_id][Slot3_ammo],
												HouseInfo[house_id][Materials],
												HouseInfo[house_id][Drugs],
												HouseInfo[house_id][ID]);
	mysql_pquery(mysql, query);

	return 1;
}

public LoadBusinesses()
{
	new query[256];
	
	mysql_format(mysql, query, sizeof(query), "SELECT * FROM businesses");
	mysql_tquery(mysql, query, "OnBusinessesLoaded");
	
	return 0;
}

public OnBusinessesLoaded()
{
	if(cache_num_rows() > 0)
	{
		for(new i = 0; i < cache_num_rows(); i++)
		{
			cache_get_value_name_int(i, "id", BusinessInfo[GlobalBusinessesCounter][ID]);
			cache_get_value_name_int(i, "owned", BusinessInfo[GlobalBusinessesCounter][Owned]);
			cache_get_value_name_int(i, "user_id", BusinessInfo[GlobalBusinessesCounter][Owner]);
			cache_get_value_name_int(i, "name", BusinessInfo[GlobalBusinessesCounter][Name]);
			cache_get_value_name_int(i, "price", BusinessInfo[GlobalBusinessesCounter][Price]);
			cache_get_value_name_int(i, "locked", BusinessInfo[GlobalBusinessesCounter][Locked]);
			cache_get_value_name_int(i, "money", BusinessInfo[GlobalBusinessesCounter][Money]);
			cache_get_value_name_int(i, "enter_fee", BusinessInfo[GlobalBusinessesCounter][EnterFee]);
			cache_get_value_name_int(i, "business_type", BusinessInfo[GlobalBusinessesCounter][Type]);
			cache_get_value_name_float(i, "enterX", BusinessInfo[GlobalBusinessesCounter][EnterX]);
			cache_get_value_name_float(i, "enterY", BusinessInfo[GlobalBusinessesCounter][EnterY]);
			cache_get_value_name_float(i, "enterZ", BusinessInfo[GlobalBusinessesCounter][EnterZ]);
			cache_get_value_name_float(i, "enterA", BusinessInfo[GlobalBusinessesCounter][EnterA]);
			cache_get_value_name_float(i, "exitX", BusinessInfo[GlobalBusinessesCounter][ExitX]);
			cache_get_value_name_float(i, "exitY", BusinessInfo[GlobalBusinessesCounter][ExitY]);
			cache_get_value_name_float(i, "exitZ", BusinessInfo[GlobalBusinessesCounter][ExitZ]);
			cache_get_value_name_float(i, "exitA", BusinessInfo[GlobalBusinessesCounter][ExitA]);
			cache_get_value_name_int(i, "outside_interior", BusinessInfo[GlobalBusinessesCounter][OutsideInterior]);
			cache_get_value_name_int(i, "outside_virtual_world", BusinessInfo[GlobalBusinessesCounter][OutsideVirtualWorld]);
			cache_get_value_name_int(i, "inside_interior", BusinessInfo[GlobalBusinessesCounter][InsideInterior]);
			cache_get_value_name_int(i, "inside_virtual_world", BusinessInfo[GlobalBusinessesCounter][InsideVirtualWorld]);
			
			BusinessInfo[GlobalBusinessesCounter][Icon] = CreatePickup(1274, 1, BusinessInfo[GlobalBusinessesCounter][EnterX], BusinessInfo[GlobalBusinessesCounter][EnterY], BusinessInfo[GlobalBusinessesCounter][EnterZ], BusinessInfo[GlobalBusinessesCounter][OutsideVirtualWorld]);
			if(BusinessInfo[GlobalBusinessesCounter][Owned] == 0)
			{
				new message[256];
				format(message, sizeof(message), "Ovaj biznis nema vlasnika!\n"TEXT_COLOR_RED"Ime"TEXT_COLOR_WHITE": %s\n"TEXT_COLOR_RED"ID"TEXT_COLOR_WHITE": %d\n"TEXT_COLOR_RED"Cena"TEXT_COLOR_WHITE": %d\n"TEXT_COLOR_WHITE"Da kupite biznis, kucajte /b buy", BusinessInfo[GlobalBusinessesCounter][Name], BusinessInfo[GlobalBusinessesCounter][ID], BusinessInfo[GlobalBusinessesCounter][Price]);
				BusinessLabels[GlobalBusinessesCounter] = Create3DTextLabel(message, -1, BusinessInfo[GlobalBusinessesCounter][EnterX], BusinessInfo[GlobalBusinessesCounter][EnterY], BusinessInfo[GlobalBusinessesCounter][EnterZ], 20.0, BusinessInfo[GlobalBusinessesCounter][OutsideVirtualWorld], 0);
				GlobalBusinessesCounter++;
			}
			if(BusinessInfo[GlobalBusinessesCounter][Owned] == 1)
			{
				new message[512];
				format(message, sizeof(message), ""TEXT_COLOR_WHITE"Ovaj biznis ima vlasnika!\n "TEXT_COLOR_RED"Ime"TEXT_COLOR_WHITE": %s\n"TEXT_COLOR_RED"ID"TEXT_COLOR_WHITE": %d\n"TEXT_COLOR_RED"Vlasnik"TEXT_COLOR_WHITE": %s\n"TEXT_COLOR_RED"Cena ulaza"TEXT_COLOR_WHITE": %d", BusinessInfo[GlobalBusinessesCounter][Name], BusinessInfo[GlobalBusinessesCounter][ID], GetBusinessOwnerName(BusinessInfo[GlobalBusinessesCounter][Owner]), BusinessInfo[GlobalBusinessesCounter][EnterFee]);
				BusinessLabels[GlobalBusinessesCounter] = Create3DTextLabel(message, -1, BusinessInfo[GlobalBusinessesCounter][EnterX], BusinessInfo[GlobalBusinessesCounter][EnterY], BusinessInfo[GlobalBusinessesCounter][EnterZ], 20.0, BusinessInfo[GlobalBusinessesCounter][OutsideVirtualWorld], 0);
				GlobalBusinessesCounter++;
			}	
		}
	}
}

public InsertBusiness(business_id) 
{
	new query[512];
	
	mysql_format(mysql, query, sizeof(query), "INSERT INTO Businesses SET \
													owned = 0, \
													user_id = %d, \
													name = %s, \
													price = %d, \
													locked = 0, \
													money = 0, \
													enter_fee = 0, \
													enterX = %f, \
													enterY = %f, \
													enterZ = %f, \
													enterA = %f, \
													exitX = %f, \
													exitY = %f, \
													exitZ = %f, \
													exitA = %f, \
													business_type = %d, \
													outside_interior = %d, \
													outside_virtual_world = %d, \
													inside_interior = %d, \
													inside_virtual_world = %d",
													BusinessInfo[business_id][Owner],
													BusinessInfo[business_id][Name],
													BusinessInfo[business_id][Price],
													BusinessInfo[business_id][EnterX],
													BusinessInfo[business_id][EnterY],
													BusinessInfo[business_id][EnterZ],
													BusinessInfo[business_id][EnterA],
													BusinessInfo[business_id][ExitX],
													BusinessInfo[business_id][ExitY],
													BusinessInfo[business_id][ExitZ],
													BusinessInfo[business_id][ExitA],
													BusinessInfo[business_id][Type],
													BusinessInfo[business_id][OutsideInterior],
													BusinessInfo[business_id][OutsideVirtualWorld],
													BusinessInfo[business_id][InsideInterior],
													BusinessInfo[business_id][InsideVirtualWorld]);
	mysql_tquery(mysql, query, "OnBusinessInserted", "i", business_id);
}

public OnBusinessInserted(business_id)
{
	new message[256];

	BusinessInfo[business_id][ID] = cache_insert_id();
	
	if(BusinessInfo[business_id][ExitIcon]) DestroyPickup(BusinessInfo[business_id][ExitIcon]);
    if(BusinessInfo[business_id][Icon]) DestroyPickup(BusinessInfo[business_id][Icon]);
    BusinessInfo[business_id][Icon] = CreatePickup(1274, 1, BusinessInfo[business_id][EnterX], BusinessInfo[business_id][EnterY], BusinessInfo[business_id][EnterZ], BusinessInfo[business_id][OutsideVirtualWorld]);

    format(message, sizeof(message), ""TEXT_COLOR_WHITE" Ovaj biznis vlasnika !\n "TEXT_COLOR_BLUE"Cena biznisa"TEXT_COLOR_WHITE": %d \n "TEXT_COLOR_BLUE"ID"TEXT_COLOR_WHITE": %d \n Da kupite ovaj biznis \n kucajte "TEXT_COLOR_BLUE"/kupibiznis", BusinessInfo[business_id][Price], BusinessInfo[business_id][ID]);
    BusinessLabels[business_id] = Create3DTextLabel(message, -1, BusinessInfo[business_id][EnterX], BusinessInfo[business_id][EnterY], BusinessInfo[business_id][EnterZ], 20.0, BusinessInfo[business_id][OutsideVirtualWorld]);

}

public SaveBusiness(business_id)
{
	new query[512];
	
	mysql_format(mysql, query, sizeof(query), "UPDATE Businesses \
												SET owned = %d, \
													user_id = %d, \
													name = %s, \
													price = %d, \
													locked = %d, \
													money = %d, \
													enter_fee = %d, \
													enterX = %f, \
													enterY = %f, \
													enterZ = %f, \
													enterA = %f, \
													exitX = %f, \
													exitY = %f, \
													exitZ = %f, \
													exitA = %f, \
													business_type = %d, \
													outside_interior = %d, \
													outside_virtual_world = %d, \
													inside_interior = %d, \
													inside_virtual_world = %d \												
												WHERE id = %d",
												BusinessInfo[business_id][Owned],
												BusinessInfo[business_id][Owner],
												BusinessInfo[business_id][Name],												
												BusinessInfo[business_id][Price],  
												BusinessInfo[business_id][Locked],											
												BusinessInfo[business_id][Money],  											
												BusinessInfo[business_id][EnterFee],  
												BusinessInfo[business_id][EnterX], 
												BusinessInfo[business_id][EnterY], 
												BusinessInfo[business_id][EnterZ], 
												BusinessInfo[business_id][EnterA], 
												BusinessInfo[business_id][ExitX],
												BusinessInfo[business_id][ExitY],
												BusinessInfo[business_id][ExitZ],
												BusinessInfo[business_id][ExitA],
												BusinessInfo[business_id][Type],
												BusinessInfo[business_id][OutsideInterior],
												BusinessInfo[business_id][OutsideVirtualWorld],
												BusinessInfo[business_id][InsideInterior],
												BusinessInfo[business_id][InsideVirtualWorld],
												BusinessInfo[business_id][ID]);
	mysql_pquery(mysql, query);

	return 1;
}

public DeleteBusiness(business_id) 
{
	new query[512];
	
	mysql_format(mysql, query, sizeof(query), "DELETE FROM Businesses \
												WHERE id = %d",
													BusinessInfo[business_id][ID]);
	mysql_tquery(mysql, query);
}

public OnAccountLoad(playerid)
{
	if(cache_num_rows() > 0)
	{
		cache_get_value_name_int(0, "ID", PlayerInfo[playerid][ID]);

		SendClientMessage(playerid, -1, "Welcome back.");
	}
	
	return 1;
}

public KickPlayer(playerid)
{
	Kick(playerid);
}

public AntiRoleplayName(playerid, playerName[])
{
	new str[128], check_name;
	
	check_name = strfind(playerName, "_", true);
	if(check_name == -1 ) 
	{
		format(str, sizeof(str), "%s je kikovan zbog neprihvatljivog imena", playerName);
		
		SendClientMessageToAll(COLOR_RED, str);
		SendClientMessage(playerid, COLOR_RED, "[ERROR]: Vase ime je neprihvatljivo.");
		SendClientMessage(playerid, COLOR_RED, "Vase ime mora biti u formatu Ime_Prezime. Velika pocetna slova.");
		
		Kick(playerid);
	}
	
	return 1;
}

public IsASaleVehicle(vehicleID)
{
	for(new i = 0; i < sizeof(SaleVehicles); i++)
	{
	    if(vehicleID == SaleVehicles[i]) return 1;
	}
	
	return 0;
}

public IsAOwnedVehicle(vehicleID)
{
   for(new i = 0; i < sizeof(OwnedVehicles); i++)
   {
      if(vehicleID == OwnedVehicles[i]) return 1;
   }
   
   return 0;
}


public IsARentVehicle(vehicleID)
{
   for(new i = 0; i < sizeof(RentVehicles); i++)
   {
      if(vehicleID == RentVehicles[i]) return 1;
   }
   
   return 0;
}

public IsALSPoliceCar(vehicleID)
{
	for(new i = 0; i < sizeof(LSPoliceCars); i++)
	{
		if(vehicleID == LSPoliceCars[i]) return 1;
	}
	return 0;
}

public IsABike(vehicleID)
{
    new model_id = GetVehicleModel(vehicleID);
	
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

public IsABoat(vehicleID)
{
    new model_id = GetVehicleModel(vehicleID);
	
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

public IsAPlane(vehicleID)
{
    new model_id = GetVehicleModel(vehicleID);
	
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

public IsATrain(vehicleID)
{
	new model_id = GetVehicleModel(vehicleID);
	
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

public StartVehicleEngine(playerid, vehicleID)
{
	new engine, lights, alarm, doors, bonnet, boot, objective, playername[MAX_PLAYER_NAME], str[128];
	
	GetVehicleParamsEx(vehicleID, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleID, 1, 1, alarm, doors, bonnet, boot, objective);

	VehicleEngine[vehicleID] = 1;
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
	   	new vehicleID = GetPlayerVehicleID(playerid);
	   	VehicleFuel[vehicleID] += RefillLitre[playerid];
	   	RefuellingVehicle[playerid] = 9999;
	   	//PlayerInfo[playerid][Money] -= RefillLitre[playerid]*5;
	   	//GivePlayerMoney(playerid, -RefillLitre[playerid]*5);
	}
}

public OnPlayerRegistered(playerid)
{
	PlayerInfo[playerid][ID] = cache_insert_id();
	printf("Korisnik se registrovao %d", PlayerInfo[playerid][ID]);
	SendClientMessage(playerid, -1, "Registrovali ste se na server.");
}

public closeLspdCellRoomDoor()
{
	MoveDynamicObject(lspdCellRoomDoor, 247.98140, 87.49130, 1005.20001, 1.0, 0.00000, 0.00000, 0.00000);
	lspdCellRoomDoorOpened = 0;

	return 1;
}

public closeLspdDoor1() 
{
	MoveDynamicObject(lspdDoor1, 250.611, 63.2995, 1003.18, 1.0, 0.00, 0.00, 0.00);
	lspdDoor1Opened = 0;

	return 1;
}

public closeLspdDoor2()
{
	MoveDynamicObject(lspdDoor2, 246.228, 72.4962, 1003.04, 1.0, 0.00000, 0.00000, 90.00000);
	lspdDoor2Opened = 0;

	return 1;
}

public closeLspdCell1()
{
	MoveDynamicObject(lspdCell1, 266.29559, 79.27300, 1002.59998, 1.0, 0.00000, 0.00000, 0.00000);
	lspdCell1Opened = 0;

	return 1;
}

public closeLspdCell2()
{
	MoveDynamicObject(lspdCell2, 266.29559, 83.77230, 1002.59998, 1.0, 0.00000, 0.00000, 0.00000);
	lspdCell2Opened = 0;

	return 1;
}

public closeLspdCell3()
{
	MoveDynamicObject(lspdCell3, 266.29559, 88.26910, 1002.59998, 1.0, 0.00000, 0.00000, 0.00000);
	lspdCell3Opened = 0;
	return 1;
}

public closeLspdWindow()
{
	MoveDynamicObject(lspdWindow, 250.524, 67.650, 1002.58, 1.0, 0.00, 0.00, 90.00);
	lspdWindowOpened = 99099;

	return 1;
}

public closeLspdGarage()
{
	MoveDynamicObject(lspdGarage, 1589.7000000, -1638.3101000, 14.2700000, 5.0, 0.0000000, 0.0000000, 90.0000000);
	lspdGarageOpened = 0;

	return 1;
}

public closeLspdGarageDoor()
{
	MoveDynamicObject(lspdGarageDoor, 1582.4000000, -1638.0500000, 15.0000000, 5.0, 0.0000000, 0.0000000, 90.0000000);
	lspdGarageDoorOpened = 0;

	return 1;
}

public LoadRentVehicles()
{
	//------------------------------------------------------------------------ > RENT
	RentVehicles[0] = AddStaticVehicleEx(462,1560.3000500,-2309.0000000,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicles[1] = AddStaticVehicleEx(462,1560.3000500,-2312.3000500,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicles[2] = AddStaticVehicleEx(462,1560.3000500,-2315.6001000,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicles[3] = AddStaticVehicleEx(462,1560.3000500,-2318.8999000,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicles[4] = AddStaticVehicleEx(462,1560.3000500,-2322.1999500,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicles[5] = AddStaticVehicleEx(462,1560.3000500,-2325.5000000,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicles[6] = AddStaticVehicleEx(462,1560.3000500,-2328.6999500,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicles[7] = AddStaticVehicleEx(462,1560.3000500,-2332.0000000,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicles[8] = AddStaticVehicleEx(462,1560.3000500,-2335.3000500,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicles[9] = AddStaticVehicleEx(462,1560.3000500,-2338.5000000,13.2000000,90.0000000,-1,7,-1); //Faggio
	RentVehicles[10] = AddStaticVehicleEx(410, 1552.6835, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicles[11] = AddStaticVehicleEx(410, 1549.4233, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicles[12] = AddStaticVehicleEx(410, 1546.1617, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicles[13] = AddStaticVehicleEx(410, 1542.9518, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicles[14] = AddStaticVehicleEx(410, 1539.6881, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicles[15] = AddStaticVehicleEx(410, 1536.3673, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicles[16] = AddStaticVehicleEx(410, 1533.1079, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicles[17] = AddStaticVehicleEx(410, 1529.8678, -2361.0581, 13.2520, 0.0000, -1, 7, -1);
	RentVehicles[18] = AddStaticVehicleEx(462,1180.0000000,-1337.6000000,13.2000000,270.0000000,-1,7,-1); //Faggio
	RentVehicles[19] = AddStaticVehicleEx(462,1184.5996000,-1337.5996000,13.2000000,270.0000000,-1,7,-1); //Faggio
	RentVehicles[20] = AddStaticVehicleEx(462,1184.5996000,-1340.5996000,13.2000000,270.0000000,-1,7,-1); //Faggio
	RentVehicles[21] = AddStaticVehicleEx(462,1180.0000000,-1340.5996000,13.2000000,270.0000000,-1,7,-1); //Faggio
	RentVehicles[22] = AddStaticVehicleEx(462,1175.4000000,-1337.6000000,13.2000000,270.0000000,-1,7,-1); //Faggio
	RentVehicles[23] = AddStaticVehicleEx(462,1175.4000000,-1340.5996000,13.2000000,270.0000000,-1,7,-1); //Faggio
	GlobalVehiclesCounter += 24;
}

public LoadSaleVehicles()
{
	//------------------------------------------------------------------------- > SALES VEHICLES
	//------------------------------------------------------------------------- > COUNT AND SHUTZ
	SaleVehicles[0] = AddStaticVehicleEx(580,2148.7000000,-1134.1000000,25.5000000,270.0000000, 1, 1, 15); //Stafford
	SaleVehicles[1] = AddStaticVehicleEx(566,2148.7002000,-1143.2002000,25.0000000,270.0000000, 1, 1, 15); //Tahoma
	SaleVehicles[2] = AddStaticVehicleEx(529,2148.7002000,-1148.2002000,24.2000000,270.0000000, 1, 1, 15); //Willard
	SaleVehicles[3] = AddStaticVehicleEx(445,2148.7002000,-1157.2000000,23.8000000,270.0000000, 1, 1, 15); //Admiral
	SaleVehicles[4] = AddStaticVehicleEx(516,2148.7002000,-1153.0000000,23.7000000,270.0000000, 1, 1, 15); //Nebula
	SaleVehicles[5] = AddStaticVehicleEx(401,2148.7002000,-1194.4000000,23.7000000,270.0000000, 1, 1, 15); //Bravura
	SaleVehicles[6] = AddStaticVehicleEx(410,2148.7002000,-1189.7002000,23.6000000,270.0000000, 1, 1, 15); //Manana
	SaleVehicles[7] = AddStaticVehicleEx(436,2148.7002000,-1198.9004000,23.8000000,270.0000000, 1, 1, 15); //Previon
	SaleVehicles[8] = AddStaticVehicleEx(413,2161.3000000,-1148.3000000,24.6000000,90.0000000, 1, 1, 15); //Pony
	SaleVehicles[9] = AddStaticVehicleEx(418,2161.3000000,-1158.1000000,24.0000000,90.0000000, 1, 1, 15); //Moonbeam
	SaleVehicles[10] = AddStaticVehicleEx(482,2161.3000000,-1152.9000000,24.1000000,90.0000000, 1, 1, 15); //Burrito
	SaleVehicles[11] = AddStaticVehicleEx(554,2161.2998000,-1168.1000000,24.0000000,90.0000000, 1, 1, 15); //Yosemite
	SaleVehicles[12] = AddStaticVehicleEx(543,2161.2998000,-1173.0000000,23.7523200,90.0000000, 1, 1, 15); //Sadler
	SaleVehicles[13] = AddStaticVehicleEx(546,2148.7000000,-1138.3000000,25.3000000,270.0000000, 1, 1, 15); //Intruder
	SaleVehicles[14] = AddStaticVehicleEx(422,2161.2998000,-1177.9004000,23.9000000,90.0000000, 1, 1, 15); //Bobcat
	SaleVehicles[15] = AddStaticVehicleEx(404,2161.2998000,-1192.4000000,23.7000000,90.0000000, 1, 1, 15); //Perrenial
	SaleVehicles[16] = AddStaticVehicleEx(479,2161.2998000,-1187.5000000,23.7000000,90.0000000, 1, 1, 15); //Regina
	SaleVehicles[17] = AddStaticVehicleEx(517,2148.7002000,-1175.5996000,23.8000000,270.0000000, 1, 1, 15); //Majestic
	SaleVehicles[18] = AddStaticVehicleEx(491,2148.7002000,-1170.8000000,23.7000000,270.0000000, 1, 1, 15); //Virgo
	SaleVehicles[19] = AddStaticVehicleEx(526,2148.7002000,-1180.2000000,23.7000000,270.0000000, 1, 1, 15); //Fortune
	SaleVehicles[20] = AddStaticVehicleEx(423,2120.5000000,-1128.5996000,25.0000000,315.0000000, 1, 1, 15); //Mr Whoopee
	SaleVehicles[21] = AddStaticVehicleEx(588,2120.5000000,-1134.5000000,25.3000000,315.0000000, 1, 1, 15); //Hotdog
	SaleVehicles[22] = AddStaticVehicleEx(420,2134.4004000,-1128.5996000,25.5000000,45.0000000, 1, 1, 15); //Taxi
	SaleVehicles[23] = AddStaticVehicleEx(438,2134.4004000,-1134.5000000,25.9000000,45.0000000, 1, 1, 15); //Cabbie
	//------------------------------------------------------------------------- > WANG CARS
	SaleVehicles[24] = AddStaticVehicleEx(542,-1946.7998000,273.7002000,35.3000000,135.0000000, 2, 2, 15); //Clover
	SaleVehicles[25] = AddStaticVehicleEx(475,-1946.7002000,269.0996100,35.4000000,135.0000000, 2, 2, 15); //Sabre
	SaleVehicles[26] = AddStaticVehicleEx(545,-1946.7002000,264.7002000,35.4000000,135.0000000, 2, 2, 15); //Hustler
	SaleVehicles[27] = AddStaticVehicleEx(533,-1946.7998000,260.0996100,35.3000000,135.0000000, 2, 2, 15); //Feltzer
	SaleVehicles[28] = AddStaticVehicleEx(496,-1960.7002000,256.2998000,35.3000000,315.0000000, 2, 2, 15); //Blista Compact
	SaleVehicles[29] = AddStaticVehicleEx(589,-1960.7002000,261.7002000,35.2000000,315.0000000, 2, 2, 15); //Club
	SaleVehicles[30] = AddStaticVehicleEx(500,-1960.7002000,269.1000100,35.7000000,315.0000000, 2, 2, 15); //Mesa
	SaleVehicles[31] = AddStaticVehicleEx(579,-1960.7002000,274.7999900,35.6000000,315.0000000, 2, 2, 15); //Huntley
	SaleVehicles[32] = AddStaticVehicleEx(489,-1960.7002000,283.0996100,35.7498200,315.0000000, 2, 2, 15); //Rancher
	SaleVehicles[33] = AddStaticVehicleEx(400,-1960.7002000,288.9003900,35.6000000,315.0000000, 2, 2, 15); //Landstalker
	SaleVehicles[34] = AddStaticVehicleEx(540,-1960.7002000,299.8999900,35.6000000,225.0000000, 2, 2, 15); //Vincent
	SaleVehicles[35] = AddStaticVehicleEx(412,-1947.0000000,273.5000000,41.0000000,135.0000000, 2, 2, 15); //Voodoo
	SaleVehicles[36] = AddStaticVehicleEx(419,-1947.0000000,268.7002000,41.0000000,135.0000000, 2, 2, 15); //Esperanto
	SaleVehicles[37] = AddStaticVehicleEx(518,-1947.0000000,264.0996100,40.8000000,135.0000000, 2, 2, 15); //Buccaneer
	SaleVehicles[38] = AddStaticVehicleEx(534,-1947.0000000,259.5000000,40.9000000,135.0000000, 2, 2, 15); //Remington
	SaleVehicles[39] = AddStaticVehicleEx(535,-1956.1000000,256.2000100,40.9000000,0.0000000, 2, 2, 15); //Slamvan
	SaleVehicles[40] = AddStaticVehicleEx(536,-1953.4004000,293.4003900,40.9000000,45.0000000, 2, 2, 15); //Blade
	SaleVehicles[41] = AddStaticVehicleEx(567,-1956.0000000,304.2998000,41.0000000,225.0000000, 2, 2, 15); //Savanna
	SaleVehicles[42] = AddStaticVehicleEx(550,-1956.0000000,264.5000000,41.0000000,315.0000000, 2, 2, 15); //Sunrise
	//------------------------------------------------------------------------- > OTTO'S CARS
	SaleVehicles[43] = AddStaticVehicleEx(402,-1647.5000000,1206.0000000,13.6000000,45.0000000, 3, 3, 15); //Buffalo
	SaleVehicles[44] = AddStaticVehicleEx(477,-1665.3000000,1224.3000000,13.5000000,180.0000000, 3, 3, 15); //ZR-350
	SaleVehicles[45] = AddStaticVehicleEx(506,-1679.4004000,1209.7002000,13.5000000,267.9950000, 3, 3, 15); //Super GT
	SaleVehicles[46] = AddStaticVehicleEx(603,-1656.8000000,1215.5000000,13.7000000,130.0000000, 3, 3, 15); //Phoenix
	SaleVehicles[47] = AddStaticVehicleEx(429,-1667.5000000,1216.0000000,7.0000000,250.0000000, 3, 3, 15); //Banshee
	SaleVehicles[48] = AddStaticVehicleEx(480,-1669.1000000,1206.1000000,7.1000000,320.0000000, 3, 3, 15); //Comet
	SaleVehicles[49] = AddStaticVehicleEx(560,-1679.3000000,1210.0000000,21.0000000,270.0000000, 3, 3, 15); //Sultan
	SaleVehicles[50] = AddStaticVehicleEx(562,-1665.7000000,1223.7000000,20.9000000,180.0000000, 3, 3, 15); //Elegy
	SaleVehicles[51] = AddStaticVehicleEx(565,-1646.5000000,1205.0000000,20.8000000,74.9980000, 3, 3, 15); //Flash
	SaleVehicles[52] = AddStaticVehicleEx(559,-1664.4004000,1205.0996000,20.9000000,0.0000000, 3, 3, 15); //Jester
	SaleVehicles[53] = AddStaticVehicleEx(558,-1655.0000000,1213.2000000,20.9000000,180.0000000, 3, 3, 15); //Uranus
	SaleVehicles[54] = AddStaticVehicleEx(561,-1658.7000000,1205.6000000,21.1000000,0.0000000, 3, 3, 15); //Stratum
	//------------------------------------------------------------------------- > DONATE CARS
	SaleVehicles[55] = AddStaticVehicleEx(411,564.2999900,-1289.5000000,17.0000000,0.0000000, 6, 6, 15); //Infernus
	SaleVehicles[56] = AddStaticVehicleEx(415,551.2000100,-1263.8000000,17.1000000,215.0000000, 6, 6, 15); //Cheetah
	SaleVehicles[57] = AddStaticVehicleEx(451,554.2999900,-1289.5000000,17.0000000,0.0000000, 6, 6, 15); //Turismo
	SaleVehicles[58] = AddStaticVehicleEx(541,543.2000100,-1270.1000000,16.9000000,219.9960000, 6, 6, 15); //Bullet
	SaleVehicles[59] = AddStaticVehicleEx(495,544.2999900,-1289.5000000,17.8000000,0.0000000, 6, 6, 15); //Sandking
	//------------------------------------------------------------------------- > BIKES
	SaleVehicles[60] = AddStaticVehicleEx(462,1904.8000000,-1357.9000000,13.2000000,135.0000000, 16, 16, 15); //Faggio
	SaleVehicles[61] = AddStaticVehicleEx(463,1909.1000000,-1362.9000000,13.1000000,135.0000000, 16, 16, 15); //Freeway
	SaleVehicles[62] = AddStaticVehicleEx(468,1913.1000000,-1358.8000000,13.3000000,134.9950000, 16, 16, 15); //Sanchez
	SaleVehicles[63] = AddStaticVehicleEx(471,1911.7000000,-1365.5000000,13.1000000,135.0000000, 16, 16, 15); //Quad
	SaleVehicles[64] = AddStaticVehicleEx(521,1920.0000000,-1365.7000000,13.2000000,135.0000000, 16, 16, 15); //FCR-900
	SaleVehicles[65] = AddStaticVehicleEx(522,1908.9000000,-1354.0000000,13.2000000,180.0000000, 6, 6, 15); //NRG-500
	SaleVehicles[66] = AddStaticVehicleEx(581,1915.6000000,-1361.3000000,13.2000000,135.0000000, 16, 16, 15); //BF-400
	SaleVehicles[67] = AddStaticVehicleEx(586,1906.7000000,-1360.5000000,13.1000000,135.0000000, 16, 16, 15); //Wayfarer
	SaleVehicles[68] = AddStaticVehicleEx(461,1917.9000000,-1363.6000000,13.2000000,135.0000000, 16, 16, 15); //PCJ-600
	SaleVehicles[69] = AddStaticVehicleEx(481,1883.5000000,-1369.6000000,13.2000000,135.0000000, 16, 16, 15); //BMX
	SaleVehicles[70] = AddStaticVehicleEx(510,1887.6000000,-1369.7000000,13.3000000,135.0000000, 16, 16, 15); //Mountain Bike
	//------------------------------------------------------------------------- > BOATS
	SaleVehicles[71] = AddStaticVehicleEx(493,-2231.7002000,2392.6006000,0.6637900,45.0000000, 6, 6, 15); //Jetmax
	SaleVehicles[72] = AddStaticVehicleEx(452,-2211.3000000,2413.2000000,0.0000000,45.0000000, 6, 6, 15); //Speeder
	SaleVehicles[73] = AddStaticVehicleEx(453,-2260.7000000,2421.1001000,0.0000000,225.0000000, 1, 1, 15); //Reefer
	SaleVehicles[74] = AddStaticVehicleEx(454,-2252.3000000,2429.3000000,0.0000000,225.0000000, 1, 1, 15); //Tropic
	SaleVehicles[75] = AddStaticVehicleEx(595,-2238.3000000,2440.5000000,0.0000000,225.0000000, 1, 1, 15); //Launch
	SaleVehicles[76] = AddStaticVehicleEx(484,-2232.7000000,2448.8000000,0.0000000,225.0000000, 1, 1, 15); //Marquis
	SaleVehicles[77] = AddStaticVehicleEx(473,-2204.8999000,2420.2000000,0.0000000,45.0000000, 1, 1, 15); //Dinghy
	SaleVehicles[78] = AddStaticVehicleEx(446,-2224.5000000,2400.2002000,0.0000000,45.0000000, 1, 1, 15); //Squalo
	SaleVehicles[79] = AddStaticVehicleEx(417,-2319.5000000,2323.8000000,0.0000000,180.0000000, 1, 1, 15); //Leviathan
	SaleVehicles[80] = AddStaticVehicleEx(447,-2319.5000000,2309.5000000,0.0000000,180.0000000, 1, 1, 15); //Seasparrow
	SaleVehicles[81] = AddStaticVehicleEx(460,-2319.3999000,2297.6001000,0.0000000,180.0000000, 1, 1, 15); //Skimmer
	//------------------------------------------------------------------------- > AIRPLANES
	SaleVehicles[82] = AddStaticVehicleEx(469,290.2002000,2535.7002000,16.9000000,180.0000000, 1, 1, 15); //Sparrow
	SaleVehicles[83] = AddStaticVehicleEx(476,325.7998000,2538.1006000,17.5567800,180.0000000, 1, 1, 15); //Rustler
	SaleVehicles[84] = AddStaticVehicleEx(512,290.7002000,2474.2002000,17.1000000,0.0000000, 1, 1, 15); //Cropdust
	SaleVehicles[85] = AddStaticVehicleEx(513,324.5996100,2474.7002000,17.3000000,0.0000000, 1, 1, 15); //Stunt
	SaleVehicles[86] = AddStaticVehicleEx(593,209.9003900,2474.2002000,17.0000000,0.0000000, 1, 1, 15); //Dodo
	SaleVehicles[87] = AddStaticVehicleEx(511,244.5000000,2471.5000000,18.0000000,0.0000000, 1, 1, 15); //Beagle
	SaleVehicles[88] = AddStaticVehicleEx(487,365.1000100,2536.5000000,16.9000000,180.0000000, 6, 6, 15); //Maverick
	GlobalVehiclesCounter += 89;
}

public LoadLosSantosParking()
{
	//------------------------------------------------------------------------ > PARKING
	CreateDynamicObject(19447,1622.9000000,-1146.3900000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1615.7000000,-1146.3900000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (2)
	CreateDynamicObject(19428,1610.1500000,-1146.1500000,24.5000000,0.0000000,0.0000000,72.0000000); //object(cs_landbit_10_a) (1)
	CreateDynamicObject(19428,1608.7100000,-1145.5100000,24.5000000,0.0000000,0.0000000,59.9963400); //object(cs_landbit_10_a) (2)
	CreateDynamicObject(19428,1607.5000000,-1144.5400000,24.5000000,0.0000000,0.0000000,42.6499900); //object(cs_landbit_10_a) (4)
	CreateDynamicObject(19428,1606.5500000,-1143.2900000,24.5000000,0.0000000,0.0000000,31.5647000); //object(cs_landbit_10_a) (5)
	CreateDynamicObject(19428,1605.9900000,-1141.8500000,24.5000000,0.0000000,0.0000000,10.7999900); //object(cs_landbit_10_a) (6)
	CreateDynamicObject(19428,1605.8250000,-1140.3000000,24.5000000,0.0000000,0.0000000,1.2000120); //object(cs_landbit_10_a) (7)
	CreateDynamicObject(19428,1605.8100000,-1138.7000000,24.5000000,0.0000000,0.0000000,359.7500000); //object(cs_landbit_10_a) (8)
	CreateDynamicObject(19428,1605.8200000,-1137.1900000,24.5000000,0.0000000,0.0000000,359.2473000); //object(cs_landbit_10_a) (9)
	CreateDynamicObject(19428,1605.8000000,-1135.6000000,24.5000000,0.0000000,0.0000000,2.2500000); //object(cs_landbit_10_a) (10)
	CreateDynamicObject(19428,1605.7000000,-1134.0000000,24.5000000,0.0000000,0.0000000,4.9967040); //object(cs_landbit_10_a) (11)
	CreateDynamicObject(19428,1605.5360000,-1132.4100000,24.5000000,0.0000000,0.0000000,6.7432860); //object(cs_landbit_10_a) (12)
	CreateDynamicObject(19428,1605.3500000,-1130.8300000,24.5000000,0.0000000,0.0000000,6.7401120); //object(cs_landbit_10_a) (13)
	CreateDynamicObject(19428,1605.1680000,-1129.3100000,24.5000000,0.0000000,0.0000000,6.7401120); //object(cs_landbit_10_a) (14)
	CreateDynamicObject(19428,1605.0000000,-1127.8000000,24.5000000,0.0000000,0.0000000,5.7401120); //object(cs_landbit_10_a) (15)
	CreateDynamicObject(19428,1604.8500000,-1126.3000000,24.5000000,0.0000000,0.0000000,5.7348630); //object(cs_landbit_10_a) (16)
	CreateDynamicObject(19428,1604.6900000,-1124.7200000,24.5000000,0.0000000,0.0000000,5.7348630); //object(cs_landbit_10_a) (17)
	CreateDynamicObject(19428,1604.5360000,-1123.2000000,24.5000000,0.0000000,0.0000000,5.7348630); //object(cs_landbit_10_a) (18)
	CreateDynamicObject(19428,1604.3600000,-1121.6200000,24.5000000,0.0000000,0.0000000,6.7348630); //object(cs_landbit_10_a) (19)
	CreateDynamicObject(19428,1604.1500000,-1120.0700000,24.5000000,0.0000000,0.0000000,8.4846190); //object(cs_landbit_10_a) (20)
	CreateDynamicObject(19428,1603.9000000,-1118.5000000,24.5000000,0.0000000,0.0000000,9.4814450); //object(cs_landbit_10_a) (21)
	CreateDynamicObject(19428,1603.6700000,-1117.0000000,24.5000000,0.0000000,0.0000000,7.9812010); //object(cs_landbit_10_a) (22)
	CreateDynamicObject(19428,1603.4400000,-1115.4300000,24.5000000,0.0000000,0.0000000,8.7260740); //object(cs_landbit_10_a) (23)
	CreateDynamicObject(19428,1603.2080000,-1113.9000000,24.5000000,0.0000000,0.0000000,8.4731450); //object(cs_landbit_10_a) (24)
	CreateDynamicObject(19428,1602.9900000,-1112.4000000,24.5000000,0.0000000,0.0000000,8.2204590); //object(cs_landbit_10_a) (25)
	CreateDynamicObject(19428,1602.7700000,-1110.8200000,24.5000000,0.0000000,0.0000000,7.7177730); //object(cs_landbit_10_a) (26)
	CreateDynamicObject(19428,1602.5520000,-1109.2400000,24.5000000,0.0000000,0.0000000,7.9624020); //object(cs_landbit_10_a) (27)
	CreateDynamicObject(19428,1602.3000000,-1107.7000000,24.5000000,0.0000000,0.0000000,10.7095900); //object(cs_landbit_10_a) (28)
	CreateDynamicObject(19428,1602.0000000,-1106.1300000,24.5000000,0.0000000,0.0000000,10.9561800); //object(cs_landbit_10_a) (29)
	CreateDynamicObject(19428,1601.7000000,-1104.6000000,24.5000000,0.0000000,0.0000000,11.2033700); //object(cs_landbit_10_a) (30)
	CreateDynamicObject(19428,1601.4000000,-1103.0600000,24.5000000,0.0000000,0.0000000,10.9505600); //object(cs_landbit_10_a) (31)
	CreateDynamicObject(19428,1601.1000000,-1101.5100000,24.5000000,0.0000000,0.0000000,10.9478800); //object(cs_landbit_10_a) (32)
	CreateDynamicObject(19428,1600.7600000,-1099.9600000,24.5000000,0.0000000,0.0000000,13.6978800); //object(cs_landbit_10_a) (33)
	CreateDynamicObject(19428,1600.3800000,-1098.4300000,24.5000000,0.0000000,0.0000000,13.9444600); //object(cs_landbit_10_a) (34)
	CreateDynamicObject(19428,1600.0600000,-1096.8600000,24.5000000,0.0000000,0.0000000,9.1916500); //object(cs_landbit_10_a) (35)
	CreateDynamicObject(19428,1599.7600000,-1095.3000000,24.5000000,0.0000000,0.0000000,12.6900600); //object(cs_landbit_10_a) (36)
	CreateDynamicObject(19428,1599.3000000,-1093.7800000,24.5000000,0.0000000,0.0000000,20.9392100); //object(cs_landbit_10_a) (37)
	CreateDynamicObject(19428,1598.7400000,-1092.2900000,24.5000000,0.0000000,0.0000000,20.1844500); //object(cs_landbit_10_a) (38)
	CreateDynamicObject(19428,1598.2000000,-1090.8000000,24.5000000,0.0000000,0.0000000,19.6818800); //object(cs_landbit_10_a) (39)
	CreateDynamicObject(19428,1597.6200000,-1089.3200000,24.5000000,0.0000000,0.0000000,23.1765100); //object(cs_landbit_10_a) (40)
	CreateDynamicObject(19428,1597.0200000,-1087.8300000,24.5000000,0.0000000,0.0000000,20.6752900); //object(cs_landbit_10_a) (41)
	CreateDynamicObject(19428,1596.4700000,-1086.3300000,24.5000000,0.0000000,0.0000000,19.6708100); //object(cs_landbit_10_a) (42)
	CreateDynamicObject(19428,1595.9500000,-1084.8100000,24.5000000,0.0000000,0.0000000,18.1655300); //object(cs_landbit_10_a) (43)
	CreateDynamicObject(19428,1595.4200000,-1083.3100000,24.5000000,0.0000000,0.0000000,20.6604000); //object(cs_landbit_10_a) (44)
	CreateDynamicObject(19428,1594.8500000,-1081.8200000,24.5000000,0.0000000,0.0000000,21.4097900); //object(cs_landbit_10_a) (45)
	CreateDynamicObject(19428,1594.2000000,-1080.4000000,24.5000000,0.0000000,0.0000000,27.6568600); //object(cs_landbit_10_a) (46)
	CreateDynamicObject(19428,1593.4300000,-1079.0000000,24.5000000,0.0000000,0.0000000,29.9025900); //object(cs_landbit_10_a) (47)
	CreateDynamicObject(19428,1592.6500000,-1077.6300000,24.5000000,0.0000000,0.0000000,29.3992900); //object(cs_landbit_10_a) (48)
	CreateDynamicObject(19428,1591.9000000,-1076.2500000,24.5000000,0.0000000,0.0000000,27.6439200); //object(cs_landbit_10_a) (49)
	CreateDynamicObject(19428,1591.1600000,-1074.8300000,24.5000000,0.0000000,0.0000000,27.3916000); //object(cs_landbit_10_a) (50)
	CreateDynamicObject(19428,1590.4300000,-1073.4200000,24.5000000,0.0000000,0.0000000,27.3889200); //object(cs_landbit_10_a) (51)
	CreateDynamicObject(19428,1589.7000000,-1072.0000000,24.5000000,0.0000000,0.0000000,26.8889200); //object(cs_landbit_10_a) (52)
	CreateDynamicObject(19428,1589.0000000,-1070.6000000,24.5000000,0.0000000,0.0000000,26.1335100); //object(cs_landbit_10_a) (53)
	CreateDynamicObject(19428,1588.3000000,-1069.2000000,24.5000000,0.0000000,0.0000000,26.8809800); //object(cs_landbit_10_a) (54)
	CreateDynamicObject(19428,1587.5700000,-1067.8000000,24.5000000,0.0000000,0.0000000,28.1280500); //object(cs_landbit_10_a) (55)
	CreateDynamicObject(19428,1586.8300000,-1066.4000000,24.5000000,0.0000000,0.0000000,27.6250000); //object(cs_landbit_10_a) (56)
	CreateDynamicObject(19428,1586.0200000,-1065.0400000,24.5000000,0.0000000,0.0000000,33.8696300); //object(cs_landbit_10_a) (58)
	CreateDynamicObject(19428,1585.1000000,-1063.7400000,24.5000000,0.0000000,0.0000000,36.8653900); //object(cs_landbit_10_a) (59)
	CreateDynamicObject(19428,1584.1000000,-1062.5000000,24.5000000,0.0000000,0.0000000,40.8646200); //object(cs_landbit_10_a) (60)
	CreateDynamicObject(19428,1583.1300000,-1061.3000000,24.5000000,0.0000000,0.0000000,36.8636500); //object(cs_landbit_10_a) (61)
	CreateDynamicObject(19428,1582.2100000,-1060.0700000,24.5000000,0.0000000,0.0000000,36.8591300); //object(cs_landbit_10_a) (62)
	CreateDynamicObject(19428,1581.2600000,-1058.8000000,24.5000000,0.0000000,0.0000000,36.8591300); //object(cs_landbit_10_a) (63)
	CreateDynamicObject(19428,1580.3000000,-1057.5200000,24.5000000,0.0000000,0.0000000,36.6091300); //object(cs_landbit_10_a) (64)
	CreateDynamicObject(19428,1579.3500000,-1056.2400000,24.5000000,0.0000000,0.0000000,36.6064500); //object(cs_landbit_10_a) (65)
	CreateDynamicObject(19428,1578.4200000,-1055.0000000,24.5000000,0.0000000,0.0000000,37.3564800); //object(cs_landbit_10_a) (66)
	CreateDynamicObject(19428,1577.4600000,-1053.7200000,24.5000000,0.0000000,0.0000000,36.6035200); //object(cs_landbit_10_a) (67)
	CreateDynamicObject(19428,1576.5000000,-1052.4400000,24.5000000,0.0000000,0.0000000,37.1009500); //object(cs_landbit_10_a) (68)
	CreateDynamicObject(19428,1575.5500000,-1051.1600000,24.5000000,0.0000000,0.0000000,36.1008300); //object(cs_landbit_10_a) (69)
	CreateDynamicObject(19428,1574.6100000,-1049.9000000,24.5000000,0.0000000,0.0000000,37.0955800); //object(cs_landbit_10_a) (70)
	CreateDynamicObject(19428,1573.6600000,-1048.6200000,24.5000000,0.0000000,0.0000000,36.0953400); //object(cs_landbit_10_a) (71)
	CreateDynamicObject(19428,1572.6500000,-1047.4000000,24.5000000,0.0000000,0.0000000,43.3400900); //object(cs_landbit_10_a) (72)
	CreateDynamicObject(19428,1571.4700000,-1046.3500000,24.5000000,0.0000000,0.0000000,53.0855700); //object(cs_landbit_10_a) (73)
	CreateDynamicObject(19428,1570.2400000,-1045.4000000,24.5000000,0.0000000,0.0000000,51.5804400); //object(cs_landbit_10_a) (74)
	CreateDynamicObject(19428,1569.0500000,-1044.4000000,24.5000000,0.0000000,0.0000000,48.3253200); //object(cs_landbit_10_a) (75)
	CreateDynamicObject(19428,1567.8300000,-1043.3800000,24.5000000,0.0000000,0.0000000,51.8225100); //object(cs_landbit_10_a) (76)
	CreateDynamicObject(19428,1566.6100000,-1042.3900000,24.5000000,0.0000000,0.0000000,50.3225100); //object(cs_landbit_10_a) (76)
	CreateDynamicObject(19428,1565.4100000,-1041.3900000,24.5000000,0.0000000,0.0000000,50.0673800); //object(cs_landbit_10_a) (76)
	CreateDynamicObject(19428,1564.2200000,-1040.3900000,24.5000000,0.0000000,0.0000000,50.0647000); //object(cs_landbit_10_a) (76)
	CreateDynamicObject(19428,1563.0500000,-1039.4000000,24.5000000,0.0000000,0.0000000,49.5647300); //object(cs_landbit_10_a) (76)
	CreateDynamicObject(19428,1562.6000000,-1039.0200000,24.5000000,0.0000000,0.0000000,49.5593300); //object(cs_landbit_10_a) (76)
	CreateDynamicObject(19428,1561.2600000,-1038.2900000,24.5000000,0.0000000,0.0000000,73.0593600); //object(cs_landbit_10_a) (76)
	CreateDynamicObject(19428,1559.8000000,-1037.8500000,24.5000000,0.0000000,0.0000000,73.3090800); //object(cs_landbit_10_a) (76)
	CreateDynamicObject(19428,1558.2900000,-1037.3800000,24.5000000,0.0000000,0.0000000,72.0562700); //object(cs_landbit_10_a) (76)
	CreateDynamicObject(19447,1549.0000000,-1034.4000000,24.5000000,0.0000000,0.0000000,72.0000000); //object(cs_detrok13) (3)
	CreateDynamicObject(19447,1540.2500000,-1031.5800000,24.5000000,0.0000000,0.0000000,72.2489000); //object(cs_detrok13) (4)
	CreateDynamicObject(19428,1535.2600000,-1029.4800000,24.5000000,0.0000000,0.0000000,33.7500000); //object(cs_landbit_10_a) (3)
	CreateDynamicObject(19428,1534.7900000,-1028.0560000,24.5000000,0.0000000,0.0000000,2.7449950); //object(cs_landbit_10_a) (57)
	CreateDynamicObject(19428,1535.0300000,-1026.5450000,24.5000000,0.0000000,0.0000000,338.9911000); //object(cs_landbit_10_a) (77)
	CreateDynamicObject(19428,1535.6000000,-1025.1000000,24.5000000,0.0000000,0.0000000,337.7386000); //object(cs_landbit_10_a) (78)
	CreateDynamicObject(19428,1536.2100000,-1023.7000000,24.5000000,0.0000000,0.0000000,335.7334000); //object(cs_landbit_10_a) (79)
	CreateDynamicObject(19447,1538.5300000,-1018.6000000,24.5000000,0.0000000,0.0000000,335.5000000); //object(cs_detrok13) (8)
	CreateDynamicObject(19447,1542.5100098,-1009.8300171,24.5000000,0.0000000,0.0000000,335.7000122); //object(cs_detrok13) (9)
	CreateDynamicObject(19447,1652.5000000,-1146.3900000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1662.1000000,-1146.3900000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1671.7000000,-1146.3900000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1676.7000000,-1146.3900000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19428,1682.2700000,-1146.2000000,24.5000000,0.0000000,0.0000000,284.0000000); //object(cs_landbit_10_a) (80)
	CreateDynamicObject(19428,1683.6400000,-1145.5200000,24.5000000,0.0000000,0.0000000,308.7466000); //object(cs_landbit_10_a) (81)
	CreateDynamicObject(19428,1684.6300000,-1144.3500000,24.5000000,0.0000000,0.0000000,330.4933000); //object(cs_landbit_10_a) (82)
	CreateDynamicObject(19428,1685.3000000,-1142.9400000,24.5000000,0.0000000,0.0000000,338.4907000); //object(cs_landbit_10_a) (83)
	CreateDynamicObject(19428,1685.7000000,-1141.4200000,24.5000000,0.0000000,0.0000000,351.9888000); //object(cs_landbit_10_a) (85)
	CreateDynamicObject(19447,1685.8000000,-1135.8400000,24.5000000,0.0000000,0.0000000,0.1000061); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1685.8000000,-1126.3000000,24.5000000,0.0000000,0.0000000,359.9000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1685.8000000,-1116.7000000,24.5000000,0.0000000,0.0000000,0.1456299); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1685.8000000,-1107.1000000,24.5000000,0.0000000,0.0000000,359.8928000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1685.8000000,-1099.9000000,24.5000000,0.0000000,0.0000000,0.1401367); //object(cs_detrok13) (1)
	CreateDynamicObject(19428,1686.3350000,-1094.5900000,24.5000000,0.0000000,0.0000000,314.0000000); //object(cs_landbit_10_a) (86)
	CreateDynamicObject(19447,1691.6670000,-1094.1000000,24.5000000,0.0000000,0.0000000,89.5000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1701.2700000,-1094.1400000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1710.9000000,-1094.2000000,24.5000000,0.0000000,0.0000000,89.2999900); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1720.5000000,-1094.2580000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1730.1000000,-1094.2580000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1739.7000000,-1094.2580000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1749.2000000,-1094.2580000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1758.7000000,-1094.2580000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1768.3000000,-1094.2580000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1777.8000000,-1094.2580000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1787.4000000,-1094.2580000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1797.0000000,-1094.2580000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1806.6000000,-1094.2580000,24.5000000,0.0000000,0.0000000,90.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19428,1812.1600000,-1094.2580000,24.5000000,0.0000000,0.0000000,270.0000000); //object(cs_landbit_10_a) (87)
	CreateDynamicObject(19447,1813.0500000,-1089.5300000,24.5000000,0.0000000,0.0000000,0.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1813.0500000,-1080.0000000,24.5000000,0.0000000,0.0000000,0.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1813.0500000,-1070.5000000,24.5000000,0.0000000,0.0000000,0.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1813.0500000,-1060.9000000,24.5000000,0.0000000,0.0000000,0.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1813.0500000,-1051.3000000,24.5000000,0.0000000,0.0000000,0.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1813.0500000,-1041.7000000,24.5000000,0.0000000,0.0000000,0.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1813.0500000,-1032.1000000,24.5000000,0.0000000,0.0000000,0.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1813.0500000,-1022.5000000,24.5000000,0.0000000,0.0000000,0.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1813.0500000,-1012.9000000,24.5000000,0.0000000,0.0000000,0.0000000); //object(cs_detrok13) (1)
	CreateDynamicObject(19447,1546.4100000,-1001.2000000,24.5000000,0.0000000,0.0000000,335.6982000); //object(cs_detrok13) (9)
	CreateDynamicObject(8406,1635.9000000,-1146.1000000,28.4000000,0.0000000,0.0000000,0.0000000); //object(carparksign01_lvs) (1)
	CreateDynamicObject(4641,1637.7000000,-1144.4000000,24.6000000,0.0000000,0.0000000,180.0000000); //object(paypark_lan04) (1)
	// parking_gate1 = CreateDynamicObject(969,1627.8000000,-1145.9000000,23.1000000,0.0000000,0.0000000,0.0000000); //object(electricgate) (1)
	// parking_gate2 = CreateDynamicObject(969,1647.6000000,-1145.9000000,23.1000000,0.0000000,0.0000000,180.0000000); //object(electricgate) (2)
}

public LoadLosSantosAirport()
{
	//------------------------------------------------------------------------ > SPAWN OBJECTS
	CreateDynamicObject(984,1565.7399900,-2349.0000000,13.2000000,0.0000000,0.0000000,0.0000000); //object(fenceshit2) (1)
	CreateDynamicObject(984,1565.7399900,-2361.7998000,13.2000000,0.0000000,0.0000000,0.0000000); //object(fenceshit2) (2)
	CreateDynamicObject(984,1565.7399900,-2336.1999500,13.2000000,0.0000000,0.0000000,0.0000000); //object(fenceshit2) (4)
	CreateDynamicObject(984,1565.7399900,-2323.3000500,13.2000000,0.0000000,0.0000000,0.0000000); //object(fenceshit2) (5)
	CreateDynamicObject(984,1565.7399900,-2311.0000000,13.2000000,0.0000000,0.0000000,0.0000000); //object(fenceshit2) (6)
	CreateDynamicObject(9131,1565.7399900,-2367.8689000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (1)
	CreateDynamicObject(9131,1565.7399900,-2355.3999000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (2)
	CreateDynamicObject(9131,1565.7399900,-2342.6001000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (3)
	CreateDynamicObject(9131,1565.7399900,-2329.8000500,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (4)
	CreateDynamicObject(9131,1565.7399900,-2317.0000000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (5)
	CreateDynamicObject(9131,1565.7399900,-2305.8000500,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (6)
	CreateDynamicObject(983,1565.7399900,-2303.0000000,13.2500000,0.0000000,0.0000000,0.0000000); //object(fenceshit3) (3)
	CreateDynamicObject(983,1565.7399900,-2299.8000500,13.2500000,0.0000000,0.0000000,0.0000000); //object(fenceshit3) (4)
	CreateDynamicObject(9131,1565.7399900,-2296.9199200,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (7)
	CreateDynamicObject(984,1559.6999500,-2367.8999000,13.2000000,0.0000000,0.0000000,90.0000000); //object(fenceshit2) (9)
	CreateDynamicObject(984,1547.0000000,-2367.8999000,13.2000000,0.0000000,0.0000000,90.0000000); //object(fenceshit2) (10)
	CreateDynamicObject(984,1534.1999500,-2367.8999000,13.2000000,0.0000000,0.0000000,90.0000000); //object(fenceshit2) (11)
	CreateDynamicObject(984,1521.4000200,-2367.8999000,13.2000000,0.0000000,0.0000000,90.0000000); //object(fenceshit2) (12)
	CreateDynamicObject(984,1508.5999800,-2367.8999000,13.2000000,0.0000000,0.0000000,90.0000000); //object(fenceshit2) (13)
	CreateDynamicObject(984,1495.8000500,-2367.8999000,13.2000000,0.0000000,0.0000000,90.0000000); //object(fenceshit2) (14)
	CreateDynamicObject(983,1487.8000500,-2367.8999000,13.2500000,0.0000000,0.0000000,90.0000000); //object(fenceshit3) (5)
	CreateDynamicObject(9131,1553.4000200,-2367.8689000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (8)
	CreateDynamicObject(9131,1540.5999800,-2367.8689000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (9)
	CreateDynamicObject(9131,1527.6999500,-2367.8689000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (10)
	CreateDynamicObject(9131,1515.0999800,-2367.8689000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (11)
	CreateDynamicObject(9131,1502.3000500,-2367.8689000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (12)
	CreateDynamicObject(9131,1484.8000500,-2367.8689000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (13)
	CreateDynamicObject(984,1484.8000500,-2361.7998000,13.2000000,0.0000000,0.0000000,0.0000000); //object(fenceshit2) (15)
	CreateDynamicObject(9131,1484.8000500,-2355.3994100,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (14)
	CreateDynamicObject(984,1484.8000500,-2349.0000000,13.2000000,0.0000000,0.0000000,0.0000000); //object(fenceshit2) (16)
	CreateDynamicObject(9131,1484.7889400,-2342.6999500,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (15)
	CreateDynamicObject(983,1488.0999800,-2342.1999500,13.3000000,0.0000000,0.0000000,280.0000000); //object(fenceshit3) (6)
	CreateDynamicObject(983,1494.4000200,-2341.1001000,13.3000000,0.0000000,0.0000000,279.7480000); //object(fenceshit3) (8)
	CreateDynamicObject(9131,1497.8890400,-2340.6001000,13.6000000,0.0000000,0.0000000,8.0000000); //object(shbbyhswall13_lvs) (16)
	CreateDynamicObject(984,1504.4000200,-2340.4670400,13.2000000,0.0000000,0.0000000,90.0000000); //object(fenceshit2) (17)
	CreateDynamicObject(9131,1510.8000500,-2340.4670400,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (17)
	CreateDynamicObject(984,1517.0999800,-2340.4670400,13.2000000,0.0000000,0.0000000,90.0000000); //object(fenceshit2) (18)
	CreateDynamicObject(9131,1523.6999500,-2340.4670400,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (18)
	CreateDynamicObject(984,1530.4000200,-2340.4670400,13.2000000,0.0000000,0.0000000,90.0000000); //object(fenceshit2) (19)
	CreateDynamicObject(9131,1538.6894500,-2340.4668000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (19)
	CreateDynamicObject(983,1535.1999500,-2340.4670400,13.2500000,0.0000000,0.0000000,90.0000000); //object(fenceshit3) (9)
	CreateDynamicObject(984,1538.6899400,-2333.8000500,13.2000000,0.0000000,0.0000000,0.0000000); //object(fenceshit2) (20)
	CreateDynamicObject(9131,1538.6669900,-2327.3999000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (20)
	CreateDynamicObject(984,1538.6899400,-2320.8000500,13.2000000,0.0000000,0.0000000,0.0000000); //object(fenceshit2) (21)
	CreateDynamicObject(9131,1538.6400100,-2314.3999000,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (21)
	CreateDynamicObject(984,1538.6700400,-2307.8999000,13.2000000,0.0000000,0.0000000,0.0000000); //object(fenceshit2) (22)
	CreateDynamicObject(983,1538.6700400,-2299.8999000,13.2500000,0.0000000,0.0000000,0.0000000); //object(fenceshit3) (10)
	CreateDynamicObject(9131,1538.6099900,-2296.8730500,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (22)
	CreateDynamicObject(984,1559.6800500,-2296.8999000,13.2000000,0.0000000,0.0000000,90.0000000); //object(fenceshit2) (23)
	CreateDynamicObject(4639,1540.7450000,-2297.5996100,14.2000000,0.0000000,0.0000000,0.0000000); //object(paypark_lan02) (1)
	CreateDynamicObject(9131,1542.8800000,-2296.8730500,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (23)
	CreateDynamicObject(9131,1553.6200000,-2296.9199200,13.6000000,0.0000000,0.0000000,0.0000000); //object(shbbyhswall13_lvs) (24)
	CreateDynamicObject(1215,1565.6999500,-2296.8999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (1)
	CreateDynamicObject(1215,1565.6999500,-2305.8000500,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (2)
	CreateDynamicObject(1215,1565.6999500,-2317.0000000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (3)
	CreateDynamicObject(1215,1565.6999500,-2329.8000500,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (4)
	CreateDynamicObject(1215,1565.6999500,-2342.6001000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (5)
	CreateDynamicObject(1215,1565.6999500,-2355.3999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (6)
	CreateDynamicObject(1215,1565.6999500,-2367.8999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (7)
	CreateDynamicObject(1215,1553.5999800,-2296.8999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (8)
	CreateDynamicObject(1215,1553.4000200,-2367.8999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (9)
	CreateDynamicObject(1215,1540.5999800,-2367.8999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (10)
	CreateDynamicObject(1215,1527.6999500,-2367.8999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (11)
	CreateDynamicObject(1215,1515.0999800,-2367.8999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (12)
	CreateDynamicObject(1215,1502.3000500,-2367.8999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (13)
	CreateDynamicObject(1215,1484.8000500,-2367.8999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (14)
	CreateDynamicObject(1215,1484.8000500,-2355.3999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (15)
	CreateDynamicObject(1215,1484.8000500,-2342.6999500,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (16)
	CreateDynamicObject(1215,1497.8700000,-2340.6001000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (17)
	CreateDynamicObject(1215,1510.8000500,-2340.4499500,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (18)
	CreateDynamicObject(1215,1523.6999500,-2340.4499500,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (19)
	CreateDynamicObject(1215,1538.6700400,-2340.4499500,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (20)
	CreateDynamicObject(1215,1538.6700400,-2327.3999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (21)
	CreateDynamicObject(1215,1538.5999800,-2314.3999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (22)
	CreateDynamicObject(1215,1538.5999800,-2296.8999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (23)
	CreateDynamicObject(1215,1542.9000200,-2296.8999000,15.3000000,0.0000000,0.0000000,0.0000000); //object(bollardlight) (24)
	CreateDynamicObject(9339,1590.0999800,-2326.6001000,13.2000000,0.0000000,0.0000000,90.0000000); //object(sfnvilla001_cm) (1)
	CreateDynamicObject(9339,1616.2149700,-2326.6047400,13.2000000,0.0000000,0.0000000,270.0000000); //object(sfnvilla001_cm) (2)
	CreateDynamicObject(9339,1633.0000000,-2326.6120600,13.2000000,0.0000000,0.0000000,90.0000000); //object(sfnvilla001_cm) (3)
	CreateDynamicObject(9339,1646.1999500,-2339.5388200,13.2000000,0.0000000,0.0000000,0.0000000); //object(sfnvilla001_cm) (4)
	CreateDynamicObject(3858,1638.9000200,-2326.6001000,16.8000000,0.0000000,0.0000000,45.0000000); //object(ottosmash1) (1)
	CreateDynamicObject(3858,1625.1999500,-2326.6001000,16.8000000,0.0000000,0.0000000,44.9950000); //object(ottosmash1) (2)
	CreateDynamicObject(3858,1611.4000200,-2326.6001000,16.8000000,0.0000000,0.0000000,44.9950000); //object(ottosmash1) (3)
	CreateDynamicObject(3858,1597.5999800,-2326.6001000,16.8000000,0.0000000,0.0000000,44.9950000); //object(ottosmash1) (4)
	CreateDynamicObject(3858,1583.9000200,-2326.6001000,16.8000000,0.0000000,0.0000000,45.0000000); //object(ottosmash1) (7)
	CreateDynamicObject(3858,1646.1870100,-2333.8889200,16.8000000,0.0000000,0.0000000,315.0000000); //object(ottosmash1) (8)
}

public LoadLosSantosPoliceDepartment() 
{
	CreateDynamicObject(2930, 247.98140, 89.21600, 1005.20001, 0.00000, 0.00000, 0.00000);
	lspdCellRoomDoor = CreateDynamicObject(2930, 247.98140, 87.49130, 1005.20001, 0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2930, 266.29559, 77.55000, 1002.59998, 0.00000, 0.00000, 0.00000);
	lspdCell1 = CreateDynamicObject(2930, 266.29559, 79.27300, 1002.59998, 0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2930, 266.29559, 82.05180, 1002.59998, 0.00000, 0.00000, 0.00000);
	lspdCell2 = CreateDynamicObject(2930, 266.29559, 83.77230, 1002.59998, 0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2930, 266.29559, 86.54900, 1002.59998, 0.00000, 0.00000, 0.00000);
	lspdCell3 = CreateDynamicObject(2930, 266.29559, 88.26910, 1002.59998, 0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2603, 262.90793, 87.48180, 1000.44501, 0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2602, 263.03015, 84.94619, 1000.54480, 0.00000, 0.00000, 135.00000);
	CreateDynamicObject(2603, 262.90790, 82.97620, 1000.44501, 0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2602, 263.03021, 80.43490, 1000.54480, 0.00000, 0.00000, 135.00000);
	CreateDynamicObject(2603, 262.90790, 78.47430, 1000.44501, 0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2602, 263.03021, 75.97380, 1000.54480, 0.00000, 0.00000, 135.00000);
	lspdDoor1 = CreateDynamicObject(5422, 250.611,63.2995,1003.18,0.00,0.00,00.00); // LSPD Main Door
	lspdDoor2 = CreateDynamicObject(5422, 246.228,72.4962,1003.04,0.00,0.00,90.00); // LSPD Control Room Door
	lspdWindow = CreateDynamicObject(974,250.524,67.650,1002.58,0.00,0.00,90.00); // LSPD Windows
	lspdGarage = CreateDynamicObject(3037,1589.7000000,-1638.3101000,14.2700000,0.0000000,0.0000000,90.0000000); //object(warehouse_door2b) (2)
	lspdGarageDoor = CreateDynamicObject(2930,1582.4000000,-1638.0500000,15.0000000,0.0000000,0.0000000,90.0000000); //object(chinatgate) (1)
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

	
    //TIME AND WEATHER ON SERVER START
    new hours, minutes, seconds;
	gettime(hours, minutes, seconds);

    switch(hours)
	{
		case 16: SetWorldTime(21);
		case 17: SetWorldTime(22);
		case 18: SetWorldTime(23);
		case 19: SetWorldTime(24);
		case 20: SetWorldTime(24);
		case 21: SetWorldTime(24);
		case 22: SetWorldTime(24);
		case 23: SetWorldTime(24);
		case 0: SetWorldTime(1);
		case 1: SetWorldTime(1);
		case 2: SetWorldTime(2);
		case 3: SetWorldTime(3);
		case 4: SetWorldTime(4);
		case 5: SetWorldTime(5);
		case 6: SetWorldTime(6);
		case 7: SetWorldTime(7);
		default: SetWorldTime(12);
	}

	// Textdraws for vehicles on sale
	for(new i = 0; i < MAX_VEHICLES; i++)
	{
	    if(IsASaleVehicle(i))
	    {
	        new Float:X, Float:Y, Float:Z, model_name[32], message[512];
			
			GetVehiclePos(i, X, Y, Z);
			GetVehicleName(i, model_name, sizeof(model_name));
			
	        format(message, sizeof(message), "Vozilo na prodaju! \n "TEXT_COLOR_RED"Model"TEXT_COLOR_WHITE": %s ( %d ) \n "TEXT_COLOR_RED"Cena"TEXT_COLOR_WHITE": %d$ \n Da kupite ovo vozilo \n udjite u njega i kucajte \n "TEXT_COLOR_RED"/v buy", model_name, GetVehicleModel(i), GetVehiclePrice(i));
			
			SaleVehicleLabels[i] = Create3DTextLabel(message, -1, X, Y, Z, 10, 0, 0);
	        Attach3DTextLabelToVehicle(SaleVehicleLabels[i], i, 0, 0, 0);
		}
	}

	// Load great parking
	LoadLosSantosParking();
	
	// Load Los Santos airport
	LoadLosSantosAirport();
	
	// Load rent vehicles
	LoadRentVehicles();
	
	// Load sale vehicles
	LoadSaleVehicles();
	
	// Load Los Santos police department
	LoadLosSantosPoliceDepartment();

	// Load owned vehicles
	LoadVehicles(); 
	
	// Load all houses
	LoadHouses();
	
	// Load all businesses
	LoadBusinesses();
	
	SetTimer("CheckVehicleFuel", 60000, true);
	
	return 1;
}

public OnGameModeExit()
{
	for(new i = 0; i < GlobalVehiclesCounter; i++)
		SaveVehicle(i);

	for(new i = 0; i < GlobalHousesCounter; i++)
		SaveHouse(i);

	for(new i = 0; i < GlobalBusinessesCounter; i++)
		SaveBusiness(i);

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
	new playerName[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playerName, sizeof(playerName));
	AntiRoleplayName(playerid, playerName);
	CheckPlayerData(playerid);	
	
	IsPlayerRentingVehicle[playerid] = 0;
	RentedVehicle[playerid] = 0;
	StartingVehicleEngine[playerid] = 0;
	RefuellingVehicle[playerid] = 0;
	RefillLitre[playerid] = 0;
	HasBelt[playerid] = 0;
	HasHelmet[playerid] = 0;
	
	VehicleSellOffer[playerid] = 9999;
 	VehicleBuyOffer[playerid] = 9999;
 	VehicleForOffer[playerid] = 9999;
	VehiclePlayerOffer[playerid] = 9999;
	VehicleOfferPrice[playerid] = 0;
	
	HouseSellOffer[playerid] = 9999;
 	HouseBuyOffer[playerid] = 9999;
 	HouseForOffer[playerid] = 9999;
	HousePlayerOffer[playerid] = 9999;
	HouseOfferPrice[playerid] = 0;
	InHouse[playerid] = 0;

	BusinessSellOffer[playerid] = 9999;
 	BusinessBuyOffer[playerid] = 9999;
 	BusinessForOffer[playerid] = 9999;
	BusinessPlayerOffer[playerid] = 9999;
	BusinessOfferPrice[playerid] = 0;
	InBusiness[playerid] = 0;


	iCall[playerid] = 0;
	Caller[playerid] = 0;
	CalledPlayer[playerid] = 0;
	InCall[playerid] = 0;

	FuelTD[playerid] = TextDrawCreate(526.399963, 412.906738, "Gorivo: 100");
	TextDrawLetterSize(FuelTD[playerid], 0.449999, 1.600000);
	TextDrawAlignment(FuelTD[playerid], 1);
	TextDrawColor(FuelTD[playerid], 16711935);
	TextDrawSetShadow(FuelTD[playerid], 0);
	TextDrawSetOutline(FuelTD[playerid], 1);
	TextDrawBackgroundColor(FuelTD[playerid], 51);
	TextDrawFont(FuelTD[playerid], 1);
	TextDrawSetProportional(FuelTD[playerid], 1);

	InLSPDPoliceHQ[playerid] = 0;
	
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	new Float:X, Float:Y, Float:Z;
	
	// If player rented a vehicle, respawn it
	if(IsPlayerRentingVehicle[playerid]) SetVehicleToRespawn(RentedVehicle[playerid]);
	
	GetPlayerPos(playerid, X, Y, Z);
	PlayerInfo[playerid][SpawnX] = X;
	PlayerInfo[playerid][SpawnY] = Y;
	PlayerInfo[playerid][SpawnZ] = Z;
	
	SavePlayer(playerid);
		
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
	new Float:vehicleHealth, engine, lights, alarm, doors, bonnet, boot, objective;
	
	GetPlayerHealth(playerid, health);
	if(IsABike(vehicleid))
	{
		if(HasHelmet[playerid] != 1)
		{
			SetPlayerHealth(playerid, floatround(health, floatround_round) -5);
		}
	}
	else if(HasBelt[playerid] != 1)
	{
		SetPlayerHealth(playerid, floatround(health, floatround_round) -5);
	}

 	if(VehicleEngine[vehicleid] == 1)
  	{
   		GetVehicleHealth(vehicleid, vehicleHealth);
	    if(vehicleHealth <= 500.0)
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
	new prefix[64], playerName[MAX_PLAYER_NAME], str[128];
	/*if(DetectiveDuty[playerid] != 9999) playerName = "Detektiv";
	else GetPlayerNameEx(playerid, playerName, MAX_PLAYER_NAME);*/
	GetPlayerName(playerid, playerName, sizeof(playerName));
	if(PlayerInfo[playerid][Muted] != 9999)
	{
	    format(str, sizeof(str), "Mutirani ste, ne mozete da pisete! Sacekajte jos %d sekundi", PlayerInfo[playerid][MutedTime]);
		SendClientMessage(playerid, COLOR_RED, str);
	}
	else
	{
	    if(text[0] == '#' && PlayerInfo[playerid][Admin] != 9999)
	    {
			if(PlayerInfo[playerid][Admin] == 2) prefix = "[MODERATOR]";
			else if(PlayerInfo[playerid][Admin] == 3) prefix = "[ADMIN]";
			else if(PlayerInfo[playerid][Admin] == 4) prefix = "[ADMIN]";
			else if(PlayerInfo[playerid][Admin] == 5) prefix = "[SUVLASNIK]";
			else if(PlayerInfo[playerid][Admin] == 6) prefix = "[VLASNIK]";
			else if(PlayerInfo[playerid][Level] == 1) prefix = "[POCETNIK]";


			for(new i = 0; i < MAX_PLAYERS; i++)
			{
			    if(PlayerInfo[i][Admin] != 9999)
			    {
			        format(str, sizeof(str), "%s %s adminima: %s", prefix, playerName, text[1]);
			        SendClientMessage(i, COLOR_WHITE, str);
				}
			}
		}
		else if(text[0] == '@' && PlayerInfo[playerid][Admin] != 9999)
	    {
	    	if(PlayerInfo[playerid][Admin] == 1) prefix = "[MODERATOR]";
			else if(PlayerInfo[playerid][Admin] == 2) prefix = "[MODERATOR]";
			else if(PlayerInfo[playerid][Admin] == 3) prefix = "[ADMIN]";
			else if(PlayerInfo[playerid][Admin] == 4) prefix = "[ADMIN]";
			else if(PlayerInfo[playerid][Admin] == 5) prefix = "[SUVLASNIK]";
			else if(PlayerInfo[playerid][Admin] == 6) prefix = "[VLASNIK]";
			format(str, sizeof(str), "%s %s: %s", prefix, playerName, text[1]);
			SendClientMessageToAll(COLOR_WHITE, str);
		}
		else
		{
			if(InCall[playerid] == 9999)
			{
				format(str, sizeof(str), "[IC][ID %d] %s says: %s", playerid, playerName, text);
		  		SendRadiusMessage(50.0, playerid, str, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE);
				SetPlayerChatBubble(playerid, str, COLOR_WHITE, 50.0, 10000);
			}
			else if(InCall[playerid] == 1)
			{
			    format(str, sizeof(str), "[MOBILE][ID %d] %s says: %s", playerid, playerName, text);
			    SendRadiusMessage(50.0, playerid, str, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE);
			    if(iCall[playerid] != 9999) SendClientMessage(CalledPlayer[playerid], COLOR_WHITE, str);
			    else SendClientMessage(Caller[playerid], COLOR_WHITE, str);
			}
		}
	}

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
	new vehicle_name[32], vehicle_owner[64], str[128];
	GetVehicleName(vehicleid, vehicle_name, sizeof(vehicle_name));
	vehicle_owner = GetVehicleOwnerName(vehicleid);
	
	if(IsAOwnedVehicle(vehicleid))
	{
	    format(str, sizeof(str), "Ulazite u %s (%d). Vlasnik: %s", vehicle_name, vehicleid, vehicle_owner);
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
		    HasBelt[playerid] = 0;
		    format(str, sizeof(str), "Odvezali ste pojas.");
		    SendClientMessage(playerid, -1, str);
		    format(str, sizeof(str), "%s odvezuje svoj pojas.", playername);
		    SendRadiusMessage(10.0, playerid, str, -1, -1, -1, -1, -1);
		}

	    if(HasHelmet[playerid] == 1)
		{
		    HasHelmet[playerid] = 0;
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
	if(newkeys == KEY_SECONDARY_ATTACK) 
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1553.9333, -1675.6754, 16.1953)) // Los Santos PoliceHQ ENTER
		{
		    TogglePlayerControllable(playerid, 0);
		    SetTimerEx("AntiFreezePlayer", 1000, false, "i", playerid);
			SetPlayerPos(playerid, 246.783996, 63.900199, 1003.640625);
			SetPlayerInterior(playerid, 6);
			InLSPDPoliceHQ[playerid] = 1;
		}
        else if(IsPlayerInRangeOfPoint(playerid, 2.0, 246.783996, 63.900199, 1003.640625)) // Los Santos PoliceHQ EXIT
		{
			SetPlayerPos(playerid, 1553.9333, -1675.6754, 16.1953);
			SetPlayerInterior(playerid, 0);
			InLSPDPoliceHQ[playerid] = 0;
		}
		else 
		{
			for(new i = 0; i < sizeof(HouseInfo); i++)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.0, HouseInfo[i][EnterX], HouseInfo[i][EnterY], HouseInfo[i][EnterZ]))
				{
					if(HouseInfo[i][Locked] == 1) return 1;
					TogglePlayerControllable(playerid, 0);
					SetTimerEx("AntiFreezePlayer", 1000, false, "i", playerid);
					SetPlayerPos(playerid, HouseInfo[i][ExitX], HouseInfo[i][ExitY], HouseInfo[i][ExitZ]);
					SetPlayerFacingAngle(playerid, HouseInfo[i][ExitA]);
					SetPlayerInterior(playerid, HouseInfo[i][InsideInterior]);
					SetPlayerVirtualWorld(playerid, HouseInfo[i][InsideVirtualWorld]);

					InHouse[playerid] = i;

					return 1;
				}
				else if(IsPlayerInRangeOfPoint(playerid, 2.0, HouseInfo[i][ExitX], HouseInfo[i][ExitY], HouseInfo[i][ExitZ]) && GetPlayerVirtualWorld(playerid) == HouseInfo[i][InsideVirtualWorld])
				{
					if(InHouse[playerid] == 0) return 1;
					SetPlayerPos(playerid, HouseInfo[i][EnterX], HouseInfo[i][EnterY], HouseInfo[i][EnterZ]);
					SetPlayerFacingAngle(playerid, HouseInfo[i][EnterA]);
					SetPlayerInterior(playerid, HouseInfo[i][OutsideInterior]);
					SetPlayerVirtualWorld(playerid, HouseInfo[i][OutsideVirtualWorld]);

					InHouse[playerid] = 0;

					return 1;
				}
			}

			for(new i = 0; i < sizeof(BusinessInfo); i++)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.0, BusinessInfo[i][EnterX], BusinessInfo[i][EnterY], BusinessInfo[i][EnterZ]))
				{
					if(GetPlayerMoney(playerid) < BusinessInfo[i][EnterFee]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate dovoljno novca da bi usli u biznis!");
					if(BusinessInfo[i][Locked] == 1) return 1;
					PlayerInfo[playerid][Money] -= BusinessInfo[i][EnterFee];
					GivePlayerMoney(playerid, -BusinessInfo[i][EnterFee]);
					SavePlayer(playerid);
					TogglePlayerControllable(playerid, 0);
					SetTimerEx("AntiFreezePlayer", 1000, false, "i", playerid);
					SetPlayerPos(playerid, BusinessInfo[i][ExitX], BusinessInfo[i][ExitY], BusinessInfo[i][ExitZ]);
					SetPlayerFacingAngle(playerid, BusinessInfo[i][ExitA]);
					SetPlayerInterior(playerid, BusinessInfo[i][InsideInterior]);
					SetPlayerVirtualWorld(playerid, BusinessInfo[i][InsideVirtualWorld]);
					BusinessInfo[i][Money] += BusinessInfo[i][EnterFee];
					
					InBusiness[playerid] = i;
					
					return 1;
				}
				else if(IsPlayerInRangeOfPoint(playerid, 2.0, BusinessInfo[i][ExitX], BusinessInfo[i][ExitY], BusinessInfo[i][ExitZ]) && GetPlayerVirtualWorld(playerid) == BusinessInfo[i][InsideVirtualWorld])
				{
					SetPlayerPos(playerid, BusinessInfo[i][EnterX], BusinessInfo[i][EnterY], BusinessInfo[i][EnterZ]);
					SetPlayerFacingAngle(playerid, BusinessInfo[i][EnterA]);
					SetPlayerInterior(playerid, BusinessInfo[i][OutsideInterior]);
					SetPlayerVirtualWorld(playerid, BusinessInfo[i][OutsideVirtualWorld]);
					
					InBusiness[playerid] = 0;
				
					return 1;
				}
			}
		}
	}
	else if(newkeys == KEY_YES)
	{
		new vehicleID, playername[MAX_PLAYER_NAME], Float:vehicleHealth, str[128];
		
		if(!IsPlayerInAnyVehicle(playerid)) return 1;
		vehicleID = GetPlayerVehicleID(playerid);
		if(IsASaleVehicle(vehicleID)) return 1;
		if(IsARentVehicle(vehicleID) && (IsPlayerRentingVehicle[playerid] == 0 || RentedVehicle[playerid] != vehicleID)) return 1;
		if(VehicleEngine[vehicleID] == 1) return 1;

		GetVehicleHealth(vehicleID, vehicleHealth);
	    if(vehicleHealth <= 500.0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ne mozete upaliti motor vozila. Motor je ostecen!");
	    if(StartingVehicleEngine[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Vec pokusavate da upalite motor vozila!");
	    
		StartingVehicleEngine[playerid] = 1;
		TogglePlayerControllable(playerid, 0);
		SetTimerEx("StartVehicleEngine", 3500, false, "ii", playerid, vehicleID);
	    GameTextForPlayer(playerid, "~w~Pokretanje motora vozila...", 3500, 3);

	    GetPlayerName(playerid, playername, sizeof(playername));
    	format(str, sizeof(str), "%s okrece kljuc i pokusava da upali motor vozila.", playername);
    	SendRadiusMessage(50.0, playerid, str, -1, -1, -1, -1, -1);
	}
	else if(newkeys == KEY_CROUCH)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 1589.7000000, -1638.3101000, 14.2700000)) // LSPD
		{
		    new playerName[MAX_PLAYER_NAME], str[128];
			GetPlayerName(playerid, playerName, sizeof(playerName));
			// if(PlayerInfo[playerid][OMember] != 1) return 1;
			if(lspdGarageOpened == 1) return 1;
			MoveDynamicObject(lspdGarage, 1597.7000000, -1638.3101000, 14.2700000, 5.0, 0.0000000, 0.0000000, 90.0000000);
			lspdGarageOpened = 1;
			SendClientMessage(playerid, -1, "Otvorili ste PD garazu, zatvorice se sama za 10 sekundi!");
			format(str, sizeof(str), "%s otvara garazu LSPDa!", playerName);
			SendRadiusMessage(15.0, playerid, str, -1, -1, -1, -1, -1);
			SetTimer("closeLspdGarage", 10000, 0);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 5.0, 1582.4000000, -1638.0500000, 15.0000000)) // LSPD
		{
		    new playerName[MAX_PLAYER_NAME], str[128];
			GetPlayerName(playerid, playerName, sizeof(playerName));
			// if(PlayerInfo[playerid][OMember] != 1 || PlayerInfo[playerid][OLeader] != 1) return 1;
			if(lspdGarageDoorOpened == 1) return 1;
			MoveDynamicObject(lspdGarageDoor, 1582.4000000, -1638.0500000, 12.5000000, 5.0, 0.0000000, 0.0000000, 90.0000000);
			lspdGarageDoorOpened = 1;
			SendClientMessage(playerid, -1, "Otvorili ste PD garazu, zatvorice se sama za 10 sekundi!");
			format(str, sizeof(str), "%s otvara garazu LSPDa!", playerName);
			SendRadiusMessage(15.0, playerid, str, -1, -1, -1, -1, -1);
			SetTimer("closeLspdGarageDoor", 10000, 0);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 250.611, 63.2995, 1003.18))
		{
			// if(PlayerInfo[playerid][OMember] != 1) return 1;
			if(lspdDoor1Opened == 1) return 1;
			MoveDynamicObject(lspdDoor1, 250.611, 63.2995, 1000.18, 1.0, 0.00, 0.00, 0.00);
			lspdDoor1Opened = 1;
			SetTimer("closeLspdDoor1", 5000, 0);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 246.228, 72.4962, 1003.04))
		{
			// if(PlayerInfo[playerid][OMember] != 1) return 1;
			if(lspdDoor2Opened == 1) return 1;
			MoveDynamicObject(lspdDoor2, 246.228, 72.4962, 1000.04, 1.0, 0.00, 0.00, 90.00);
			lspdDoor2Opened = 1;
			SetTimer("closeLspdDoor2", 5000, 0);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 250.524, 67.650, 1002.58))
		{
			// if(PlayerInfo[playerid][OMember] != 1) return 1;
			if(lspdWindowOpened == 1) return 1;
			MoveDynamicObject(lspdWindow, 250.524, 67.650, 999.58, 1.0, 0.00, 0.00, 90.00);
			lspdWindowOpened = 1;
			SetTimer("closeLspdWindow", 5000, 0);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 266.29559, 79.27300, 1002.59998))
		{
			// if(PlayerInfo[playerid][OMember] != 1) return 1;
			if(lspdCell1Opened == 1) return 1;
			MoveDynamicObject(lspdCell1, 266.29559, 77.55000, 1002.59998, 1.0, 0.00000, 0.00000, 0.00000);
			lspdCell1Opened = 1;
			SetTimer("closeLspdCell1", 5000, 0);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 266.29559, 83.77230, 1002.59998))
		{
			// if(PlayerInfo[playerid][OMember] != 1) return 1;
			if(lspdCell2Opened == 1) return 1;
			MoveDynamicObject(lspdCell2, 266.29559, 82.05180, 1002.59998, 1.0, 0.00000, 0.00000, 0.00000);
			lspdCell2Opened = 1;
			SetTimer("closeLspdCell2", 5000, 0);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 266.29559, 88.26910, 1002.59998))
		{
			// if(PlayerInfo[playerid][OMember] != 1) return 1;
			if(lspdCell3Opened == 1) return 1;
			MoveDynamicObject(lspdCell3, 266.29559, 86.54900, 1002.59998, 1.0, 0.00000, 0.00000, 0.00000);
			lspdCell3Opened = 1;
			SetTimer("closeLspdCell3", 5000, 0);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 247.98140, 87.49130, 1005.20001))
		{
			// if(PlayerInfo[playerid][OMember] != 1) return 1;
			if(lspdCellRoomDoorOpened == 1) return 1;
			MoveDynamicObject(lspdCellRoomDoor, 247.98140, 85.8, 1005.20001, 1.0, 0.00000, 0.00000, 0.00000);
			lspdCellRoomDoorOpened = 1;
			SetTimer("closeLspdCellRoomDoor", 5000, 0);
		}
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
				PlayerInfo[playerid][Skin] = 170;
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
				PlayerInfo[playerid][Skin] = 169;
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
			new query[256], message[256], playerName[MAX_PLAYER_NAME], player_age, player_sex[8], player_country[32], player_city[16];
			
			if(!response)
			{
				return Kick(playerid);
			}
			
			GetPlayerName(playerid, playerName, sizeof(playerName));
			
			switch(listitem)
			{
				// Los Santos
				case 0:
				{
					PlayerInfo[playerid][City] = 0;
					PlayerInfo[playerid][SpawnX] = 1642.2903;
					PlayerInfo[playerid][SpawnY] = -2333.3423;
					PlayerInfo[playerid][SpawnZ] = 13.5469;
					PlayerInfo[playerid][SpawnA] = 0.0;
					mysql_format(mysql, query, sizeof(query), "UPDATE Users \
																SET city = %d, spawnX = %f, spawnY = %f, spawnZ = %f \
																WHERE id = %d", PlayerInfo[playerid][City], PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query);
					
					player_age = PlayerInfo[playerid][Age];
					player_sex = GetPlayerGender(playerid);
					player_country = GetPlayerCountry(playerid);
					player_city = GetPlayerCity(playerid);
					
					format(message, sizeof(message), ""TEXT_COLOR_WHITE"Uspesno ste zavrsili registraciju. \n"TEXT_COLOR_RED"Ime_Prezime: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Pol: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Godina: "TEXT_COLOR_WHITE"%d \n"TEXT_COLOR_RED"Drzava: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Grad: "TEXT_COLOR_WHITE"%s \nUnesite Vasu lozinku da se prijavite", playerName, player_sex, player_age, player_country, player_city);
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, ""TEXT_COLOR_RED"Login", message, "Dalje", "Izlaz");					
				}
				// Las Venturas
				case 1:
				{
					PlayerInfo[playerid][City] = 1;
					PlayerInfo[playerid][SpawnX] = 1676.4181;
					PlayerInfo[playerid][SpawnY] = 1447.8713;
					PlayerInfo[playerid][SpawnZ] = 10.7845;
					PlayerInfo[playerid][SpawnA] = 270.4988;
					
					mysql_format(mysql, query, sizeof(query), "UPDATE Users \
																SET city = %d, spawnX = %f, spawnY = %f, spawnZ = %f \
																WHERE id = %d", PlayerInfo[playerid][City], PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query);
					
					format(message, sizeof(message), ""TEXT_COLOR_WHITE"Uspesno ste zavrsili registraciju. \n"TEXT_COLOR_RED"Ime_Prezime: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Pol: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Godina: "TEXT_COLOR_WHITE"%d \n"TEXT_COLOR_RED"Drzava: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Grad: "TEXT_COLOR_WHITE"%s \nUnesite Vasu lozinku da se prijavite", playerName, player_sex, player_age, player_country, player_city);
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, ""TEXT_COLOR_RED"Login", message, "Dalje", "Izlaz");	
				}
				// San Fierro
				case 2:
				{
					PlayerInfo[playerid][City] = 2;
					PlayerInfo[playerid][SpawnX] = 1410.8577;
					PlayerInfo[playerid][SpawnY] = -301.6284;
					PlayerInfo[playerid][SpawnZ] = 14.1484;
					PlayerInfo[playerid][SpawnA] = 136.9096;
					mysql_format(mysql, query, sizeof(query), "UPDATE Users \
																SET city = %d, spawnX = %f, spawnY = %f, spawnZ = %f \
																WHERE id = %d", PlayerInfo[playerid][City], PlayerInfo[playerid][SpawnX], PlayerInfo[playerid][SpawnY], PlayerInfo[playerid][SpawnZ], PlayerInfo[playerid][ID]);
					mysql_tquery(mysql, query);
					
					player_age = PlayerInfo[playerid][Age];
					player_sex = GetPlayerGender(playerid);
					player_country = GetPlayerCountry(playerid);
					player_city = GetPlayerCity(playerid);
		
					format(message, sizeof(message), ""TEXT_COLOR_WHITE"Uspesno ste zavrsili registraciju. \n"TEXT_COLOR_RED"Ime_Prezime: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Pol: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Godina: "TEXT_COLOR_WHITE"%d \n"TEXT_COLOR_RED"Drzava: "TEXT_COLOR_WHITE"%s \n"TEXT_COLOR_RED"Grad: "TEXT_COLOR_WHITE"%s \nUnesite Vasu lozinku da se prijavite", playerName, player_sex, player_age, player_country, player_city);
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, ""TEXT_COLOR_RED"Login", message, "Dalje", "Izlaz");	
				}
			}
		}
		
		case DIALOG_BUY_VEHICLE:
		{
			if(!response)
			{
				VehicleSellOffer[VehiclePlayerOffer[playerid]] = 9999;
				VehicleBuyOffer[playerid] = 9999;
				VehicleForOffer[playerid] = 9999;
				VehicleOfferPrice[playerid] = 0;
				VehiclePlayerOffer[playerid] = 9999;

				SendClientMessage(playerid, COLOR_RED, "Odbili ste da kupite vozilo!");
				SendClientMessage(VehiclePlayerOffer[playerid], COLOR_RED, "Igrac je odbio ponudu za vozilo!");
			}
			if(response)
			{
				if(GetPlayerMoney(playerid) < VehicleOfferPrice[playerid])
				{
					VehicleSellOffer[VehiclePlayerOffer[playerid]] = 9999;
					VehicleBuyOffer[playerid] = 9999;
					VehicleForOffer[playerid] = 9999;
					VehicleOfferPrice[playerid] = 0;
					VehiclePlayerOffer[playerid] = 9999;

					SendClientMessage(playerid, COLOR_RED, "Nemate dovoljno novca da kupite vozilo!");
					SendClientMessage(VehiclePlayerOffer[playerid], COLOR_RED, "Igrac nema dovoljno novca da kupi vozilo!");
				}
				else
				{
					new playerName[MAX_PLAYER_NAME], player, vehicleID, vehicle_model;

					GetPlayerName(playerid, playerName, sizeof(playerName));
					player = VehiclePlayerOffer[playerid];
					vehicleID = VehicleForOffer[playerid];
					vehicle_model = GetVehicleModel(vehicleID);
					//strmid(VehicleInfo[VehicleForOffer[playerid]][vOwner], playerName, 0, strlen(playerName), 999);
					VehicleInfo[vehicleID][Owner] = PlayerInfo[playerid][ID];
					VehicleInfo[vehicleID][Locked] = 1;

					RemovePlayerFromVehicle(player);

					PlayerInfo[playerid][Money] -= VehicleOfferPrice[playerid];
					GivePlayerMoney(playerid, -VehicleOfferPrice[playerid]);
					SavePlayer(playerid);
					SendClientMessage(playerid, COLOR_GREEN, "KUPILI STE VOZILO!");

					PlayerInfo[player][Money] += VehicleOfferPrice[playerid];
					GivePlayerMoney(player, VehicleOfferPrice[playerid]);
					SavePlayer(player);
					SendClientMessage(player, COLOR_GREEN, "PRODALI STE VOZILO!");

					SaveVehicle(vehicleID);
					DestroyVehicle(vehicleID);

					OwnedVehicles[vehicleID] = CreateVehicle(vehicle_model, VehicleInfo[vehicleID][ParkX], VehicleInfo[vehicleID][ParkY], VehicleInfo[vehicleID][ParkZ], VehicleInfo[vehicleID][ParkA], VehicleInfo[vehicleID][Color1], VehicleInfo[vehicleID][Color2], -1);

					VehicleSellOffer[player] = 9999;
					VehicleBuyOffer[playerid] = 9999;
					VehicleForOffer[playerid] = 9999;
					VehicleOfferPrice[playerid] = 0;
					VehiclePlayerOffer[playerid] = 9999;
				}
				return 1;
			}
		}

		case DIALOG_BUY_HOUSE:
		{
			if(!response)
			{
			    HouseSellOffer[HousePlayerOffer[playerid]] = 9999;
				HouseBuyOffer[playerid] = 9999;
			 	HouseForOffer[playerid] = 9999;
			 	HouseOfferPrice[playerid] = 0;
				HousePlayerOffer[playerid] = 9999;

				SendClientMessage(playerid, -1, "Odbili ste da kupite kucu!");
				SendClientMessage(HousePlayerOffer[playerid], -1, "Igrac je odbio ponudu za kucu!");
			}
			if(response)
			{
			    if(GetPlayerMoney(playerid) < HouseOfferPrice[playerid])
			    {
			        HouseSellOffer[HousePlayerOffer[playerid]] = 9999;
					HouseBuyOffer[playerid] = 9999;
				 	HouseForOffer[playerid] = 9999;
				 	HouseOfferPrice[playerid] = 0;
					HousePlayerOffer[playerid] = 9999;

					SendClientMessage(playerid, -1, "Nemate dovoljno novca da kupite kucu!");
					SendClientMessage(HousePlayerOffer[playerid], -1, "Igrac nema dovoljno novca da kupi kucu!");
			    }
			    else
			    {
	       			new player, id, playerName[MAX_PLAYER_NAME], house3dtext[256];
					GetPlayerName(playerid, playerName, sizeof(playerName));
					player = HousePlayerOffer[playerid];

					id = HouseForOffer[playerid];
					HouseInfo[id][Owner] = PlayerInfo[playerid][ID];
					HouseInfo[id][Locked] = 1;

					PlayerInfo[playerid][Money] -= HouseOfferPrice[playerid];
					GivePlayerMoney(playerid, -HouseOfferPrice[playerid]);

					PlayerInfo[player][Money] += HouseOfferPrice[playerid];
					GivePlayerMoney(player, HouseOfferPrice[playerid]);

					SendClientMessage(playerid, -1, "KUPILI STE KUCU!");
					SendClientMessage(player, -1, "PRODALI STE KUCU!");
					SavePlayer(player);
					SavePlayer(playerid);
					SaveHouse(id);

					format(house3dtext, sizeof(house3dtext), ""TEXT_COLOR_WHITE" Ova kuca ima vlasnika !\n "TEXT_COLOR_RED"Vlasnik kuce"TEXT_COLOR_WHITE": %s\n "TEXT_COLOR_RED"ID Kuce"TEXT_COLOR_WHITE": %d", GetHouseOwnerName(HouseInfo[id][ID]), HouseInfo[id][ID]);
					Update3DTextLabelText(HouseLabelArray[id], -1, house3dtext);

					HouseSellOffer[player] = 9999;
					HouseBuyOffer[playerid] = 9999;
				 	HouseForOffer[playerid] = 9999;
				 	HouseOfferPrice[playerid] = 0;
			 		HousePlayerOffer[playerid] = 9999;
				}
				return 1;
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
	
	new vehicleID, vehicle, color1, color2, Float:X, Float:Y, Float:Z;
	
	if(sscanf(params, "iii", vehicle, color1, color2))
	{
		return SendClientMessage(playerid, -1, "[[USAGE]]: /avehicle [id_vozila] [boja1] [boja2]");
	}
	
	GetPlayerPos(playerid, X, Y, Z);
	vehicleID = CreateVehicle(vehicle, X+1, Y+1, Z, 270.0, color1, color2, -1);
	VehicleEngine[vehicleID] = 0;
	VehicleFuel[vehicleID] = 30;
	return 1;
}

/* YCMD:(playerid, params[], help)
{
	#pragma unused help
	
	
	
	return 1;
}*/

YCMD:amoney(playerid, params[], help)
{
	#pragma unused help
	new player, money, playerName[MAX_PLAYER_NAME], message[128];
	//if((PlayerInfo[playerid][Admin] < 6) || (PlayerInfo[playerid][Admin] == 9999)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu!");
	if(sscanf(params, "ri", player, money)) return SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /amoney [id/deo imena] [kolicina]");

	PlayerInfo[player][Money] += money;
	GivePlayerMoney(player, money);
	
	SavePlayer(player);

	GetPlayerName(playerid, playerName, sizeof(playerName));
	format(message, sizeof(message), "Admin %s Vam je dao %d$.", playerName, money);
	SendClientMessage(player, COLOR_GREEN, message);

	GetPlayerName(player, playerName, sizeof(playerName));
	format(message, sizeof(message), "Dali ste igracu %s %d$.", playerName, money);
	SendClientMessage(playerid, COLOR_GREEN, message);
	return 1;
}

// Command that respawns all rent vehicles
// TO:DO - Check if player is admin
YCMD:respawnrentvehicles(playerid, params[], help)
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
	
	SendClientMessage(playerid, -1, "All unused rent vehicles are respawned.");
	return 1;
}

YCMD:rentvehicle(playerid, params[], help)
{
	#pragma unused help
	
	new vehicleID;
	
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are not in vehicle!");
	
	vehicleID = GetPlayerVehicleID(playerid);
	if(!IsARentVehicle(vehicleID)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are not in rent vehicle!");
	//if(GetPlayerMoney(playerid) < 50) return SendClientMessage(playerid, -1 ,"[ERROR]: You dont have enough money to rent a vehicle!");
	if(IsPlayerRentingVehicle[playerid]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are already renting a vehicle!");
	
	for(new i = 0; i < MAX_PLAYERS; i++) 
	{
		if(RentedVehicle[i] == vehicleID) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Someone already rented this vehicle!");
	}
	
	IsPlayerRentingVehicle[playerid] = 1;
	RentedVehicle[playerid] = vehicleID;
   	TogglePlayerControllable(playerid, 1);
	
	SendClientMessage(playerid, -1, "Iznajmili ste vozilo. Da vratite vozilo kucajte: /vrativozilo");
	
	return 1;
}

YCMD:returnvehicle(playerid, params[], help)
{
	#pragma unused help

	new vehicleID = GetPlayerVehicleID(playerid);
	
	if(!IsPlayerRentingVehicle[playerid]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate iznajmljeno vozilo.");
	
	if(vehicleID == RentedVehicle[playerid]) TogglePlayerControllable(playerid, 1);
	SetVehicleToRespawn(RentedVehicle[playerid]);
	IsPlayerRentingVehicle[playerid] = 0;
	RentedVehicle[playerid] = 0;
	
	SendClientMessage(playerid, -1, "Vratili ste iznajmljeno vozilo.");
	
	return 1;
}

YCMD:engine(playerid, params[], help)
{
	#pragma unused help
	
	new playername[MAX_PLAYER_NAME], vehicleID, engine, lights, alarm, doors, bonnet, boot, objective, Float:vehicleHealth, str[128];
	
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are not in vehicle!");
	vehicleID = GetPlayerVehicleID(playerid);
	GetVehicleParamsEx(vehicleID, engine, lights, alarm, doors, bonnet, boot, objective);
	if(IsASaleVehicle(vehicleID)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ne mozete pokrenuti motor ovog vozila!");
	if(IsARentVehicle(vehicleID) && (IsPlayerRentingVehicle[playerid] == 0 || RentedVehicle[playerid] != vehicleID)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ne mozete pokrenuti motor ovog vozila!");
	if(VehicleFuel[vehicleID] == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Rezervoar je prazan!");
	if(RefuellingVehicle[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Sipanje goriva u toku!");
	if(VehicleEngine[vehicleID] == 0)
	{
    	GetVehicleHealth(vehicleID, vehicleHealth);
	    if(vehicleHealth <= 500.0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ne mozete upaliti motor vozila. Motor je ostecen!");
	    if(StartingVehicleEngine[playerid] == 1) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Vec pokusavate da pokrenete motor vozila!");
	    StartingVehicleEngine[playerid] = 1;
    	TogglePlayerControllable(playerid, 0);
		SetTimerEx("StartVehicleEngine", 3500, false, "ii", playerid, vehicleID);
	    GameTextForPlayer(playerid, "~w~Pokretanje motora vozila...", 3500, 3);

	    GetPlayerName(playerid, playername, sizeof(playername));
    	format(str, sizeof(str), "%s okrece kljuc i pokusava da upali motor vozila.", playername);
    	SendRadiusMessage(50.0, playerid, str, -1, -1, -1, -1, -1);
	}
	else
	{
	    SetVehicleParamsEx(vehicleID, 0, 0, alarm, doors, bonnet, boot, objective);
    	VehicleEngine[vehicleID] = 0;

    	SendClientMessage(playerid, -1, "Ugasili ste motor vozila.");
		
    	GetPlayerName(playerid, playername, sizeof(playername));
    	format(str, sizeof(str), "%s gasi motor vozila.", playername);
    	SendRadiusMessage(50.0, playerid, str, -1, -1, -1, -1, -1);
 	}
    return 1;
}

YCMD:fillfuel(playerid, params[], help)
{
	#pragma unused help
	
	new vehicleID, litre, pump1, pump2, pump3;
	
	if(sscanf(params, "i", litre)) return SendClientMessage(playerid, -1, "[USAGE]: /sipajgorivo [litara] (x5$)");
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are not in vehicle!");
	vehicleID = GetPlayerVehicleID(playerid);
	
	pump1 = IsPlayerNearPump1(playerid);
	pump2 = IsPlayerNearPump2(playerid);
	pump3 = IsPlayerNearPump3(playerid);
	
	if(pump1 != -1 && pump1 != 0)
	{
		if(VehicleEngine[vehicleID] == 1) return SendClientMessage(playerid, -1, "Morate prvo ugasiti motor! (/engine)");
		//if(GetPlayerMoney(playerid) < litre*5) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate dovoljno novca da sipate gorivo! (litar 5$)");
		if(IsABike(vehicleID) && litre + VehicleFuel[vehicleID] > 30) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ne mozete da sipate toliko goriva! (30l rezervoar)");
		else if(litre + VehicleFuel[vehicleID] > 60) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ne mozete da sipate toliko goriva! (60l rezervoar)");
		
		TogglePlayerControllable(playerid, 0);
		GameTextForPlayer(playerid, "~w~PUNJENJE GORIVA...", 10000, 3);
		SetTimerEx("AntiFreezePlayer", litre, false, "i", playerid);
		RefuellingVehicle[playerid] = 1;
		RefillLitre[playerid] = litre;
	}
	else if(pump2 != -1 && pump2 != 0)
	{
		if(VehicleEngine[vehicleID] == 1) return SendClientMessage(playerid, -1, "Morate prvo ugasiti motor! (/engine)");
		//if(GetPlayerMoney(playerid) < litre*5) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate dovoljno novca da sipate gorivo! (litar 5$)");
		if(IsABike(vehicleID) && litre + VehicleFuel[vehicleID] > 30) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ne mozete da sipate toliko goriva! (30l rezervoar)");
		else if(litre + VehicleFuel[vehicleID] > 60) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ne mozete da sipate toliko goriva! (60l rezervoar)");
		
		TogglePlayerControllable(playerid, 0);
		GameTextForPlayer(playerid, "~w~PUNJENJE GORIVA...", 10000, 3);
		SetTimerEx("AntiFreezePlayer", litre, false, "i", playerid);
		RefuellingVehicle[playerid] = 1;
		RefillLitre[playerid] = litre;
	}
	else if(pump3 != -1 && pump3 != 0)
	{
		if(VehicleEngine[vehicleID] == 1) return SendClientMessage(playerid, -1, "Morate prvo ugasiti motor! (/engine)");
		//if(GetPlayerMoney(playerid) < litre*5) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate dovoljno novca da sipate gorivo! (litar 5$)");
		if(IsABike(vehicleID) && litre + VehicleFuel[vehicleID] > 30) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ne mozete da sipate toliko goriva! (30l rezervoar)");
		else if(litre + VehicleFuel[vehicleID] > 60) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ne mozete da sipate toliko goriva! (60l rezervoar)");
		
		TogglePlayerControllable(playerid, 0);
		GameTextForPlayer(playerid, "~w~PUNJENJE GORIVA...", 10000, 3);
		SetTimerEx("AntiFreezePlayer", litre, false, "i", playerid);
		RefuellingVehicle[playerid] = 1;
		RefillLitre[playerid] = litre;
	}
	else return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste na pump!");
	return 1;
}

YCMD:belt(playerid, params[], help)
{
	#pragma unused help
	
 	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are not in vehicle!");
	new str[128], vehicleID = GetPlayerVehicleID(playerid), playername[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playername, sizeof(playername));
	if(IsABike(vehicleID)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Na motoru ste, koristite kacigu! (/kaciga)");
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

YCMD:helmet(playerid, params[], help)
{
	#pragma unused help
	
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are not in vehicle!");
	new str[128], vehicleID = GetPlayerVehicleID(playerid), playername[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playername, sizeof(playername));
	if(!IsABike(vehicleID)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste na motoru, vezite pojas! (/pojas)");
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

YCMD:v(playerid, params[], help)
{
	new command[16];
	if(sscanf(params, "s[16]", command))
	{
		SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /v(ehicle) [komanda]");
		SendClientMessage(playerid, COLOR_BLUE, "Dostupne komande: buy, sell[1-3], sellto, park[1-3], lock[1-3], find[1-3], color[1-3], paintjob[1-3], save[1-3], menu");
	}
	else
	{
		if(strcmp(command, "buy", true) == 0)
		{
            new playerName[MAX_PLAYER_NAME], vehicleID, vehicle_model, model_name[64], new_vehicleID;
			
			GetPlayerName(playerid, playerName, sizeof(playerName));
			
			vehicleID = GetPlayerVehicleID(playerid);
			vehicle_model = GetVehicleModel(vehicleID);
			new_vehicleID = GlobalVehiclesCounter++;
			
			if(!IsASaleVehicle(vehicleID)) return SendClientMessage(playerid, COLOR_WHITE, "[ERROR]: Ovo vozilo nije na prodaju!");
			//if((vehicleID == 411 || vehicleID == 415 || vehicleID == 451 || vehicleID == 495 || vehicleID == 522 || vehicleID == 541) && PlayerInfo[playerid][Donator] == 9999) return SendClientMessage(playerid, COLOR_WHITE, "[ERROR]: Ne mozete kupiti ovo vozilo! Niste donator!");
			
			if(GetPlayerMoney(playerid) < GetVehiclePrice(vehicleID)) return SendClientMessage(playerid, COLOR_WHITE, "[ERROR]: Nemate dovoljno novca da bi kupili ovo vozilo!");
			GetVehicleName(vehicle_model, model_name, sizeof(model_name));

			VehicleInfo[new_vehicleID][Owned] = 1;
			VehicleInfo[new_vehicleID][Owner] = PlayerInfo[playerid][ID];
			VehicleInfo[new_vehicleID][Model] = vehicle_model;
			VehicleInfo[new_vehicleID][ParkX] = 1590.59;
			VehicleInfo[new_vehicleID][ParkY] = -2319.39;
			VehicleInfo[new_vehicleID][ParkZ] = 13.3828;
			VehicleInfo[new_vehicleID][ParkA] = 80;
			VehicleInfo[new_vehicleID][Color1] = 1;
			VehicleInfo[new_vehicleID][Color2] = 1;
			VehicleInfo[new_vehicleID][Paintjob] = 9999;
			VehicleInfo[new_vehicleID][Locked] = 1;
			VehicleInfo[new_vehicleID][Registration] = 0;
			VehicleFuel[new_vehicleID] = 60;
			
			InsertVehicle(PlayerInfo[playerid][ID], vehicle_model);
			OwnedVehicles[new_vehicleID] = CreateVehicle(vehicle_model, VehicleInfo[new_vehicleID][ParkX], VehicleInfo[new_vehicleID][ParkY], VehicleInfo[new_vehicleID][ParkZ], VehicleInfo[new_vehicleID][ParkA], VehicleInfo[new_vehicleID][Color1], VehicleInfo[new_vehicleID][Color2], -1);
			
			SendClientMessage(playerid, COLOR_GREEN, "Kupili ste vozilo. Vozilo je na parkingu, preuzmite ga.");
            
			PlayerInfo[playerid][Money] -= GetVehiclePrice(vehicle_model);
			GivePlayerMoney(playerid, -GetVehiclePrice(vehicle_model));
			
			SavePlayer(playerid);
		}
		else if(strcmp(command, "lock", true) == 0)
		{
			new Float:X, Float:Y, Float:Z;

			for(new i = 0; i < MAX_VEHICLES; i++) 
			{
				if(VehicleInfo[i][Owner] != PlayerInfo[playerid][ID]) continue;
				if(VehicleInfo[i][Owned] == 1) 
				{
					GetVehiclePos(i, X, Y, Z);
					if(IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
					{
						if(VehicleInfo[i][Locked] == 1)
						{
							SetVehicleParamsForPlayer(i, playerid, 0, 0);
							GameTextForPlayer(playerid, "~g~Vozilo otkljucano!", 2000, 3);
							VehicleInfo[i][Locked] = 0;
							SaveVehicle(i);
							
							return 1;
						}
						else
						{
							SetVehicleParamsForPlayer(i, playerid, 0, 1);
							GameTextForPlayer(playerid, "~r~Vozilo zakljucano!", 2000, 3);
							VehicleInfo[i][Locked] = 1;
							SaveVehicle(i);
							
							return 1;
						}
					}
				}
			}
			
			SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste blizu svog vozila!");

			return 1;
		}
		else if(strcmp(command, "sell", true) == 0)
		{
			new vehicleID;

			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are not in vehicle!");

			vehicleID = GetPlayerVehicleID(playerid);
			if(VehicleInfo[vehicleID][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste u vasem vozilu!");

			VehicleInfo[vehicleID][Owned] = 9999;
			VehicleInfo[vehicleID][ParkX] = 1590.3740;
			VehicleInfo[vehicleID][ParkY] = -1026.0565;
			VehicleInfo[vehicleID][ParkZ] = 23.9063;
			VehicleInfo[vehicleID][ParkA] = 317.1649;
			VehicleInfo[vehicleID][Locked] = 0;
			VehicleInfo[vehicleID][Registration] = 0;
			VehicleInfo[vehicleID][Spoiler] = 0;
			VehicleInfo[vehicleID][Hood] = 0;
			VehicleInfo[vehicleID][Roof] = 0;
			VehicleInfo[vehicleID][Side_skirt] = 0;
			VehicleInfo[vehicleID][Lamps] = 0;
			VehicleInfo[vehicleID][Nitro] = 0;
			VehicleInfo[vehicleID][Exhaust] = 0;
			VehicleInfo[vehicleID][Wheels] = 0;
			VehicleInfo[vehicleID][Stereo] = 0;
			VehicleInfo[vehicleID][Hydraulics] = 0;
			VehicleInfo[vehicleID][Front_bumper] = 0;
			VehicleInfo[vehicleID][Rear_bumper] = 0;
			VehicleInfo[vehicleID][Vent_right] = 0;
			VehicleInfo[vehicleID][Vent_left] = 0;
			VehicleEngine[vehicleID] = 0;
			VehicleFuel[vehicleID] = 60;

			DeleteVehicle(vehicleID);
			
			PlayerInfo[playerid][Money] += GetVehiclePrice(vehicleID);
			GivePlayerMoney(playerid, PlayerInfo[playerid][Money]);
			SavePlayer(playerid);
			
			RemovePlayerFromVehicle(playerid);
			DestroyVehicle(vehicleID);
			TogglePlayerControllable(playerid, 1);
			
			SendClientMessage(playerid, COLOR_GREEN, "Prodali ste vase vozilo.");

			return 1;
		}
		else if(!strfind(command, "sellto"))
		{
			new playerName[MAX_PLAYER_NAME], vehicleID, target, price, vehicle[32], Float:X, Float:Y, Float:Z, message[512];

			if(sscanf(params, "s[16]ii", command, target, price)) return SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /sellto [id igraca/deo imena] [cena]");
			if(VehicleSellOffer[playerid] != 9999) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Vec ste ponudili prodaju vozila!");
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are not in vehicle!");
			vehicleID = GetPlayerVehicleID(playerid);
			GetVehiclePos(vehicleID, X, Y, Z);
			GetVehicleName(vehicleID, vehicle, sizeof(vehicle));
			if(VehicleInfo[vehicleID][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste u svom vozilu!");
			if(!IsPlayerInRangeOfPoint(target, 7.0, X, Y, Z)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Igrac nije blizu vas!");

			VehicleSellOffer[playerid] = 1;
			VehicleBuyOffer[target] = 1;
			VehicleForOffer[target] = vehicleID;
			VehiclePlayerOffer[target] = playerid;
			VehicleOfferPrice[target] = price;

			SetTimerEx("VehicleStopOffer", 10000, false, "ii", playerid, target);
			format(message, sizeof(message), "\n"TEXT_COLOR_RED"Vozilo"TEXT_COLOR_WHITE": %s\n "TEXT_COLOR_RED"Trenutni vlasnik"TEXT_COLOR_WHITE": %s\n "TEXT_COLOR_RED"Cena"TEXT_COLOR_WHITE": %d\n "TEXT_COLOR_RED"Registrovan"TEXT_COLOR_WHITE": %s\n", vehicle, GetVehicleOwnerName(vehicleID), price, GetVehicleRegistration(vehicleID));
			ShowPlayerDialog(target, DIALOG_BUY_VEHICLE, DIALOG_STYLE_MSGBOX, ""TEXT_COLOR_RED"KUPOVINA VOZILA", message, "Kupi", "Odbij");

			GetPlayerName(target, playerName, sizeof(playerName));
			format(message, sizeof(message), "Ponudili ste igracu %s da kupi vase vozilo.", playerName);
			SendClientMessage(playerid, COLOR_GREEN, message);

			GetPlayerName(target, playerName, sizeof(playerName));
			format(message, sizeof(message), "Igrac %s Vam je ponudio da kupite njegovo vozilo.", playerName);
			SendClientMessage(target, COLOR_GREEN, message);
		}
		else if(strcmp(command, "save", true) == 0)
		{
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are not in vehicle!");
			new vehicleID = GetPlayerVehicleID(playerid);
			if(VehicleInfo[vehicleID][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "GRSKA: Niste u vasem vozilu!");
			if(VehicleInfo[vehicleID][Owned] == 1)
			{
				SaveVehicleComponents(vehicleID);

				SendClientMessage(playerid, COLOR_GREEN, "Sacuvali ste komponente vaseg vozila.");
			}

			return 1;
		}
		else if(strcmp(command, "park", true) == 0)
		{
			new vehicleID, vehicle_model, Float:X, Float:Y, Float:Z, Float:A;

			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are not in vehicle!");
			vehicleID = GetPlayerVehicleID(playerid);
			vehicle_model = GetVehicleModel(vehicleID);
			if(VehicleInfo[vehicleID][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste u vasem vozilu!");

			GetVehiclePos(vehicleID, X, Y, Z);
			GetVehicleZAngle(vehicleID, A);

			VehicleInfo[vehicleID][ParkX] = X;
			VehicleInfo[vehicleID][ParkY] = Y;
			VehicleInfo[vehicleID][ParkZ] = Z;
			VehicleInfo[vehicleID][ParkA] = A;
			VehicleEngine[vehicleID] = 0;

			printf("vehicleID je %d", vehicleID);
			printf("id vozila je %d", VehicleInfo[vehicleID][ID]);

			SaveVehicle(vehicleID);
			RemovePlayerFromVehicle(playerid);
			DestroyVehicle(vehicleID);
			TogglePlayerControllable(playerid, 1);

			OwnedVehicles[vehicleID] = CreateVehicle(vehicle_model, VehicleInfo[vehicleID][ParkX], VehicleInfo[vehicleID][ParkY], VehicleInfo[vehicleID][ParkZ], VehicleInfo[vehicleID][ParkA], VehicleInfo[vehicleID][Color1], VehicleInfo[vehicleID][Color2], -1);
			SetVehicleComponents(vehicleID);

			SendClientMessage(playerid, COLOR_GREEN, "Parkirali ste vase vozilo.");

			return 1;
		}
		else if(!strfind(command, "color"))
		{
			new color1, color2;

			if(sscanf(params, "s[16]ii", command, color1, color2)) return SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /v(ehicle) [color] [boja 1] [boja 2]");
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are not in vehicle!");
			new vehicleID = GetPlayerVehicleID(playerid);
			if(VehicleInfo[vehicleID][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste u vasem vozilu!");
			if(GetPlayerMoney(playerid) < 2500) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate dovoljno novca! ($2500)");

			PlayerInfo[playerid][Money] -= 2500;
			GivePlayerMoney(playerid, -2500);
			SavePlayer(playerid);

			ChangeVehicleColor(vehicleID, color1, color2);
			VehicleInfo[vehicleID][Color1] = color1;
			VehicleInfo[vehicleID][Color2] = color2;
			SaveVehicle(vehicleID);

			SendClientMessage(playerid, COLOR_GREEN, "Promenili ste boju vaseg vozila.");

			return 1;
		}
		else if(!strfind(command, "paintjob"))
		{
			new paintjob;

			if(sscanf(params, "s[16]ii", command, paintjob)) return SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /v(ehicle) [paintjob] [paintjob id]");
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: You are not in vehicle!");
			new vehicleID = GetPlayerVehicleID(playerid);
			if(VehicleInfo[vehicleID][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste u vasem vozilu!");
			if(GetPlayerMoney(playerid) < 5000) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate dovoljno novca! ($5000)");

			PlayerInfo[playerid][Money] -= 5000;
			GivePlayerMoney(playerid, -5000);
			SavePlayer(playerid);

			ChangeVehiclePaintjob(vehicleID, paintjob);
			VehicleInfo[vehicleID][Paintjob] = paintjob;
			SaveVehicle(vehicleID);

			SendClientMessage(playerid, COLOR_GREEN, "Promenili ste boju vaseg vozila.");

			return 1;
		}
		/*else
		{
		    SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /v(ehicle) [komanda]");
			SendClientMessage(playerid, COLOR_BLUE, "Dostupne komande: buy, sell[1-3], sellto, park[1-3], lock[1-3], find[1-3], color[1-3], paintjob[1-3], save[1-3], menu");
		}*/
	}
	return 1;
}

YCMD:h(playerid, params[], help)
{
	new command[32];
	if(sscanf(params, "s[32]", command))
	{
		SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /h(ouse) [komanda]");
		SendClientMessage(playerid, COLOR_BLUE, "Dostupne komande: buy, sell, sellto, lock, stavioruzje, uzmioruzje, stavimaterijale, uzmimaterijale, stavehicleIDrogu, uzmidrogu");
	}
	else
	{
		if(strcmp(command, "buy", true) == 0)
		{
			new playerName[MAX_PLAYER_NAME], id, message[256];

			id = IsPlayerNearHouseEnter(playerid);
			GetPlayerName(playerid, playerName, sizeof(playerName));
			
			if(id == -1 || id == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste blizu kuce!");
			if(HouseInfo[id][Owned] != 0 || HouseInfo[id][Price] == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ova kuca nije na prodaju!");
			if(GetPlayerMoney(playerid) < HouseInfo[id][Price]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate dovoljno novca da kupite ovu kucu!");

			PlayerInfo[playerid][Money] -= HouseInfo[id][Price];
			GivePlayerMoney(playerid, -HouseInfo[id][Price]);

			HouseInfo[id][Owned] = 1;
			HouseInfo[id][Owner] = PlayerInfo[playerid][ID];
			HouseInfo[id][Locked] = 0;

			DestroyPickup(HouseInfo[id][Icon]);
			HouseInfo[id][Icon] = CreatePickup(1272, 1, HouseInfo[id][EnterX], HouseInfo[id][EnterY], HouseInfo[id][EnterZ], HouseInfo[id][OutsideVirtualWorld]);
			SendClientMessage(playerid, COLOR_GREEN, "Kupili ste kucu.");

			format(message, sizeof(message), ""TEXT_COLOR_WHITE" Ova kuca ima vlasnika !\n "TEXT_COLOR_RED"Vlasnik kuce"TEXT_COLOR_WHITE": %s\n "TEXT_COLOR_RED"ID Kuce"TEXT_COLOR_WHITE": %d", GetHouseOwnerName(GlobalHousesCounter), HouseInfo[id][ID]);
			Update3DTextLabelText(HouseLabelArray[id], -1, message);

			SaveHouse(id);
			SavePlayer(playerid);

			return 1;
		}
		else if(strcmp(command, "sell", true) == 0)
		{
			new id, message[256];

			id = IsPlayerNearHouseEnter(playerid);
			if(id == -1 || id == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste blizu kuce!");
			if(HouseInfo[id][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nije vasa kuca!");

			HouseInfo[id][Owned] = 0;
			HouseInfo[id][Locked] = 1;
			HouseInfo[id][Slot1] = 9999;
			HouseInfo[id][Slot1_ammo] = 0;
			HouseInfo[id][Slot2] = 9999;
			HouseInfo[id][Slot2_ammo] = 0;
			HouseInfo[id][Slot3] = 9999;
			HouseInfo[id][Slot3_ammo] = 0;
			HouseInfo[id][Materials] = 0;
			HouseInfo[id][Drugs] = 0;

			DestroyPickup(HouseInfo[id][Icon]);
			HouseInfo[id][Icon] = CreatePickup(1273, 1, HouseInfo[id][EnterX], HouseInfo[id][EnterY], HouseInfo[id][EnterZ], HouseInfo[id][OutsideVirtualWorld]);

			PlayerInfo[playerid][Money] += HouseInfo[id][Price]/2;
			GivePlayerMoney(playerid, (HouseInfo[id][Price]/2));

			SendClientMessage(playerid, COLOR_GREEN, "Prodali ste kucu.");

			format(message, sizeof(message), ""TEXT_COLOR_WHITE" Ova kuca nema vlasnika !\n "TEXT_COLOR_RED"Cena kuce"TEXT_COLOR_WHITE": %d \n "TEXT_COLOR_RED"ID kuce"TEXT_COLOR_WHITE": %d \n "TEXT_COLOR_RED"Da kupite ovu kucu \n kucajte /h buy", HouseInfo[id][Price], HouseInfo[id][ID]);
			Update3DTextLabelText(HouseLabelArray[id], -1, message);

			SaveHouse(id);
			SavePlayer(playerid);
			return 1;
		}
		else if(!strfind(command, "sellto"))
		{
			new id, target, price, Float:X, Float:Y, Float:Z,playerName[MAX_PLAYER_NAME], str[512];
			if(sscanf(params, "s[16]ii", command, target, price)) return SendClientMessage(playerid, -1, "[USAGE]: /h(ouse) sellto [id igraca/deo imena] [cena]");
			if(HouseSellOffer[playerid] != 9999) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Vec ste ponudili prodaju kuce!");
			GetPlayerPos(target, X, Y, Z);
			if(!IsPlayerInRangeOfPoint(target, 7.0, X, Y, Z)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Igrac nije blizu vas!");
			id = IsPlayerNearHouseEnter(playerid);
			if(id == -1 || id == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste blizu kuce!");
			if(HouseInfo[id][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nije vasa kuca!");

			HouseSellOffer[playerid] = 1;
			HouseBuyOffer[target] = 1;
		 	HouseForOffer[target] = id;
			HousePlayerOffer[target] = playerid;
			HouseOfferPrice[target] = price;
			
			SetTimerEx("HouseStopOffer", 10000, false, "ii", playerid, target);
			format(str, sizeof(str), "\nIgrac "TEXT_COLOR_RED"%s"TEXT_COLOR_WHITE" Vam je ponudio da kupite kucu.\n"TEXT_COLOR_RED"ID"TEXT_COLOR_WHITE": %d\n"TEXT_COLOR_RED"Trenutni vlasnik"TEXT_COLOR_WHITE": %d\n "TEXT_COLOR_RED"Cena"TEXT_COLOR_WHITE": %d", playerName, HouseInfo[id][ID], GetHouseOwnerName(HouseInfo[id][ID]), HouseOfferPrice[playerid]);
			ShowPlayerDialog(target, DIALOG_BUY_HOUSE, DIALOG_STYLE_MSGBOX, ""TEXT_COLOR_RED"KUPOVINA KUCE", str, "Kupi", "Odbij");
			
			GetPlayerName(target, playerName, sizeof(playerName));
			format(str, sizeof(str), "Ponudili ste igracu %s da kupi kucu.", playerName);
			SendClientMessage(playerid, -1, str);
			
			GetPlayerName(playerid, playerName, sizeof(playerName));
			format(str, sizeof(str), "Igrac %s Vam je ponudio da kupite kucu.", playerName);
			SendClientMessage(target, -1, str);
			
			return 1;
		}
		else if(strcmp(command, "lock", true) == 0)
		{
			new id = IsPlayerNearHouseEnter(playerid);
			if(HouseInfo[id][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste blizu vase kuce!");
			if(HouseInfo[id][Locked] == 1)
			{
				HouseInfo[id][Locked] = 0;
				GameTextForPlayer(playerid, "Kuca ~g~otkljucana!", 3000, 3);
				SaveHouse(id);
			}
			else
			{
				HouseInfo[id][Locked] = 1;
				GameTextForPlayer(playerid, "Kuca ~r~zakljucana!", 3000, 3);
				SaveHouse(id);
			}

			return 1;
		}
		/* else
		{
		SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /h(ouse) [komanda]");
		SendClientMessage(playerid, COLOR_BLUE, "Dostupne komande: buy, sell, sellto, lock, stavioruzje, uzmioruzje, stavimaterijale, uzmimaterijale, stavehicleIDrogu, uzmidrogu");
		} */
	}
	return 1;
}

YCMD:b(playerid, params[], help)
{
	new command[16];
	if(sscanf(params, "s[16]", command))
	{
		SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /b(usiness) [komanda]");
		SendClientMessage(playerid, COLOR_BLUE, "Dostupne komande: buy, sell, lock, fee, name");
	}
	else
	{
		if(strcmp(command, "buy", true) == 0)
		{
			new id, playerName[MAX_PLAYER_NAME], message[256];
			
			GetPlayerName(playerid, playerName, sizeof(playerName));

			id = IsPlayerNearBusinessEnter(playerid);
			if(id == -1 || id == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste blizu biznisa!");
			if(BusinessInfo[id][Owned] != 0 || BusinessInfo[id][Price] == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ovaj biznis nije na prodaju!");
			if(GetPlayerMoney(playerid) < BusinessInfo[id][Price]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate dovoljno novca da kupite ovaj biznis!");

			PlayerInfo[playerid][Money] -= BusinessInfo[id][Price];
			GivePlayerMoney(playerid, -BusinessInfo[id][Price]);

			BusinessInfo[id][Locked] = 0;
			BusinessInfo[id][Owned] = 1;
			BusinessInfo[id][Owner] = PlayerInfo[playerid][ID];

			format(message, sizeof(message), ""TEXT_COLOR_WHITE" Ovaj biznis ima vlasnika !\n "TEXT_COLOR_BLUE"Ime biznisa"TEXT_COLOR_WHITE": %s \n "TEXT_COLOR_BLUE"Vlasnik"TEXT_COLOR_WHITE": %s \n "TEXT_COLOR_BLUE"Cena ulaza"TEXT_COLOR_WHITE": %d \n Da udjete kucajte "TEXT_COLOR_BLUE"/enter", BusinessInfo[id][Name], GetBusinessOwnerName(BusinessInfo[id][Owner]), BusinessInfo[id][EnterFee]);
			Update3DTextLabelText(BusinessLabels[id], -1, message);
			SaveBusiness(id);
			SavePlayer(playerid);

			SendClientMessage(playerid, COLOR_RED, "Kupili ste biznis.");

			return 1;
		}
		else if(strcmp(command, "sell", true) == 0)
		{
			new id, message[256];
			id = IsPlayerNearBusinessEnter(playerid);
			// Check if near business

			BusinessInfo[id][Owned] = 0;
			BusinessInfo[id][Locked] = 1;

			PlayerInfo[playerid][Money] += BusinessInfo[id][Price]/2;
			GivePlayerMoney(playerid, PlayerInfo[playerid][Money]);

			format(message, sizeof(message), ""TEXT_COLOR_WHITE" Ovaj biznis nema vlasnika !\n "TEXT_COLOR_BLUE"Ime biznisa"TEXT_COLOR_WHITE": %s \n "TEXT_COLOR_BLUE"Cena biznisa"TEXT_COLOR_WHITE": %d \n Da kupite ovaj biznis \n kucajte "TEXT_COLOR_BLUE"/buybusiness", BusinessInfo[id][Name], BusinessInfo[id][Price]);
			Update3DTextLabelText(BusinessLabels[id], -1, message);

			SaveBusiness(id);
			SavePlayer(playerid);

			SendClientMessage(playerid, COLOR_GREEN, "Prodali ste biznis.");
			
			return 1;
		}
		else if(!strfind(command, "fee"))
		{
			new id, fee, message[128];

			id = IsPlayerNearBusinessEnter(playerid);

			if(sscanf(params, "s[16]i", command, fee)) return SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /b(usiness) [fee] [cena]");
			if(id == -1 || id == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste blizu svog biznisa!");
			if(BusinessInfo[id][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "Niste blizu svog biznisa!");

			BusinessInfo[id][EnterFee] = fee;

			format(message, sizeof(message), "Promenili ste cenu ulaza na %d.", fee);
			SaveBusiness(id);
			
			SendClientMessage(playerid, COLOR_GREEN, message);

			return 1;
		}
		else if(strcmp(command, "lock", true) == 0)
		{
			new id = IsPlayerNearBusinessEnter(playerid);

			if(id == -1 || id == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste blizu svog biznisa!");
			if(BusinessInfo[id][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "Niste blizu svog biznisa!");

			if(BusinessInfo[id][Locked] == 1)
			{
				BusinessInfo[id][Locked] = 0;
				GameTextForPlayer(playerid, "Biznis ~g~otkljucan!", 3000, 3);
				SaveBusiness(id);
			}
			else
			{
				BusinessInfo[id][Locked] = 1;
				GameTextForPlayer(playerid, "Biznis ~r~zakljucan!", 3000, 3);
				SaveBusiness(id);
			}

			return 1;
		}
		else if(strcmp(command, "money", true) == 0)
		{
			new id, message[128];
			id = IsPlayerNearBusinessEnter(playerid);

			if(id == -1 || id == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste blizu svog biznisa!");
			if(BusinessInfo[id][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste blizu svog biznisa!");
			if(BusinessInfo[id][Money] == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate novca na racunu biznisa!");

			PlayerInfo[playerid][Money] += BusinessInfo[id][Money];
			GivePlayerMoney(playerid, BusinessInfo[id][Money]);

			format(message, sizeof(message), "Podigli ste %d$ sa racuna biznisa.", BusinessInfo[id][Money]);
			SendClientMessage(playerid, COLOR_GREEN, message);
			
			BusinessInfo[id][Money] = 0;
			
			SaveBusiness(id);
			SavePlayer(playerid);

			return 1;
		}
		else if(!strfind(command, "name"))
		{
			new id, name[128], message[128];

			id = IsPlayerNearBusinessEnter(playerid);

			if(sscanf(params, "s[16]s[128]", command, name)) return SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /b(usiness) [name] [ime]");
			if(id == -1 || id == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste blizu svog biznisa!");
			if(BusinessInfo[id][Owner] != PlayerInfo[playerid][ID]) return SendClientMessage(playerid, COLOR_RED, "Niste blizu svog biznisa!");

			BusinessInfo[id][Name] = name;

			format(message, sizeof(message), "Promenili ste ime biznisa u %s.", name);
			SaveBusiness(id);

			SendClientMessage(playerid, COLOR_GREEN, message);

			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /b(usiness) [komanda]");
			SendClientMessage(playerid, COLOR_BLUE, "Dostupne komande: buy, sell, lock, fee, name");
		}
	}
	return 1;
}

// ====================================================================================================== Admin commands
YCMD:makehouse(playerid, params[], help)
{
	#pragma unused help
    // Check for admin level

    new price, player_interior, player_virtual_world, inside_interior, Float:X, Float:Y, Float:Z, Float:A;
    if(sscanf(params, "ii", price, inside_interior)) return SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /makehouse [cena] [interior]");

    switch(inside_interior)
	{
	    case 0: // CJ House
		{
        	HouseInfo[GlobalHousesCounter][InsideInterior] = 3;
			HouseInfo[GlobalHousesCounter][ExitX] = 2496.05;
    		HouseInfo[GlobalHousesCounter][ExitY] = -1692.73;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1015.75;
		}
        case 1: // Safe House 1
		{
        	HouseInfo[GlobalHousesCounter][InsideInterior] = 1;
			HouseInfo[GlobalHousesCounter][ExitX] = 223.04;
    		HouseInfo[GlobalHousesCounter][ExitY] = 1287.26;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1083.2;
		}
		case 2: // Safe House 2
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 4;
			HouseInfo[GlobalHousesCounter][ExitX] = 260.98;
    		HouseInfo[GlobalHousesCounter][ExitY] = 1284.55;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1081.3;
		}
		case 3: // Safe House 3
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 5;
			HouseInfo[GlobalHousesCounter][ExitX] = 140.18;
    		HouseInfo[GlobalHousesCounter][ExitY] = 1366.58;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1084.97;
		}
		case 4: // Safe House 4
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 9;
			HouseInfo[GlobalHousesCounter][ExitX] = 82.95;
    		HouseInfo[GlobalHousesCounter][ExitY] = 1322.44;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1084.99;
		}
		case 7:  // Safe House 7
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 8;
			HouseInfo[GlobalHousesCounter][ExitX] = -42.85;
    		HouseInfo[GlobalHousesCounter][ExitY] = 1405.61;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1085.5;
		}
		case 8: // Safe House 8
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 6;
			HouseInfo[GlobalHousesCounter][ExitX] = -68.69;
    		HouseInfo[GlobalHousesCounter][ExitY] = 1351.97;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1081.28;
		}
		case 9: // Safe House 9
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 6;
			HouseInfo[GlobalHousesCounter][ExitX] = 2333.11;
    		HouseInfo[GlobalHousesCounter][ExitY] = -1077.1;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1050.04;
		}
		case 10: // Safe House 10
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 5;
			HouseInfo[GlobalHousesCounter][ExitX] = 2233.8;
    		HouseInfo[GlobalHousesCounter][ExitY] = -1115.36;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1051.91;
		}
		case 11: // Safe House 11
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 8;
			HouseInfo[GlobalHousesCounter][ExitX] = 2365.3;
    		HouseInfo[GlobalHousesCounter][ExitY] = -1134.92;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1051.91;
		}
		case 12: // Safe House 12
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 11;
			HouseInfo[GlobalHousesCounter][ExitX] = 2282.91;
    		HouseInfo[GlobalHousesCounter][ExitY] = -1140.29;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1051.91;
		}
  		case 13: // Safe House 13
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 6;
			HouseInfo[GlobalHousesCounter][ExitX] = 2196.79;
    		HouseInfo[GlobalHousesCounter][ExitY] = -1204.35;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1050.05;
		}
		case 14: // Safe House 14
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 10;
			HouseInfo[GlobalHousesCounter][ExitX] = 2270.39;
    		HouseInfo[GlobalHousesCounter][ExitY] = -1210.45;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1048.57;
		}
		case 15: // Safe House 15
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 6;
			HouseInfo[GlobalHousesCounter][ExitX] = 2308.79;
    		HouseInfo[GlobalHousesCounter][ExitY] = -1212.88;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1050.3;
		}
		case 16: // Safe House 16
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 1;
			HouseInfo[GlobalHousesCounter][ExitX] = 2217.54;
    		HouseInfo[GlobalHousesCounter][ExitY] = -1076.29;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1051.52;
		}
		case 17: // Safe House 17
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 2;
			HouseInfo[GlobalHousesCounter][ExitX] = 2237.59;
    		HouseInfo[GlobalHousesCounter][ExitY] = -1080.97;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1050.07;
		}
		case 18: // Safe House 18
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 9;
			HouseInfo[GlobalHousesCounter][ExitX] = 2317.82;
    		HouseInfo[GlobalHousesCounter][ExitY] = -1026.75;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1051.21;
		}
		case 19: // Budget Inn Motel Room
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 12;
			HouseInfo[GlobalHousesCounter][ExitX] = 447.52;
    		HouseInfo[GlobalHousesCounter][ExitY] = 511.49;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 1001.42;
		}
		case 20: // Abandon House
		{
		    HouseInfo[GlobalHousesCounter][InsideInterior] = 10;
			HouseInfo[GlobalHousesCounter][ExitX] = 422.16;
    		HouseInfo[GlobalHousesCounter][ExitY] = 2536.52;
    		HouseInfo[GlobalHousesCounter][ExitZ] = 11.01;
		}

	}

    GetPlayerPos(playerid, X, Y, Z);
    GetPlayerFacingAngle(playerid, A);
    player_interior = GetPlayerInterior(playerid);
    player_virtual_world = GetPlayerVirtualWorld(playerid);

    HouseInfo[GlobalHousesCounter][Owned] = 0;
    HouseInfo[GlobalHousesCounter][Owner] = PlayerInfo[playerid][ID];
    HouseInfo[GlobalHousesCounter][Price] = price;
    HouseInfo[GlobalHousesCounter][EnterX] = X;
    HouseInfo[GlobalHousesCounter][EnterY] = Y;
    HouseInfo[GlobalHousesCounter][EnterZ] = Z;
    HouseInfo[GlobalHousesCounter][EnterA] = A;
    HouseInfo[GlobalHousesCounter][Locked] = 1;
    HouseInfo[GlobalHousesCounter][OutsideInterior] = player_interior;
    HouseInfo[GlobalHousesCounter][OutsideVirtualWorld] = player_virtual_world;
    HouseInfo[GlobalHousesCounter][InsideVirtualWorld] = GlobalHousesCounter;
	HouseInfo[GlobalHousesCounter][Slot1] = 0;
	HouseInfo[GlobalHousesCounter][Slot1_ammo] = 0;
	HouseInfo[GlobalHousesCounter][Slot2] = 0;
	HouseInfo[GlobalHousesCounter][Slot2_ammo] = 0;
	HouseInfo[GlobalHousesCounter][Slot3] = 0;
	HouseInfo[GlobalHousesCounter][Slot3_ammo] = 0;
	HouseInfo[GlobalHousesCounter][Materials] = 0;
	HouseInfo[GlobalHousesCounter][Drugs] = 0;

	InsertHouse(GlobalHousesCounter);
	GlobalHousesCounter++;

    return 1;
}

YCMD:deletehouse(playerid, params[], help)
{
    #pragma unused help
    // Check for admin

    new id;

    if(sscanf(params, "i", id)) return SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /deletehouse [id]");
    if(HouseInfo[id][Owned] == 1) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ova kuca ima vlasnika!");

    HouseInfo[id][Owned] = 0;
    HouseInfo[id][Price] = 0;
    HouseInfo[id][Owner] = 0;
    HouseInfo[id][Locked] = 0;
    HouseInfo[id][EnterX] = 0;
    HouseInfo[id][EnterY] = 0;
    HouseInfo[id][EnterZ] = 0;
    HouseInfo[id][EnterA] = 0;
    HouseInfo[id][ExitX] = 0;
    HouseInfo[id][ExitY] = 0;
    HouseInfo[id][ExitZ] = 0;
    HouseInfo[id][ExitA] = 0;
    HouseInfo[id][OutsideInterior] = 0;
    HouseInfo[id][OutsideVirtualWorld] = 0;
    HouseInfo[id][InsideInterior] = 0;
    HouseInfo[id][InsideVirtualWorld] = 0;
    HouseInfo[id][Slot1] = 0;
	HouseInfo[id][Slot1_ammo] = 0;
	HouseInfo[id][Slot2] = 0;
	HouseInfo[id][Slot2_ammo] = 0;
	HouseInfo[id][Slot3] = 0;
	HouseInfo[id][Slot3_ammo] = 0;
	HouseInfo[id][Materials] = 0;
	HouseInfo[id][Drugs] = 0;

    DeleteHouse(id);

   	DestroyPickup(HouseInfo[id][Icon]);
    Delete3DTextLabel(HouseLabelArray[id]);

    return 1;
}

YCMD:makebusiness(playerid, params[], help)
{
    #pragma unused help
    new price, type, id, player_interior, player_virtual_world, name[128], inside_interior, Float:X, Float:Y, Float:Z, Float:A;
    // Check for admin
    if(sscanf(params, "iii", price, type, inside_interior)) return SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /makebusiness [cena] [tip] [interior]");


    switch(inside_interior)
    {
        case 1: // 24/7 1
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 17;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = -25.884499;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -185.868988;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1003.549988;
            format(name, sizeof(name), "24/7");
            //strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
			BusinessInfo[GlobalBusinessesCounter][Name] = name;
			
			printf("Name je %s", BusinessInfo[GlobalBusinessesCounter][Name]);
        }
        case 2: // 24/7 2
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 10;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 6.091180;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -29.271898;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1003.549988;
            format(name, sizeof(name), "24/7");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 3: // 24/7 3
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 18;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = -30.946699;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -89.609596;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1003.549988;
            format(name, sizeof(name), "24/7");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 4: // 24/7 4
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 16;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = -25.132599;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -139.066986;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1003.549988;
            format(name, sizeof(name), "24/7");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 5: // 24/7 5
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 4;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = -27.312300;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -29.277599;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1003.549988;
            format(name, sizeof(name), "24/7");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 6: // 24/7 6
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 6;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = -26.691599;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -55.714897;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1003.549988;
            format(name, sizeof(name), "24/7");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 7: // Ammunation 1
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 1;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 286.148987;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -40.644398;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1001.569946;
            format(name, sizeof(name), "Ammunation");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 8: // Ammunation 2
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 4;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 286.800995;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -82.547600;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1001.539978;
            format(name, sizeof(name), "Ammunation");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 9: // Ammunation 3
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 6;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 296.919983;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -108.071999;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1001.569946;
            format(name, sizeof(name), "Ammunation");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 10: // Ammunation 4 (2 floors)
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 7;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 314.820984;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -141.431992;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 999.661987;
            format(name, sizeof(name), "Ammunation");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 11: // Ammunation 5
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 6;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 316.524994;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -167.706985;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 999.661987;
            format(name, sizeof(name), "Ammunation");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 12: // Binco
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 15;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 207.737991;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -109.019996;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1005.132812;
            format(name, sizeof(name), "Binco");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 13: // DS (Didier Sachs)
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 14;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 204.332992;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -166.694992;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1000.523437;
            format(name, sizeof(name), "DS (Didier Sachs)");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 14: // Prolaps
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 3;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 207.054992;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -138.804992;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1003.507812;
            format(name, sizeof(name), "Prolaps");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 15: // Suburban
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 1;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 203.777999;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -48.492397;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1001.804687;
            format(name, sizeof(name), "Suburban");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 16: // Victim
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 5;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 226.293991;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -7.431529;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1002.210937;
            format(name, sizeof(name), "Victim");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 17: // ZIP
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 18;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 161.391006;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -93.159156;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1001.804687;
            format(name, sizeof(name), "ZIP");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 18: // Burg
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 10;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 364.0647;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -73.8064;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1001.507812;
            format(name, sizeof(name), "Burg");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 19: // Cluckin'Bell
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 9;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 375.962463;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -65.816848;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1001.507812;
            format(name, sizeof(name), "Cluckin'Bell");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 20: // Well Stacked Pizza
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 5;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 372.2830;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -132.2032;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1001.4922;
            format(name, sizeof(name), "Well Stacked Pizza");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 21: // Rusty Brown Donuts
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 17;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 377.0696;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -191.9550;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1000.632812;
            format(name, sizeof(name), "Rusty Brown Donuts");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 22: // Dillimore Gas Station
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 0;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 663.836242;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -575.605407;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 16.343263;
            format(name, sizeof(name), "Dillimore Gas Station");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 23: // Club
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 17;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 493.390991;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -22.722799;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1000.679687;
            format(name, sizeof(name), "Club");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 24: // Bar
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 11;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 501.980987;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -69.150199;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 998.757812;
            format(name, sizeof(name), "Bar");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 25: // Lil' probe inn
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 18;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = -227.027999;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = 1401.229980;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 27.765625;
            format(name, sizeof(name), "Lil' probe inn");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 26: // Jay's diner
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 4;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 457.304748;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -88.428497;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 999.554687;
            format(name, sizeof(name), "Jay's diner");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 27: // Gant bridge diner
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 5;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 454.973937;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -110.104995;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1000.077209;
            format(name, sizeof(name), "Gant bridge diner");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 28: // World of coq
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 1;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 452.489990;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -18.179698;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1001.132812;
            format(name, sizeof(name), "World of coq");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 29: // Welcome pump
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 1;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 681.557861;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -455.680053;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = -25.609874;
            format(name, sizeof(name), "Welcome pump");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
        case 30: // Big spread ranch
        {
            BusinessInfo[GlobalBusinessesCounter][InsideInterior] = 3;
            BusinessInfo[GlobalBusinessesCounter][ExitX] = 1212.019897;
            BusinessInfo[GlobalBusinessesCounter][ExitY] = -28.663099;
            BusinessInfo[GlobalBusinessesCounter][ExitZ] = 1000.953125;
            format(name, sizeof(name), "Big spread ranch");
            strmid(BusinessInfo[GlobalBusinessesCounter][Name], name, 0, strlen(name));
        }
    }

    GetPlayerPos(playerid, X, Y, Z);
    GetPlayerFacingAngle(playerid, A);
    player_interior = GetPlayerInterior(playerid);
    player_virtual_world = GetPlayerVirtualWorld(playerid);

    BusinessInfo[GlobalBusinessesCounter][Owned] = 0;
    BusinessInfo[GlobalBusinessesCounter][Owner] = PlayerInfo[playerid][ID];
    BusinessInfo[GlobalBusinessesCounter][Price] = price;
    BusinessInfo[GlobalBusinessesCounter][EnterFee] = 0;
    BusinessInfo[GlobalBusinessesCounter][Money] = 0;
    BusinessInfo[GlobalBusinessesCounter][Type] = type;
    BusinessInfo[GlobalBusinessesCounter][EnterX] = X;
    BusinessInfo[GlobalBusinessesCounter][EnterY] = Y;
    BusinessInfo[GlobalBusinessesCounter][EnterZ] = Z;
    BusinessInfo[GlobalBusinessesCounter][EnterA] = A;
    BusinessInfo[GlobalBusinessesCounter][Locked] = 0;
    BusinessInfo[GlobalBusinessesCounter][OutsideInterior] = player_interior;
    BusinessInfo[GlobalBusinessesCounter][OutsideVirtualWorld] = player_virtual_world;
    BusinessInfo[GlobalBusinessesCounter][InsideVirtualWorld] = id;

    InsertBusiness(GlobalBusinessesCounter);
	GlobalBusinessesCounter++;
    return 1;
}

YCMD:deletebusiness(playerid, params[], help)
{
    #pragma unused help
    new id;

    // Check for admin

    if(sscanf(params, "i", id)) return SendClientMessage(playerid, COLOR_BLUE, "[USAGE]: /deletebusiness [id]");
    if(BusinessInfo[id][Owned] == 1) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ovaj biznis ima vlasnika.");

    BusinessInfo[id][Owned] = 0;
    BusinessInfo[id][Price] = 0;
    BusinessInfo[id][Type] = 0;
    BusinessInfo[id][Locked] = 0;
    BusinessInfo[id][Name] = 0;
    BusinessInfo[id][Money] = 0;
    BusinessInfo[id][EnterFee] = 0;
    BusinessInfo[id][EnterX] = 0;
    BusinessInfo[id][EnterY] = 0;
    BusinessInfo[id][EnterZ] = 0;
    BusinessInfo[id][EnterA] = 0;
    BusinessInfo[id][ExitX] = 0;
    BusinessInfo[id][ExitY] = 0;
    BusinessInfo[id][ExitZ] = 0;
    BusinessInfo[id][ExitA] = 0;
    BusinessInfo[id][OutsideInterior] = 0;
    BusinessInfo[id][OutsideVirtualWorld] = 0;

   	DestroyPickup(BusinessInfo[id][Icon]);
	Delete3DTextLabel(BusinessLabels[id]);
    DeleteBusiness(id);

    return 1;
}

YCMD:makeadmin(playerid, params[], help)
{
	#pragma unused help
	new player, level, playerName[MAX_PLAYER_NAME], str[128];
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu!");
	if(sscanf(params, "ri", player, level)) return SendClientMessage(playerid, -1, "[USAGE]: /makeadmin [id/deo imena] [level]");

	PlayerInfo[player][Admin] = level;
	SavePlayer(player);

	GetPlayerName(playerid, playerName, sizeof(playerName));
	format(str, sizeof(str), "Admin %s Vam je dodelio Admina level %d.", playerName, level);
	SendClientMessage(player, -1, str);

	GetPlayerName(player, playerName, sizeof(playerName));
	format(str, sizeof(str), "Dodelili ste igracu %s Admina level %d.", playerName, level);
	SendClientMessage(playerid, -1, str);

	return 1;
}

YCMD:makedonator(playerid, params[], help)
{
	#pragma unused help
	new player, points, playerName[MAX_PLAYER_NAME], str[128];
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu!");
	if(sscanf(params, "ri", player, points)) return SendClientMessage(playerid, -1, "[USAGE]: /makedonator [id/deo imena] [poeni]");

	if(points == 0)
	{
		PlayerInfo[playerid][Donator] = 0;
		PlayerInfo[playerid][DonatorPoints] = 0;
	}
	else
	{
		PlayerInfo[player][Donator] = 1;
		PlayerInfo[player][DonatorPoints] += points;
 	}
	SavePlayer(player);

	GetPlayerName(playerid, playerName, sizeof(playerName));
	format(str, sizeof(str), "Admin %s Vam je dodelio %d Donator poena.", playerName, points);
	SendClientMessage(player, -1, str);

	GetPlayerName(playerid, playerName, sizeof(playerName));
	format(str, sizeof(str), "Dodelili ste igracu %s %d Donator poena.", playerName, points);
	SendClientMessage(playerid, -1, str);

	return 1;
}

YCMD:port(playerid, params[], help)
{
    #pragma unused help
    new target[32], vehicleID;
    if(PlayerInfo[playerid][Admin] < 4) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu");
    if(sscanf(params, "s[32]", target)) return SendClientMessage(playerid, -1, "[USAGE]: /port [mesto]");
    if(strcmp(target, "banka", true) == 0)
    {
        if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, 589.6011, -1240.2231, 17.8361);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, 589.6011, -1240.2231, 17.8361);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "opstina", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, 1481.5153,-1740.2601,13.1089);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, 1481.5153,-1740.2601,13.1089);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}

	}
	else if(strcmp(target, "parking", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, 1637.5028, -1151.6288, 23.9063);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, 1637.5028, -1151.6288, 23.9063);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "ammunation", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, 1364.2379,-1280.8793,13.0893);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, 1364.2379,-1280.8793,13.0893);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "autoskola", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, -2026.6176, -100.3294, 35.1641);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, -2026.6176, -100.3294, 35.1641);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "salon1", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, 2127.8760,-1119.0120,24.9260);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, 2127.8760,-1119.0120,24.9260);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "salon2", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, 558.4743,-1252.5942,16.6883);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, 558.4743,-1252.5942,16.6883);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "salon3", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, 323.1658,2505.4736,16.0548);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, 323.1658,2505.4736,16.0548);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "salon4", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, -2225.7283,2376.3650,4.5412);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, -2225.7283,2376.3650,4.5412);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "lShowPlayerDialog", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, 1539.3977,-1677.4619,13.1032);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, 1539.3977,-1677.4619,13.1032);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "spawn", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, 1548.0010, -2291.4651, 13.3828);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, 1548.0010, -2291.4651, 13.3828);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "lsgaraza", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, 1041.1724, -1031.6471, 32.0555);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, 1041.1724, -1031.6471, 32.0555);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "sfgaraza", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, -2711.0183, 217.4066, 4.1897);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, -2711.0183, 217.4066, 4.1897);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "planina", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, -2358.8628, -2187.9668, 33.6227);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, -2358.8628, -2187.9668, 33.6227);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "vrh", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, -2307.7209, -1658.5023, 483.6776);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, -2307.7209, -1658.5023, 483.6776);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "sf", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, -1656.5377, -541.6462, 10.9824);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, -1656.5377, -541.6462, 10.9824);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	else if(strcmp(target, "lv", true) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			vehicleID = GetPlayerVehicleID(playerid);
	  		SetVehiclePos(vehicleID, 1707.2388, 1455.0815, 10.4415);
	  		SetVehicleVirtualWorld(vehicleID, 0);
	  		LinkVehicleToInterior(vehicleID, 0);
		}
	    else
		{
			SetPlayerPos(playerid, -1707.2388, 1455.0815, 10.4415);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
    return 1;
}

YCMD:goto(playerid, params[], help)
{
    #pragma unused help
    new player, player_interior, vehicleID, Float:X, Float:Y, Float:Z;
    if(PlayerInfo[playerid][Admin] == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu");
    if(sscanf(params, "u", player)) return SendClientMessage(playerid, -1, "[USAGE]: /goto [id/deo imena]");
    if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Pogresan ID!");

    GetPlayerPos(player, X, Y, Z);
    player_interior = GetPlayerInterior(player);

    if(IsPlayerInAnyVehicle(playerid))
	{
		vehicleID = GetPlayerVehicleID(playerid);
  		SetVehiclePos(vehicleID, X-1, Y-1, Z);
  		LinkVehicleToInterior(vehicleID, player_interior);
	}
    else
	{
		SetPlayerPos(playerid, X-1, Y-1, Z);
		SetPlayerInterior(playerid, player_interior);
	}

    return 1;
}

YCMD:gethere(playerid, params[], help)
{
    #pragma unused help
    new player, player_interior, vehicleID, Float:X, Float:Y, Float:Z;
    if(PlayerInfo[playerid][Admin] == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu");
    if(sscanf(params, "u", player)) return SendClientMessage(playerid, -1, "[USAGE]: /time [id/deo imena]");
    if(!IsPlayerConnected(player)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Pogresan ID!");

    GetPlayerPos(playerid, X, Y, Z);
    player_interior = GetPlayerInterior(playerid);

    if(IsPlayerInAnyVehicle(player))
	{
		vehicleID = GetPlayerVehicleID(player);
  		SetVehiclePos(vehicleID, X-1, Y-1, Z);
  		LinkVehicleToInterior(vehicleID, player_interior);
  		SetPlayerInterior(player, player_interior);
	}
    else
    {
		SetPlayerPos(player, X-1, Y-1, Z);
		SetPlayerInterior(player, player_interior);
	}

    return 1;
}

YCMD:getincar(playerid, params[], help)
{
	#pragma unused help
	// if((PlayerInfo[playerid][Admin] < 3) || (PlayerInfo[playerid][Admin] == 9999)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu");
	new vID;
	if(sscanf(params, "i", vID)) return SendClientMessage(playerid, -1, "[USAGE]: /getincar [ID vozila]");
	else if(vID == INVALID_VEHICLE_ID) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Pogresan ID vozila!");

	PutPlayerInVehicle(playerid, vID, 0);
	return 1;
}

YCMD:getvehhere(playerid, params[], help)
{
    #pragma unused help
    new pINT, vehicle, Float:X, Float:Y, Float:Z;
    // if((PlayerInfo[playerid][Admin] < 3) || (PlayerInfo[playerid][Admin] == 9999)) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu");
    if(sscanf(params, "i", vehicle)) return SendClientMessage(playerid, -1, "[USAGE]: /getvehhere [id vozila]");

    GetPlayerPos(playerid, X, Y, Z);
    pINT = GetPlayerInterior(playerid);

	SetVehiclePos(vehicle, X-2, Y-2, Z);
	LinkVehicleToInterior(vehicle, pINT);
    return 1;
}

YCMD:settime(playerid, params[], help)
{
	#pragma unused help
	new hours, playerName[MAX_PLAYER_NAME], str[128];
 	if(PlayerInfo[playerid][Admin] < 5) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu");
    if(sscanf(params, "i", hours)) return SendClientMessage(playerid, -1, "[USAGE]: /settime [sati]");

	SetWorldTime(hours);

	GetPlayerName(playerid, playerName, sizeof(playerName));
	format(str, sizeof(str), "Admin %s je postavio vreme na %d sati.", playerName, hours);
	SendClientMessageToAll(-1, str);
	return 1;
}

YCMD:setweather(playerid, params[], help)
{
    #pragma unused help
	new weather_id, playerName[MAX_PLAYER_NAME], str[128];
 	if(PlayerInfo[playerid][Admin] < 5) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu");
    if(sscanf(params, "i", weather_id)) return SendClientMessage(playerid, -1, "[USAGE]: /setweather [id vremena]");
    //if(weather_id < 0 || weather_id > 20) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: ID vremena mora biti izmedju 1 i 20!");
	SetWeather(weather_id);

	GetPlayerName(playerid, playerName, sizeof(playerName));
	format(str, sizeof(str), "Admin %s je postavio vreme ID %d.", playerName, weather_id);
	SendClientMessageToAll(-1, str);
	return 1;
}

YCMD:givemoney(playerid, params[], help)
{
	#pragma unused help
	new player, money, playerName[MAX_PLAYER_NAME], str[128];
	if(PlayerInfo[playerid][Admin] < 6) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu!");
	if(sscanf(params, "ri", player, money)) return SendClientMessage(playerid, -1, "[USAGE]: /givemoney [id/deo imena] [kolicina]");

	PlayerInfo[player][Money] += money;
	GivePlayerMoney(player, money);
	SavePlayer(player);

	GetPlayerName(playerid, playerName, sizeof(playerName));
	format(str, sizeof(str), "Admin %s Vam je dao %d$.", playerName, money);
	SendClientMessage(player, -1, str);

	GetPlayerName(player, playerName, sizeof(playerName));
	format(str, sizeof(str), "Dali ste igracu %s %d$.", playerName, money);
	SendClientMessage(playerid, -1, str);

	return 1;
}

YCMD:setskin(playerid, params[], help)
{
	#pragma unused help
	new player, skin, playerName[MAX_PLAYER_NAME], str[128];
	if(PlayerInfo[playerid][Admin] < 5) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu");
	if(sscanf(params, "ri", player, skin)) return SendClientMessage(playerid, -1, "[USAGE]: /setskin [id/deo imena] [id skina]");
	if(skin < 1 || skin > 299) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: ID Skina ne moze biti manji od 1 i veci od 299!");

	SetPlayerSkin(player, skin);
	PlayerInfo[player][Skin] = skin;
	SavePlayer(playerid);

	GetPlayerName(playerid, playerName, sizeof(playerName));
	format(str, sizeof(str), "Admin %s Vam je stavio skin ID: %d.", playerName, skin);
	SendClientMessage(player, -1, str);

	GetPlayerName(player, playerName, sizeof(playerName));
	format(str, sizeof(str), "Postavili ste igracu %s skin ID: %d.", playerName, skin);
	SendClientMessage(playerid, -1, str);

	return 1;
}

// **TO:DO FIX**
YCMD:setjob(playerid, params[], help)
{
	#pragma unused help
	new player, job, playerName[MAX_PLAYER_NAME], str[128];
	if(PlayerInfo[playerid][Admin] < 5) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu!");
	if(sscanf(params, "ri", player, job)) return SendClientMessage(playerid, -1, "[USAGE]: /ajob [id/deo imena] [id posla]");

	PlayerInfo[player][Job] = job;
	SavePlayer(playerid);

	// GetPlayerName(playerid, playerName, sizeof(playerName));
	// format(str, sizeof(str), "Admin %s Vam je dodelio posao: %s.", playerName, PlayerJob(player));
	// SendClientMessage(player, -1, str);

	// GetPlayerName(player, playerName, sizeof(playerName));
	// format(str, sizeof(str), "Stavili ste igracu %s posao: %s.", playerName, PlayerJob(player));
	// SendClientMessage(playerid, -1, str);
	return 1;
}

YCMD:setheatlh(playerid, params[], help)
{
	#pragma unused help
	new player, health, playerName[MAX_PLAYER_NAME], str[128];
	if(PlayerInfo[playerid][Admin] < 6) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu");
	if(sscanf(params, "ri", player, health)) return SendClientMessage(playerid, -1, "[USAGE]: /sethealth [id/deo imena] [kolicina]");

	SetPlayerHealth(player, health);
	SavePlayer(player);

	GetPlayerName(playerid, playerName, sizeof(playerName));
	format(str, sizeof(str), "Admin %s Vam je stavio helte na %d.", playerName, health);
	SendClientMessage(player, -1, str);

	GetPlayerName(player, playerName, sizeof(playerName));
	format(str, sizeof(str), "Stavili ste igracu %s helte na %d.", playerName, health);
	SendClientMessage(playerid, -1, str);
	return 1;
}

YCMD:setarmor(playerid, params[], help)
{
	#pragma unused help
	new player, armor, playerName[MAX_PLAYER_NAME], str[128];
	if(PlayerInfo[playerid][Admin] < 6) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu");
	if(sscanf(params, "ri", player, armor)) return SendClientMessage(playerid, -1, "[USAGE]: /setarmor [id/deo imena] [kolicina]");

	SetPlayerArmour(player, armor);
	SavePlayer(player);

	GetPlayerName(playerid, playerName, sizeof(playerName));
	format(str, sizeof(str), "Admin %s Vam je stavio pancir na %d.", playerName, armor);
	SendClientMessage(player, -1, str);

	GetPlayerName(player, playerName, sizeof(playerName));
	format(str, sizeof(str), "Stavili ste igracu %s pancir na %d.", playerName, armor);
	SendClientMessage(playerid, -1, str);
	return 1;
}

YCMD:giveweapon(playerid, params[], help)
{
	#pragma unused help
	new player, weapon, ammo;
	if(PlayerInfo[playerid][Admin] < 6) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu");
	if(sscanf(params, "rii", player, weapon, ammo)) return SendClientMessage(playerid, -1, "[USAGE]: /giveweapon [id/deo imena igraca] [id oruzja] [metkovi]");
	
	GivePlayerWeapon(player, weapon, ammo);

	return 1;
}

YCMD:giveweaponskill(playerid, params[], help)
{
	#pragma unused help
	new player, weapon, skill;
	if(sscanf(params, "rii", player, weapon, skill)) return SendClientMessage(playerid, -1, "[USAGE]: /giveweaponskill [id/deo imena] [oruzje] [skill]");
	else if (player == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Igrac ne postoji!");
	else if(weapon < 1 || weapon > 11) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Broj za oruzje mora biti izmedju 1 i 9!");
	switch(weapon)
	{

	    case 1:
	    {
		    PlayerInfo[player][PistolSkill] += skill;
		    SavePlayer(player);
		  	SetPlayerSkillLevel(player, WEAPONSKILL_PISTOL, PlayerInfo[player][PistolSkill]);
        }
		case 2:
	    {
	        PlayerInfo[player][SilencedSkill] += skill;
	        SavePlayer(player);
			SetPlayerSkillLevel(player, WEAPONSKILL_PISTOL_SILENCED, PlayerInfo[player][SilencedSkill]);
        }
	    case 3:
	    {
			PlayerInfo[player][DesertSkill] += skill;
			SavePlayer(player);
			SetPlayerSkillLevel(player, WEAPONSKILL_DESERT_EAGLE, PlayerInfo[player][DesertSkill]);
		}
	    case 4:
	    {
			PlayerInfo[player][ShotgunSkill] += skill;
			SavePlayer(player);
			SetPlayerSkillLevel(player, WEAPONSKILL_SHOTGUN, PlayerInfo[player][ShotgunSkill]);
        }
	    case 5:
	    {
			PlayerInfo[player][SawnoffSkill] += skill;
			SavePlayer(player);
			SetPlayerSkillLevel(player, WEAPONSKILL_SAWNOFF_SHOTGUN, PlayerInfo[player][SawnoffSkill]);
        }
	    case 6:
	    {
		 	PlayerInfo[player][CombatSkill] += skill;
			SavePlayer(player);
			SetPlayerSkillLevel(player, WEAPONSKILL_SPAS12_SHOTGUN, PlayerInfo[player][CombatSkill]);
        }
	    case 7:
	    {
			PlayerInfo[player][UziSkill] += skill;
			SavePlayer(player);
			SetPlayerSkillLevel(player, WEAPONSKILL_MICRO_UZI, PlayerInfo[player][UziSkill]);
        }
	    case 8:
	    {
			PlayerInfo[player][MP5Skill] += skill;
			SavePlayer(player);
			SetPlayerSkillLevel(player, WEAPONSKILL_MP5, PlayerInfo[player][MP5Skill]);
        }
	    case 9:
	    {
			PlayerInfo[player][AK47Skill] += skill;
			SavePlayer(player);
			SetPlayerSkillLevel(player, WEAPONSKILL_AK47, PlayerInfo[player][AK47Skill]);
        }
	    case 10:
	    {
			PlayerInfo[player][M4Skill] += skill;
			SavePlayer(player);
			SetPlayerSkillLevel(player, WEAPONSKILL_M4, PlayerInfo[player][M4Skill]);
		}
		case 11:
	    {
			PlayerInfo[player][SniperSkill] += skill;
			SavePlayer(player);
			SetPlayerSkillLevel(player, WEAPONSKILL_SNIPERRIFLE, PlayerInfo[player][SniperSkill]);
		}
	}
	
	return 1;
}

// **TO:DO Fix**
YCMD:setfightstyle(playerid, params[], help)
{
	#pragma unused help
	new style, player, playerName[MAX_PLAYER_NAME], str[128];
	if(PlayerInfo[playerid][Admin] < 6) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu!");
	if(sscanf(params, "ri", player, style)) return SendClientMessage(playerid, -1, "[USAGE]: /setfightstyle [id/deo imena] [stil]");
	else if (player == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Igrac ne postoji!");
	else if (style < 4 || (style > 7 && style < 15) || style > 16) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Stil moze biti u opsegu 4-7 i 15-16!");
	
	PlayerInfo[playerid][FightingStyle] = style;
	SetPlayerFightingStyle(player, style);
	SavePlayer(playerid);

	// GetPlayerName(playerid, playerName, sizeof(playerName));
	// format(str, sizeof(str), "Admin %s Vam je postavio borbeni still na: %s.", playerName, PlayerFightingStyle(playerid));
	// SendClientMessage(player, -1, str);

	// GetPlayerName(player, playerName, sizeof(playerName));
	// format(str, sizeof(str), "Postavili ste %s brobeni stil na: %s.", playerName, PlayerFightingStyle(playerid));
	// SendClientMessage(playerid, -1, str);

	return 1;
}

YCMD:givedrugs(playerid, params[], help)
{
	#pragma unused help
	new player, drug, playerName[MAX_PLAYER_NAME], str[128];
	if(PlayerInfo[playerid][Admin] < 6) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu!");
	if(sscanf(params, "ri", player, drug)) return SendClientMessage(playerid, -1, "[USAGE]: /givedrugs [id/deo imena] [kolicina]");

	PlayerInfo[player][Drugs] += drug;
	SavePlayer(player);

	GetPlayerName(playerid, playerName, sizeof(playerName));
	format(str, sizeof(str), "Admin %s gave You %d drugs.", playerName, drug);
	SendClientMessage(player, -1, str);

	GetPlayerName(player, playerName, sizeof(playerName));
	format(str, sizeof(str), "You gave %s %d drugs.", playerName, drug);
	SendClientMessage(playerid, -1, str);

	return 1;
}

YCMD:givematerials(playerid, params[], help)
{
	#pragma unused help
	new player, materials, playerName[MAX_PLAYER_NAME], str[128];
	if(PlayerInfo[playerid][Admin] < 6) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Niste ovlasceni da koristite ovu komandu");
	if(sscanf(params, "ri", player, materials)) return SendClientMessage(playerid, -1, "[USAGE]: /givemats [id/deo imena] [kolicina]");

	PlayerInfo[player][Materials] += materials;
	SavePlayer(player);

	GetPlayerName(playerid, playerName, sizeof(playerName));
	format(str, sizeof(str), "Admin %s Vam je dao %d materijala.", playerName, materials);
	SendClientMessage(player, -1, str);

	GetPlayerName(player, playerName, sizeof(playerName));
	format(str, sizeof(str), "Dali ste igracu %s %d materijala.", playerName, materials);
	SendClientMessage(playerid, -1, str);
	return 1;
}


YCMD:specialaction(playerid, params[], help)
{
	#pragma unused help
	new action;
	if(sscanf(params, "i", action)) return SendClientMessage(playerid, -1, "[USAGE]: /specialaction id_akcije");
	
	SetPlayerSpecialAction(playerid, action);
	
	return 1;
}

YCMD:call(playerid, params[], help)
{
	#pragma unused help
	new number, sendername[MAX_PLAYER_NAME], str[128];
	if(sscanf(params, "i", number)) return SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /pozovi [id igraca/deo imena]");
	if(PlayerInfo[playerid][Mobile] == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate mobilni!");
	if(PlayerInfo[playerid][MobileNumber] == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate SIM karticu!");
	if(PlayerInfo[playerid][MobileCredit] == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate kredita!");
	if(InCall[playerid] != 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Vec ste u pozivu! Da prekinete poziv kucajte /prekinipoziv");
	// if(number == 007)
	// {
	//     if(PlayerInfo[playerid][MobileCredit] < 5) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate dovoljno kredita!");
	//     if(detectives == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Trenutno nema Detektiva na duznosti!");

	//     DetectiveCaller = playerid;

	//     format(str, sizeof(str), "%s je potreban Detektiv, da prihvatite poziv kucajte /prihvati detektiv", sendername);
	//     SendJobMessage(1, COLOR_WHITE, str);

	//     SendClientMessage(playerid, COLOR_WHITE, "Detektiv sluzba je prihvatila vas poziv.");
	//     SendClientMessage(playerid, COLOR_WHITE, "Svi Detektivi su informisani o vasem pozivu. Ocekujte uskoro da neko prihvati vas zahtev.");
	//     SendClientMessage(playerid, COLOR_WHITE, "Prekinuli su vezu.");

	//     PlayerInfo[playerid][MobileCredit] -= 5;
	//     SavePlayer(playerid);

	//     format(str, sizeof(str), "MTS: Trenutno stanje na vasem racunu je %d$", PlayerInfo[playerid][MobileCredit]);
	// 	SendClientMessage(playerid, COLOR_WHITE, str);
	// }
	// if(number == 555)
	// {
	//     if(PlayerInfo[playerid][MobileCredit] < 5) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate dovoljno kredita!");
	//     if(mechanics == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Trenutno nema Mehanicara na duznosti!");

	//     MechanicCaller = playerid;

	//     format(str, sizeof(str), "%s je potreban Mehanicar, da prihvatite poziv kucajte /prihvati mehanicar", sendername);
	//     SendJobMessage(4, COLOR_WHITE, str);

	//     SendClientMessage(playerid, COLOR_WHITE, "Mehanicarska sluzba je prihvatila vas poziv.");
	//     SendClientMessage(playerid, COLOR_WHITE, "Svi Mehanicari su informisani o vasem pozivu. Ocekujte uskoro da neko prihvati vas zahtev.");
	//     SendClientMessage(playerid, COLOR_WHITE, "Prekinuli su vezu.");

	//     PlayerInfo[playerid][MobileCredit] -= 5;
	//     SavePlayer(playerid);

	//     format(str, sizeof(str), "MTS: Trenutno stanje na vasem racunu je %d$", PlayerInfo[playerid][MobileCredit]);
	// 	SendClientMessage(playerid, COLOR_WHITE, str);
	// }
	// else if(number == 722722)
	// {
	// 	if(PlayerInfo[playerid][MobileCredit] < 5) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate dovoljno kredita!");
	// 	if(taxidrivers == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Trenutno nema Taxista na duznosti!");
	// 	if(TaxiTime[playerid] != 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Ne mozete pozvati taxi u ovom trenutku!");

	// 	TaxiCaller = playerid;

	// 	format(str, sizeof(str), "%s je potreban prevoz. da prihvatite poziv kucajte /prihvati taxi", sendername);
	// 	SendJobMessage(5, COLOR_WHITE, str);

	// 	SendClientMessage(playerid, COLOR_WHITE, "S Taxi je prihvatio vas poziv.");
	// 	SendClientMessage(playerid, COLOR_WHITE, "Svi Taxisti su informisani o vasem pozivu. Ocekujte uskoro da neko prihvati vas zahtev.");
	// 	SendClientMessage(playerid, COLOR_WHITE, "Prekinuli su vezu.");

	// 	PlayerInfo[playerid][MobileCredit] -= 5;
	// 	SavePlayer(playerid);

	// 	format(str, sizeof(str), "MTS: Trenutno stanje na vasem racunu je %d$", PlayerInfo[playerid][MobileCredit]);
	// 	SendClientMessage(playerid, COLOR_WHITE, str);
	// 	return 1;
	// }
	// else
	{
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(PlayerInfo[i][MobileNumber] == number)
			{
				if(InCall[i] != 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Broj je zauzet!");
				iCall[playerid] = 1;
				Caller[i] = playerid;
				CalledPlayer[playerid] = i;
				GetPlayerName(i, sendername, sizeof(sendername));
				format(str, sizeof(str), "Pozivate %s", sendername);
				SendClientMessage(playerid, COLOR_WHITE, str);
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(str, sizeof(str), "%s (%d) vas zove. Da se javite kucajte /prihvatipoziv", sendername, PlayerInfo[playerid][MobileNumber]);
				SendClientMessage(i, COLOR_WHITE, str);
				break;
			}
		}
		if(CalledPlayer[playerid] == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Izabrali ste nepostojeci broj!");
	}
	return 1;
}

YCMD:acceptcall(playerid, params[], help)
{
	#pragma unused help
	new sendername[MAX_PLAYER_NAME], str[128];
	InCall[playerid] = 1;
	InCall[Caller[playerid]] = 1;
	PlayerInfo[Caller[playerid]][MobileCredit] -= 1;
	SavePlayer(Caller[playerid]);
	SendClientMessage(playerid, COLOR_WHITE, "Prihvatili ste poziv.");
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(str, sizeof(str), "Igrac %s je prihvatio poziv.", sendername);
	SendClientMessage(Caller[playerid], COLOR_WHITE, str);
	return 1;
}

YCMD:cancelcall(playerid, params[], help)
{
	#pragma unused help
	new sendername[MAX_PLAYER_NAME], str[128];
	if(iCall[playerid] != 0)
	{
	    GetPlayerName(playerid, sendername, sizeof(sendername));
	    SendClientMessage(playerid, COLOR_RED, "Prekinuli ste poziv");
	    format(str, sizeof(str), "%s je prekinuo poziv.", sendername);
	    SendClientMessage(CalledPlayer[playerid], COLOR_RED, str);
		InCall[playerid] = 0;
		InCall[CalledPlayer[playerid]] = 0;
		CalledPlayer[Caller[playerid]] = 0;
		Caller[playerid] = 0;
	}
	else
	{
	    GetPlayerName(playerid, sendername, sizeof(sendername));
	    SendClientMessage(playerid, COLOR_RED, "Prekinuli ste poziv");
	    format(str, sizeof(str), "%s je prekinuo poziv.", sendername);
	    SendClientMessage(Caller[playerid], COLOR_RED, str);
		InCall[playerid] = 0;
		InCall[Caller[playerid]] = 0;
		CalledPlayer[Caller[playerid]] = 0;
		Caller[playerid] = 0;
	}

	return 1;
}

YCMD:advertise(playerid, params[], help)
{
	#pragma unused help
	new text[128], str[128], sendername[MAX_PLAYER_NAME];
	if(sscanf(params, "s[128]", text)) return SendClientMessage(playerid, COLOR_WHITE, "[USAGE]: /oglas [text]");
	if(PlayerInfo[playerid][Mobile] == 9999) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate mobilni!");
	if(PlayerInfo[playerid][MobileNumber] == 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate SIM karticu!");
	if(PlayerInfo[playerid][MobileCredit] < 5) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Nemate dovoljno kredita! (5$ potrebno)");
	if(AdvertisementTime[playerid] != 0) return SendClientMessage(playerid, COLOR_RED, "[ERROR]: Vreme izmedju oglasa mora biti najmanje 2 minuta!");
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(str, sizeof(str), "OGLAS - %s [%d]", sendername, PlayerInfo[playerid][MobileNumber]);
	SendClientMessageToAll(COLOR_WHITE, str);
	format(str, sizeof(str), "TEKST OGLASA: %s", text);
	SendClientMessageToAll(COLOR_WHITE, str);
	AdvertisementTime[playerid] = 120;
	PlayerInfo[playerid][MobileCredit] -= 5;
	SavePlayer(playerid);
	return 1;
}
// ====================================================================================================== Timers
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

ptask PhoneCall[500](playerid)
{
	new sendername[MAX_PLAYER_NAME], str[128];
	// if(PlayerInfo[playerid][pLogged] != 1) return 1;
	if(InCall[playerid] == 0) return 1;
	else
	{
		if(iCall[playerid] == 0) return 1;
		else
		{
			if(PlayerInfo[playerid][MobileCredit] == 0)
			{
				iCall[playerid] = 0;
				InCall[playerid] = 0;
				InCall[CalledPlayer[playerid]] = 0;
				SendClientMessage(playerid, COLOR_RED, "Nemate dovoljno kredita da nastavite razgovor!");
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(str, sizeof(str), "%s nema dovoljno kredita da nastavi razgovor!", sendername);
				SendClientMessage(CalledPlayer[playerid], COLOR_RED, str);
				Caller[CalledPlayer[playerid]] = 0;
				CalledPlayer[playerid] = 0;
			}
			else
			{
				PlayerInfo[playerid][MobileCredit] -= 1;
				SavePlayer(playerid);
			}
		}
	}
	return 1;
}