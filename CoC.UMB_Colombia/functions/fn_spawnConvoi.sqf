params ["_client","_target","_level"];

_posCenter = [8277.57,7975.61];

_nearestRoad = _posCenter nearRoads 7000;
_closeRoads = _posCenter nearRoads 1000;
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

_distanceStatus = 0;
_streetObject_end = "";
while {_distanceStatus == 0} do {
	_rand_end = random _count;
	_rand_end = round _rand_end;
	_streetObject_end = _allowedRoads select _rand_end;
	
	_distance = _streetObject_start distance _streetObject_end;
	if(_distance < 2000 && _distance > 6000) then {
		_distanceStatus = 0;
	} else {
		_distanceStatus = 1;
	};
};

// GUARD VEHICLE
_guardVehicle = "B_GEN_Offroad_01_gen_F";
_driverClass = "B_Captain_Dwarden_F";
_spawnGuardVehicle = createVehicle [_guardVehicle, position _streetObject_start, [], 0, "NONE"];

_grp = createGroup _target;
_guardDriver = _grp createUnit [_driverClass, [0,0,0], [], 0, "NONE"];
_guardDriver moveInDriver _spawnGuardVehicle;
_grp setFormation "FILE";

_dirRoadGuard = (_startRoadInfo select 6) getDir (_startRoadInfo select 7);
[_spawnGuardVehicle, _dirRoadGuard] remoteExec ["setDir", 0];

_connectedRoads = roadsConnectedTo _streetObject_start;
_secondVehiclePos = _connectedRoads select 0;
_secondVehiclePosInfo = getRoadInfo _secondVehiclePos;

sleep 5;

// MAIN VEHICLE
_mainVehicle = "B_GEN_Van_02_vehicle_F";
_driverClass = "B_Captain_Dwarden_F";
_spawnMainVehicle = createVehicle [_mainVehicle, position _secondVehiclePos, [], 0, "NONE"];

_mainDriver = _grp createUnit [_driverClass, [0,0,0], [], 0, "NONE"];
_mainDriver moveInDriver _spawnMainVehicle;

_dirRoadMain = (_secondVehiclePosInfo select 6) getDir (_secondVehiclePosInfo select 7);
[_spawnMainVehicle, _dirRoadMain] remoteExec ["setDir", 0];

_connectedRoads = roadsConnectedTo _secondVehiclePos;
_thirdVehiclePos = _connectedRoads select 0;
_thirdVehiclePosInfo = getRoadInfo _thirdVehiclePos;

sleep 5;

// TRANSPORT VEHICLE
_transportVehicle = "B_GEN_Van_02_transport_F";
_driverClass = "B_Captain_Dwarden_F";
_spawnTransportVehicle = createVehicle [_transportVehicle, position _thirdVehiclePos, [], 0, "NONE"];

_transportDriver = _grp createUnit [_driverClass, [0,0,0], [], 0, "NONE"];
_transportDriver moveInDriver _spawnTransportVehicle;

_dirRoadTransport = (_thirdVehiclePosInfo select 6) getDir (_thirdVehiclePosInfo select 7);
[_spawnTransportVehicle, _dirRoadTransport] remoteExec ["setDir", 0];


sleep 5;

{
	_x setSkill ["general",1];
} foreach units _grp;
_grp setBehaviour "SAFE";


/*


0=[driver _spawnGuardVehicle] spawn
	{
	params ["_DriverGuardVehicle"];
	while{alive _DriverGuardVehicle} do {
		_DriverGuardVehicle forceWeaponFire["PoliceHorn", "PoliceHorn"];
		sleep 1.5;
		};
	};

0=[driver _spawnMainVehicle] spawn
	{
	params ["_DriverMainVehicle"];
	while{alive _DriverMainVehicle} do {
		_DriverMainVehicle forceWeaponFire["PoliceHorn", "PoliceHorn"];
		sleep 1.5;
		};
	};

0=[driver _spawnTransportVehicle] spawn
	{
	params ["_DriverTransportVehicle"];
	while{alive _DriverTransportVehicle} do {
		_DriverTransportVehicle forceWeaponFire["PoliceHorn", "PoliceHorn"];
		sleep 1.5;
		};
	};

*/

[_spawnGuardVehicle,'CustomSoundController1',1,0.2] remoteExec ['BIS_fnc_setCustomSoundController'];
_spawnGuardVehicle animate ["BeaconsStart", 1]; 
_spawnMainVehicle animate ["lights_em_hide", 1]; 
[_spawnTransportVehicle,'CustomSoundController1',1,0.2] remoteExec ['BIS_fnc_setCustomSoundController'];
_spawnTransportVehicle animate ["lights_em_hide", 1]; 

_spawnGuardVehicle setVariable ["speedLimit", 35];
_spawnGuardVehicle forceFollowRoad true;
_spawnMainVehicle forceFollowRoad true;
_spawnTransportVehicle forceFollowRoad true;

_wp1 = _grp addWaypoint [position _streetObject_end, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "LIMITED";


//roadsConnectedTo roadSegment

//_info = getRoadInfo _road;
//



/*
_grpCargo = createGroup _target;
for "_i" from 1 to 6 do {
	_spawnInfClass = selectRandom _infClasses;
	_spawnCargoInf = _grpCargo createUnit [_infClasses, [0,0,0], [], 0, "NONE"];
	_spawnCargoInf moveInAny _spawnInfVehicle;
	sleep 0.2;
};




//_wp1 = _grp addWaypoint [position _streetObject_end, 0];
//_wp1 setWaypointSpeed "FULL";
//_wp1 setWaypointType "MOVE";



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


*/




/*

_grp setBehaviour "CARELESS";
_grp setCombatMode "BLUE";

_wp1 = _grp addWaypoint [position _streetObject_end, 0];
_wp1 setWaypointSpeed "FULL";
_wp1 setWaypointType "MOVE";
*/