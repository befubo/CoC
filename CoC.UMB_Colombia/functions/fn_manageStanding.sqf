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
				if(_distance < 60) then {																	//IS PLAYER IN VIEW-RANGE
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
	_opfor_unit = _x;
	if(!isPlayer _opfor_unit) then {
		{
			_standing_opfor = _x getVariable "standing_opfor";
			if(_standing_opfor == 0) then {
				_lastKnown = _x getVariable "lastKnown_opfor";
				_now = time;
				_difference = _now - _lastKnown;
				if(_difference > 30) then {
					_x setVariable ["standing_opfor", 1, true];
				};
				_angle = 160;
				if(_standing_opfor == 1) then {
					_angle = 270;
				} else {
					_angle = 160;
				};
				
				_playerInSight = [position _opfor_unit, getDir _opfor_unit, _angle, position _x ] call BIS_fnc_inAngleSector;
				if(_playerInSight == true) then {																//IS PLAYER IN VIEW-SECTOR?
					_distance = _x distance _opfor_unit;
					if(_distance < 60) then {																	//IS PLAYER IN VIEW-RANGE
						_cansee = [objNull, "VIEW"] checkVisibility [eyePos _opfor_unit, eyePos _x];
						if(_cansee == 1) then {																	//IS PLAYER VISIBLE
							_pWeap = primaryWeapon _x;
							_hWeap = handgunWeapon _x;
							_sWeap = secondaryWeapon _x;
							if(_pWeap != "" OR _hWeap != "" OR _sWeap != "") then {								//HAS PLAYER A WEAPON
								_x setVariable ["standing_opfor", 0, true];
								_time = time;
								_x setVariable ["lastKnown_opfor", _time, true];
							};
						};
					};
				};	
			};
		} foreach allPlayers;
	};
} foreach units EAST;

{
	_standing_blufor = _x getVariable "standing_blufor";
	_standing_opfor = _x getVariable "standing_opfor";
	_standing_grenfor = _x getVariable "standing_grenfor";
	
	_reputation_blufor = _x getVariable "reputation_blufor";
	_reputation_opfor = _x getVariable "reputation_opfor";
	_reputation_grenfor = _x getVariable "reputation_grenfor";
	
	if(_standing_blufor == 0 && _standing_opfor == 0 && _standing_grenfor == 0) then {
		_score = rating _x;
		_setRating = _score * (-1);
		_x addRating _setRating;
		
		_x addRating -10000;
		[] spawn COC_fnc_resetSideRelations;
	} else {
		_score = rating _x;
		_setRating = _score * (-1);
		_x addRating _setRating;
	};
	if(_standing_blufor == 0 && _standing_opfor == 0 && _standing_grenfor == 1) then {
		[_x] joinSilent createGroup resistance;
		[] spawn COC_fnc_resetSideRelations;
	};
	if(_standing_blufor == 0 && _standing_opfor == 1 && _standing_grenfor == 1) then {
		[resistance,east,1] spawn COC_fnc_changeSideRelations;
		if(_reputation_opfor < _reputation_grenfor) then {
			[_x] joinSilent createGroup resistance;
		} else {
			[_x] joinSilent createGroup EAST;
		};
	};
	if(_standing_blufor == 0 && _standing_opfor == 1 && _standing_grenfor == 0) then {
		[_x] joinSilent createGroup EAST;
		[] spawn COC_fnc_resetSideRelations;
	};
	if(_standing_blufor == 1 && _standing_opfor == 0 && _standing_grenfor == 0) then {
		[_x] joinSilent createGroup WEST;
		[] spawn COC_fnc_resetSideRelations;
	};
	if(_standing_blufor == 1 && _standing_opfor == 1 && _standing_grenfor == 0) then {
		[west,east,1] spawn COC_fnc_changeSideRelations;
		if(_reputation_blufor < _reputation_opfor) then {
			[_x] joinSilent createGroup EAST;
		} else {
			[_x] joinSilent createGroup WEST;
		};
	};
	if(_standing_blufor == 1 && _standing_opfor == 1 && _standing_grenfor == 1) then {
		[_x] joinSilent createGroup civilian;
		[] spawn COC_fnc_resetSideRelations;
	};
	if(_standing_blufor == 1 && _standing_opfor == 0 && _standing_grenfor == 1) then {
		[west,resistance,1] spawn COC_fnc_changeSideRelations;
		if(_reputation_blufor < _reputation_grenfor) then {
			[_x] joinSilent createGroup resistance;	
		} else {
			[_x] joinSilent createGroup WEST;
		};
	};
} forEach allPlayers;