// Adjust the card opacity when hovering over a unit
var _current_hover = obj_battle_arena_cursor.unit_hovered;
if (instance_exists(_current_hover)) {
    last_unit_seen = _current_hover;
    card_alpha = lerp(card_alpha, 1, card_fade_speed);
} else {
    card_alpha = lerp(card_alpha, 0, card_fade_speed);
}
