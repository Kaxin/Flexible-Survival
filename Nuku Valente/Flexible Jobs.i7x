Flexible Jobs by Nuku Valente begins here.

Farmer is a job.
The validation of Farmer is the farmvailable rule.
The maximum of farmer is maxfarmer rule.

This is the maxfarmer rule:
	now max of farmer is territory of tribe of player;
	let x be 100;
	if "Farming" is listed in perks of tribe of player:
		increase x by 25;
	if "Plant" is listed in diet of tribe of player:
		increase x by 25;
	now max of farmer is ( max of farmer * x ) / 100;
	

This is the farmvailable rule:
	if "Plant" is listed in diet of tribe of player:
		rule succeeds;
	if "Farming" is listed in perks of tribe of player:
		rule succeeds;
	rule fails;

An everyturn rule(this is the Farming rule):
	if the remainder after dividing turns by 4 is not 0, continue the action;
	if workers of farmer is 0, continue the action;
	let foragers be workers of farmer;
	[First check for easy to grab salvage, will become more scarce over time]
	let x be a random number from 80 to 120; [mild variance]
	if "Farming" is listed in perks of tribe of player:
		increase x by 10;
	if "Plant" is listed in diet of tribe of player:
		increase x by 10;
	now x is x * 4;
	now x is x * foragers;
	now x is x / 100;
	if x is greater than 0: [ There is forage available ]
		if x is less than 1, now x is 1;
		say "Farming yields food: +[x]";
		if "Plant" is listed in diet of tribe of player:
			increase food of tribe of player by x;
		otherwise:
			increase creds of tribe of player by x;

Hunter is a job.
The validation of Hunter is the huntvailable rule.
The maximum of hunter is maxhunter rule.

This is the maxhunter rule:
	now max of hunter is territory of tribe of player;
	let x be 100;
	if "Hunting" is listed in perks of tribe of player:
		increase x by 25;
	if "Meat" is listed in diet of tribe of player:
		increase x by 25;
	now max of hunter is ( max of hunter * x ) / 100;
 
This is the huntvailable rule:
	if "Meat" is listed in diet of tribe of player, rule succeeds;
	if "Hunting" is listed in perks of tribe of player, rule succeeds;
	rule fails;

An everyturn rule(this is the Hunting rule):
	if the remainder after dividing turns by 2 is not 0, continue the action;
	if workers of hunter is 0, continue the action;
	let foragers be workers of hunter;
	[First check for easy to grab salvage, will become more scarce over time]
	let x be a random number from 80 to 120; [mild variance]
	if "Hunting" is listed in perks of tribe of player:
		increase x by 10;
	if "Meat" is listed in diet of tribe of player:
		increase x by 10;
	now x is x * 2;
	now x is x * foragers;
	now x is x / 100;
	if x is greater than 0: [ There is forage available ]
		if x is less than 1, now x is 1;
		say "Hunting yields food: +[x]";
		if "Meat" is listed in diet of tribe of player:
			increase food of tribe of player by x;
		otherwise:
			increase creds of tribe of player by x;

Warrior is a job.
The validation of Warrior is the warvailable rule.
The maximum of Warrior is maxwarrior rule.

This is the maxwarrior rule:
	now max of warrior is population of tribe of player;

This is the warvailable rule:
	rule succeeds;

An everyturn rule(this is the Warrior Payday rule):
	if workers of warrior is 0, continue the action;
	let foragers be workers of warrior;
	decrease foragers by 5;
	if foragers is less than 0, continue the action;
	[First check for easy to grab salvage, will become more scarce over time]
	let x be 100;
	if "Militant" is listed in perks of tribe of player:
		decrease x by 10;
	if "Ascetic" is listed in diet of tribe of player:
		decrease x by 10;
	now x is x * foragers;
	now x is x / 100;
	if x is greater than 0: [ The warriors demand monies ]
		if x is less than 1, now x is 1;
		if creds of tribe of player < x:
			decrease x by creds of tribe of player;
			now creds of tribe of player is 0;
			if x is less than 2, now x is 2;
			decrease morale of tribe of player by ( x / 2 );
			say "You lack the funds to properly pay for warriors. Morale: -[x / 2]";
		otherwise:
			decrease creds of tribe of player by x;
			say "You pay [x] freecreds for your military.";


Flexible Jobs ends here.