
menuOptions = [
	{ index: CAMPAIGN,    sprite: sprPlaceholderCampaignButton },
	{ index: FREE_BATTLE, sprite: sprPlaceholderFreeBattleButton },
	{ index: SETTINGS,    sprite: sprPlaceholderSettingsButton }
	
];


menuIndex = 0;   // Start on Campaign
menuLength = array_length(menuOptions);

mainMenuState = MainMenuStateFree;
