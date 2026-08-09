
function ScreenShake (_magnitude, _frames)
{
	if (instance_exists(objBattleCamera))
    {
		objBattleCamera.screenIsShaking = true;
		objBattleCamera.shakeRemain = _magnitude;
		objBattleCamera.shakeDecay = _magnitude / _frames;
    }
}


function DamageScreenShake (_damageType)
{
	var _damageMultiplier = GetTypeDamageMultiplier(_damageType);
	ScreenShake(DAMAGE_BASE_SCREEN_SHAKE_MAGNITUDE*_damageMultiplier, DAMAGE_BASE_SCREEN_SHAKE_FRAMES*_damageMultiplier);
}
