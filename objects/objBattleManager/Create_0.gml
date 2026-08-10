
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











var _uid = "0143";
var _name = ""
var _type = Type.FIRE;


var _uid2 = "0143";
var _name2 = ""
var _type2 = Type.FIRE;




var _team_one_unit_one = {
	uId: _uid, team: Team.ONE, name: _name, level: 5,
	hp: 20, attackStat: 12, defenseStat: 7,
	activeType: _type,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.MATRIX, attackDistance: 2,
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
	hp: 2, attackStat: 12, defenseStat: 7,
	activeType: _type2,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
CreateUnitAndPlaceOnMap(_team_one_unit_three, map, 5, 4);

var _team_one_unit_four = {
	uId: _uid2, team: Team.TWO, name: _name2, level: 5,
	hp: 2, attackStat: 12, defenseStat: 7,
	activeType: _type2,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
CreateUnitAndPlaceOnMap(_team_one_unit_four, map, 3, 6);

var _team_one_unit_five = {
	uId: _uid2, team: Team.TWO, name: _name2, level: 5,
	hp: 2, attackStat: 12, defenseStat: 7,
	activeType: _type2,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
CreateUnitAndPlaceOnMap(_team_one_unit_five, map, 1, 4);

var _team_one_unit_six = {
	uId: _uid2, team: Team.TWO, name: _name2, level: 5,
	hp: 2, attackStat: 12, defenseStat: 7,
	activeType: _type2,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
CreateUnitAndPlaceOnMap(_team_one_unit_five, map, 1, 2);

var _team_one_unit_seven = {
	uId: _uid2, team: Team.TWO, name: _name2, level: 5,
	hp: 2, attackStat: 12, defenseStat: 7,
	activeType: _type2,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
CreateUnitAndPlaceOnMap(_team_one_unit_seven, map, 5, 2);

var _team_one_unit_eight = {
	uId: _uid2, team: Team.TWO, name: _name2, level: 5,
	hp: 2, attackStat: 12, defenseStat: 7,
	activeType: _type2,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
CreateUnitAndPlaceOnMap(_team_one_unit_eight, map, 1, 6);

var _team_one_unit_nine = {
	uId: _uid2, team: Team.TWO, name: _name2, level: 5,
	hp: 2, attackStat: 12, defenseStat: 7,
	activeType: _type2,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
};
CreateUnitAndPlaceOnMap(_team_one_unit_nine, map, 5, 6);


