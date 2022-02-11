/// @description Size variables and mode setup

w = 256;
h = 144;
h_half = h * 0.5;
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}
mode = TRANS_MODE.INTRO; 
percent = 1;
target = room;