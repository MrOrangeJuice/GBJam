/// @description Collect coin
audio_play_sound(snd_Coin,5,false);
global.coins++;
global.coinTextScale = 1.15;
with(other)
{
	instance_create_layer(x,y,"Coins",oCoinVFX);
	instance_destroy();
}
