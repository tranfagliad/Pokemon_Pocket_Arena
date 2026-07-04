
// Zoom In/Out
if (objInputManager.pressed.zoom_in)  { targetZoom = CAMERA_DEFAULT_ZOOM; }
if (objInputManager.pressed.zoom_out) { targetZoom = CAMERA_ZOOM_OUT; }
currentZoomLevel = lerp(currentZoomLevel, targetZoom, CAMERA_ZOOM_SPEED);
var _current_width = VIEWPORT_WIDTH * currentZoomLevel;
var _current_height = VIEWPORT_HEIGHT*currentZoomLevel;
camera_set_view_size(view_camera[FIRST_VIEW], _current_width, _current_height);


// Pan Camera
x = lerp(x, followTarget.x, CAMERA_PAN_SPEED);
y = lerp(y, followTarget.y, CAMERA_PAN_SPEED);
camera_set_view_pos(view_camera[FIRST_VIEW], x-(_current_width/2), y-(_current_height/2));
