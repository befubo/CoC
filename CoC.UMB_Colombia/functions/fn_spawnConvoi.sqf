params ["_client","_target","_level"];

_posCenter = [7306.088,8348.544];

_nearestRoad = _posCenter nearRoads 6500;
_allowedRoads = _nearestRoad - forbiddenStreets;
_count = count _allowedRoads;

_rand_start = random _count;
_rand_start = round _rand_start;
_streetObject_start = _allowedRoads select _rand_start;
_startRoadInfo = getRoadInfo _streetObject_start;

while {_startRoadInfo select 8} do {
	_rand_start = random _count;
	_rand_start = round _rand_start;
	_streetObject_start = _allowedRoads select _rand_start;
	_startRoadInfo = getRoadInfo _streetObject_start;
};

_startMarker = createMarker ["convoyStartPos", position _streetObject_start];
"convoyStartPos" setMarkerType "hd_start";

_distanceStatus = 0;
_streetObject_end = "";
while {_distanceStatus == 0} do {
	_rand_end = random _count;
	_rand_end = round _rand_end;
	_streetObject_end = _allowedRoads select _rand_end;
	
	_distance = _streetObject_start distance _streetObject_end;
	if(_distance < 2000 OR _distance > 6000) then {
		_distanceStatus = 0;
	} else {
		_distanceStatus = 1;
	};
};

_endMarker = createMarker ["convoyEndPos", position _streetObject_end];
"convoyEndPos" setMarkerType "hd_end";

// GUARD VEHICLE
_guardVehicle = "B_GEN_Offroad_01_gen_F";
_driverClass = "B_Captain_Dwarden_F";
_spawnGuardVehicle = createVehicle [_guardVehicle, position _streetObject_start, [], 0, "NONE"];

_grpGuard = createGroup _target;
_guardDriver = _grpGuard createUnit [_driverClass, [0,0,0], [], 0, "NONE"];
_guardDriver moveInDriver _spawnGuardVehicle;

_dirRoadGuard = (_startRoadInfo select 6) getDir (_startRoadInfo select 7);
[_spawnGuardVehicle, _dirRoadGuard] remoteExec ["setDir", 0];

_connectedRoads = roadsConnectedTo _streetObject_start;
_secondVehiclePos = _connectedRoads select 0;
_secondVehiclePosInfo = getRoadInfo _secondVehiclePos;

_distance1to2 = _streetObject_start distance _secondVehiclePos;
while {_distance1to2 < 10} do {
	_connectedRoads = roadsConnectedTo _secondVehiclePos;
	_secondVehiclePos = _connectedRoads select 0;
	_distance1to2 = _streetObject_start distance _secondVehiclePos;
};

sleep 5;

// MAIN VEHICLE
_mainVehicle = "B_GEN_Offroad_01_gen_F";
_driverClass = "B_Captain_Dwarden_F";
_spawnMainVehicle = createVehicle [_mainVehicle, position _secondVehiclePos, [], 0, "NONE"];

_grpMain = createGroup _target;
_mainDriver = _grpMain createUnit [_driverClass, [0,0,0], [], 0, "NONE"];
_mainDriver moveInDriver _spawnMainVehicle;

_dirRoadMain = (_secondVehiclePosInfo select 6) getDir (_secondVehiclePosInfo select 7);
[_spawnMainVehicle, _dirRoadMain] remoteExec ["setDir", 0];

_connectedRoads = roadsConnectedTo _secondVehiclePos;
_thirdVehiclePos = _connectedRoads select 0;
_thirdVehiclePosInfo = getRoadInfo _thirdVehiclePos;

_distance2to3 = _secondVehiclePos distance _thirdVehiclePos;
while {_distance2to3 < 10} do {
	_connectedRoads = roadsConnectedTo _thirdVehiclePos;
	_thirdVehiclePos = _connectedRoads select 0;
	_distance2to3 = _secondVehiclePos distance _thirdVehiclePos;
};

sleep 5;

// TRANSPORT VEHICLE
_transportVehicle = "B_GEN_Offroad_01_gen_F";
_driverClass = "B_Captain_Dwarden_F";
_spawnTransportVehicle = createVehicle [_transportVehicle, position _thirdVehiclePos, [], 0, "NONE"];

_grpTransport = createGroup _target;
_transportDriver = _grpTransport createUnit [_driverClass, [0,0,0], [], 0, "NONE"];
_transportDriver moveInDriver _spawnTransportVehicle;

_dirRoadTransport = (_thirdVehiclePosInfo select 6) getDir (_thirdVehiclePosInfo select 7);
[_spawnTransportVehicle, _dirRoadTransport] remoteExec ["setDir", 0];

_infClasses = ["I_E_Soldier_MP_F","I_E_Soldier_lite_F","I_E_Soldier_TL_F","I_E_soldier_M_F"]; 
 
_grpCargo = createGroup west;
for "_i" from 1 to 4 do { 
 _grpTemp = createGroup west; 
 _spawnInfClass = selectRandom _infClasses; 
 _spawnCargoInf = _grpTemp createUnit [_spawnInfClass, [0,0,0], [], 0, "NONE"]; 
[_spawnCargoInf] joinSilent _grpCargo; 
};

{
	_x moveInCargo _spawnTransportVehicle;
} foreach units _grpCargo;

sleep 3;

_spawnGuardVehicle animate ["BeaconsStart", 1]; 
_spawnMainVehicle animate ["lights_em_hide", 1]; 
_spawnTransportVehicle animate ["lights_em_hide", 1]; 
//SIRENS
//[_spawnTransportVehicle,'CustomSoundController1',1,0.2] remoteExec ['BIS_fnc_setCustomSoundController'];
//[_spawnGuardVehicle,'CustomSoundController1',1,0.2] remoteExec ['BIS_fnc_setCustomSoundController'];

_spawnMainVehicle setConvoySeparation 15;
_spawnTransportVehicle setConvoySeparation 15;

_handle = [["convoyStartPos","convoyEndPos"],[_spawnGuardVehicle,_spawnMainVehicle,_spawnTransportVehicle], 35, 300, 1, "NORMAL", "CARELESS"] spawn DEVAS_ConvoyMove;



//////////////



/*

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


*/




/*

_grp setBehaviour "CARELESS";
_grp setCombatMode "BLUE";

_wp1 = _grp addWaypoint [position _streetObject_end, 0];
_wp1 setWaypointSpeed "FULL";
_wp1 setWaypointType "MOVE";
*/