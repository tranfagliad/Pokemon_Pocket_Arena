
draw_set_font(fntConsolas20Bold);
draw_set_halign(fa_center);
draw_text(VIEWPORT_WIDTH/2, 180, disclaimerTitle);

draw_set_font(fntConsolas12);
draw_set_halign(fa_left);
draw_text(230, 260, disclaimerMsg);


if (allow_skip) {
    draw_set_halign(fa_center);
	var _prompt = GetButtonName("select");
    draw_text(VIEWPORT_WIDTH/2, VIEWPORT_HEIGHT-100, "Press "+_prompt+" to Acknowledge and Continue");
}
