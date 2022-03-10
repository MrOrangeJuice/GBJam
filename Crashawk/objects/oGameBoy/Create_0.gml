/// @description Init
vsp = -8;
slow = 0.1;
inPlace = false;
playerCSS = 0;
doomed = false;

analogLeftPrev = false;
analogRightPrev = false;

// Find open skin slot
openSkinSlot = -1;
for(i = 0; i < array_length(global.skins); i++)
{
	if(global.skins[i] == false)
	{
		openSkinSlot = i;
		break;
	}
}
skin = openSkinSlot;
global.skins[skin] = true;
confirm = false;