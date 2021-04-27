params [];
_posCenter = [7306.088,8348.544]; 
 
_radius = 6500; 
_militaryTowers = nearestObjects [_posCenter, ["Land_ControlTower_01_F"], _radius];

_tower = selectRandom _militaryTowers; 
 
deleteMarker "testMarker";
_testMarker = createMarker ["testMarker", position _tower]; 
"testMarker" setMarkerType "hd_start";

_posTower = getPos _tower;
_dirTower = getDir _tower;
_tower hideObjectGlobal true;

_newTower = createVehicle ["Land_ControlTower_01_F", _posTower, [], 0, "CAN_COLLIDE"];
[_newTower, _dirTower] remoteExec ["setDir", 0];

_cair_1 = createVehicle ["Land_CampingChair_V2_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_cair_1 attachTo [_newTower, [0.8, -0.4, 5.3]]; 
sleep 0.2;
_cair_2 = createVehicle ["Land_CampingChair_V2_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_cair_2 attachTo [_newTower, [1.4, -1.8, 5.25]];
sleep 0.2;
_table_1 = createVehicle ["Land_WoodenTable_large_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_table_1 attachTo [_newTower, [1.8, -2.4, 5.25]];
[_table_1, 90] remoteExec ["setDir", 0];
sleep 0.2;
_rack_1 = createVehicle ["Land_Metal_rack_Tall_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_rack_1 attachTo [_newTower, [3.25, -0.2, -7.5]];
[_rack_1, 90] remoteExec ["setDir", 0];
sleep 0.2;
_rack_2 = createVehicle ["Land_Metal_rack_Tall_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_rack_2 attachTo [_newTower, [3.25, -1, -7.5]];
[_rack_2, 90] remoteExec ["setDir", 0];
sleep 0.2;
_rack_3 = createVehicle ["Land_Metal_rack_Tall_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_rack_3 attachTo [_newTower, [3.25, -1.8, -7.5]];
[_rack_3, 90] remoteExec ["setDir", 0];
sleep 0.2;
_rack_4 = createVehicle ["Land_Metal_rack_Tall_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_rack_4 attachTo [_newTower, [3.25, -2.6, -7.5]];
[_rack_4, 90] remoteExec ["setDir", 0];