/// @description Fire Player

instance_create_layer(x,y,"Instances",oPlayerCannonExit);
audio_play_sound(snd_Cannon,5,false);
ScreenShake(2,10);