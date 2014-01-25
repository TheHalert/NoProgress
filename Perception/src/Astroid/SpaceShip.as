package Astroid 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Steven
	 */
	public class SpaceShip extends FlxSprite
	{
		[Embed(source = '../image/spaceship.png')] private var shipimage:Class;
		public function SpaceShip(xpos:Number, ypos:Number) 
		{
			super(xpos, ypos, shipimage);
		}
		override public function update():void 
		{
			super.update();
			if (FlxG.keys.pressed("RIGHT")){
				angle += 5;
			}
			if (FlxG.keys.pressed("LEFT")) {
				angle -= 5;
			}
			if (FlxG.keys.pressed("UP")) {
			    velocity.x += Math.sin((angle /180) * Math.PI) * 5;
				velocity.y -= Math.cos((angle /180) * Math.PI) * 5;
			}
		}
		
	}

}