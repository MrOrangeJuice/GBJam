/// @description Increment Timer

// Pause and Unpause

key_pause = keyboard_check_pressed(vk_escape);
key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
key_select = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_space);

if (key_up) || (key_down) ||  (key_select) || (key_pause)
{
	global.controller = 0;
}

if ((gamepad_axis_value(0,gp_axislv) < -0.4 && analogUpPrev == false) || gamepad_button_check_pressed(0,gp_padu) || (gamepad_axis_value(4,gp_axislv) < -0.4 && analogUpPrevD == false) || gamepad_button_check_pressed(4,gp_padu))
{
	key_up = 1;
	global.controller = 1;
	analogUpPrev = true;
}

if ((gamepad_axis_value(0,gp_axislv) > 0.4 && analogDownPrev == false) || gamepad_button_check_pressed(0,gp_padd) || gamepad_axis_value(4,gp_axislv) > 0.4 || (gamepad_button_check_pressed(4,gp_padd) && analogDownPrevD == false))
{
	key_down = 1;
	global.controller = 1;
	analogDownPrev = true;
}

if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_select = 1;
	global.controller = 1;
}

if(gamepad_button_check_pressed(0,gp_start) || gamepad_button_check_pressed(4,gp_start))
{
	key_pause = true;
	global.controller = 1;
}

if(key_pause)
{
	if(room != rTitle && room != rResults)
	{
		if(global.paused)
		{
			audio_play_sound(snd_PauseOut,5,false);
			// Reset pause menu
			pauseOption = 0;
			global.paused = false;	
		}
		else if(!global.paused)
		{
			audio_play_sound(snd_PauseIn,5,false);
			global.paused = true;	
		}
	}
}

if(room != rResults)
{
	global.time++;	
}