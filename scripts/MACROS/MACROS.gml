
#macro CELL_SIZE   64
#macro CENTER_CELL 32

#macro MAP_WIDTH  25
#macro MAP_HEIGHT 25



#macro W_KEY ord("W")
#macro A_KEY ord("A")
#macro S_KEY ord("S")
#macro D_KEY ord("D")

#macro I_KEY ord("I")
#macro O_KEY ord("O")



#macro GAMEPAD_DISCONNECTED -1
#macro SLOT_1                0
#macro SLOT_11              11
#macro ASYNC_LOAD_TYPE      async_load[? "type"]
#macro ASYNC_LOAD_PAD       async_load[? "pad_index"]
#macro GAMEPAD_DISCOVERED   "gamepad discovered"
#macro GAMEPAD_LOST         "gamepad lost"
#macro DEFAULT_DEADZONE     0.2



#macro CURSOR_BASE_SPEED 8
#macro CURSOR_SPRINT_SPEED (CURSOR_BASE_SPEED*2)
#macro CURSOR_SNAP_STRENGTH 0.15



#macro FIRST_VIEW 0
#macro VIEW_WIDTH 1280
#macro VIEW_HEIGHT 720
#macro CAMERA_PAN_SPEED 0.08
#macro CAMERA_DEFAULT_ZOOM 0.8
#macro CAMERA_ZOOM_OUT 1.1
#macro CAMERA_ZOOM_SPEED 0.05



#macro DEFAULT_DRAW_ALPHA 1.0
#macro DEFAULT_DRAW_ROTATION 0
#macro DEFAULT_DRAW_COLOR c_white



#macro SYSTEM_LAYER "System"
#macro UNITS_LAYER  "Units"



#macro INFO_CARD_WIDTH  400
#macro INFO_CARD_HEIGHT 250
#macro INFO_CARD_ALPHA 0.4

#macro OPTIONS_BOX_WIDTH   120
#macro OPTIONS_BOX_TEAM_ONE_HEIGHT 100
#macro OPTIONS_BOX_TEAM_TWO_HEIGHT 55
#macro OPTIONS_BOX_MOVE    { index: 0, text: "Move" }
#macro OPTIONS_BOX_ATTACK  { index: 1, text: "Attack" }
#macro OPTIONS_BOX_DETAILS { index: 2, text: "Details" }
#macro OPTIONS_BOX_CANCEL  { index: 3, text: "Cancel" }
#macro OPTIONS_BOX_X ((VIEW_WIDTH / 2) - (OPTIONS_BOX_WIDTH / 2))
#macro OPTIONS_BOX_Y ((VIEW_HEIGHT / 2) + 50)

#macro DISPLAY_SPRITE_SIZE 128
#macro TYPE_SPRITE_SCALE  0.6
#macro RANGE_SPRITE_SCALE 0.9

#macro DEFAULT_FONT -1

#macro EMPTY_STRING ""
