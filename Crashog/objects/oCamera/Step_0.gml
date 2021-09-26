/// @description Update camera
// Update destination
if (instance_exists(oPlayer))
{
	xTo = (follow.x + 16);
	yTo = follow.y;
}

// Update object position
x += (xTo - x) / 8;
y += (yTo - y) / 8;

// Keep camera center inside room
x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

// Screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

// Update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);