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
}