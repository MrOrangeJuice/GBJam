/// @description Insert description here
// You can write your code in this editor
if(instance_exists(oPlayer))
{
	global.lastCheckpointX = oPlayer.x;
	global.lastCheckpointY = oPlayer.y;
}

if(room == rTitle)
{
	// Reset pause menu
	pauseOption = 0;
	global.paused = false;
	global.time = 0;
	global.coins = 0;
	// Reset multiplayer
	global.p1lives = 10;
	global.p2lives = 10;
	global.p3lives = 10;
	global.p4lives = 10;
}

if(room != rTitle && room != rResults && room != rMultiplayer)
{
	alarm[0] = room_speed * 1;
	alarm[1] = room_speed * 4;
}