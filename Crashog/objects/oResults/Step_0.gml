/// @description Advance Scene

key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"));
key_dash = keyboard_check_pressed(vk_lshift) || keyboard_check_pressed(ord("X"));

if (key_jump) || (key_dash)
{
	global.controller = 0;
}

// Gamepad input
if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_jump = 1;
	global.controller = 1;
}

if (gamepad_button_check_pressed(0,gp_face3) || gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(4,gp_face3) || gamepad_button_check_pressed(4,gp_face2))
{
	key_dash = 1;
	global.controller = 1;
}

if(key_jump)
{
	audio_play_sound(snd_MenuSelect,5,false);
	SlideTransition(TRANS_MODE.RESTART);	
}
if(key_dash)
{
	audio_play_sound(snd_MenuSelect,5,false);
	url_open("https://discord.gg/eyBNQE28MY");	
}