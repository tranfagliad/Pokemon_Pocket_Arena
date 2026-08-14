
#region unit battle data
	
	uId = "0000"
	name = "";
	team = Team.NONE;
	level = 1;
	maxHp = 1;
	currentHp = maxHp;
	attackStat = 1;
	defenseStat = 1;
	activeType = Type.NONE;
	moveRange = Range.NONE;
	moveDistance = 0;
	attackRange = Range.NONE;
	attackDistance = 0;
	
#endregion

#region unit meta data
	
	image_speed = IDLE_IMAGE_SPEED;
	facingDirection = Direction.SOUTH;
	isAlive = true;
	isEnabled = true;
	colorBlend = UNIT_ENABLED_BLEND;
	
#endregion

#region unit sprites
	
	sprite_index = noone;
	shadowAnimation = noone;
	
	displaySprite = noone;
	iconSprite = noone;
	
	idleAnimation = noone;
	walkAnimation = noone;
	attackAnimation = noone;
	hurtAnimation = noone;
	faintAnimation = noone;
	
#endregion
