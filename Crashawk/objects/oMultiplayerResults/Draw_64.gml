/// @description Display Results

numDrawn = 0;

// Slot 1
switch(global.p1skin)
{
	case 0:
		draw_sprite(sPlayerIdle,0,64,96);
		numDrawn++;
		break;
	case 1:
		draw_sprite(sPlayerIdleBlue,0,64,96);
		numDrawn++;
		break;
	case 2:
		draw_sprite(sPlayerIdleRed,0,64,96);
		numDrawn++;
		break;
	case 3:
		draw_sprite(sPlayerIdlePurple,0,64,96);
		numDrawn++;
		break;
}

switch(global.p2skin)
{
	case 0:
		draw_sprite(sPlayerIdle,0,64+((128/(numPlayers-1)) * numDrawn),96);
		numDrawn++;
		break;
	case 1:
		draw_sprite(sPlayerIdleBlue,0,64+((128/(numPlayers-1)) * numDrawn),96);
		numDrawn++;
		break;
	case 2:
		draw_sprite(sPlayerIdleRed,0,64+((128/(numPlayers-1)) * numDrawn),96);
		numDrawn++;
		break;
	case 3:
		draw_sprite(sPlayerIdlePurple,0,64+((128/(numPlayers-1)) * numDrawn),96);
		numDrawn++;
		break;
}

switch(global.p3skin)
{
	case 0:
		draw_sprite(sPlayerIdle,0,64+((128/(numPlayers-1)) * numDrawn),96);
		numDrawn++;
		break;
	case 1:
		draw_sprite(sPlayerIdleBlue,0,64+((128/(numPlayers-1)) * numDrawn),96);
		numDrawn++;
		break;
	case 2:
		draw_sprite(sPlayerIdleRed,0,64+((128/(numPlayers-1)) * numDrawn),96);
		numDrawn++;
		break;
	case 3:
		draw_sprite(sPlayerIdlePurple,0,64+((128/(numPlayers-1)) * numDrawn),96);
		numDrawn++;
		break;
}

switch(global.p4skin)
{
	case 0:
		draw_sprite(sPlayerIdle,0,64+((128/(numPlayers-1)) * numDrawn),96);
		numDrawn++;
		break;
	case 1:
		draw_sprite(sPlayerIdleBlue,0,64+((128/(numPlayers-1)) * numDrawn),96);
		numDrawn++;
		break;
	case 2:
		draw_sprite(sPlayerIdleRed,0,64+((128/(numPlayers-1)) * numDrawn),96);
		numDrawn++;
		break;
	case 3:
		draw_sprite(sPlayerIdlePurple,0,64+((128/(numPlayers-1)) * numDrawn),96);
		numDrawn++;
		break;
}