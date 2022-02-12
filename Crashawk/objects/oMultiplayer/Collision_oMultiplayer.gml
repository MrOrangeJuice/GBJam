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
				global.p1lives--;
				global.p1TextScale = 1.3;
				if(global.p1lives <= 0) newPlayerSpawn = false; 
				break;
			case 1:
				death.color = global.p2skin;
				global.p2lives--;
				global.p2TextScale = 1.3;
				if(global.p2lives <= 0) newPlayerSpawn = false;
				break;
			case 2:
				death.color = global.p3skin;
				global.p3lives--;
				global.p3TextScale = 1.3;
				if(global.p3lives <= 0) newPlayerSpawn = false;
				break;
			case 3:
				death.color = global.p4skin;
				global.p4lives--;
				global.p4TextScale = 1.3;
				if(global.p4lives <= 0) newPlayerSpawn = false;
				break;
		}
		newPlayer = instance_create_layer(256,96,"Instances",oMultiplayer);
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
		newPlayerSpawn = true;
		switch(player)
		{
			case 0:
				death.color = global.p1skin;
				global.p1lives--;
				global.p1TextScale = 1.3;
				if(global.p1lives <= 0) newPlayerSpawn = false; 
				break;
			case 1:
				death.color = global.p2skin;
				global.p2lives--;
				global.p2TextScale = 1.3;
				if(global.p2lives <= 0) newPlayerSpawn = false;
				break;
			case 2:
				death.color = global.p3skin;
				global.p3lives--;
				global.p3TextScale = 1.3;
				if(global.p3lives <= 0) newPlayerSpawn = false;
				break;
			case 3:
				death.color = global.p4skin;
				global.p4lives--;
				global.p4TextScale = 1.3;
				if(global.p4lives <= 0) newPlayerSpawn = false;
				break;
		}
		if(newPlayerSpawn)
		{
			newPlayer = instance_create_layer(256,96,"Instances",oMultiplayer);
			newPlayer.player = player;
			newPlayer.controller = controller;
		}
		instance_destroy();
	}
}
