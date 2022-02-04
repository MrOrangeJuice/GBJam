/// @description Insert description here
// You can write your code in this editor

// Set Random Direction
direction = random_range(0, 360);
speed = 1;

// Set gravity variables
vsp = 0;
grv = 0.25;

// Set despawn timer
alarm[0] = room_speed * 2;