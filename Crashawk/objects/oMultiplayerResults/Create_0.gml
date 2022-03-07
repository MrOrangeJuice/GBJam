/// @description Set alarms

// Set up GUI
display_set_gui_size(256,144);
draw_set_font(fUI);
draw_set_color($002704);
draw_set_halign(fa_left);

// Determine how many players there are

numPlayers = 0;
numDrawn = 0;

if (global.p1skin != -1) numPlayers++;
if (global.p2skin != -1) numPlayers++;
if (global.p3skin != -1) numPlayers++;
if (global.p4skin != -1) numPlayers++;