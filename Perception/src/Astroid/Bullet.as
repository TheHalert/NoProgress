package Astroid 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Steven
	 */
	public class Bullet extends FlxSprite
	{
	
		[Embed(source = "/image/bullets.png")] private var bullet:Class;
	
		public function Bullet(xstart:Number, ystart:Number, angleshot:Number, speed:Number) 
		{
		
			super(xstart, ystart, bullet);
			velocity.x += Math.sin((angleshot /180) * Math.PI) * (speed + 300);
			velocity.y -= Math.cos((angleshot / 180) * Math.PI) * (speed + 300);
			angle = angleshot;
			
		}
		override public function update():void 
		{
			super.update();
			
			if (y < 0 || y> FlxG.height || x < 0 || y> FlxG.width)
				kill();
			
		}
		
	}

}