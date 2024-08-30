/**
    Spawn paradrop group above position / area
    Saves unit loadout in case it does not have parachute

    _unitClasses    === ARRAY, unit classes to be spawned in order
    _areaCenter     === POSITION, center of area to spawn group
    _areaRadius     === NUMBER [DEFAULT 0], radius of area to spawn group
    _altitude       === NUMBER [DEFAULT 200], altitude to spawn group on
    _groupBehaviour === STRING [DEFAULT "AWARE"], ["CARELESS" "SAFE" "AWARE" "COMBAT" "STEALTH"], group behaviour
    _groupCombat    === STRING [DEFAULT "YELLOW"], ["BLUE" "GREEN" "WHITE" "YELLOW" "RED"], group combat mode

    RETURN: CREATED GROUP
 */

params [
     "_unitClasses",
    "_areaCenter",
    ["_areaRadius" 0],
    ["_altitude", 200],
    ["_groupBehaviour", "AWARE"],
    ["_groupCombat", "YELLOW"]
];

private _position = [_areaCenter, _areaRadius] call CBA_fnc_randPos;
_position set [2, _altitude];

private _group = [_position, _unitClasses] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
_group setBehaviour _groupBehaviour;
_group setCombatMode _groupCombat;

// Add parachute if needed
private _parachuteHandler = {
    private _loadout = false;
    _unit = _this select 0;
    if (backpack _unit != "B_parachute") then {
        _unit setVariable ["savedLoadout", getUnitLoadout _unit];
        removeBackpack _unit;
        _unit addBackpack "B_parachute";
        _loadout = true;
    };
    waitUntil {
        sleep 1;
        getPosATL _unit select 2 < 200;
    };

    _unit action ["openParachute", _unit];

    if (_loadout) then {
        waitUntil {
            sleep 1;
            isTouchingGround _unit;
        };
        
        removeBackpack _unit;
        _unit setUnitLoadout (_unit getVariable "savedLoadout");
    };
};

{ [_x] spawn _parachuteHandler; } forEach units _group;

_group;