package SpaceInvader
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Steven
	 */
	public class InvaderGame extends FlxState
	{
		
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
		}
		public override function update():void {
			super.update();
			
		}
		
	}

}