package SpaceInvader
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Steven
	 */
	public class InvaderGame extends FlxState
	{
		private var ship:SpaceShip;
		private var camerapoint:FlxObject;
		public function InvaderGame() 
		{
			
		}
		public override function create():void {
			super.create()
			
			for (var ie:int = 0; ie < 5; ie++) {
				for (var i:int = 0; i < 10; i++) {
					var monster:Alien = new Alien(30, FlxG.width - 80, 30);
					monster.x += ((monster.width * 1.5) * i);
					monster.y += ((monster.height * 1.5) * ie);
					monster.leftpoint += ((monster.width * 1.5) * i);
					monster.rightpoint -= ((monster.width * 1.5) * (9 - i));
					add(monster);
				}
			}
			ship = new SpaceShip(0, FlxG.width - 40, FlxG.height + 300 , FlxG.height - 50);
			add(ship);
			camerapoint = new FlxObject(ship.x, ship.y - (FlxG.height / 2), 5, 5);
			add(camerapoint);
			FlxG.camera.setBounds(0, 0, FlxG.width, FlxG.height + 300, true);
			FlxG.worldBounds.make(0, 0, FlxG.width, FlxG.height + 300);
			FlxG.camera.follow(camerapoint);
			
		}
		public override function update():void {
			super.update();
			camerapoint.y = ship.y - (FlxG.height / 2) + ship.height * 2;
			
		}
		
	}

}