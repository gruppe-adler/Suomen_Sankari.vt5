_target = _this select 0;

_object = "Land_PortableLight_single_F" createVehicle position _target;




convertVectorToDir = {
	private ["_obj","_dir","_ang","_pit","_vecdx","_vecdy","_vecdz","_vecux","_vecuy","_vecuz"];

_obj = _this select 0;
_dir = _this select 1;
_ang = _this select 2;
_pit = _this select 3;

_vecdx = sin(_dir) * cos(_ang);
_vecdy = cos(_dir) * cos(_ang);
_vecdz = sin(_ang);

_vecux = cos(_dir) * cos(_ang) * sin(_pit);
_vecuy = sin(_dir) * cos(_ang) * sin(_pit);
_vecuz = cos(_ang) * cos(_pit);

[[_vecdx,_vecdy,_vecdz],[_vecux,_vecuy,_vecuz]]

};

[_target, _object] spawn {      
	_veh = _this select 0;     
	_objectToAttach = _this select 1;   

	_gunGunBeg = getText (configfile >> "CfgVehicles" >> (typeOf _veh) >> "Turrets" >> "M2_Turret" >> "gunBeg");
    _gunGunEnd = getText (configfile >> "CfgVehicles" >> (typeOf _veh) >> "Turrets" >> "M2_Turret" >> "gunEnd");


	//_objectToAttach attachTo [_veh, [0,1,0], _gunGunBeg]; 
	_objectToAttach attachTo [_veh, [0,1,0],_gunGunBeg]; 



	//_x1 = "Sign_Sphere25cm_F" createVehicleLocal (getpos _veh);  
	//_x1 attachTo [_veh, [0,0,0], _gunGunEnd];   

	//_x2 ="Sign_Sphere100cm_F" createVehicleLocal (getpos _veh);  
	//_x2 attachTo [_veh, [0,0,0], _gunGunBeg]; 

	
	[_veh,_objectToAttach,_gunGunBeg,_gunGunEnd] spawn {
	_vehicle = _this select 0;
	_obj = _this select 1;
	_gunB = _this select 2;
	_gunE = _this select 3;
	while {alive _vehicle} do {
        _posBeg = _vehicle selectionPosition _gunB;
        _posEnd = _vehicle selectionPosition _gunE;
        _dirVector = [_posEnd, _posBeg] call BIS_fnc_vectorFromXToY;
        hintSilent format ["%1",_dirVector];
        _ele = asin (_dirVector select 2);
        _dir = (_dirVector select 0) atan2 (_dirVector select 1);
        _upVector = [0, (_dirVector select 2), -1 * (((cos _dir) * (_dirVector select 1)) + ((sin _dir) * (_dirVector select 0)))];

        //systemChat format ["%1 , %2 = [%3, %4]", _dirVector, _upVector, _dir, _ele];
         //[_objectToAttach,_dirVector select 0] call rotateObjectZ;
         _obj setVectorDirAndUp ([_obj,_dir+180,-_ele,0] call convertVectorToDir);
         sleep 0.2;
       };
    
	};
};  