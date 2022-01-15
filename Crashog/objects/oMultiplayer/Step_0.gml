/// @description Insert description here
// You can write your code in this editor

if(!global.paused)
{	
	// Play animations
	image_speed = 1;
	
	key_left = 0;
	key_right = 0;
	key_down = 0;
	key_jump = 0;
	key_jump_released = 0;
	key_dash = 0;
	key_dash_released = 0;
	
	if(controller == -1)
	{
		key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
		key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
		key_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
		key_jump = keyboard_check(vk_space) || keyboard_check(ord("Z"));
		key_jump_released = keyboard_check_released(vk_space) || keyboard_check_released(ord("Z"));
		key_dash = keyboard_check(vk_lshift) || keyboard_check(ord("X"));
		key_dash_released = keyboard_check_released(vk_lshift) || keyboard_check_released(ord("X"));
	}
	else
	{
		// Gamepad input
		if (gamepad_axis_value(controller,gp_axislh) < -0.2 || gamepad_button_check(controller,gp_padl))
		{
			key_left = 1;
		}

		if (gamepad_axis_value(controller,gp_axislh) > 0.2 || gamepad_button_check(controller,gp_padr))
		{
			key_right = 1;
		}

		if (gamepad_axis_value(controller,gp_axislv) > 0.4 || gamepad_button_check(controller,gp_padd))
		{
			key_down = 1;
		}

		if (gamepad_button_check(controller,gp_face1))
		{
			key_jump = 1;
		}

		if (gamepad_button_check_released(controller,gp_face1))
		{
			key_jump_released = 1;
		}

		if (gamepad_button_check(controller,gp_face3) || gamepad_button_check(controller,gp_face2))
		{
			key_dash = 1;
		}

		if (gamepad_button_check_released(controller,gp_face3) || gamepad_button_check_released(controller,gp_face2))
		{
			key_dash_released = 1;
		}
	}

	if(isDashing)
	{
		// If player doesn't release jump, they can't jump again once the dash ends
		if(key_jump_released)
		{
			canJump = true;
		}
		// Charge up dash up to a half second
		if(key_dash && !dashInit)
		{
			if(dashtime <= maxdashtime)
			{
				dashtime += 0.01;	
			}
			// Play charging sound effect
			if(dashtime == maxdashtime * 0.6)
			{
				audio_play_sound(snd_Charge,5,false);
			}
			// Display targeting arrow
			if(dashtime >= maxdashtime * 0.6)
			{
				if(xdir == 0)
				{
					xdir = image_xscale;	
				}
				if(xdir = 1)
				{
					if(instance_exists(oLeftArrow)) instance_destroy(oLeftArrow);
					if(!instance_exists(oRightArrow)) rightArrow = instance_create_layer(x+8,y+8,"Instances",oRightArrow);
					switch(player)
					{
						case 0:
							rightArrow.color = global.p1skin;
							break;
						case 1:
							rightArrow.color = global.p2skin;
							break;
					}
				}
				if(xdir = -1)
				{
					if(instance_exists(oRightArrow)) instance_destroy(oRightArrow);
					if(!instance_exists(oLeftArrow)) leftArrow = instance_create_layer(x-8,y+8,"Instances",oLeftArrow);
					switch(player)
					{
						case 0:
							leftArrow.color = global.p1skin;
							break;
						case 1:
							leftArrow.color = global.p2skin;
							break;
					}
				}	
			}
			// Allow player to change initial xdir
			if(key_left) xdir = -1;
			if(key_right) xdir = 1;
			switch(player)
			{
				case 0:
					switch(global.p1skin)
					{
						case 0:
							sprite_index = sPlayerBall;
							break;
						case 1:
							sprite_index = sPlayerBallBlue;
					}
					break;
				case 1:
					switch(global.p2skin)
					{
						case 0:
							sprite_index = sPlayerBall;
							break;
						case 1:
							sprite_index = sPlayerBallBlue;
					}
					break;
			}
		}
		// If dash key is released, set can dash back to true for when you're out of the dash
		if(key_dash_released)
		{
			canDash = true;	
		}
		// If dash key is released or maximum charge is reached, start dash
		if((key_dash_released || dashtime == maxdashtime) && !dashInit)
		{
			// Delete targeting arrows
			if(instance_exists(oRightArrow)) instance_destroy(oRightArrow);
			if(instance_exists(oLeftArrow)) instance_destroy(oLeftArrow);
			// Make dash only light or heavy
			if(dashtime != maxdashtime)
			{
				dashtime = 0.15;
			}
			dashInit = true;
			ydir = 1;
			if(xdir == 0)
			{
				xdir = image_xscale;	
			}
			audio_play_sound(snd_Dash,5,false);
		}
		if(dashInit)
		{
			// Check wall and bumper collisions
			//y collision
			if (place_meeting(x,y + (vdashsp * ydir),oWall)){
				ydir *= -1;
				audio_play_sound(snd_Collision,5,false);
				ScreenShake(1,5);
			}
			bumper = instance_place(x,y + (vdashsp * ydir),oBumper)
			if (bumper){
				ydir *= -1;
				bumper.hit = true;
				bumperHit = true;
				audio_play_sound(snd_Bumper,5,false);
				ScreenShake(1,5);
				currentdashtime = 0;
			}
		
			//x collision
			if(place_meeting(x + (hdashsp * xdir), y, oWall)){
				xdir *= -1;
				audio_play_sound(snd_Collision,5,false);
				ScreenShake(1,5);
			}
			bumper = instance_place(x + (hdashsp * xdir), y, oBumper);
			if(bumper && !bumperHit) {
				xdir *= -1;
				bumper.hit = true;
				audio_play_sound(snd_Bumper,5,false);
				ScreenShake(1,5);
				currentdashtime = 0;
			}
		
			// Animation
			switch(player)
			{
				case 0:
					switch(global.p1skin)
					{
						case 0:
							sprite_index = sPlayerDash;
							break;
						case 1:
							sprite_index = sPlayerDashBlue;
					}
					break;
				case 1:
					switch(global.p2skin)
					{
						case 0:
							sprite_index = sPlayerDash;
							break;
						case 1:
							sprite_index = sPlayerDashBlue;
					}
					break;
			}
			image_xscale = xdir;
			image_yscale = ydir;
		
			// Reset bumper hit
			bumperHit = false;
		
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
				x += hdashsp * xdir;
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
			if(currentwalksp < (-walksp - 0.5))
			{
				currentwalksp += 0.5;
			}
			else if(currentwalksp < -walksp)
			{
				currentwalksp += 0.25;
			}
		}
		if(key_right && !key_left)
		{
			currentwalksp += 0.25;
			if(currentwalksp > (walksp + 0.5))
			{
				currentwalksp -= 0.5;
			}
			else if(currentwalksp > walksp)
			{
				currentwalksp -= 0.25;
			}
		}
		// Slow down if not moving
		if (!(key_left || key_right) || (key_left && key_right))
		{
			if(currentwalksp < 0)
			{
				currentwalksp += 0.25;
			}
			if(currentwalksp > 0)
			{
				currentwalksp -= 0.25;
			}
		}
	
		// Clamp vsp
		if(vsp >= vdashsp)
		{
			vsp = vdashsp;
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
		if(key_dash && canDash && airborne && !place_meeting(x,y,oBumper))
		{
			isDashing = true;	
			canDash = false;
		}
	
		// Decrement jump buffer
		jumpBuffer--;
	
		// Check if player is airborne
		if(!place_meeting(x, y + 1, oWall))
		{
			airborne = true;	
		}
		else
		{
			airborne = false;	
			jumpBuffer = 5;
		}

		// Jump
		if((key_jump) && (canJump) && (jumpBuffer > 0))
		{
			vsp = -3;
			canJump = false;
			audio_play_sound(snd_Jump,5,false);
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
			currentwalksp = 0;
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
	
		// Animation
		if (hsp != 0) image_xscale = sign(hsp);
		image_yscale = 1;
		if(airborne)
		{
			switch(player)
			{
				case 0:
					switch(global.p1skin)
					{
						case 0:
							if (vsp <= 0) sprite_index = sPlayerJumpUp;
							if (vsp > 0) sprite_index = sPlayerJumpDown;
							break;
						case 1:
							if (vsp <= 0) sprite_index = sPlayerJumpUpBlue;
							if (vsp > 0) sprite_index = sPlayerJumpDownBlue;
							break;
					}
					break;
				case 1:
					switch(global.p2skin)
					{
						case 0:
							if (vsp <= 0) sprite_index = sPlayerJumpUp;
							if (vsp > 0) sprite_index = sPlayerJumpDown;
							break;
						case 1:
							if (vsp <= 0) sprite_index = sPlayerJumpUpBlue;
							if (vsp > 0) sprite_index = sPlayerJumpDownBlue;
							break;
					}
					break;
			}
		}
		else
		{
			switch(player)
			{
				case 0:
					switch(global.p1skin)
					{
						case 0:
							if (hsp != 0)
							{
								sprite_index = sPlayerRun;
							}
							else
							{
								sprite_index = sPlayerIdle;
							}
							break;
						case 1:
							if (hsp != 0)
							{
								sprite_index = sPlayerRunBlue;
							}
							else
							{
								sprite_index = sPlayerIdleBlue;
							}
							break;
					}
					break;
				case 1:
					switch(global.p2skin)
					{
						case 0:
							if (hsp != 0)
							{
								sprite_index = sPlayerRun;
							}
							else
							{
								sprite_index = sPlayerIdle;
							}
							break;
						case 1:
							if (hsp != 0)
							{
								sprite_index = sPlayerRunBlue;
							}
							else
							{
								sprite_index = sPlayerIdleBlue;
							}
							break;
					}
					break;
			}
		}
	}
}
else
{
	image_speed = 0;	
}