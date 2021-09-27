/// @description Draw coin counter
if(room != rTitle)
{
	coinOffset = 0;
	// Draw Coin Count
	if(global.coins < 10)
	{
		coinOffset = 16;	
	}
	else if(global.coins < 100)
	{
		coinOffset = 8;	
	}
	else if(global.coins < 1000)
	{
		coinOffset = 0;	
	}
	else
	{
		coinOffset = -8;	
	}
	global.coinTextScale = max(global.coinTextScale * .95, 1);
	//draw_sprite(sCoin,0,124 + coinOffset,8);
	//draw_text_transformed(132,8,"*" + string(global.coins), global.coinTextScale, global.coinTextScale,0);
}