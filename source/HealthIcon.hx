package;

import flixel.FlxSprite;
import flixel.FlxG;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	private var isOldIcon:Bool = false;
	private var isPlayer:Bool = false;
	private var char:String = '';
	// private var iconpath:String = 'icons';

	// The following icons have antialiasing forced to be disabled
	var noAntialiasing:Array<String> = ['bf-pixel', 'senpai', 'spirit'];

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		isOldIcon = (char == 'bf-old');
		this.isPlayer = isPlayer;
		changeIcon(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}

	public function swapOldIcon() {
		if(isOldIcon = !isOldIcon) changeIcon('bf-old');
		else changeIcon('bf');
	}

	public function changeIcon(char:String) {
		/*
		if(ClientPrefs.redrawnIcons = true)
			iconpath = 'redrawnicons';

		else if(ClientPrefs.redrawnIcons = false)
			iconpath = 'icons';
		*/

		if(this.char != char) {
			var name:String = 'icons/icon-' + char;
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			var file:Dynamic = Paths.image(name);
			loadGraphic(file, true, 150, 150);
			animation.add(char, [0, 1], 0, false, isPlayer);
			animation.play(char);
			this.char = char;
			/*
			var name:String = iconpath + '/icon-' + char;
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = iconpath + '/icon-face'; //Prevents crash from missing icon
			var file:Dynamic = Paths.image(name);
			loadGraphic(file, true, 150, 150);
			animation.add(char, [0, 1], 0, false, isPlayer);
			animation.play(char);
			this.char = char;
			*/

			antialiasing = ClientPrefs.globalAntialiasing;
			for (i in 0...noAntialiasing.length) {
				if(char == noAntialiasing[i]) {
					antialiasing = false;
					break;
				}
			}
		}
	}

	public function getCharacter():String {
		return char;
	}
}
