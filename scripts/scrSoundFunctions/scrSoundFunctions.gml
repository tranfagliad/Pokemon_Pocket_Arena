
#region simple sfx

	function PlaySound (_sound, _volumePercent=DEFAULT_VOLUME_PERCENT, _loop=false)
	{
		if (audio_is_playing(_sound)) { audio_stop_sound(_sound); }
		_volumePercent = clamp(_volumePercent, MIN_VOLUME_PERCENT, MAX_VOLUME_PERCENT);
		var _gain = (global.soundVolume * _volumePercent) / 100;
		var _id = audio_play_sound(_sound, 1, _loop, _gain);
		return _id;
	}
	
	
	function PlayDamageSfx (_damageType)
	{
		switch (_damageType)
		{
			case DamageType.NOT_VERY_EFFECTIVE:
				PlaySound(sfxHitNotVeryEffective);
				break;
			case DamageType.SUPER_EFFECTIVE:
				PlaySound(sfxHitSuperEffective);
				break;
			default:
				PlaySound(sfxHitNormalDamage);
				break;
		}
	}
	
#endregion
