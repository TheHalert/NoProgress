package Breakout 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BoPad extends FlxSprite
	{
		
		public function BoPad(posX:int, posY:int, speed:int) 
		{
			super( posX, posY );
			makeGraphic( 80, 10 );
			
			maxVelocity.x = speed;
		}
		
		override public function update():void 
		{
			velocity.x = 0;
			
			if ( this.x + width > FlxG.width )
			{
				this.x = FlxG.width - width;
				return;
			}
			else if ( this.x <= 0 )
			{
				this.x = 1;
				return;
			}
			
			if ( FlxG.keys.LEFT )
			{
				velocity.x = -maxVelocity.x;
			}
			else if ( FlxG.keys.RIGHT )
			{
				velocity.x = maxVelocity.x;
			}
		}
	}

}