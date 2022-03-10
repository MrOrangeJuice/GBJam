/// @description Advance Scene

key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"));

if (key_jump)
{
	global.controller = 0;
}

// Gamepad input
if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(1,gp_face1)
|| gamepad_button_check_pressed(2,gp_face1) || gamepad_button_check_pressed(3,gp_face1)
|| gamepad_button_check_pressed(4,gp_face1) || gamepad_button_check_pressed(5,gp_face1) 
|| gamepad_button_check_pressed(6,gp_face1) || gamepad_button_check_pressed(7,gp_face1))
{
	key_jump = 1;
	global.controller = 1;
}


if(key_jump)
{
	audio_play_sound(snd_MenuSelect,5,false);
	SlideTransition(TRANS_MODE.GOTO,rCharSelect);
}