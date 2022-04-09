/// @description Bounce

if(!global.paused)
{
	image_speed = 1;
}
else
{
	image_speed = 0;	
}

if(hit)
{
	sprite_index = sSlimeBlockHit;	
	image_index = 0;
	hit = false;
}
