if (isServer) then {
    [] execVM "qah.sqf";
	[] execVM "\QAHLimitedAdmin\initAH.sqf";
} else {
    "AHAH" addPublicVariableEventHandler
{[] spawn (_this select 1);
};
    clientStarted = player;
 
    publicVariableServer "clientStarted";
};