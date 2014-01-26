package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Steven
	 */
	public class Ending extends FlxSprite
	{
		[Embed(source = 'image/congratulations.png')] private var gratz:Class;
		[Embed(source = 'image/youaredead.png')] private var dead:Class;
		[Embed(source = 'audio/tada.mp3')] private var tada:Class;
		var nextstate:FlxState;
		static public var endingrunning:Boolean = false;
		static public var starttime:Number;
		var victory:Boolean
		public function Ending(victory:Boolean ,nstate:FlxState = null) 
		{
		
			
			var imagetoload:Class
			if (victory)
				imagetoload = gratz;
			else
				imagetoload = dead;
			super(0, 0, imagetoload);
			if (new Date().time - starttime < 7000) {
				kill();
				return;
			
			}
			if (victory)
				FlxG.play(tada);
			endingrunning = true;
			this.victory = victory;
			nextstate = nstate;
			scrollFactor = new FlxPoint(0,0);
			scale = new FlxPoint(3, 3);
			setOriginToCorner();
			x = FlxG.width / 2 - width * 1.5;
			y = FlxG.height / 2 - height * 1.5;
			starttime = new Date().time;
		}
		override public function update():void 
		{
			super.update();
			if (new Date().time - starttime > 5000) {
				endingrunning = false;
				FlxG.bgColor = 0xFF000000;
				if (victory) {
					FlxG.switchState(nextstate);
				}else {
					FlxG.resetState();
				}
			}
				
		}
		
	}

}