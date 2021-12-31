/// @description Draw coin counter

// Set Text Properties
draw_set_font(fUI);
draw_set_color($002704);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

if(room != rTitle && room != rResults)
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
	draw_sprite(sCoin,0,216 + coinOffset,9);
	draw_text_transformed(254,4,"*" + string(global.coins), global.coinTextScale, global.coinTextScale,0);
}

// Draw Pause Menu
if(global.paused)
{
	draw_sprite(sPauseMenu,pauseOption,80,40);
}