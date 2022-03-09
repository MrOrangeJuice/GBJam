/// @description Dissapear if player has joined

playerJoined = false;
for(i = 0; i < array_length(global.controllers); i++)
{
	if(global.controllers[i] != -1) playerJoined = true;
}

if(playerJoined)
{
	visible = false;	
}
else
{
	visible = true;
}