
menuOptions = [
	{ name: "Campaign",    sprite: sprPlaceholderCampaignButton },
	{ name: "Free Battle", sprite: sprPlaceholderFreeBattleButton },
	{ name: "Settings",    sprite: sprPlaceholderSettingsButton }
	
];


menuIndex = 0;   // Start on Campaign
menuLength = array_length(menuOptions);

mainMenuState = MainMenuStateFree;
