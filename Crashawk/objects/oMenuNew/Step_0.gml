/// @description Switch menu items and display correct one
key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
key_select = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_space);

if (key_up) || (key_down) ||  (key_select)
{
	global.controller = 0;
}

if ((gamepad_axis_value(0,gp_axislv) < -0.4 && analogUpPrev == false) || gamepad_button_check_pressed(0,gp_padu) || (gamepad_axis_value(4,gp_axislv) < -0.4 && analogUpPrevD == false) || gamepad_button_check_pressed(4,gp_padu))
{
	key_up = 1;
	global.controller = 1;
	analogUpPrev = true;
}

if ((gamepad_axis_value(0,gp_axislv) > 0.4 && analogDownPrev == false) || gamepad_button_check_pressed(0,gp_padd) || (gamepad_axis_value(4,gp_axislv) > 0.4 && analogDownPrevD == false) || gamepad_button_check_pressed(4,gp_padd))
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

if(key_up)
{
	audio_play_sound(snd_MenuMove,5,false);
	currentItem--;
	if(currentItem <= -1)
	{
		currentItem = 3;	
	}
}

if(key_down)
{
	audio_play_sound(snd_MenuMove,5,false);
	currentItem++;
	if(currentItem >= 4)
	{
		currentItem = 0;	
	}
}

if(key_select)
{
	audio_play_sound(snd_MenuSelect,5,false);
	switch(currentItem)
	{
		case 0:
			SlideTransition(TRANS_MODE.NEXT);
			break;
		case 1:
			SlideTransition(TRANS_MODE.GOTO,rCharSelect);
			break;
		case 2:
			window_set_fullscreen(!window_get_fullscreen());
			break;
		case 3:
			game_end();
			break;
	}
}

if(keyboard_check_pressed(vk_ralt) || gamepad_button_check_pressed(0, gp_shoulderr))
{
	SlideTransition(TRANS_MODE.GOTO,rMultiplayerResults);	
}

image_index = currentItem;

// Record analog inputs for this frame

if(gamepad_axis_value(0,gp_axislv) < -0.4)
{
	analogUpPrev = true;	
}
else
{
	analogUpPrev = false;	
}

if(gamepad_axis_value(0,gp_axislv) > 0.4)
{
	analogDownPrev = true;	
}
else
{
	analogDownPrev = false;	
}

if(gamepad_axis_value(4,gp_axislv) < -0.4)
{
	analogUpPrevD = true;	
}
else
{
	analogUpPrevD = false;	
}

if(gamepad_axis_value(4,gp_axislv) > 0.4)
{
	analogDownPrevD = true;	
}
else
{
	analogDownPrevD = false;	
}