// Draw the unit info card if we are hovering over one
var _target_unit = obj_battle_arena_cursor.unit_hovered;
if (_target_unit != noone) {
    draw_info_card(_target_unit);
}
