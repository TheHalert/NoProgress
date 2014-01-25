package SpaceInvader 
{
	import org.flixel.*; 
	/**
	 * ...
	 * @author Steven
	 */
	public class Alien extends FlxSprite
	{
		[Embed(source = '../image/spacemonsterA_1.png')] private var alienimagea1:Class;
		[Embed(source = '../image/spacemonsterA_2.png')] private var alienimagea2:Class;
		
		[Embed(source = '../image/spacemonsterB_1.png')] private var alienimageb1:Class;
		[Embed(source = '../image/spacemonsterB_2.png')] private var alienimageb2:Class;
		static var nextjumpex:Number = 0;
		var alientype:int;
		var image1:Boolean = true;
		var nextjump:Number = 0;
		var leftpoint:Number;
		var rightpoint:Number;
		var movingright:Boolean;
		var step:Number = 10;
		var laststep:int;
		public function Alien(lpos:Number,rpos:Number, ypos:Number, type:int) 
		{
			var imagetoload:Class;
			alientype = type;
			if (alientype == 0)
				imagetoload = alienimagea1;
			else if  (alientype == 1)
				imagetoload = alienimageb1;
			super(0, 0, imagetoload);
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
				if (alientype == 0){
					if (image1) {
						loadGraphic(alienimagea2);
					}else {
						loadGraphic(alienimagea1);
					}
				} else if (alientype == 1) {
					if (image1) {
						loadGraphic(alienimageb2);
					}else {
						loadGraphic(alienimageb1);
					}
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