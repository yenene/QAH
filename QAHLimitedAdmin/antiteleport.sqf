_playermessage = "QAH: " + _player + " Has Been Caught Hacking, Contact An Admin Now! UID:" + _uid;
_banmessage = QAHServerVariables select 11;

while {true} do 
{
waitUntil{alive player};
_pos1 = (getpos (vehicle player));
sleep 1;
_pos2 = (getpos (vehicle player));
_tpcheck = _pos1 distance _pos2; 
if  (_tpcheck > 200) then 
	{
	titleCut ["", "BLACK",0];
	disableUserInput true;
	titleText [_banmessage, "PLAIN"];
	broadcast = 1;
	publicVariable "broadcast";
	publicVariable "_playermessage";
	player addScore -5000;
	servermessage = "QAH: " + _player + " Teleported UID:" + _uid;
	publicVariableServer "servermessage";
	sleep 0.2;
	servermessage = "QAH: " + _player + " Was Hack-Locked By QAH UID:" + _uid;
	publicVariableServer "servermessage";
	serverbroadcast = 1;
	publicVariableServer "serverbroadcast";
	execVM "QAH\antimove.sqf";
	};
};