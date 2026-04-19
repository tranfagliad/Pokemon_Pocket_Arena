
// Zoom In/Out
if (obj_input_manager.pressed.zoom_in)  { target_zoom = CAMERA_DEFAULT_ZOOM; }
if (obj_input_manager.pressed.zoom_out) { target_zoom = CAMERA_ZOOM_OUT; }
current_zoom_level = lerp(current_zoom_level, target_zoom, CAMERA_ZOOM_SPEED);
var _current_width = VIEW_WIDTH * current_zoom_level;
var _current_height = VIEW_HEIGHT*current_zoom_level;
camera_set_view_size(view_camera[FIRST_VIEW], _current_width, _current_height);



// Pan Camera
x = lerp(x, follow_target.x, CAMERA_PAN_SPEED);
y = lerp(y, follow_target.y, CAMERA_PAN_SPEED);
camera_set_view_pos(view_camera[FIRST_VIEW], x-(_current_width/2), y-(_current_height/2));
