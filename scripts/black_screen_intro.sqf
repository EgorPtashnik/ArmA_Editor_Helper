5 fadeSound 0;
enableRadio false;
phase_3_player enableSimulation true;
phase_3_player hideObject false;
phase_3_apc enableSimulation true;
phase_3_apc hideObject false;
cutText ["", "BLACK OUT", 5];
sleep 5;
cutText ["", "BLACK IN", 7];
5 fadeSound 1;
enableRadio true;
sleep 3;

/*
enableRadio false;
0 fadeSound 0;
cutText ["", "BLACK FADED", 999];
0.1 fadeSound 0;
sleep 3;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 3;
cutText ["", "BLACK IN", 7];
10 fadeSound 1;
["о. Малден", "Подъезд к посту ВС РФ"] spawn BIS_fnc_infoText;
enableRadio true;

*/


/* 
titleCut ["", "BLACK FADED", 999];
[] Spawn {

titleText ["This line here should take you about five seconds to read.","PLAIN DOWN"]; 
titleFadeOut 7;
sleep 5;

titleText ["This line should take five seconds as well, if you read slowly.","PLAIN"];
titleFadeOut 7;
sleep 5;

titleText ["This line however is important.  It should take you ten seconds to read it.  That's how much time you have to read this line completely.","PLAIN DOWN"];
titleFadeOut 12;
sleep 10;

titleText ["You don't have as much time with this line, but it is still quite lengthy and ever so informative.","PLAIN"];
titleFadeOut 9;
sleep 7;

titleText ["But this line.\n\nThis line will make you pause.  This line will give you time to...\n\nthink.","PLAIN"];
titleFadeOut 12;
sleep 10;

// Info text
[str ("Not so far away..."), str("Not so long ago..."), str(date select 1) + "." + str(date select 2) + "." + str(date select 0)] spawn BIS_fnc_infoText;

sleep 3;
"dynamicBlur" ppEffectEnable true;   
"dynamicBlur" ppEffectAdjust [6];   
"dynamicBlur" ppEffectCommit 0;     
"dynamicBlur" ppEffectAdjust [0.0];  
"dynamicBlur" ppEffectCommit 5;  

titleCut ["", "BLACK IN", 5];
};
*/