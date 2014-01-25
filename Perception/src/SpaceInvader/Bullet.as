package SpaceInvader 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Steven
	 */
	public class Bullet extends FlxSprite
	{
		var goingUp:Boolean;
		[Embed(source = "/image/bullets.png")] private var bullets:Class;
		[Embed(source = "/image/bullets.png")] private var bulletenemy:Class;
		public function Bullet(xstart:Number, ystart:Number, goUp:Boolean) 
		{
			super(xstart, ystart, bullets);
			goingUp = goUp;
		}
		override public function update():void 
		{
			super.update();
			if (goingUp) {
				y -= 5;
			}else{
				y += 5;
			}
			if (y < 0 || y> FlxG.height +300)
				kill();
			
		}
		
	}

}