/// @description Init
audio_play_sound(snd_Death, 5, false);
ScreenShake(3,10);

switch(color)
{
	case 0:
		sprite_index = sPlayerDeath;
		break;
	case 1:
		sprite_index = sPlayerDeathBlue;
		break;
	case 2:
		sprite_index = sPlayerDeathRed;
		break;
	case 3:
		sprite_index = sPlayerDeathPurple;
		break;
}