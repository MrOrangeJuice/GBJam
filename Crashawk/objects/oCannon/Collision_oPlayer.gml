/// @description Collide with player

instance_destroy(oPlayer);
audio_play_sound(snd_CannonEnter,5,false);
sprite_index = sCannonEnter;
alarm[0] = room_speed * 1.2;
alarm[1] = room_speed * 2.5;
