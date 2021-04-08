if (!isNil "p_1") then {
	_prefix = "CoC_";
	_uid = getPlayerUID p_1;
	_uid_p1 = _prefix + _uid;
	_playerSaveGame = profileNamespace getVariable [_uid_p1, []];

	if !(_playerSaveGame isEqualTo []) then {
		{
			ammobox_p_1 addWeaponWithAttachmentsCargoGlobal [_x, 1];
		}foreach (_playerSaveGame select 0) select 0;
		{
			_classname = _x;
			_amount = ((_playerSaveGame select 1) select 1) select _forEachIndex;
			ammobox_p_1 addItemCargoGlobal [_classname,_amount];
		}foreach ((_playerSaveGame select 1) select 0) select 0;
		{
			_classname = _x;
			_amount = ((_playerSaveGame select 2) select 1) select _forEachIndex;
			ammobox_p_1 addMagazineCargoGlobal [_classname,_amount];
		}foreach ((_playerSaveGame select 2) select 0) select 0;
		{
			_classname = _x;
			_amount = ((_playerSaveGame select 3) select 1) select _forEachIndex;
			ammobox_p_1 addBackpackCargoGlobal [_classname,_amount];
		}foreach ((_playerSaveGame select 3) select 0) select 0;
	};
};

if (!isNil "p_2") then {
	_prefix = "CoC_";
	_uid = getPlayerUID p_2;
	_uid_p2 = _prefix + _uid;
	_playerSaveGame = profileNamespace getVariable [_uid_p2, []];

	if !(_playerSaveGame isEqualTo []) then {
		{
			ammobox_p_2 addWeaponWithAttachmentsCargoGlobal [_x, 1];
		}foreach (_playerSaveGame select 0) select 0;
		{
			_classname = _x;
			_amount = ((_playerSaveGame select 1) select 1) select _forEachIndex;
			ammobox_p_2 addItemCargoGlobal [_classname,_amount];
		}foreach ((_playerSaveGame select 1) select 0) select 0;
		{
			_classname = _x;
			_amount = ((_playerSaveGame select 2) select 1) select _forEachIndex;
			ammobox_p_2 addMagazineCargoGlobal [_classname,_amount];
		}foreach ((_playerSaveGame select 2) select 0) select 0;
		{
			_classname = _x;
			_amount = ((_playerSaveGame select 3) select 1) select _forEachIndex;
			ammobox_p_2 addBackpackCargoGlobal [_classname,_amount];
		}foreach ((_playerSaveGame select 3) select 0) select 0;
	};
};

if (!isNil "p_3") then {
	_prefix = "CoC_";
	_uid = getPlayerUID p_3;
	_uid_p3 = _prefix + _uid;
	_playerSaveGame = profileNamespace getVariable [_uid_p3, []];

	if !(_playerSaveGame isEqualTo []) then {
		{
			ammobox_p_3 addWeaponWithAttachmentsCargoGlobal [_x, 1];
		}foreach (_playerSaveGame select 0) select 0;
		{
			_classname = _x;
			_amount = ((_playerSaveGame select 1) select 1) select _forEachIndex;
			ammobox_p_3 addItemCargoGlobal [_classname,_amount];
		}foreach ((_playerSaveGame select 1) select 0) select 0;
		{
			_classname = _x;
			_amount = ((_playerSaveGame select 2) select 1) select _forEachIndex;
			ammobox_p_3 addMagazineCargoGlobal [_classname,_amount];
		}foreach ((_playerSaveGame select 2) select 0) select 0;
		{
			_classname = _x;
			_amount = ((_playerSaveGame select 3) select 1) select _forEachIndex;
			ammobox_p_3 addBackpackCargoGlobal [_classname,_amount];
		}foreach ((_playerSaveGame select 3) select 0) select 0;
	};
};

if (!isNil "p_4") then {
	_prefix = "CoC_";
	_uid = getPlayerUID p_4;
	_uid_p4 = _prefix + _uid;
	_playerSaveGame = profileNamespace getVariable [_uid_p4, []];

	if !(_playerSaveGame isEqualTo []) then {
		{
			ammobox_p_4 addWeaponWithAttachmentsCargoGlobal [_x, 1];
		}foreach (_playerSaveGame select 0) select 0;
		{
			_classname = _x;
			_amount = ((_playerSaveGame select 1) select 1) select _forEachIndex;
			ammobox_p_4 addItemCargoGlobal [_classname,_amount];
		}foreach ((_playerSaveGame select 1) select 0) select 0;
		{
			_classname = _x;
			_amount = ((_playerSaveGame select 2) select 1) select _forEachIndex;
			ammobox_p_4 addMagazineCargoGlobal [_classname,_amount];
		}foreach ((_playerSaveGame select 2) select 0) select 0;
		{
			_classname = _x;
			_amount = ((_playerSaveGame select 3) select 1) select _forEachIndex;
			ammobox_p_4 addBackpackCargoGlobal [_classname,_amount];
		}foreach ((_playerSaveGame select 3) select 0) select 0;
	};
};