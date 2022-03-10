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
	key_left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
	key_right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);
	key_select = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"));
	key_back = keyboard_check_pressed(vk_lshift) || keyboard_check_pressed(ord("X"));
}
else
{
	// Gamepad input
	if ((gamepad_axis_value(controller,gp_axislh) < -0.2 && analogLeftPrev == false) || gamepad_button_check_pressed(controller,gp_padl))
	{
		key_left = 1;
		analogLeftPrev = true;
	}

	if ((gamepad_axis_value(controller,gp_axislh) > 0.2 && analogRightPrev == false) || gamepad_button_check_pressed(controller,gp_padr))
	{
		key_right = 1;
		analogRightPrev = true;
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

// Swap skin
if(!confirm)
{
	if(key_right)
	{
		global.skins[skin] = false;
		nextSkin = skin + 1;
		if(nextSkin > 3)
		{
			nextSkin = 0;	
		}
		if(global.skins[nextSkin] == true)
		{
			while(global.skins[nextSkin] == true)
			{
				nextSkin++;
				if(nextSkin > 3)
				{
					nextSkin = 0;	
				}
			}
		}
		skin = nextSkin;
		global.skins[skin] = true;
		audio_play_sound(snd_MenuMove,5,false);
	}

	if(key_left)
	{
		global.skins[skin] = false;
		nextSkin = skin - 1;
		if(nextSkin < 0)
		{
			nextSkin = 3;	
		}
		if(global.skins[nextSkin] == true)
		{
			while(global.skins[nextSkin] == true)
			{
				nextSkin--;
				if(nextSkin < 0)
				{
					nextSkin = 3;	
				}
			}
		}
		skin = nextSkin;
		global.skins[skin] = true;
		audio_play_sound(snd_MenuMove,5,false);
	}
}

// Display Skin
if(inPlace)
{
	playerCSS.color = skin;
}

if(key_select && !confirm && inPlace)
{
	playerCSS.confirmed = true;	
	confirm = true;
	switch(player)
	{
		case 0:
			global.p1skin = skin;
			break;
		case 1:
			global.p2skin = skin;
			break;
		case 2:
			global.p3skin = skin;
			break;
		case 3:
			global.p4skin = skin;
			break;
	}
	switch(skin)
	{
		case 0:
			sprite_index = sGameBoyGreen;
			break;
		case 1:
			sprite_index = sGameBoyBlue;
			break;
		case 2:
			sprite_index = sGameBoyRed;
			break;
		case 3:
			sprite_index = sGameBoyPurple;
			break;
	}
	audio_play_sound(snd_MenuSelect,5,false);
}

// Back Out
if(key_back && inPlace && !confirm)
{
	slow = 0.2;
	inPlace = false;
	doomed = true;
	instance_destroy(playerCSS);
	global.controllers[player] = -1;
	alarm[0] = room_speed;
	global.skins[skin] = false;
	audio_play_sound(snd_Collision,5,false);
}

if(key_back && inPlace && confirm)
{
	confirm = false;
	playerCSS.confirmed = false;
	sprite_index = sGameBoy;
	// Reset skin
	switch(player)
	{
		case 0:
			global.p1skin = -1;
			break;
		case 1:
			global.p2skin = -1;
			break;
		case 2:
			global.p3skin = -1;
			break;
		case 3:
			global.p4skin = -1;
			break;
	}
	audio_play_sound(snd_PauseOut,5,false);
}

// Record analog inputs for this frame
if(gamepad_axis_value(controller,gp_axislh) < -0.2)
{
	analogLeftPrev = true;	
}
else
{
	analogLeftPrev = false;	
}

if(gamepad_axis_value(controller,gp_axislh) > 0.2)
{
	analogRightPrev = true;	
}
else
{
	analogRightPrev = false;	
}