params ["_pos", "_index"];

// hintsilent format ["setting target to pos %1 and index %2", _pos, _index];
missionNamespace setVariable [format ["GRAD_crows_distantTarget_%1", _index], _pos];