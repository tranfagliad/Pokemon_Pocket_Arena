// Camera Dimensions
camera_width = BASE_CAMERA_WIDTH;
camera_height = BASE_CAMERA_HEIGHT;



// Camera Zoom
zoom_level = 1;
zoom_target = 1;
zoom_speed = 0.08

// Camera-Only Constants
MIN_ZOOM = 1;
MAX_ZOOM = 1.5;



// Smooth Camera follow speed
follow_speed = 0.08;



// Set the camera position on the cursor
if (instance_exists(obj_battle_arena_cursor)) {
    x = obj_battle_arena_cursor.x;
    y = obj_battle_arena_cursor.y;
}
var _start_x = x - (camera_width / 2);
var _start_y = y - (camera_height / 2);
camera_set_view_pos(view_camera[0], _start_x, _start_y);
