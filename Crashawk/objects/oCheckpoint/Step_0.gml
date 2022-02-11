/// @description Insert description here
// You can write your code in this editor
if(global.lastCheckpointX == x && global.lastCheckpointY == y)
{
	sprite_index = sCheckpointActive;	
}
else
{
	sprite_index = sCheckpoint;	
	active = false;
}