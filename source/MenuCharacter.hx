package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class MenuCharacter extends FlxSprite
{
	public var character:String;

	public function new(x:Float, character:String = 'bf')
	{
		super(x);

		changeCharacter(character);
	}

	public function changeCharacter(?character:String = 'bf') {
		if(character == this.character) return;
	
		this.character = character;
		antialiasing = ClientPrefs.globalAntialiasing;

		switch(character) {
			case 'bf':
				frames = Paths.getSparrowAtlas('menucharacters/Menu_BF');
				animation.addByPrefix('idle', "M BF Idle", 24);
				animation.addByPrefix('confirm', 'M bf HEY', 24, false);

			case 'gf':
				frames = Paths.getSparrowAtlas('menucharacters/Menu_GF');
				animation.addByPrefix('idle', "M GF Idle", 24);

			case 'sickle':
				frames = Paths.getSparrowAtlas('menucharacters/Menu_Sickle');
				animation.addByPrefix('idle', "M Sickle Bop", 24);

			case 'empty':
				frames = Paths.getSparrowAtlas('menucharacters/Menu_Blank');
				animation.addByPrefix('idle', "Empty", 24);
		}
		animation.play('idle');
		updateHitbox();

		switch(character) {
			case 'bf':
				offset.set(15, -40);

			case 'gf':
				offset.set(0, -25);

			case 'sickle':
				offset.set(80, 10);

			case 'empty':
				offset.set(0,0);
		}
	}
}
