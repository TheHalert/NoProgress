package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Steven
	 */
	import org.flixel.FlxGame;
	[SWF(width = "800", height = "600", backgroundColor = "#82CAFA")];
	public class Main extends FlxGame 
	{
		
		public function Main():void 
		{
			
			super(800, 600, Mainmenu);
			useSoundHotKeys = false;
		}
		
	}
	
}