/// @description Move

hsp += dir * xspeed;
if(sign(hsp) == 1)
{
	if(winnerX > x && winnerX < x + hsp)
	{
		numXTouched++;
	}
}
if(sign(hsp) == -1)
{
	if(winnerX < x && winnerX > x + hsp)
	{
		numXTouched++;
	}
}
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

// Drop down
if(numXTouched == 4)
{
	xspeed = 0;
	hsp = 0;
	vsp = -3;
	falling = true;
	recolor = true;
	numXTouched = 0;
	audio_stop_sound(snd_DrumRoll);
	audio_play_sound(snd_Trophy,5,false);
}

if(falling)
{
	vsp += grv;
	y += vsp;
	if(y > 80) 
	{
		falling = false;
		audio_play_sound(snd_Win,5,false);
		instance_create_layer(128,128,"Tutorials",oContinueTutorialGray);
	}
}

// Recolor
if(recolor)
{
	switch(playerWon)
	{
		case 0:
			switch(global.p1skin)
			{
				case 0:
					sprite_index = sTrophy;
					break;
				case 1:
					sprite_index = sTrophyBlue;
					break;
				case 2:
					sprite_index = sTrophyRed;
					break;
				case 3:
					sprite_index = sTrophyPurple;
					break;
			}
			break;
		case 1:
			switch(global.p2skin)
			{
				case 0:
					sprite_index = sTrophy;
					break;
				case 1:
					sprite_index = sTrophyBlue;
					break;
				case 2:
					sprite_index = sTrophyRed;
					break;
				case 3:
					sprite_index = sTrophyPurple;
					break;
			}
			break;
		case 2:
			switch(global.p3skin)
			{
				case 0:
					sprite_index = sTrophy;
					break;
				case 1:
					sprite_index = sTrophyBlue;
					break;
				case 2:
					sprite_index = sTrophyRed;
					break;
				case 3:
					sprite_index = sTrophyPurple;
					break;
			}
			break;
		case 3:
			switch(global.p4skin)
			{
				case 0:
					sprite_index = sTrophy;
					break;
				case 1:
					sprite_index = sTrophyBlue;
					break;
				case 2:
					sprite_index = sTrophyRed;
					break;
				case 3:
					sprite_index = sTrophyPurple;
					break;
			}
			break;
	}
}