/// @description Switch menu items and display correct one
key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
key_select = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_space);

if (key_up) || (key_down) ||  (key_select)
{
	controller = 0;
}

if ((gamepad_axis_value(0,gp_axislv) < -0.4 && !analogUpPrev) || gamepad_button_check_pressed(0,gp_padu) || gamepad_axis_value(4,gp_axislv) < -0.4 || gamepad_button_check_pressed(4,gp_padu))
{
	key_up = 1;
	controller = 1;
}

if ((gamepad_axis_value(0,gp_axislv) > 0.4 && !analogDownPrev) || gamepad_button_check_pressed(0,gp_padd) || gamepad_axis_value(4,gp_axislv) > 0.4 || gamepad_button_check_pressed(4,gp_padd))
{
	key_down = 1;
	controller = 1;
}

if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_select = 1;
	controller = 1;
}

if(key_up)
{
	audio_play_sound(snd_MenuMove,5,false);
	currentItem--;
	if(currentItem <= -1)
	{
		currentItem = 2;	
	}
}

if(key_down)
{
	audio_play_sound(snd_MenuMove,5,false);
	currentItem++;
	if(currentItem >= 3)
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
			window_set_fullscreen(!window_get_fullscreen());
			break;
		case 2:
			game_end();
			break;
	}
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