package SpaceInvader 
{
	import org.flixel.*; 
	/**
	 * ...
	 * @author Steven
	 */
	public class Alien extends FlxSprite
	{
		[Embed(source = '../image/spacemonster.png')] private var alienimage:Class;
		static var nextjumpex:Number = 0;
		var nextjump:Number = 0;
		var leftpoint:Number;
		var rightpoint:Number;
		var movingright:Boolean;
		var step:Number = 10;
		var laststep:int;
		public function Alien(lpos:Number,rpos:Number, ypos:Number) 
		{
			super(0, 0, alienimage);
			x = lpos;
			y = ypos;
			leftpoint = lpos;
			rightpoint = rpos;
			if (nextjumpex == 0)
				nextjumpex = new Date().time + 500;
			nextjump = nextjumpex;
			movingright = true;
		}
		public override function update():void {
			super.update();
			if ((new Date().time - nextjump) > 0) {
				if(nextjump == nextjumpex)
					nextjumpex = new Date().time + 500; 
				nextjump = nextjumpex;
				if(movingright)
					x += step;
				else
					x -= step;
				if (x >= rightpoint || x <= leftpoint){
					y += (step * 3)
					movingright = !movingright;
				}
				
			}
		}
		
	}

}