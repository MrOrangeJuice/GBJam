/// @description Collide with player

if(other.isHeavyDashing)
{
	if(!isHeavyDashing)
	{
		death = instance_create_layer(x,y,"Instances",oMultiPlayerDeath);	
		switch(player)
		{
			case 0:
				death.color = global.p1skin;
				break;
			case 1:
				death.color = global.p2skin;
				break;
			case 2:
				death.color = global.p3skin;
				break;
			case 3:
				death.color = global.p4skin;
				break;
		}
		newPlayer = instance_create_layer(initX,initY,"Instances",oMultiplayer);
		newPlayer.player = player;
		newPlayer.controller = controller;
		instance_destroy();
	}
}
else if(other.isDashing)
{
	if(!isDashing)
	{
		death = instance_create_layer(x,y,"Instances",oMultiPlayerDeath);	
		switch(player)
		{
			case 0:
				death.color = global.p1skin;
				break;
			case 1:
				death.color = global.p2skin;
				break;
			case 2:
				death.color = global.p3skin;
				break;
			case 3:
				death.color = global.p4skin;
				break;
		}
		newPlayer = instance_create_layer(initX,initY,"Instances",oMultiplayer);
		newPlayer.player = player;
		newPlayer.controller = controller;
		instance_destroy();
	}
}
