
mapName = global.battleArena.name;
mapWidth = global.battleArena.width;
mapHeight = global.battleArena.height;

map = ds_grid_create(global.battleArena.width, global.battleArena.height);
ds_grid_clear(map, { terrain: noone, unit: noone });
