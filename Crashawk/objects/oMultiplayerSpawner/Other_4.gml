/// @description Spawn Players

if(global.p1skin != -1)
{
	p1 = instance_create_layer(256,96,"Instances",oMultiplayer);	
	p1.player = 0;
	p1.controller = global.controllers[0];
}

if(global.p2skin != -1)
{
	p2 = instance_create_layer(256,96,"Instances",oMultiplayer);	
	p2.player = 1;
	p2.controller = global.controllers[1];
}

if(global.p3skin != -1)
{
	p3 = instance_create_layer(256,96,"Instances",oMultiplayer);	
	p3.player = 2;
	p3.controller = global.controllers[2];
}

if(global.p4skin != -1)
{
	p4 = instance_create_layer(256,96,"Instances",oMultiplayer);	
	p4.player = 3;
	p4.controller = global.controllers[3];
}