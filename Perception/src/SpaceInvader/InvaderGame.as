package SpaceInvader
{
	import Astroid.AstroidGame;
	import Breakout.BreakoutState;
	import org.flixel.*;
	/**
	 * ...
	 * @author Steven
	 */
	public class InvaderGame extends FlxState
	{
		private var ship:SpaceShip;
		private var camerapoint:FlxObject;
		private var monsters:FlxGroup =new FlxGroup();
		private var bullets:FlxGroup = new FlxGroup();
		private var lastshot:Number;
		[Embed(source = "/image/exit.png")] private var exitimage:Class;
		[Embed(source = '../audio/cannon.mp3')] private var cannon:Class;
		[Embed(source = '../audio/alienshot.mp3')] private var alienshot:Class;
		
		private var exit:FlxSprite;
		private var monstersarray:Array = new Array();
		private var allienlastshot:Number;
		public function InvaderGame() 
		{
			
		}
		public override function create():void {
			super.create()
			
			for (var ie:int = 0; ie < 5; ie++) {
				for (var i:int = 0; i < 10; i++) {
					
					var monster:Alien = new Alien(30, FlxG.width - 80, 30, ( ie & 1 ));
					monster.x += ((monster.width * 1.5) * i);
					monster.y += ((monster.height * 1.5) * ie);
					monster.leftpoint += ((monster.width * 1.5) * i);
					monster.rightpoint -= ((monster.width * 1.5) * (9 - i));
					monsters.add(monster);
					monstersarray.push(monster);
				}
			}
			exit = new FlxSprite(0, FlxG.height + 200, exitimage);
			exit.x = FlxG.width - exit.width;
			add(exit);
			add(monsters);
			add(bullets);
			ship = new SpaceShip(0, FlxG.width - 40, FlxG.height + 300 , FlxG.height - 50);
			add(ship);
			camerapoint = new FlxObject(ship.x, ship.y - (FlxG.height / 2), 5, 5);
			add(camerapoint);
			FlxG.camera.setBounds(0, 0, FlxG.width, FlxG.height + 300, true);
			FlxG.worldBounds.make(0, 0, FlxG.width, FlxG.height + 300);
			FlxG.camera.follow(camerapoint);
			lastshot = new Date().time - 1000;
			allienlastshot = new Date().time - 1000;
		}
		public override function update():void {
			super.update();
			camerapoint.y = ship.y - (FlxG.height / 2) + ship.height * 2;
			if (ship.health <= 0){
				var ending:Ending = new Ending(false);
				add(ending);
			}
			if (FlxG.keys.justPressed("SPACE") && new Date().time - lastshot > 1000) {
				var bullet:Bullet = new Bullet(ship.x + (ship.width / 5), ship.y, true);
				bullets.add(bullet);
				lastshot = new Date().time;
				FlxG.play(cannon);
			}
			FlxG.overlap(monsters, bullets, bullethitmonster);
			if(FlxG.overlap(ship, exit)){
				var ending:Ending = new Ending(true, new BreakoutState);
				add(ending);
			}
			
			if (FlxG.overlap(ship, bullets, ship.bullethit));
			if (new Date().time - allienlastshot > 1000) {
				var collum:int = Tools.getRandomBetween(0, 9);
				var row:int = 4;
				while (row >= 0 ) {
					var currentmonster:Alien =  monstersarray[collum + (10 * row)];
					if (currentmonster.alive) {
						var bullet:Bullet = new Bullet(currentmonster.x + (currentmonster.width / 5), currentmonster.y + currentmonster.height, false);
						bullets.add(bullet);
						FlxG.play(alienshot);						
						allienlastshot = new Date().time;
						break;
					}
					row--;
				}
			}
			
		}
		function bullethitmonster(alien:Alien, bullet:Bullet):void {
			if (!bullet.goingUp)
				return;
			for (var i:int = 0; i < 10; i++) {
				if (monstersarray[i] == alien)
				{
					bullet.kill();
					return;
				}
			}
			alien.kill();
			bullet.kill();
		}
	}

}