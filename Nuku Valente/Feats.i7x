Version 1 of Feats by Nuku Valente begins here.

"Controls feats for Flexible Survival"

Section 1 - Basic Feats

basic feats is a featset.

The player has a number called featgained.

Featgetting is an action applying to nothing.
understand "volunteer" as featgetting.

Check featgetting:
	if hp of doctor matt is 0, say "Volunteer for what now? You are a strange person. Considering what game this is, that says a lot!" instead;
	if featgained of player is greater than ( level of player divided by 3 ), say "You do not yet qualify for more feats." instead; 
	if doctor matt is not visible, say "Only Doctor Matt knows how to do this." instead;

carry out featgetting:
	blank out the whole of table of gainable feats;
	repeat with x running through featsets:
		try addfeating x;
	if there is no title in row 1 of table of gainable feats:
		say "There are no feats to gain!";
		wait for any key;
	otherwise:
		change the current menu to table of Gainable Feats;
		carry out the displaying activity;
	
To Featget:
	blank out the whole of table of gainable feats;
	repeat with x running through featsets:
		try addfeating x;
	if there is no title in row 1 of table of gainable feats:
		say "There are no feats to gain!";
		wait for any key;
	otherwise:
		change the current menu to table of Gainable Feats;
		carry out the displaying activity;

Addfeating is an action applying to one thing.

carry out addfeating:
	say "Tuna";

To addfeat (x - text) with (y - text):
	if x is not listed in feats of player:
		choose a blank row in table of Gainable Feats;
		now title entry is X;
		now toggle entry is gainfeat rule;
		now description entry is Y;

	
instead of addfeating the basic feats:
	if charisma of player is greater than 14:
		addfeat "Haggler" with "You are an especially skilled haggler. Sometimes, you end up with two of what you are trading for!";
	addfeat "Survivalist" with "You are great at scavenging. When doing such, you get a +4 to finding things.";
	if stamina of player is greater than 14:
		addfeat "Spartan Diet" with "You don't need 2 liters of water and great feasts to keep you going! You become thirsty and hungry slower.";
		addfeat "Iron Stomach" with "Your belly has nano resistance! Eating or drinking infectious items fails to change you.";
	if "Sterile" is not listed in feats of player, addfeat "Fertile" with "You are blessed by the rabbit totem! You are especially good at producing children.";
	if "Fertile" is not listed in feats of player, addfeat "Sterile" with "You are incapable of mothering a child.";
	if intelligence of player is greater than 14:
		addfeat "Fast Learner" with "You assimilate new information rapidly. -20% xp needed to level.";
	if perception of player is greater than 14:
		addfeat "Expert Hunter" with "Your chances of hunting a specific critter with the hunt command increases from 3 X to 5 X.";
	if "Expert Hunter" is listed in feats of player:
		addfeat "Master Baiter" with "You are virtually assured victory when hunting a specific creature. Your proficiency doubles from 5X to 10X.";
	addfeat "Male Preferred" with "You will reject female mutation";
	addfeat "Female Preferred" with "You will reject male mutation";
	addfeat "One Way" with "You can only grow larger, not smaller, sexually, barring specific effects.";
	addfeat "Automatic Survival" with "You forage a little here, a little there. This is a mildly cheating feat, taking it will impact your score negatively, but will remove food and water as a concern.";
	if strength of player is greater than 14:
		addfeat "Strong Back" with "You can carry impressive amounts of stuff. +50 lb tolerance.";
	if number of entries in childrenfaces is greater than 0:
		addfeat "Spirited Youth" with "Your child will lend their aid in combat, occasionally dealing damage to the enemy.";
	if hp of doctor matt is greater than 4:
		addfeat "Microwaved" with "Thanks to the good advice, you have a great idea! If you can clean water, why not yourself? Genius. Gives you a very potent resistance to species reassignment.";


This is the gainfeat rule:
	choose row Current Menu Selection in table of gainable feats;
	let nam be title entry;
	say "Are you sure you want '[title entry]': [description entry][line break]?";
	if player consents:
		add nam to feats of player;
		say "You have gained '[nam]'!";
		wait for any key;
		decrease menu depth by 1;
		increase featgained of player by 1;
		if nam is "Automatic Survival", decrease score by 600;

Feats ends here.