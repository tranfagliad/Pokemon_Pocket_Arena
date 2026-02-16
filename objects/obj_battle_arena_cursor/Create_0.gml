// Initial position is in the center of the room
x = (floor((room_width / 2) / sprite_width) * sprite_width) + CENTER_TILE;
y = (floor((room_height / 2) / sprite_width) * sprite_width) + CENTER_TILE;



// Cursor move speed
cursor_speed = 5;



// Cursor Snap Settings
cursor_snap = 0.5;
is_snapped = false;
unit_hovered = noone;
