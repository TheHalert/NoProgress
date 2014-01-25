package SpaceInvader 
{
	import org.flixel.*; 
	/**
	 * ...
	 * @author Steven
	 */
	public class Alien extends FlxSprite
	{
		[Embed(source = '../image/spacemonsterA_1.png')] private var alienimage1:Class;
		[Embed(source = '../image/spacemonsterA_2.png')] private var alienimage2:Class;
		static var nextjumpex:Number = 0;
		var image1:Boolean = true;
		var nextjump:Number = 0;
		var leftpoint:Number;
		var rightpoint:Number;
		var movingright:Boolean;
		var step:Number = 10;
		var laststep:int;
		public function Alien(lpos:Number,rpos:Number, ypos:Number) 
		{
			super(0, 0, alienimage1);
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
				if (image1) {
					loadGraphic(alienimage2);
				}else {
					loadGraphic(alienimage1);
				}
				image1 = !image1;
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