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
		}
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
		}
		instance_destroy();
	}
}
