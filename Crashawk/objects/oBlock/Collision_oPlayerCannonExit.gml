/// @description Destroy

audio_play_sound(snd_Block,5,false);
ScreenShake(1,5);
instance_create_layer(x,y,"Coins",oBlockFragment);
instance_create_layer(x,y,"Coins",oBlockFragment);
instance_create_layer(x,y,"Coins",oBlockFragment);
instance_create_layer(x,y,"Coins",oBlockFragment);

instance_destroy();