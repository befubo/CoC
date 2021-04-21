params [];

{
	_blufor_unit = _x;
	if(!isPlayer _blufor_unit) then {
		{
			_lastKnown = _x getVariable "lastKnown_blufor";
			_now = time;
			_difference = _now - _lastKnown;
			if(_difference > 30) then {
				_x setVariable ["standing_blufor", 1, true];
			};
			
			_standing_blufor = _x getVariable "standing_blufor";
			_angle = 160;
			if(_standing_blufor == 1) then {
				_angle = 270;
			} else {
				_angle = 160;
			};
			
			_playerInSight = [position _blufor_unit, getDir _blufor_unit, _angle, position _x ] call BIS_fnc_inAngleSector;
			if(_playerInSight == true) then {																//IS PLAYER IN VIEW-SECTOR?
				_distance = _x distance _blufor_unit;
				_vehUnit = vehicle _x;
				_detectionRange = 60;
				if(_vehUnit == _x) then {
					_detectionRange = 60;
				} else {
					_detectionRange = 10;
				};
				
				if(_distance < _detectionRange) then {																	//IS PLAYER IN VIEW-RANGE
					_cansee = [objNull, "VIEW"] checkVisibility [eyePos _blufor_unit, eyePos _x];
					if(_cansee == 1) then {																	//IS PLAYER VISIBLE
						_pWeap = primaryWeapon _x;
						_hWeap = handgunWeapon _x;
						_sWeap = secondaryWeapon _x;
						if(_pWeap != "" OR _hWeap != "" OR _sWeap != "") then {								//HAS PLAYER A WEAPON
							_x setVariable ["standing_blufor", 0, true];
							_time = time;
							_x setVariable ["lastKnown_blufor", _time, true];
						};
					};
				};
			};	
		} foreach allPlayers;
	};
} foreach units WEST;

{
	_grenfor_unit = _x;
	if(!isPlayer _grenfor_unit) then {
		{
			_standing_grenfor = _x getVariable "standing_grenfor";
			if(_standing_grenfor == 0) then {
				_lastKnown = _x getVariable "lastKnown_grenfor";
				_now = time;
				_difference = _now - _lastKnown;
				if(_difference > 30) then {
					_x setVariable ["standing_grenfor", 1, true];
				};
				_angle = 160;
				if(_standing_grenfor == 1) then {
					_angle = 270;
				} else {
					_angle = 160;
				};
				
				_playerInSight = [position _grenfor_unit, getDir _grenfor_unit, _angle, position _x ] call BIS_fnc_inAngleSector;
				if(_playerInSight == true) then {																//IS PLAYER IN VIEW-SECTOR?
					_distance = _x distance _grenfor_unit;
					if(_distance < 60) then {																	//IS PLAYER IN VIEW-RANGE
						_cansee = [objNull, "VIEW"] checkVisibility [eyePos _grenfor_unit, eyePos _x];
						if(_cansee == 1) then {																	//IS PLAYER VISIBLE
							_pWeap = primaryWeapon _x;
							_hWeap = handgunWeapon _x;
							_sWeap = secondaryWeapon _x;
							if(_pWeap != "" OR _hWeap != "" OR _sWeap != "") then {							//HAS PLAYER A WEAPON
								_x setVariable ["standing_grenfor", 0, true];
								_time = time;
								_x setVariable ["lastKnown_grenfor", _time, true];
							};
						};
					};
				};
			};
		} foreach allPlayers;
	};
} foreach units independent;


{
	_standing_blufor = _x getVariable "standing_blufor";
	_standing_grenfor = _x getVariable "standing_grenfor";
	
	_reputation_blufor = _x getVariable "reputation_blufor";
	_reputation_grenfor = _x getVariable "reputation_grenfor";
		
	if(_standing_blufor == 1 && _standing_grenfor == 1) then {
		if(side _x != civilian) then {
			[_x] joinSilent createGroup civilian;
		};
	};
	if(_standing_blufor == 1 && _standing_grenfor == 0) then {
		if(side _x != west) then {
			[_x] joinSilent createGroup west;
		};
	};
	if(_standing_blufor == 0 && _standing_grenfor == 1) then {
		if(side _x != resistance) then {
			[_x] joinSilent createGroup resistance;
		};
	};
	if(_standing_blufor == 0 && _standing_grenfor == 0) then {
		if(side _x != east) then {
			[_x] joinSilent createGroup east;
		};
	};
} forEach allPlayers;