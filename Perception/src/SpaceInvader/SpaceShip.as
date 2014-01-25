package SpaceInvader 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Steven
	 */
	public class SpaceShip extends FlxSprite
	{
		
		[Embed(source = '../image/spaceship.png')] private var shipimage:Class;
		var leftpoint:Number;
		var rightpoint:Number;
		var toppoint:Number;
		var downpoint:Number;
		var step:int = 5;
		public function SpaceShip(lpos:Number,rpos:Number,dpos:Number, ypos:Number) 
		{
			super((rpos - lpos) / 2, ypos, shipimage);
			leftpoint = lpos;
			rightpoint = rpos;
			downpoint = dpos;
			toppoint = ypos;
		}
		public override function update():void {
			super.update();
			if (FlxG.keys.pressed("RIGHT") && x + step < rightpoint){
				x  += step;
			}
			if (FlxG.keys.pressed("LEFT") && x - step > leftpoint) {
				x -= step;
			}
			if (FlxG.keys.pressed("DOWN") && y + step < downpoint) {
				
				y += step;
			}
			else if (!FlxG.keys.pressed("DOWN") && y > toppoint) {
				
				y -= step;
			}
			
		}
		
		
		
	}

}