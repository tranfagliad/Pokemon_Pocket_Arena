// Set font and color
draw_set_colour(c_white);
draw_set_font(fnt_debugging);



// Draw text
draw_text(10, 60, "Camera X: "+string(x));
draw_text(10, 75, "Camera Y: "+string(y));
draw_text(10, 95, "Camera Zoom: "+string(zoom_level));



// Reset font and color
draw_set_colour(c_white);
draw_set_font(-1);
