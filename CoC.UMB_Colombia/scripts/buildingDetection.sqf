_radius = 10000;

_medicalStations = position player nearObjects ["Land_HealthCenter_01_F", _radius];
{
	_sufix = str _forEachIndex;
	_markerName = "MedicalBuilding_" + _sufix;
	
	_marker = createMarker [_markerName, _x];
	_marker setMarkerType "loc_Hospital";
} foreach _medicalStations;


_garages = position player nearObjects ["Land_GarageRow_01_large_F", _radius];
{
	_sufix = str _forEachIndex;
	_markerName = "garages_" + _sufix;
	
	_marker = createMarker [_markerName, _x];
	_marker setMarkerType "loc_BusStop";
} foreach _garages;


_sheds = position player nearObjects ["Land_i_Shed_Ind_F", _radius];
{
	_sufix = str _forEachIndex;
	_markerName = "sheds_" + _sufix;
	
	_marker = createMarker [_markerName, _x];
	_marker setMarkerType "loc_Stack";
} foreach _sheds;


_powerStation = position player nearObjects ["Land_PowerStation_01_F", _radius];
{
	_sufix = str _forEachIndex;
	_markerName = "powerStation_" + _sufix;
	
	_marker = createMarker [_markerName, _x];
	_marker setMarkerType "loc_Power";
} foreach _powerStation;


_industrial = position player nearObjects ["Land_CementWorks_01_grey_F", _radius];
{
	_sufix = str _forEachIndex;
	_markerName = "industrial_" + _sufix;
	
	_marker = createMarker [_markerName, _x];
	_marker setMarkerType "loc_Fountain";
} foreach _industrial;


_police = position player nearObjects ["Land_PoliceStation_01_F", _radius];
{
	_sufix = str _forEachIndex;
	_markerName = "police_" + _sufix;
	
	_marker = createMarker [_markerName, _x];
	_marker setMarkerType "MinefieldAP";
} foreach _police;







