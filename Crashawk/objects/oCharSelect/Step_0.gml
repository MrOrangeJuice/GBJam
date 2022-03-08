/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1))
{
	SlideTransition(TRANS_MODE.GOTO,rMultiplayer);	
}