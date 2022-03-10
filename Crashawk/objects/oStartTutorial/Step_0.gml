/// @description Check number of players
// Check for start
numPlayers = 0;

if (global.p1skin != -1) numPlayers++;
if (global.p2skin != -1) numPlayers++;
if (global.p3skin != -1) numPlayers++;
if (global.p4skin != -1) numPlayers++;

if(numPlayers > 1)
{
	visible = true	
}
else
{
	visible = false;	
}