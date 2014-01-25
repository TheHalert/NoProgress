package Astroid 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Steven
	 */
	public class Astroid extends FlxSprite
	{
		[Embed(source = '../image/smallcomet1.png')] private var comet:Class;
		public function Astroid(_x:Number, _y:Number) 
		{
			super(_x, _y, comet);
			if (Tools.getRandomBetween(0, 1) == 1)
				velocity.x = Math.random() * 100;
			else 
				velocity.x = Math.random() * -100;
			if (Tools.getRandomBetween(0, 1) == 1)
				velocity.y = Math.random() * 100;
			else 
				velocity.y = Math.random() * -100;
		}
		override public function update():void 
		{
			super.update();
			if (x < 0) {
				x = FlxG.width;
			}
			if (y < 0) {
				y = FlxG.height;
			}
			if (x > FlxG.width) {
				x = 0;
			}
			if (y > FlxG.height) {
				y = 0;
			}
		}
		
	}

}