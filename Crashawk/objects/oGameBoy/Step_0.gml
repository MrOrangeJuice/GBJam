/// @description Move

if(!inPlace)
{
	vsp += slow;
	y += vsp;
}

if(y <= 152 && !inPlace)
{
	vsp = 0;
	inPlace = true;
	audio_play_sound(snd_Bumper,5,false);
}