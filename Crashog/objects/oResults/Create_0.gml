/// @description Set alarms

alarm[0] = room_speed * 0.5;
alarm[1] = room_speed;
alarm[2] = room_speed * 1.5;
alarm[3] = room_speed * 2;

coinDisplay = false;
timeDisplay = false;
rankTextDisplay = false;
rankDisplay = false;

rank = "c";

// Set up GUI
display_set_gui_size(160,144);
draw_set_font(fUI);
draw_set_color($002704);
draw_set_halign(fa_left);