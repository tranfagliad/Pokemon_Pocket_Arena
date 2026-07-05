
teamOneUnits = ds_list_create();
teamTwoUnits = ds_list_create();

currentTurn = 0;

opponent = global.opponent;



var _team_one_pikachu = {
	team: Team.ONE, name: "Pikachu", level: 5,
	maxHp: 20, currentHp: 20,
	attackStat: 12, defenseStat: 7,
	activeType: Type.ELECTRIC,
	moveRange: Range.DIAGONAL, moveDistance: 3,
	attackRange: Range.STRAIGHT, attackDistance: 2,
	hasMoved: false, hasAttacked: false
};
var _team_one_charmander = {
	team: Team.ONE, name: "Charmander", level: 7,
	maxHp: 20, currentHp: 17,
	attackStat: 15, defenseStat: 11,
	activeType: Type.FIRE,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
	hasMoved: false, hasAttacked: false
};


var _team_two_squirtle = {
	team: Team.TWO, name: "Squirtle", level: 6,
	maxHp: 20, currentHp: 10,
	attackStat: 9, defenseStat: 10,
	activeType: Type.WATER,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
	hasMoved: false, hasAttacked: false
};
var _team_two_bulbasaur = {
	team: Team.TWO, name: "Bulbasaur", level: 9,
	maxHp: 20, currentHp: 3,
	attackStat: 13, defenseStat: 9,
	activeType: Type.GRASS,
	moveRange: Range.STRAIGHT, moveDistance: 2,
	attackRange: Range.STRAIGHT, attackDistance: 2,
	hasMoved: false, hasAttacked: false
};

ds_list_add(teamOneUnits, _team_one_pikachu);
ds_list_add(teamOneUnits, _team_one_charmander);

ds_list_add(teamTwoUnits, _team_two_squirtle);
ds_list_add(teamTwoUnits, _team_two_bulbasaur);


if (instance_exists(objMapManager)) {
	
}

