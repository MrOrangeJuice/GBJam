/// @description Init

hsp = 0;
dir = 1;
xspeed = 0.2;

// Check who won

playerWon = -1;
if (global.p1lives > 0) playerWon = 0;
if (global.p2lives > 1) playerWon = 1;
if (global.p3lives > 2) playerWon = 2;
if (global.p4lives > 3) playerWon = 3;