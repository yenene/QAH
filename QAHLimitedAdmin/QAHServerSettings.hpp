//MAIN SETTINGS QAH

_pboclassesdetect = true; //Scanner de pbo
_pboclasses = ["stra_debug2","DevCon","mf_sdc","tao_a3_debugger","KRON_SupportCall"]; //Classnames from addons you don't wan't on your server


_bannedvarsdetect = false; //Detection des joueur avec variables bannies
_bannedvars = [""]; //variables bannies


_speedhackdetect = true; //Detection de speedhack
_maxspeed = 400; //Vitess max des vehicules non unités


_bannedwepsdetect = true; //detection armes bannies
_bannedweps = ["Binocular"]; //Armes impossible à avoir dans la mission


_bannedvclsdetect = true; //Detection de joueurs utilisant vehicules bannis
_bannedvcls = ["B_Hunter_F"]; //Vehicules non dispo dans mission


_teleportdetect = false; //Detection de joueurs se teleportant mais peut causer du lag


_banmessage = "NO HACKER HERE !"; //Message de detection

// Ne pas editer

QAHServerVariables = [_pboclassesdetect,_pboclasses,_bannedvarsdetect,_bannedvars,_speedhackdetect,_maxspeed,_bannedwepsdetect,_bannedweps,_bannedvclsdetect,_bannedvcls,_teleportdetect,_banmessage];