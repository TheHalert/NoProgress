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
		[Embed(source = '../image/explosion.png')] private var explode:Class;
		[Embed(source = '../audio/crash.mp3')] private var crash:Class;
		public function SpaceShip(xpos:Number, ypos:Number) 
		{
			super(xpos, ypos, shipimage);
			
			health = 100;
		}
		override public function update():void 
		{
			super.update();
			if (health <= 0)
				return;
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
			else {
				if (velocity.x > 2) {
					velocity.x -= 2;
				}
				else if (velocity.x < -2) {
					velocity.x += 2;
				}else {
					velocity.x = 0;
				}
				
				if (velocity.y > 2) {
					velocity.y -= 2;
				}
				else if (velocity.y < -2) {
					velocity.y += 2;
				}else {
					velocity.y = 0;
				}
			}
			if (x < 0) {
				x = FlxG.width;
			}
			if (y < 0) {
				y = FlxG.height;
			}
			if (x > FlxG.width) {
				x = 0;
			}
			if (y > FlxG.height) {
				y = 0;
			}
		}
		public function hitastroid(ship:SpaceShip, astroid:Astroid ):void {
			if (Ending.endingrunning)
				return;
			astroid.kill();
			health -= 100;
			loadGraphic(explode);
			FlxG.play(crash);
			velocity.x = 0;
			velocity.y = 0;
		}
		
	}

}