/// @description Display Rank

// Determine rank

if(global.coins >= 565 && (global.time / room_speed) <= 90)
{
	audio_play_sound(snd_RankS,5,false);
	rank = "s";	
}
else if(global.coins >= 500 && (global.time / room_speed) <= 240)
{
	audio_play_sound(snd_RankA,5,false);
	rank = "a";	
}
else if(global.coins >= 400 && (global.time / room_speed) <= 360)
{
	audio_play_sound(snd_RankB,5,false);
	rank = "b";	
}
else
{
	audio_play_sound(snd_RankC,5,false);
	rank = "c";	
}

rankDisplay = true;