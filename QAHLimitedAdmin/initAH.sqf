if (isServer) exitWith
{
[] execVM "QAH\serverrpt.sqf";
};

[]ExecVM "QAH\QAHServerSettings.hpp";
systemChat "QAH: Demarrage..."; //Startup message
_uid = getPlayerUID vehicle player; //Init variable
broadcast = 0; //Init variable
_hacklock = false; //Init variable
_player = name player; //Init variable
sleep 0.2;
_pboclassesdetect = QAHServerVariables select 0;
_pboclasses = QAHServerVariables select 1;
_bannedvarsdetect = QAHServerVariables select 2;
_bannedvars = QAHServerVariables select 3;
_speedhackdetect = QAHServerVariables select 4;
_maxspeed = QAHServerVariables select 5;
_bannedwepsdetect = QAHServerVariables select 6;
_bannedweps = QAHServerVariables select 7;
_bannedvclsdetect = QAHServerVariables select 8;
_bannedvcls = QAHServerVariables select 9;
_teleportdetect = QAHServerVariables select 10;
_banmessage = QAHServerVariables select 11;

_playermessage = "QAH: " + _player + " Has Been Caught Hacking, Contact An Admin Now! UID:" + _uid;

servermessage = _player + " Joined The Server UID:" + _uid;
publicVariableServer "servermessage";
serverbroadcast = 1;
publicVariableServer "serverbroadcast";

sleep 0.2;

if (_teleportdetect) then
{
[] execVM "QAH\antiteleport.sqf";
};

if (_pboclassesdetect) then
{
for "_i" from 0 to ((count _pboclasses) - 1) do
{
_classname = (_pboclasses select _i);
if (isClass (configFile >> _classname)) then
	{
	_hacklock = true;
	servermessage = "QAH: " + _player + " Joined With A Banned MOD File UID:" + _uid;
	publicVariableServer "servermessage";
	serverbroadcast = 1;
	publicVariableServer "serverbroadcast";
	};
};
};

if (_bannedvarsdetect) then
{
for "_i" from 0 to ((count _bannedvars) - 1) do
{
_varname = (_bannedvars select _i);
if !(isnil _varname) then 
	{
	_hacklock = true;
	servermessage = "QAH: " + _player + " Passed A Banned Variable UID:" + _uid;
	publicVariableServer "servermessage";
	serverbroadcast = 1;
	publicVariableServer "serverbroadcast";
	};
};
};

sleep 0.2;

if !(_hacklock) then
	{
	systemChat "QAH: Done!"; //Startup message
	};

while {true} do
{
waituntil{((_bannedwepsdetect) && ((currentWeapon player) in _bannedweps)) or ((_bannedvclsdetect) && ((TypeOf (vehicle player)) in _bannedvcls)) or (broadcast == 1) or ((_speedhackdetect) && !((vehicle player) in vehicles) && (round speed (vehicle player) > 30) && (alive player)) or ((_speedhackdetect) && ((vehicle player) in vehicles) && (round speed (vehicle player) > _maxspeed))};
if ((_speedhackdetect) && !((vehicle player) in vehicles) && (round speed (vehicle player) > 30) && (alive player)) then
	{
	sleep 2;
	if (alive player) then
		{
		_hacklock = true;
		servermessage = "QAH: " + _player + " Speed Hacked As Unit UID:" + _uid;
		publicVariableServer "servermessage";
		serverbroadcast = 1;
		publicVariableServer "serverbroadcast";
		};
	};
if ((_speedhackdetect) && ((vehicle player) in vehicles) && (round speed (vehicle player) > _maxspeed)) then
	{
	_hacklock = true;
	servermessage = "QAH: " + _player + " Speed Hacked In Vehicle UID:" + _uid;
	publicVariableServer "servermessage";
	serverbroadcast = 1;
	publicVariableServer "serverbroadcast";
	};
if ((_bannedwepsdetect) && ((currentWeapon player) in _bannedweps)) then
	{
	_hacklock = true;
	servermessage = "QAH: " + _player + " Used A Banned Weapon UID:" + _uid;
	publicVariableServer "servermessage";
	serverbroadcast = 1;
	publicVariableServer "serverbroadcast";
	};
sleep 0.2;
if ((TypeOf (vehicle player)) in _bannedvcls) then
	{
	_veh = vehicle player;
	deleteVehicle _veh;
	_hacklock = true;
	servermessage = "QAH: " + _player + " Entered Banned Vehicle UID:" + _uid;
	publicVariableServer "servermessage";
	serverbroadcast = 1;
	publicVariableServer "serverbroadcast";
	};
sleep 0.2;
if (_hacklock) exitWith
	{
	titleCut ["", "BLACK",0];
	disableUserInput true;
	titleText [_banmessage, "PLAIN"];
	broadcast = 1;
	publicVariable "broadcast";
	publicVariable "playermessage";
	player addScore -5000;
	servermessage = "QAH: " + _player + " Was Hack-Locked By QAH UID:" + _uid;
	publicVariableServer "servermessage";
	serverbroadcast = 1;
	publicVariableServer "serverbroadcast";
	execVM "QAH\antimove.sqf";
	};
sleep 0.2;
if (broadcast == 1) then
	{
	hint playermessage;
	systemChat playermessage;
	broadcast = 0;
	};
};