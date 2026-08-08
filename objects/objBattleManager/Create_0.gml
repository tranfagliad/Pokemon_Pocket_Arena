
teamOneUnits = ds_list_create();
teamTwoUnits = ds_list_create();


currentTurn = 0;
whoseTurn = Team.ONE;

opponent = global.opponent;

typeChart = GetTypeChart();


mapName = global.battleArena.name;
mapWidth = global.battleArena.width;
mapHeight = global.battleArena.height;
map = InitializeMap();


battleState = BattleStatePlayerTurnFree;
battleStateTemp = noone;


selectedUnit = noone;
attackTargetUnit = noone;


unitOptions = [ UNIT_OPTION_MOVE, UNIT_OPTION_ATTACK, OPTION_CANCEL ];
unitOptionsPostMove = [ UNIT_OPTION_ATTACK, UNIT_OPTION_GO_BACK, UNIT_OPTION_END ];
attackConfirmationOptions = [ ATTACK_OPTION_CONFIRM, OPTION_CANCEL ];

unitOptionsIndex = UnitOptions.MOVE;


activeRangeTiles = ds_list_create();
unitTargetMapX   = RESET_CELL_COORDINATE;
unitTargetMapY   = RESET_CELL_COORDINATE;
unitOriginalMapX = RESET_CELL_COORDINATE;
unitOriginalMapY = RESET_CELL_COORDINATE;


damage = 0;




var _team_one_unit_one = {
	uId: "0001", team: Team.ONE, name: "Bulbasaur", level: 5,
	hp: 20, attackStat: 12, defenseStat: 7,
	activeType: Type.GRASS,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
CreateUnitAndPlaceOnMap(_team_one_unit_one, map, 3, 4);



var _team_one_unit_two = {
	uId: "0001", team: Team.TWO, name: "Bulbasaur", level: 5,
	hp: 20, attackStat: 12, defenseStat: 7,
	activeType: Type.GRASS,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
CreateUnitAndPlaceOnMap(_team_one_unit_two, map, 3, 2);
