/// @description Change Color

switch(color)
{
	case 0:
		if(confirmed)
		{
			sprite_index = sPlayerCSSConfirm;
		}
		else
		{
			sprite_index = sPlayerCSS;
		}
		break;
	case 1:
		if(confirmed)
		{
			sprite_index = sPlayerCSSBlueConfirm;
		}
		else
		{
			sprite_index = sPlayerCSSBlue;
		}
		break;
	case 2:
		if(confirmed)
		{
			sprite_index = sPlayerCSSRedConfirm;
		}
		else
		{
			sprite_index = sPlayerCSSRed;
		}
		break;
	case 3:
		if(confirmed)
		{
			sprite_index = sPlayerCSSPurpleConfirm;
		}
		else
		{
			sprite_index = sPlayerCSSPurple;
		}
		break;
}