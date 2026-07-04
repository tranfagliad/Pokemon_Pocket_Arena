
for (var _i = 0; _i < menuLength; _i++)
{
	var _sub_image = (_i == menuIndex) ? 1 : 0;
	draw_sprite(menuOptions[_i].sprite, _sub_image, VIEWPORT_WIDTH/2, 250+(_i*80));
}
