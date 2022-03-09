/// @description Check for new players

// Get incoming input
newInput = -1;

if(keyboard_check_pressed(ord("Z")))
{
	newInput = 8;
}

if(gamepad_button_check_pressed(0,gp_face1))
{
	newInput = 0;	
}

if(gamepad_button_check_pressed(1,gp_face1))
{
	newInput = 1;	
}

if(gamepad_button_check_pressed(2,gp_face1))
{
	newInput = 2;	
}

if(gamepad_button_check_pressed(3,gp_face1))
{
	newInput = 3;	
}

if(gamepad_button_check_pressed(4,gp_face1))
{
	newInput = 4;	
}

if(gamepad_button_check_pressed(5,gp_face1))
{
	newInput = 5;	
}

if(gamepad_button_check_pressed(6,gp_face1))
{
	newInput = 6;	
}

if(gamepad_button_check_pressed(7,gp_face1))
{
	newInput = 7;	
}

// Check if player is already joined
alreadyExists = false;
if(newInput != -1)
{
	for(i = 0; i < array_length(global.controllers); i++)
	{
		if(newInput == global.controllers[i]) alreadyExists = true;
	}
}

// Add new player
if(!alreadyExists && newInput != -1)
{
	// Find first open spot
	openSlot = 0;
	for(i = 0; i < array_length(global.controllers); i++)
	{
		if(global.controllers[i] == -1) 
		{
			openSlot = i;
			break;
		}
	}
	
	global.controllers[openSlot] = newInput;
	
	// Spawn game boy
	newGB = instance_create_layer(184 + (48 * openSlot),240,"Instances",oGameBoy);
	newGB.controller = newInput;
	newGB.player = openSlot;
}