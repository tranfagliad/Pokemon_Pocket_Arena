
function LoadIconSprite (_name)
{
	var _filePath = POKEMON_IMAGES_BASE_PATH+"/"+string_lower(_name)+"/"+ICON_SPRITE;
	
	#region error checking
	
		if (!file_exists(_filePath))
	    {
	        show_debug_message("LoadIconSprite Error: File not found at " + _filePath);
	        return noone;
	    }
	
	#endregion
	
	var _iconSprite = sprite_add(_filePath, 1, false, false, 0, 0);
	return _iconSprite;
}



function LoadDisplaySprite (_name)
{
	var _filePath = POKEMON_IMAGES_BASE_PATH+"/"+string_lower(_name)+"/"+DISPLAY_SPRITE;
	
	#region error checking
	
		if (!file_exists(_filePath))
	    {
	        show_debug_message("LoadDisplaySprite Error: File not found at " + _filePath);
	        return -1;
	    }
		
	#endregion
	
	#region find frame count
	
		var _displaySprite = sprite_add(_filePath, 1, false, false, 0, 0);
		var _width = sprite_get_width(_displaySprite);
		var _frameCount = _width / UNIT_DISPLAY_SIZE;
		
	#endregion
	
	sprite_replace(_displaySprite, _filePath, _frameCount, false, false, 0, 0);
	return _displaySprite;
}



function LoadIdleSprite (_name)
{
	var _basePath = POKEMON_IMAGES_BASE_PATH+"/"+string_lower(_name)+"/"+IDLE;
	var _imgPath = _basePath + "/" + IDLE_SPRITE;
	var _txtPath = _basePath + "/" + NUM_FRAMES_TXT;
	
	#region error checking
	
		if (!file_exists(_imgPath))
	    {
	        show_debug_message("LoadIdleSprite Error: Image not found at " + _imgPath);
	        return -1;
	    }
	    if (!file_exists(_txtPath))
	    {
	        show_debug_message("LoadIdleSprite Error: numFrames.txt not found at " + _txtPath);
	        return -1;
	    }
	
	#endregion
	
	#region find frame count
	
		var _txtFile = file_text_open_read(_txtPath);
	    var _framesPerDirection = file_text_read_real(_txtFile);
	    file_text_close(_txtFile);
		var _totalFrames = _framesPerDirection * UNIT_DIRECTIONS;
		
	#endregion
	
	#region find animation data
	
		var _idleSprite = sprite_add(_imgPath, 1, false, false, 0, 0);
		var _totalWidth = sprite_get_width(_idleSprite);
		var _totalHeight = sprite_get_height(_idleSprite);
		var _frameWidth = _totalWidth / _totalFrames;
		var _xOrigin = floor(_frameWidth / 2);
	    var _yOrigin = floor(_totalHeight / 2);
	
	#endregion
	
	sprite_replace(_idleSprite, _imgPath, _totalFrames, false, false, _xOrigin, _yOrigin);
	return _idleSprite;
}




