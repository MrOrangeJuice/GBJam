/// @description Move
event_inherited();

if(!vertical) 
{
	x += moveSpeed * dir;
}
else
{
	y += moveSpeed * dir;	
}

totalMoved += moveSpeed * dir;
// If out of range, switch direction
if(totalMoved >= range || totalMoved <= -range)
{
	dir *= -1;	
}