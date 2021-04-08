_unit = _this select 0;

_prefix = "CoC_";
_uid = getPlayerUID _unit;
_uid_player = _prefix + _uid;
_playerSaveGame = profileNamespace getVariable [_uid_player, []];

if !(_playerSaveGame isEqualTo []) then {
	
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
	
	
	//systemChat format ["%1",_weapon];
};
