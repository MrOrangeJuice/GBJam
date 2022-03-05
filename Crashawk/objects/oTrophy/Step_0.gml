/// @description Move

hsp += dir * xspeed;
x += hsp;

// Turn around
if(x > 128 && dir == 1)
{
	dir = -1;	
}

if(x < 128 && dir == -1)
{
	dir = 1;	
}