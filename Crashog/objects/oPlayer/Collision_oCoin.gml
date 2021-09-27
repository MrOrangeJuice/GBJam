/// @description Collect coin
audio_play_sound(snd_Coin,5,false);
global.coins++;
with(other)
{
	instance_destroy();
}
