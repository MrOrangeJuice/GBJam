/// @description Insert description here
// You can write your code in this editor
if(instance_exists(oPlayer))
{
	global.lastCheckpointX = oPlayer.x;
	global.lastCheckpointY = oPlayer.y;
}

if(room == rCharSelect)
{
	// Reset multiplayer
	global.p1skin = -1;
	global.p2skin = -1;
	global.p3skin = -1;
	global.p4skin = -1;

	global.p1lives = 0;
	global.p2lives = 0;
	global.p3lives = 0;
	global.p4lives = 0;

	global.skins = [false,false,false,false];

	global.controllers = [-1,-1,-1,-1];
}

if(room == rTitle)
{
	// Reset pause menu
	pauseOption = 0;
	global.paused = false;
	global.time = 0;
	global.coins = 0;
	// Reset multiplayer
	global.p1skin = -1;
	global.p2skin = -1;
	global.p3skin = -1;
	global.p4skin = -1;

	global.p1lives = 0;
	global.p2lives = 0;
	global.p3lives = 0;
	global.p4lives = 0;

	global.skins = [false,false,false,false];

	global.controllers = [-1,-1,-1,-1];
}

if(room != rTitle && room != rResults && room != rMultiplayer)
{
	alarm[0] = room_speed * 1;
	alarm[1] = room_speed * 4;
}

// Music
audio_stop_sound(msc_CharSelect);
audio_stop_sound(msc_Level1);
audio_stop_sound(msc_Level2);
audio_stop_sound(msc_Title);
audio_stop_sound(msc_Multiplayer);

if(room == rTitle)
{
	audio_play_sound(msc_Title,5,true);
}
if(room == rMultiplayer)
{
	audio_play_sound(msc_Multiplayer,5,true);	
}
if(room == rCharSelect)
{
	audio_play_sound(msc_CharSelect,5,true);	
	audio_stop_sound(snd_DrumRoll);
}
