
menuOptions = [
	{ index: MainMenuOptions.CAMPAIGN,    sprite: sprPlaceholderCampaignButton },
	{ index: MainMenuOptions.FREE_BATTLE, sprite: sprPlaceholderFreeBattleButton },
	{ index: MainMenuOptions.SETTINGS,    sprite: sprPlaceholderSettingsButton }
	
];


menuIndex = 0;   // Start on Campaign
menuLength = array_length(menuOptions);

mainMenuState = MainMenuStateFree;
