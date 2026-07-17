
teamOneUnits = ds_list_create();
teamTwoUnits = ds_list_create();


currentTurn = 0;
whoseTurn = Team.ONE;

opponent = global.opponent;


mapName = global.battleArena.name;
mapWidth = global.battleArena.width;
mapHeight = global.battleArena.height;
map = InitializeMap();


battleState = BattleStatePlayerTurnFree;
battleStateNext = noone;
selectedUnit = noone;


unitOptions = [ UNIT_OPTION_MOVE, UNIT_OPTION_ATTACK, UNIT_OPTION_CANCEL ];
unitOptionsPostMove = [ UNIT_OPTION_ATTACK, UNIT_OPTION_GO_BACK, UNIT_OPTION_END ];
unitOptionsIndex = UnitOptions.MOVE;

activeRangeTiles = ds_list_create();
unitTargetMapX   = RESET_CELL_COORDINATE;
unitTargetMapY   = RESET_CELL_COORDINATE;
unitOriginalMapX = RESET_CELL_COORDINATE;
unitOriginalMapY = RESET_CELL_COORDINATE;







var _team_one_pikachu = {
	team: Team.ONE, name: "Pikachu", level: 5,
	hp: 20, attackStat: 12, defenseStat: 7,
	activeType: Type.ELECTRIC,
	moveRange: Range.DIAGONAL, moveDistance: 3,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
var _team_one_charmander = {
	team: Team.ONE, name: "Charmander", level: 7,
	hp: 22, attackStat: 15, defenseStat: 11,
	activeType: Type.FIRE,
	moveRange: Range.MATRIX, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};


var _team_two_squirtle = {
	team: Team.TWO, name: "Squirtle", level: 6,
	hp: 21, attackStat: 9, defenseStat: 10,
	activeType: Type.WATER,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
var _team_two_bulbasaur = {
	team: Team.TWO, name: "Bulbasaur", level: 9,
	hp: 24, attackStat: 13, defenseStat: 9,
	activeType: Type.GRASS,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};



CreateUnitAndPlaceOnMap(_team_one_pikachu, map, 2, 3);
CreateUnitAndPlaceOnMap(_team_one_charmander, map, 3, 3);

CreateUnitAndPlaceOnMap(_team_two_squirtle, map, 5, 4);
CreateUnitAndPlaceOnMap(_team_two_bulbasaur, map, 11, 9);

