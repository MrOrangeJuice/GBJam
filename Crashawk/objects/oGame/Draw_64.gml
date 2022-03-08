/// @description Draw coin counter

// Set Text Properties
draw_set_font(fUI);
draw_set_color($002704);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

if(room != rTitle && room != rResults && room != rMultiplayer && room != rMultiplayerResults && room != rCharSelect)
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

if(levelSplash)
{
	if(splashOffset != 0)
	{
		splashOffset -= 3;
	}
}
else
{
	if(splashOffset != 48)
	{
		splashOffset += 3;	
	}
}

if(room == rLevel1)
{
	draw_sprite(sLevelSplash1,0,display_get_gui_width()/2,24 - splashOffset);
}
if(room == rLevel2)
{
	draw_sprite(sLevelSplash2,0,display_get_gui_width()/2,24 - splashOffset);
}

if(room == rMultiplayer)
{
	// Player 1 HUD
	switch(global.p1skin)
	{
		case 0:
			textOffset = 0;
			if (global.p1lives < 10)
			{
				textOffset = 4;	
			}
			global.p1TextScale = max(global.p1TextScale * .95, 1);
			draw_set_color($002704);
			draw_sprite(sGreenHUD,0,32,136);
			draw_sprite(sPortrait,0,18,136);
			draw_sprite(sHeart,0,30+textOffset,136);
			draw_text_transformed(52-textOffset,131,string(global.p1lives),global.p1TextScale,global.p1TextScale,0);
			break;
		case 1:
			textOffset = 0;
			if (global.p1lives < 10)
			{
				textOffset = 4;	
			}
			global.p1TextScale = max(global.p1TextScale * .95, 1);
			draw_set_color($331800);
			draw_sprite(sBlueHUD,0,32,136);
			draw_sprite(sPortraitBlue,0,18,136);
			draw_sprite(sHeartBlue,0,30+textOffset,136);
			draw_text_transformed(52-textOffset,131,string(global.p1lives),global.p1TextScale,global.p1TextScale,0);
			break;
		case 2:
			textOffset = 0;
			if (global.p1lives < 10)
			{
				textOffset = 4;	
			}
			global.p1TextScale = max(global.p1TextScale * .95, 1);
			draw_set_color($00002B);
			draw_sprite(sRedHUD,0,32,136);
			draw_sprite(sPortraitRed,0,18,136);
			draw_sprite(sHeartRed,0,30+textOffset,136);
			draw_text_transformed(52-textOffset,131,string(global.p1lives),global.p1TextScale,global.p1TextScale,0);
			break;
		case 3:
			textOffset = 0;
			if (global.p1lives < 10)
			{
				textOffset = 4;	
			}
			global.p1TextScale = max(global.p1TextScale * .95, 1);
			draw_set_color($2C142D);
			draw_sprite(sPurpleHUD,0,32,136);
			draw_sprite(sPortraitPurple,0,18,136);
			draw_sprite(sHeartPurple,0,30+textOffset,136);
			draw_text_transformed(52-textOffset,131,string(global.p1lives),global.p1TextScale,global.p1TextScale,0);
			break;
	}
	
	// Player 2 HUD
	switch(global.p2skin)
	{
		case 0:
			textOffset = 0;
			if (global.p2lives < 10)
			{
				textOffset = 4;	
			}
			global.p2TextScale = max(global.p2TextScale * .95, 1);
			draw_set_color($002704);
			draw_sprite(sGreenHUD,0,96,136);
			draw_sprite(sPortrait,0,82,136);
			draw_sprite(sHeart,0,94+textOffset,136);
			draw_text_transformed(116-textOffset,131,string(global.p2lives),global.p2TextScale,global.p2TextScale,0);
			break;
		case 1:
			textOffset = 0;
			if (global.p2lives < 10)
			{
				textOffset = 4;	
			}
			global.p2TextScale = max(global.p2TextScale * .95, 1);
			draw_set_color($331800);
			draw_sprite(sBlueHUD,0,96,136);
			draw_sprite(sPortraitBlue,0,82,136);
			draw_sprite(sHeartBlue,0,94+textOffset,136);
			draw_text_transformed(116-textOffset,131,string(global.p2lives),global.p2TextScale,global.p2TextScale,0);
			break;
		case 2:
			textOffset = 0;
			if (global.p2lives < 10)
			{
				textOffset = 4;	
			}
			global.p2TextScale = max(global.p2TextScale * .95, 1);
			draw_set_color($00002B);
			draw_sprite(sRedHUD,0,96,136);
			draw_sprite(sPortraitRed,0,82,136);
			draw_sprite(sHeartRed,0,94+textOffset,136);
			draw_text_transformed(116-textOffset,131,string(global.p2lives),global.p2TextScale,global.p2TextScale,0);
			break;
		case 3:
			textOffset = 0;
			if (global.p2lives < 10)
			{
				textOffset = 4;	
			}
			global.p2TextScale = max(global.p2TextScale * .95, 1);
			draw_set_color($2C142D);
			draw_sprite(sPurpleHUD,0,96,136);
			draw_sprite(sPortraitPurple,0,82,136);
			draw_sprite(sHeartPurple,0,94+textOffset,136);
			draw_text_transformed(116-textOffset,131,string(global.p2lives),global.p2TextScale,global.p2TextScale,0);
			break;
	}
	
	// Player 3 HUD
	switch(global.p3skin)
	{
		case 0:
			textOffset = 0;
			if (global.p3lives < 10)
			{
				textOffset = 4;	
			}
			global.p3TextScale = max(global.p3TextScale * .95, 1);
			draw_set_color($002704);
			draw_sprite(sGreenHUD,0,160,136);
			draw_sprite(sPortrait,0,146,136);
			draw_sprite(sHeart,0,158+textOffset,136);
			draw_text_transformed(180-textOffset,131,string(global.p3lives),global.p3TextScale,global.p3TextScale,0);
			break;
		case 1:
			textOffset = 0;
			if (global.p3lives < 10)
			{
				textOffset = 4;	
			}
			global.p3TextScale = max(global.p3TextScale * .95, 1);
			draw_set_color($331800);
			draw_sprite(sBlueHUD,0,160,136);
			draw_sprite(sPortraitBlue,0,146,136);
			draw_sprite(sHeartBlue,0,158+textOffset,136);
			draw_text_transformed(180-textOffset,131,string(global.p3lives),global.p3TextScale,global.p3TextScale,0);
			break;
		case 2:
			textOffset = 0;
			if (global.p3lives < 10)
			{
				textOffset = 4;	
			}
			global.p3TextScale = max(global.p3TextScale * .95, 1);
			draw_set_color($00002B);
			draw_sprite(sRedHUD,0,160,136);
			draw_sprite(sPortraitRed,0,146,136);
			draw_sprite(sHeartRed,0,158+textOffset,136);
			draw_text_transformed(180-textOffset,131,string(global.p3lives),global.p3TextScale,global.p3TextScale,0);
			break;
		case 3:
			textOffset = 0;
			if (global.p3lives < 10)
			{
				textOffset = 4;	
			}
			global.p3TextScale = max(global.p3TextScale * .95, 1);
			draw_set_color($2C142D);
			draw_sprite(sPurpleHUD,0,160,136);
			draw_sprite(sPortraitPurple,0,146,136);
			draw_sprite(sHeartPurple,0,158+textOffset,136);
			draw_text_transformed(180-textOffset,131,string(global.p3lives),global.p3TextScale,global.p3TextScale,0);
			break;
	}
	
	// Player 4 HUD
	switch(global.p4skin)
	{
		case 0:
			textOffset = 0;
			if (global.p4lives < 10)
			{
				textOffset = 4;	
			}
			global.p4TextScale = max(global.p4TextScale * .95, 1);
			draw_set_color($002704);
			draw_sprite(sGreenHUD,0,224,136);
			draw_sprite(sPortrait,0,210,136);
			draw_sprite(sHeart,0,222+textOffset,136);
			draw_text_transformed(244-textOffset,131,string(global.p4lives),global.p4TextScale,global.p4TextScale,0);
			break;
		case 1:
			textOffset = 0;
			if (global.p4lives < 10)
			{
				textOffset = 4;	
			}
			global.p4TextScale = max(global.p4TextScale * .95, 1);
			draw_set_color($331800);
			draw_sprite(sBlueHUD,0,224,136);
			draw_sprite(sPortraitBlue,0,210,136);
			draw_sprite(sHeartBlue,0,222+textOffset,136);
			draw_text_transformed(244-textOffset,131,string(global.p4lives),global.p4TextScale,global.p4TextScale,0);
			break;
		case 2:
			textOffset = 0;
			if (global.p4lives < 10)
			{
				textOffset = 4;	
			}
			global.p4TextScale = max(global.p4TextScale * .95, 1);
			draw_set_color($00002B);
			draw_sprite(sRedHUD,0,224,136);
			draw_sprite(sPortraitRed,0,210,136);
			draw_sprite(sHeartRed,0,222+textOffset,136);
			draw_text_transformed(244-textOffset,131,string(global.p4lives),global.p4TextScale,global.p4TextScale,0);
			break;
		case 3:
			textOffset = 0;
			if (global.p4lives < 10)
			{
				textOffset = 4;	
			}
			global.p4TextScale = max(global.p4TextScale * .95, 1);
			draw_set_color($2C142D);
			draw_sprite(sPurpleHUD,0,224,136);
			draw_sprite(sPortraitPurple,0,210,136);
			draw_sprite(sHeartPurple,0,222+textOffset,136);
			draw_text_transformed(244-textOffset,131,string(global.p4lives),global.p4TextScale,global.p4TextScale,0);
			break;
	}
}


// Draw Pause Menu
if(global.paused)
{
	if(room != rMultiplayer)
	{
		draw_sprite(sPauseMenu,pauseOption,80,40);
	}
	else
	{
		draw_sprite(sPauseMenuGray,pauseOption,80,40);
	}
}