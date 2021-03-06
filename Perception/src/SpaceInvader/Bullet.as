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
		[Embed(source = "/image/bullets.png")] private var bullet:Class;
		[Embed(source = "/image/enemybullet.png")] private var bulletenemy:Class;
		public function Bullet(xstart:Number, ystart:Number, goUp:Boolean) 
		{
			var imagetouse:Class
			if (goUp)
				imagetouse = bullet;
			else
				imagetouse = bulletenemy;
			super(xstart, ystart, imagetouse);
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