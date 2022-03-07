/// @description Init

hsp = 0;
dir = 1;
vsp = 0;
grv = 0.1;
xspeed = 0.2;
p1X = 0;
p2X = 0;
p3X = 0;
p4X = 0;
winnerX = 0;
numXTouched = 0;
falling = false;
recolor = false;

// Determine how many players there are
numPlayers = 0;
numDrawn = 0;

if (global.p1skin != -1) numPlayers++;
if (global.p2skin != -1) numPlayers++;
if (global.p3skin != -1) numPlayers++;
if (global.p4skin != -1) numPlayers++;

// Check who won
playerWon = -1;
if (global.p1lives > 0) playerWon = 0;
if (global.p2lives > 1) playerWon = 1;
if (global.p3lives > 2) playerWon = 2;
if (global.p4lives > 3) playerWon = 3;

// Calculate where winner is
if(global.p1skin != -1)
{
	p1X = 64+((128/(numPlayers-1)) * numDrawn);
	numDrawn++;
}
if(global.p2skin != -1)
{
	p2X = 64+((128/(numPlayers-1)) * numDrawn);
	numDrawn++;
}
if(global.p3skin != -1)
{
	p3X = 64+((128/(numPlayers-1)) * numDrawn);
	numDrawn++;
}
if(global.p4skin != -1)
{
	p4X = 64+((128/(numPlayers-1)) * numDrawn);
	numDrawn++;
}

switch(playerWon)
{
	case 0:
		winnerX = p1X;
		break;
	case 1:
		winnerX = p2X;
		break;
	case 2:
		winnerX = p3X;
		break;
	case 3:
		winnerX = p4X;
		break;
}

audio_play_sound(snd_DrumRoll,5,false);