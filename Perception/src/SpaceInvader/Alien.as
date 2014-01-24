package SpaceInvader 
{
	import org.flixel.*; 
	/**
	 * ...
	 * @author Steven
	 */
	public class Alien extends FlxSprite
	{
		static var starttime:Number = 0;
		var lastjump:Number = 0;
		var leftpoint:FlxPoint;
		var rightpoint:FlxPoint;
		var movingright:Boolean;
		var step:Number = 5;
		var laststep:int;
		public function Alien() 
		{
			if (starttime == 0)
				starttime = new Date().time;
			lastjump = starttime();
			movingright = true;
		}
		public function update():void {
			super.update();
			if ((new Date().time - starttime) > 50) {
				lastjump = new Date().time;
				if(movingright)
					x += step;
				else
					x -= step;
				if (x >= rightpoint || x <= leftpoint){
					y -= (step * 10)
					movingright = !movingright;
				}
				
			}
		}
		
	}

}