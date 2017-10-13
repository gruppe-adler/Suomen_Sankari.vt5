params ["_bomb"];

/*
activateBomb = ["activateThisBomb", "Sprengladung aktivieren (25s Timer)", "",
 {EXPLOSIVE_PLANTED = true; publicVariable "EXPLOSIVE_PLANTED";},
  {!EXPLOSIVE_PLANTED}] call ace_interact_menu_fnc_createAction;

["IEDUrbanBig_F", 0, ["ACE_MainActions"], activateBomb, true] call ace_interact_menu_fnc_addActionToClass;


[_bomb, 0, ["ACE_MainActions"], _activateBomb] call ace_interact_menu_fnc_addActionToObject;
*/

activateBomb = ["activateThisBomb", "Sprengladung aktivieren (25s Timer)", "",
        {EXPLOSIVE_PLANTED = true; publicVariable "EXPLOSIVE_PLANTED";},
        {!EXPLOSIVE_PLANTED}] call ace_interact_menu_fnc_createAction;

["Explosive", 0, ["ACE_MainActions"], activateBomb] call ace_interact_menu_fnc_addActionToClass;