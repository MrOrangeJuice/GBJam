/// @description Display Results
draw_set_font(fUI);
draw_set_color($002704);
draw_set_halign(fa_center);
coinString = "Coins: " + string(global.coins);
timeString = "Time: " + string_format((global.time / room_speed), 0, 2);
rankString = "Rank: "
if(coinDisplay) draw_text(128,48,coinString);
if(timeDisplay) draw_text(128,64,timeString);
if(rankTextDisplay) draw_text(116,80,rankString);
if(rankDisplay)
{
	switch(rank)
	{
		case "c":
			draw_sprite(sRank,0,148,86);
			break;
		case "b":
			draw_sprite(sRank,1,148,86);
			break;
		case "a":
			draw_sprite(sRank,2,148,86);
			break;
		case "s":
			draw_sprite(sRank,3,148,86);
			break;
	}
}