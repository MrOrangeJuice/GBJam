/// @description Increment Timer

// Pause and Unpause

key_pause = keyboard_check_pressed(vk_escape);

if(key_pause)
{
	global.controller = 0;	
}

// Gamepad Input
if(gamepad_button_check_pressed(0,gp_start) || gamepad_button_check_pressed(4,gp_start))
{
	key_pause = true;
	global.controller = 1;
}

if(key_pause)
{
	if(global.paused)
	{
		audio_play_sound(snd_PauseOut,5,false);
		global.paused = false;	
	}
	else if(!global.paused)
	{
		audio_play_sound(snd_PauseIn,5,false);
		global.paused = true;	
	}
}

if(room != rResults)
{
	global.time++;	
}