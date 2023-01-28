/// @description Delay if colliding with player

if(image_index >= 5 && image_index <= 15 && place_meeting(x,y,oPlayer))
{
	image_speed = 0;	
}
else
{
	image_speed = 1;	
}