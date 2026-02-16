
window_set_size(WINDOW_WIDTH, WINDOW_HEIGHT);
surface_resize(application_surface, BASE_RESOLUTION_WIDTH, BASE_RESOLUTION_HEIGHT);



view_enabled = true;
view_visible[0] = true;



view_set_wport(0, WINDOW_WIDTH);
view_set_hport(0, WINDOW_HEIGHT);



var _camera = view_get_camera(0);
camera_set_view_size(_camera, BASE_RESOLUTION_WIDTH, BASE_RESOLUTION_HEIGHT);



display_set_gui_size(BASE_RESOLUTION_WIDTH, BASE_RESOLUTION_HEIGHT);
window_center();
