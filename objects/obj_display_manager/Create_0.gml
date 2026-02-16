// Remove the window border
//window_set_showborder(false);



// Window size
window_set_size(WINDOW_WIDTH, WINDOW_HEIGHT);

// Application Surface size
surface_resize(application_surface, BASE_RESOLUTION_WIDTH, BASE_RESOLUTION_HEIGHT);

// GUI size
display_set_gui_size(BASE_RESOLUTION_WIDTH, BASE_RESOLUTION_HEIGHT);



// Set viewport
view_enabled = true;
view_visible[0] = true;
view_set_wport(0, WINDOW_WIDTH);
view_set_hport(0, WINDOW_HEIGHT);



// Set camera
var _camera = view_get_camera(0);
camera_set_view_size(_camera, BASE_RESOLUTION_WIDTH, BASE_RESOLUTION_HEIGHT);



// Center the game window on the screen
window_center();
