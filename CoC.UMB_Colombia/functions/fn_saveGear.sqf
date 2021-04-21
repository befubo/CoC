params ["_unit","_ammobox"];

_prefix = "CoC_";
_uid = getPlayerUID _unit;
_uid_unit = _prefix + _uid;

_weapons = weaponsItemsCargo _ammobox;
_items = getItemCargo _ammobox;
_magazines = getMagazineCargo _ammobox;
_backpacks = getBackpackCargo _ammobox;

_player_primary = primaryWeapon _unit;
_player_primary_items = primaryWeaponItems _unit;
_player_primary_mag = primaryWeaponMagazine _unit;
_primary = [_player_primary,_player_primary_items,_player_primary_mag];

_player_handgun = handgunWeapon _unit;
_player_primary_items = handgunItems _unit;
_player_primary_mag = handgunMagazine _unit;
_handgun = [_player_handgun, _player_primary_items, _player_primary_mag];

_player_secondary = secondaryWeapon _unit;
_player_secondary_items = secondaryWeaponItems _unit;
_player_secondary_mag = secondaryWeaponMagazine _unit;
_secondary = [_player_secondary, _player_secondary_items, _player_secondary_mag];

_player_uniform = uniform _unit;
_player_uniform_inventory = uniformItems _unit;
_uniform = [_player_uniform,_player_uniform_inventory];

_player_vest = vest _unit;
_player_vest_inventory = vestItems _unit;
_vest = [_player_vest,_player_vest_inventory];

_player_backpack = backpack _unit;
_player_backpack_inventory = backpackItems _unit;
_backpack = [_player_backpack,_player_backpack_inventory];

_playerSaveGame = [_weapons, _items, _magazines, _backpacks, _primary, _handgun, _secondary, _uniform, _vest, _backpack];
profileNamespace setVariable [_uid_unit, _playerSaveGame];

hint format ["%1\n%2",_uid_unit,_playerSaveGame];

saveProfileNamespace;