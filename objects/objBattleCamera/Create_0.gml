
// Follow
followTarget = objBattleCursor;
x = followTarget.x;
y = followTarget.y;


// Zoom
currentZoomLevel = CAMERA_DEFAULT_ZOOM;
targetZoom = currentZoomLevel;
currentWidth = VIEWPORT_WIDTH * currentZoomLevel;
currentHeight = VIEWPORT_HEIGHT * currentZoomLevel;


// Screen Shake
screenIsShaking = false;
shakeRemain = 0;
shakeDecay = 0;
