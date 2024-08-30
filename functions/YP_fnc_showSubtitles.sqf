/**
	Plays radio sound with subtitles (default BIS subtitles)

	_title		=== STRING, name of speaker
	_subtitles 	=== STRING, subtitles / speach
	_sound		=== STRING, sound for radio entering: "beep", "in1", "in2", "in3", "in4", "noise1", "noise2", "noise3"
	_withNoise	=== BOOLEAN [DEFAULT false], play noise sounds after radio entering sound
	_soundOut	=== STRING [DEFAULT _sound] - sound to play after noise 

	RETURN: NOTHING
 */

params [
	"_title",
	"_subtitles",
	["_sound" "in1"], 
	["_withNoise", false],
	["_soundOut", "REPEAT"]
];

[_title, _subtitles] spawn BIS_fnc_showSubtitle;
playSound _sound;

if (_withNoise) then {
	if (_soundOut == "REPEAT") then {
		_soundOut = _sound;
	};
	sleep 1;
	playSound selectRandom ["noise1", "noise2", "noise3"];
	sleep 5;
	playSound _soundOut;
};
