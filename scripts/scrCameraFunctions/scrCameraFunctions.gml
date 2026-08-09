
function ScreenShake (_magnitude, _frames)
{
	if (instance_exists(objBattleCamera))
    {
		objBattleCamera.screenIsShaking = true;
		objBattleCamera.shakeRemain = _magnitude;
		objBattleCamera.shakeDecay = _magnitude / _frames;
    }
}
