/// @description Insert description here
// You can write your code in this editor
key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
key_jump = keyboard_check(vk_space) || keyboard_check(ord("Z"));
key_jump_released = keyboard_check_released(vk_space) || keyboard_check_released(ord("Z"));
key_dash = keyboard_check(vk_lshift) || keyboard_check(ord("X"));
key_dash_released = keyboard_check_released(vk_lshift) || keyboard_check_released(ord("X"));

if (key_left) || (key_right) || (key_jump) || (key_dash)
{
	controller = 0;
}

// Gamepad input
if (gamepad_axis_value(0,gp_axislh) < -0.2 || gamepad_button_check(0,gp_padl) || gamepad_axis_value(4,gp_axislh) < -0.2 || gamepad_button_check(4,gp_padl))
{
	key_left = 1;
	controller = 1;
}

if (gamepad_axis_value(0,gp_axislh) > 0.2 || gamepad_button_check(0,gp_padr) || gamepad_axis_value(4,gp_axislh) > 0.2 || gamepad_button_check(4,gp_padr))
{
	key_right = 1;
	controller = 1;
}

if (gamepad_axis_value(0,gp_axislv) > 0.4 || gamepad_button_check(0,gp_padd) || gamepad_axis_value(4,gp_axislv) > 0.4 || gamepad_button_check(4,gp_padd))
{
	key_down = 1;
	controller = 1;
}

if (gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1))
{
	key_jump = 1;
	controller = 1;
}

if (gamepad_button_check_released(0,gp_face1) || gamepad_button_check_released(4,gp_face1))
{
	key_jump_released = 1;
	controller = 1;
}

if (gamepad_button_check(0,gp_face3) || gamepad_button_check(0,gp_face2) || gamepad_button_check(4,gp_face3) || gamepad_button_check(4,gp_face2))
{
	key_dash = 1;
	controller = 1;
}

if (gamepad_button_check_released(0,gp_face3) || gamepad_button_check_released(0,gp_face2) || gamepad_button_check_released(4,gp_face3) || gamepad_button_check_released(4,gp_face2))
{
	key_dash_released = 1;
	controller = 1;
}

if(isDashing)
{
	// Charge up dash up to a half second
	if(key_dash && !dashInit)
	{
		if(dashtime <= maxdashtime)
		{
			dashtime += 0.01;	
		}
	}
	// If dash key is released, set can dash back to true for when you're out of the dash
	if(key_dash_released)
	{
		canDash = true;	
	}
	// If dash key is released or maximum charge is reached, start dash
	if((key_dash_released || dashtime = maxdashtime) && !dashInit)
	{
		dashInit = true;
		ydir = 1;
	}
	if(dashInit)
	{
		// Check wall collisions
		//x collision
		if(place_meeting(x + (hdashsp * xdir), y, oWall)){
			xdir *= -1;
		}

		//y collision
		if (place_meeting(x,y + (vdashsp * ydir),oWall)){
			ydir *= -1;
		}
		
		if(currentdashtime >= dashtime)
		{
			// End dash
			isDashing = false;
			dashInit = false;
			dashtime = 0.1;
			currentdashtime = 0;
			// If player is airborne, carry momentum
			if(!place_meeting(x, y + 1, oWall))
			{
				currentwalksp = hdashsp * xdir;
				vsp = vdashsp * ydir;
			}
		}
		else
		{
			x += hdashsp * image_xscale * xdir;
			y += vdashsp * ydir;
			currentdashtime += 0.01;
		}
		
	}
}
else
{
	// Build up speed depending on inputs
	if(key_left && !key_right)
	{
		currentwalksp -= 0.25;
		if(currentwalksp < -walksp)
		{
			currentwalksp += 0.5;
		}
	}
	if(key_right && !key_left)
	{
		currentwalksp += 0.25;
		if(currentwalksp > walksp)
		{
			currentwalksp -= 0.5;
		}
	}
	// Slow down if not moving
	if (!(key_left || key_right) || (key_left && key_right))
	{
		if(currentwalksp < 0)
		{
			currentwalksp += 0.25;
			// Round up
			if(currentwalksp > -0.05)
			{
				currentwalksp = 0;	
			}
		}
		if(currentwalksp > 0)
		{
			currentwalksp -= 0.25;
			// Round down
			if(currentwalksp < 0.05)
			{
				currentwalksp = 0;	
			}
		}
	}
	hsp = currentwalksp;
	vsp = vsp + grv;

	// If player doesn't release jump, they can't jump again
	if(key_jump_released)
	{
		canJump = true;
	}
	
	if(key_dash_released)
	{
		canDash = true;	
	}
	
	// Check dash
	if(key_dash && canDash && airborne)
	{
		isDashing = true;	
		canDash = false;
	}
	
	// Check if player is airborne
	if(!place_meeting(x, y + 1, oWall))
	{
		airborne = true;	
	}
	else
	{
		airborne = false;	
	}

	// Jump
	if(place_meeting(x, y + 1, oWall)) && (key_jump) && (canJump)
	{
		vsp = -4;
		canJump = false;
	}

	// Variable jump height
	if vsp < 0 && (!(key_jump)) //if you're moving upwards in the air but not holding down jump
	{
		vsp *= 0.85; //essentially, divide your vertical speed
	}

	//x collision
	if(place_meeting(x + hsp, y, oWall)){
		while(!place_meeting(x + sign(hsp), y, oWall)){
			x = x + sign(hsp);
		}
		hsp = 0;
	}

	x = x + hsp;

	//y collision
	if (place_meeting(x,y+vsp,oWall)){
		while (!place_meeting(x,y+sign(vsp),oWall)){
			y = y + sign(vsp);
		}
		vsp = 0;
	}

	y = y + vsp;
	
	// Determine direction
	if (hsp != 0) xdir = key_right - key_left;
	if (vsp != 0) ydir = sign(vsp);
}