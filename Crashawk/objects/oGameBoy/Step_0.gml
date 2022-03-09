/// @description Move

if(!inPlace)
{
	vsp += slow;
	y += vsp;
}

if(y <= 152 && !inPlace && !doomed)
{
	vsp = 0;
	inPlace = true;
	audio_play_sound(snd_Bumper,5,false);
	
	// Create Player CSS
	playerCSS = instance_create_layer(x,y+20,"Console",oCSSPlayer);
}

// Input
key_left = 0;
key_right = 0;
key_select = 0;
key_back = 0;
	
if(controller == 8)
{
	key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	key_select = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"));
	key_back = keyboard_check_pressed(vk_lshift) || keyboard_check_pressed(ord("X"));
}
else
{
	// Gamepad input
	if (gamepad_axis_value(controller,gp_axislh) < -0.2 || gamepad_button_check(controller,gp_padl))
	{
		key_left = 1;
	}

	if (gamepad_axis_value(controller,gp_axislh) > 0.2 || gamepad_button_check(controller,gp_padr))
	{
		key_right = 1;
	}

	if (gamepad_button_check_pressed(controller,gp_face1))
	{
		key_select = 1;
	}

	if (gamepad_button_check_pressed(controller,gp_face3) || gamepad_button_check_pressed(controller,gp_face2))
	{
		key_back = 1;
	}
}

// Back Out
if(key_back && inPlace)
{
	slow = 0.2;
	inPlace = false;
	doomed = true;
	instance_destroy(playerCSS);
	global.controllers[player] = -1;
	alarm[0] = room_speed;
}