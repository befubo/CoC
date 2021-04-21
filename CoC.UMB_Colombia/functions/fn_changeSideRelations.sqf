params ["_side_1","_side_2","_state"];

_side_1 setFriend [_side_2, _state];
_side_2 setFriend [_side_1, _state];