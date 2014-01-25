package Astroid 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Steven
	 */
	public class AstroidGame extends FlxState
	{
		var ship:SpaceShip;
		var astroids:FlxGroup = new FlxGroup();
		var bullets:FlxGroup = new FlxGroup();
		private var lastshot:Number;
		[Embed(source = '../image/warpdrive.png')] private var warpimage:Class;
		var warp:FlxSprite;
		
		public function AstroidGame() 
		{
			
		}
		override public function create():void 
		{
			super.create();
			FlxG.worldBounds.make(0, 0, FlxG.width, FlxG.height );
			ship = new SpaceShip(FlxG.width / 2, FlxG.height / 2);
			add(ship);
			warp = new FlxSprite(ship.x, ship.y, warpimage);
			warp.alpha = 0;
			add(warp);
			for (var i:int = 0; i < 5; i++) {
				spawnastroid();
			}
			add(astroids);
			add(bullets);
			lastshot = new Date().time;
		}
		override public function update():void 
		{
			super.update();
			warp.x = ship.x;
			warp.y = ship.y;
			if (ship.health <= 0){
				var ending:Ending = new Ending(false);
				add(ending);
				
			}
			FlxG.overlap(ship, astroids, ship.hitastroid);
			FlxG.overlap(bullets, astroids, bullethitmonster);
			if (Math.sqrt(ship.velocity.x * ship.velocity.x + ship.velocity.y * ship.velocity.y) > 1100) {
				var ending:Ending = new Ending(true, new Mainmenu);
				add(ending);
			
			}
			if (Ending.endingrunning && ship.health > 0)
				warp.alpha += 0.004;
			
			if (FlxG.keys.justPressed("SPACE") && new Date().time - lastshot > 500) {
				var bullet:Bullet = new Bullet(ship.x + (ship.width / 5), ship.y, ship.angle, ship.velocity.magnitude());
				bullets.add(bullet);
				lastshot = new Date().time;
			}
		}
		public function spawnastroid():void {
			var astroid:Astroid;
				switch(Tools.getRandomBetween(0, 3)) {
					case 0:
						astroid = new Astroid(0, Tools.getRandomBetween(0, FlxG.height));
						break;
					case 1:
						astroid = new Astroid(FlxG.width, Tools.getRandomBetween(0, FlxG.height));
						break;
					case 2:
						astroid = new Astroid(Tools.getRandomBetween(0, FlxG.width), 0);
						break;
					case 3:
						astroid = new Astroid(Tools.getRandomBetween(0, FlxG.width), FlxG.height);
						break;
				}
			astroids.add(astroid);
		}
		public function bullethitmonster(bullet:Bullet, astoi:Astroid):void {
			astoi.kill();
			bullet.kill();
			spawnastroid();
		}
	}

}