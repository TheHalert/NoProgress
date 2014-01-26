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
		[Embed(source = '../image/spaceship_damage_1.png')] private var shipdmg:Class;
		[Embed(source = '../audio/cannon.mp3')] private var cannon:Class;
		var leftpoint:Number;
		var rightpoint:Number;
		var toppoint:Number;
		var downpoint:Number;
		var step:int = 5;
		var dmgtimer:Number;
		public function SpaceShip(lpos:Number,rpos:Number,dpos:Number, ypos:Number) 
		{
			super((rpos - lpos) / 2, ypos, shipimage);
			leftpoint = lpos;
			rightpoint = rpos;
			downpoint = dpos;
			toppoint = ypos;
			health = 100;
			dmgtimer = 0;
		}
		public override function update():void {
			super.update();
			if (health <= 0)
				kill();
			if (dmgtimer != 0 && new Date().time - dmgtimer > 500) {
				loadGraphic(shipimage);
				dmgtimer = 0;
			}
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
		public function bullethit(ship:SpaceShip, bullet:Bullet):void {
			if (bullet.goingUp)
				return;
			ship.health -= 34;
			bullet.kill();
			loadGraphic(shipdmg);
			dmgtimer = new Date().time;
		}
		
		
		
	}

}