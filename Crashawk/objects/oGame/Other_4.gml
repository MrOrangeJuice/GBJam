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