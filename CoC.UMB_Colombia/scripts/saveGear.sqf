//p1 Box
if (!isNil "p_1") then {
	_prefix = "CoC_";
	_uid = getPlayerUID p_1;
	_uid_p1 = _prefix + _uid;

	_weapons = weaponsItemsCargo ammobox_p_1;
	_items = getItemCargo ammobox_p_1;
	_magazines = getMagazineCargo ammobox_p_1;
	_backpacks = getBackpackCargo ammobox_p_1;
	
	_player_primary = primaryWeapon p_1;
	_player_primary_items = primaryWeaponItems p_1;
	_player_primary_mag = primaryWeaponMagazine p_1;
	_primary = [_player_primary,_player_primary_items,_player_primary_mag];
	
	_player_handgun = handgunWeapon p_1;
	_player_primary_items = handgunItems p_1;
	_player_primary_mag = handgunMagazine p_1;
	_handgun = [_player_handgun, _player_primary_items, _player_primary_mag];
	
	_player_secondary = secondaryWeapon p_1;
	_player_secondary_items = secondaryWeaponItems p_1;
	_player_secondary_mag = secondaryWeaponMagazine p_1;
	_secondary = [_player_secondary, _player_secondary_items, _player_secondary_mag];
	
	_player_uniform = uniform p_1;
	_player_uniform_inventory = uniformItems p_1;
	_uniform = [_player_uniform,_player_uniform_inventory];

	_player_vest = vest p_1;
	_player_vest_inventory = vestItems p_1;
	_vest = [_player_vest,_player_vest_inventory];

	_player_backpack = backpack p_1;
	_player_backpack_inventory = backpackItems p_1;
	_backpack = [_player_backpack,_player_backpack_inventory];

	_playerSaveGame = [_weapons, _items, _magazines, _backpacks, _primary, _handgun, _secondary, _uniform, _vest, _backpack];
	profileNamespace setVariable [_uid_p1, _playerSaveGame];
};
//p2 Box
if (!isNil "p_2") then {
	_prefix = "CoC_";
	_uid = getPlayerUID p_2;
	_uid_p2 = _prefix + _uid;

	_weapons = weaponsItemsCargo ammobox_p_2;
	_items = getItemCargo ammobox_p_2;
	_magazines = getMagazineCargo ammobox_p_2;
	_backpacks = getBackpackCargo ammobox_p_2;
	
	_player_primary = primaryWeapon p_2;
	_player_primary_items = primaryWeaponItems p_2;
	_player_primary_mag = primaryWeaponMagazine p_2;
	_primary = [_player_primary,_player_primary_items,_player_primary_mag];
	
	_player_handgun = handgunWeapon p_2;
	_player_primary_items = handgunItems p_2;
	_player_primary_mag = handgunMagazine p_2;
	_handgun = [_player_handgun, _player_primary_items, _player_primary_mag];
	
	_player_secondary = secondaryWeapon p_2;
	_player_secondary_items = secondaryWeaponItems p_2;
	_player_secondary_mag = secondaryWeaponMagazine p_2;
	_secondary = [_player_secondary, _player_secondary_items, _player_secondary_mag];
	
	_player_uniform = uniform p_2;
	_player_uniform_inventory = uniformItems p_2;
	_uniform = [_player_uniform,_player_uniform_inventory];

	_player_vest = vest p_2;
	_player_vest_inventory = vestItems p_2;
	_vest = [_player_vest,_player_vest_inventory];

	_player_backpack = backpack p_2;
	_player_backpack_inventory = backpackItems p_2;
	_backpack = [_player_backpack,_player_backpack_inventory];

	_playerSaveGame = [_weapons, _items, _magazines, _backpacks, _primary, _handgun, _secondary, _uniform, _vest, _backpack];
	profileNamespace setVariable [_uid_p2, _playerSaveGame];
};

//p3 Box
if (!isNil "p_3") then {
	_prefix = "CoC_";
	_uid = getPlayerUID p_3;
	_uid_p3 = _prefix + _uid;

	_weapons = weaponsItemsCargo ammobox_p_3;
	_items = getItemCargo ammobox_p_3;
	_magazines = getMagazineCargo ammobox_p_3;
	_backpacks = getBackpackCargo ammobox_p_3;
	
	_player_primary = primaryWeapon p_3;
	_player_primary_items = primaryWeaponItems p_3;
	_player_primary_mag = primaryWeaponMagazine p_3;
	_primary = [_player_primary,_player_primary_items,_player_primary_mag];
	
	_player_handgun = handgunWeapon p_3;
	_player_primary_items = handgunItems p_3;
	_player_primary_mag = handgunMagazine p_3;
	_handgun = [_player_handgun, _player_primary_items, _player_primary_mag];
	
	_player_secondary = secondaryWeapon p_3;
	_player_secondary_items = secondaryWeaponItems p_3;
	_player_secondary_mag = secondaryWeaponMagazine p_3;
	_secondary = [_player_secondary, _player_secondary_items, _player_secondary_mag];
	
	_player_uniform = uniform p_3;
	_player_uniform_inventory = uniformItems p_3;
	_uniform = [_player_uniform,_player_uniform_inventory];

	_player_vest = vest p_3;
	_player_vest_inventory = vestItems p_3;
	_vest = [_player_vest,_player_vest_inventory];

	_player_backpack = backpack p_3;
	_player_backpack_inventory = backpackItems p_3;
	_backpack = [_player_backpack,_player_backpack_inventory];

	_playerSaveGame = [_weapons, _items, _magazines, _backpacks, _primary, _handgun, _secondary, _uniform, _vest, _backpack];
	profileNamespace setVariable [_uid_p3, _playerSaveGame];
};

//p4 Box
if (!isNil "p_4") then {
	_prefix = "CoC_";
	_uid = getPlayerUID p_4;
	_uid_p4 = _prefix + _uid;

	_weapons = weaponsItemsCargo ammobox_p_4;
	_items = getItemCargo ammobox_p_4;
	_magazines = getMagazineCargo ammobox_p_4;
	_backpacks = getBackpackCargo ammobox_p_4;
	
	_player_primary = primaryWeapon p_4;
	_player_primary_items = primaryWeaponItems p_4;
	_player_primary_mag = primaryWeaponMagazine p_4;
	_primary = [_player_primary,_player_primary_items,_player_primary_mag];
	
	_player_handgun = handgunWeapon p_4;
	_player_primary_items = handgunItems p_4;
	_player_primary_mag = handgunMagazine p_4;
	_handgun = [_player_handgun, _player_primary_items, _player_primary_mag];
	
	_player_secondary = secondaryWeapon p_4;
	_player_secondary_items = secondaryWeaponItems p_4;
	_player_secondary_mag = secondaryWeaponMagazine p_4;
	_secondary = [_player_secondary, _player_secondary_items, _player_secondary_mag];
	
	_player_uniform = uniform p_4;
	_player_uniform_inventory = uniformItems p_4;
	_uniform = [_player_uniform,_player_uniform_inventory];

	_player_vest = vest p_4;
	_player_vest_inventory = vestItems p_4;
	_vest = [_player_vest,_player_vest_inventory];

	_player_backpack = backpack p_4;
	_player_backpack_inventory = backpackItems p_4;
	_backpack = [_player_backpack,_player_backpack_inventory];

	_playerSaveGame = [_weapons, _items, _magazines, _backpacks, _primary, _handgun, _secondary, _uniform, _vest, _backpack];
	profileNamespace setVariable [_uid_p4, _playerSaveGame];
};
saveProfileNamespace;