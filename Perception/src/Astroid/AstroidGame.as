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
		public function AstroidGame() 
		{
			
		}
		override public function create():void 
		{
			super.create();
			FlxG.worldBounds.make(0, 0, FlxG.width, FlxG.height );
			ship = new SpaceShip(FlxG.width / 2, FlxG.height / 2);
			add(ship);
		}
	}

}