/// @description Disappear if player crashes

if(other.isDashing)
{
	instance_create_layer(x,y,"Walls",oSlimeBlockDestroy);
	instance_destroy();
}
