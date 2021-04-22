_unit = _this select 0;
_unit setVariable ["lastKnown_blufor", 0, true];
_unit setVariable ["lastKnown_grenfor", 0, true];

_unit setVariable ["standing_blufor", 1, true];
_unit setVariable ["standing_grenfor", 1, true];

_unit setVariable ["reputation_blufor", 0.8, true];
_unit setVariable ["reputation_grenfor", 0.8, true];

_prefix = "CoC_";
_uid = getPlayerUID _unit;
_uid_player = _prefix + _uid;
_playerSaveGame = profileNamespace getVariable [_uid_player, []];


_ammobox = ammobox_p_1;
if((str _unit) == "p_1") then {
	_ammobox = ammobox_p_1;
};
if((str _unit) == "p_2") then {
	_ammobox = ammobox_p_2;
};
if((str _unit) == "p_3") then {
	_ammobox = ammobox_p_3;
};
if((str _unit) == "p_4") then {
	_ammobox = ammobox_p_4;
};


if !(_playerSaveGame isEqualTo []) then {
	{
		_ammobox addWeaponWithAttachmentsCargoGlobal [_x, 1];
	}foreach (_playerSaveGame select 0) select 0;
	{
		_classname = _x;
		_amount = ((_playerSaveGame select 1) select 1) select _forEachIndex;
		_ammobox addItemCargoGlobal [_classname,_amount];
	}foreach ((_playerSaveGame select 1) select 0) select 0;
	{
		_classname = _x;
		_amount = ((_playerSaveGame select 2) select 1) select _forEachIndex;
		_ammobox addMagazineCargoGlobal [_classname,_amount];
	}foreach ((_playerSaveGame select 2) select 0) select 0;
	{
		_classname = _x;
		_amount = ((_playerSaveGame select 3) select 1) select _forEachIndex;
		_ammobox addBackpackCargoGlobal [_classname,_amount];
	}foreach ((_playerSaveGame select 3) select 0) select 0;
	

	
	//PRIMARY WEAPON
	_weapon = (_playerSaveGame select 4) select 0;
	if !(_weapon == "") then {
		_unit addWeaponGlobal ((_playerSaveGame select 4) select 0) select 0;
	};
	
	_magazine = (_playerSaveGame select 4) select 2;
	if !(_magazine isEqualTo []) then {
		_mag = ((_playerSaveGame select 4) select 2) select 0;
		_unit addPrimaryWeaponItem _mag;
	};
	
	_items = (_playerSaveGame select 4) select 1;
	
	if !(_items isEqualTo []) then {
		_item1 = ((_playerSaveGame select 4) select 1) select 0;
		_unit addPrimaryWeaponItem _item1;
		
		_item2 = ((_playerSaveGame select 4) select 1) select 1;
		_unit addPrimaryWeaponItem _item2;
		
		_item3 = ((_playerSaveGame select 4) select 1) select 2;
		_unit addPrimaryWeaponItem _item3;
		
		_item4 = ((_playerSaveGame select 4) select 1) select 3;
		_unit addPrimaryWeaponItem _item4;
	};
	
	//HANDGUN
	_weapon = (_playerSaveGame select 5) select 0;
	if !(_weapon == "") then {
		_unit addWeaponGlobal ((_playerSaveGame select 5) select 0) select 0;
	};
	
	_magazine = (_playerSaveGame select 5) select 2;
	if !(_magazine isEqualTo []) then {
		_mag = ((_playerSaveGame select 5) select 2) select 0;
		_unit addHandgunItem _mag;
	};
	
	_items = (_playerSaveGame select 5) select 1;
	
	if !(_items isEqualTo []) then {
		_item1 = ((_playerSaveGame select 5) select 1) select 0;
		_unit addHandgunItem _item1;
		
		_item2 = ((_playerSaveGame select 5) select 1) select 1;
		_unit addHandgunItem _item2;
		
		_item3 = ((_playerSaveGame select 5) select 1) select 2;
		_unit addHandgunItem _item3;
		
		_item4 = ((_playerSaveGame select 5) select 1) select 3;
		_unit addHandgunItem _item4;
	};
	
	//SECONDARY
	_weapon = (_playerSaveGame select 6) select 0;
	if !(_weapon == "") then {
		_unit addWeaponGlobal ((_playerSaveGame select 6) select 0) select 0;
	};
	
	_magazine = (_playerSaveGame select 6) select 2;
	if !(_magazine isEqualTo []) then {
		_mag = ((_playerSaveGame select 6) select 2) select 0;
		_unit addSecondaryWeaponItem _mag;
	};
	
	_items = (_playerSaveGame select 6) select 1;
	if !(_items isEqualTo []) then {
		_item1 = ((_playerSaveGame select 6) select 1) select 0;
		_unit addSecondaryWeaponItem _item1;
		
		_item2 = ((_playerSaveGame select 6) select 1) select 1;
		_unit addSecondaryWeaponItem _item2;
		
		_item3 = ((_playerSaveGame select 6) select 1) select 2;
		_unit addSecondaryWeaponItem _item3;
		
		_item4 = ((_playerSaveGame select 6) select 1) select 3;
		_unit addSecondaryWeaponItem _item4;
	};
	
	//UNIFORM
	_uniform = (_playerSaveGame select 7) select 0;
	if !(_uniform == "") then {
		_unit forceAddUniform ((_playerSaveGame select 7) select 0) select 0;
	};
	_items = (_playerSaveGame select 7) select 1;
	{
		_unit addItemToUniform _x;
	}foreach _items;
	
	//VEST
	_vest = (_playerSaveGame select 8) select 0;
	if !(_vest == "") then {
		_unit addVest ((_playerSaveGame select 8) select 0) select 0;
	};
	_items = (_playerSaveGame select 8) select 1;
	{
		_unit addItemToVest _x;
	}foreach _items;
	
	//BACKPACK
	_backpack = (_playerSaveGame select 9) select 0;
	if !(_backpack == "") then {
		_unit addBackpack ((_playerSaveGame select 9) select 0) select 0;
	};
	_items = (_playerSaveGame select 9) select 1;
	{
		_unit addItemToBackpack _x;
	}foreach _items;
	
	//HEADGEAR
	_headgear = (_playerSaveGame select 10) select 0;
	if !(_headgear == "") then {
		_unit addHeadgear ((_playerSaveGame select 10) select 0) select 0;
	};
};


while {true} do { //DEBUG AI STATUS
	_standing_blufor = _unit getVariable "standing_blufor";
	_standing_grenfor = _unit getVariable "standing_grenfor";
	
	_reputation_blufor = _unit getVariable "reputation_blufor";
	_reputation_grenfor = _unit getVariable "reputation_grenfor";
	
	_lastKnown_blufor = _unit getVariable "lastKnown_blufor";
	_lastKnown_grenfor = _unit getVariable "lastKnown_grenfor";
	_now = time;
	_difference_blu = _now - _lastKnown_blufor;
	_difference_gre = _now - _lastKnown_grenfor;
	
	_we = west getFriend east;
	_wi = west getFriend resistance;
	_ie = resistance getFriend east;
	
	hintsilent format ["BLUFOR: %1\nOPFOR: %2\nINDEP: %3\nBLU LAST: %4\nOPF LAST: %5\nGRE LAST: %6\nW-E: %7\nW-I: %8\nI-E: %9",_standing_blufor, "NaN", _standing_grenfor, _difference_blu, "NaN", _difference_gre, _we, _wi, _ie];
	sleep 0.1;
};
