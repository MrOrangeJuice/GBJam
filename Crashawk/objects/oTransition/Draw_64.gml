/// @description Draw Black Bars

if (mode != TRANS_MODE.OFF)
{
	if(room != rMultiplayer && room != rMultiplayerResults && room != rCharSelect)
	{
		draw_set_color($002704);
		draw_rectangle(0,0,w,percent*h_half,false);
		draw_rectangle(0,h,w,h-(percent*h_half),false);
	}
	else
	{
		draw_set_color($0F1B0F);
		draw_rectangle(0,0,w,percent*h_half,false);
		draw_rectangle(0,h,w,h-(percent*h_half),false);
	}
}