params ["_client","_target","_level"];

_posCenter = [8277.57,7975.61];

_nearestRoad = _posCenter nearRoads 7000;
_closeRoads = _posCenter nearRoads 1000;
_allowedRoads = _nearestRoad - forbiddenStreets;
_count = count _allowedRoads;

_rand_start = random _count;
_rand_start = round _rand_start;
_streetObject_start = _allowedRoads select _rand_start;

_distance = 0;
_streetObject_end = "";
while {_distance < 2000} do {
	_rand_end = random _count;
	_rand_end = round _rand_end;
	_streetObject_end = _allowedRoads select _rand_end;
	
	_distance = _streetObject_start distance _streetObject_end;
};

//SPAWN CONVOY
switch (_target) do {
    case "WEST": {
		_mainVehicle = "B_GEN_Van_02_vehicle_F";
		_guardVehicle = "B_GEN_Offroad_01_gen_F";
		_infVehicle = "B_GEN_Van_02_transport_F";
		_driverClass = "B_Captain_Dwarden_F";
		_infClasses = ["B_GEN_Soldier_F","B_GEN_Commander_F"];
	};
    case "EAST": {
		_mainVehicle = "O_G_Van_02_vehicle_F";
		_guardVehicle = "O_G_Offroad_01_armed_F";
		_infVehicle = "O_G_Van_01_transport_F";
		_driverClass = "O_G_Soldier_lite_F";
		_infClasses = ["O_G_Soldier_F","O_G_Soldier_LAT_F","O_G_medic_F","O_G_Soldier_AR_F","O_G_Soldier_TL_F","O_G_Soldier_SL_F","O_G_Sharpshooter_F"];
	};
    case "GUER": {
		_mainVehicle = "I_C_Van_02_vehicle_F";
		_guardVehicle = "I_C_Offroad_02_LMG_F";
		_infVehicle = "I_C_Van_01_transport_F";
		_driverClass = "I_C_Soldier_Bandit_4_F";
		_infClasses = ["I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_6_F"];
	};
    default {
		_mainVehicle = "";
		_guardVehicle = "";
		_infVehicle = "";
		_driverClass = "";
		_infClasses = [];
	};
};

_infClasses = "I_C_Soldier_Bandit_2_F";

_grp = createGroup _target;
_spawnGuardVehicle = createVehicle [_guardVehicle, position _streetObject_start, [], 0, "NONE"];
_spawnGuardDriver = _grp createUnit [_driverClass, [0,0,0], [], 0, "NONE"];
_spawnGuardGunner = _grp createUnit [_driverClass, [0,0,0], [], 0, "NONE"];
_spawnGuardDriver moveInDriver _spawnGuardVehicle;
_spawnGuardGunner moveInGunner _spawnGuardVehicle;

_spawnMainVehicle = createVehicle [_mainVehicle, position _streetObject_start, [], 0, "NONE"];
_spawnMainDriver = _grp createUnit [_driverClass, [0,0,0], [], 0, "NONE"];
_spawnMainDriver moveInDriver _spawnMainVehicle;

_spawnInfVehicle = createVehicle [_infVehicle, position _streetObject_start, [], 0, "NONE"];
_spawnInfDriver = _grp createUnit [_driverClass, [0,0,0], [], 0, "NONE"];
_spawnInfDriver moveInDriver _spawnInfVehicle;

hint format ["%1",_infClasses];

_grpCargo = createGroup _target;
for "_i" from 1 to 6 do {
	//_spawnInfClass = selectRandom _infClasses;
	_spawnCargoInf = _grpCargo createUnit [_infClasses, [0,0,0], [], 0, "NONE"];
	_spawnCargoInf moveInAny _spawnInfVehicle;
};

_wp1 = _grp addWaypoint [position _streetObject_end, 0];
_wp1 setWaypointSpeed "FULL";
_wp1 setWaypointType "MOVE";
//////////////





//SPAWN ENDSTATION
_endPos = getPos _streetObject_end;
_randSpawnPos_car = _endPos getPos [10 * sqrt random 1, random 360];

_randSpawnPos_box_1 = _endPos getPos [10 * sqrt random 1, random 360];

while {isOnRoad _randSpawnPos_box_1} do {
	_randSpawnPos_box_1 = _endPos getPos [10 * sqrt random 1, random 360];
};
_randSpawnPos_inf = _endPos getPos [10 * sqrt random 1, random 360];

_veh = createVehicle ["I_C_Offroad_02_LMG_F", _randSpawnPos_car, [], 0, "NONE"];
_box_1 = createVehicle ["CargoNet_01_box_F", _randSpawnPos_box_1, [], 0, "NONE"];

_grp_car = createGroup independent;
_gunner_1 = _grp_car createUnit ["I_C_Soldier_Bandit_6_F", [0,0,0], [], 0, "NONE"];
_gunner_1 moveInGunner _veh;

_grp_inf = createGroup independent;
for "_i" from 1 to 3 do {
	_inf = _grp_inf createUnit ["I_C_Soldier_Bandit_5_F", _randSpawnPos_inf, [], 0, "NONE"];
};

//////////////////


_markerName_start = "convoi_start";
_marker_start = createMarker [_markerName_start, _streetObject_start];
_marker_start setMarkerType "hd_start";

_markerName_end = "convoi_end";
_markerName_end = createMarker [_markerName_end, _streetObject_end];
_markerName_end setMarkerType "hd_end";




/*

_grp setBehaviour "CARELESS";
_grp setCombatMode "BLUE";

_wp1 = _grp addWaypoint [position _streetObject_end, 0];
_wp1 setWaypointSpeed "FULL";
_wp1 setWaypointType "MOVE";
*/