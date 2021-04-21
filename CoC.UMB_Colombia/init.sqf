sleep 5;

if (!isNil "z_1") then {
	z_1 setVariable ["standing_blufor", 1, true];
	z_1 setVariable ["standing_opfor", 1, true];
	z_1 setVariable ["standing_grenfor", 1, true];
	
	z_1 setVariable ["reputation_blufor", 0.8, true];
	z_1 setVariable ["reputation_opfor", 0.8, true];
	z_1 setVariable ["reputation_grenfor", 0.8, true];
};

addMissionEventHandler ["EntityKilled", {
	params ["_dead", "_killer", "_instigator", "_useEffects"];
	_side = side group _dead;
	if(isPlayer _instigator) then {
		if(_side == resistance) then {
			_instigator setVariable ["standing_grenfor", 0, true];
			_time = time;
			_instigator setVariable ["lastKnown_grenfor", _time, true];
		};
		if(_side == east) then {
			_instigator setVariable ["standing_opfor", 0, true];
			_time = time;
			_instigator setVariable ["lastKnown_opfor", _time, true];
		};
		if(_side == west) then {
			_instigator setVariable ["standing_blufor", 0, true];
			_time = time;
			_instigator setVariable ["lastKnown_blufor", _time, true];
		};
	};
}];

_noRoads_1 = [12651,7148.04] nearRoads 300;
_noRoads_2 = [11596.6,12679.5] nearRoads 600;
_noRoads_3 = [4741.43,10937.4] nearRoads 300;
_noRoads_4 = [3281.79,10250.3] nearRoads 300;
_noRoads_5 = [2661.42,7401.17] nearRoads 300;
_noRoads_6 = [4269.4,8651.67] nearRoads 300;
_noRoads_7 = [4947.3,4839.38] nearRoads 300;
_noRoads_8 = [12824.2,5661.54] nearRoads 300;
_noRoads_9 = [9348.05,9579.64] nearRoads 300;
_noRoads_10 = [7546.1,12150.7] nearRoads 300;
_noRoads_11 = [3864.55,13134.8] nearRoads 300;
_noRoads_12 = [12821.4,5627.85] nearRoads 300;

forbiddenStreets = _noRoads_1 + _noRoads_2 + _noRoads_3 + _noRoads_4 + _noRoads_5 + _noRoads_6 + _noRoads_7 + _noRoads_8 + _noRoads_9 + _noRoads_10 + _noRoads_11 + _noRoads_12;

while {true} do {
	[] spawn COC_fnc_manageStanding;
	sleep 1;
};