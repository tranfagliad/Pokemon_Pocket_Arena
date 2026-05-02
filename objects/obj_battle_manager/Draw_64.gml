var _hovered = unit_hovered ? current_cell.unit : noone;
var _selected = selected_unit;

// Always draw the selected unit if one exists
if (_selected != noone) {
    draw_unit_info_card(_selected);
}

// Draw hovered unit when appropriate
if (_hovered != noone) {
    if (_selected == noone) {
        // Nothing selected → normal hover behavior
        draw_unit_info_card(_hovered);
    }
    else if (_hovered != _selected && _hovered.team != _selected.team) {
        // Selected + hovering over opposite team → show BOTH cards
        draw_unit_info_card(_hovered);
    }
    // Same team as selected → only show selected (already handled above)
}