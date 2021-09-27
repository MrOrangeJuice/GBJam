/// @description Collect coin
audio_play_sound(snd_Coin,5,false);
global.coins++;
global.coinTextScale = 1.2;
with(other)
{
	instance_destroy();
}
