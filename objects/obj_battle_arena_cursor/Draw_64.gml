// Set font and color
draw_set_colour(c_white);
draw_set_font(fnt_debugging);



// Draw text
draw_text(10, 10, "Cursor X: "+string(x));
draw_text(10, 25, "Cursor Y: "+string(y));



// Reset font and color
draw_set_colour(c_white);
draw_set_font(-1);
