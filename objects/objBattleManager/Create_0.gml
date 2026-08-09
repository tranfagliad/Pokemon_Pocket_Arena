
teamOneUnits = ds_list_create();
teamTwoUnits = ds_list_create();


currentTurn = 0;
whoseTurn = Team.ONE;

opponent = global.opponent;

typeChart = LoadTypeChart();

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


unitIsAttacking = false;
unitHasHit = false;
damageInfo = noone;











var _uid = "0001";
var _name = "Bulbasaur"
var _type = Type.GRASS;


var _uid2 = "0002";
var _name2 = "Ivysaur"
var _type2 = Type.GRASS;




var _team_one_unit_one = {
	uId: _uid, team: Team.ONE, name: _name, level: 5,
	hp: 20, attackStat: 12, defenseStat: 7,
	activeType: _type,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
CreateUnitAndPlaceOnMap(_team_one_unit_one, map, 3, 4);


var _team_one_unit_two = {
	uId: _uid2, team: Team.TWO, name: _name2, level: 5,
	hp: 2, attackStat: 12, defenseStat: 7,
	activeType: _type2,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
CreateUnitAndPlaceOnMap(_team_one_unit_two, map, 3, 2);

var _team_one_unit_three = {
	uId: _uid2, team: Team.TWO, name: _name2, level: 5,
	hp: 20, attackStat: 12, defenseStat: 7,
	activeType: _type2,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
CreateUnitAndPlaceOnMap(_team_one_unit_three, map, 5, 4);
