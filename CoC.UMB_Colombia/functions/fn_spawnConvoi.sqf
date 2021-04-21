params ["_side"];

hint format["Side: %1",_side];

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



/*
_veh = createVehicle ["C_Truck_02_transport_F", position _streetObject_start, [], 0, "NONE"];
_grp = createGroup independent;
_driver_1 = _grp createUnit ["I_C_Soldier_Bandit_6_F", [0,0,0], [], 0, "NONE"];
_driver_1 allowDamage false;
_driver_1 moveInDriver _veh; 
_grp setBehaviour "CARELESS";
_grp setCombatMode "BLUE";

_wp1 = _grp addWaypoint [position _streetObject_end, 0];
_wp1 setWaypointSpeed "FULL";
_wp1 setWaypointType "MOVE";
*/