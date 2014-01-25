package Breakout 
{
	import org.flixel.*;
	import Pong.PongBall;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BoBall  extends PongBall
	{
		
		public function BoBall(x:int, y:int, speed:int, rotation:int) 
		{	
			super( x, y, speed, rotation, false );
			m_bottom = FlxG.height;// * 1.5;
		}
		
		override public function RestrictToScreen():void 
		{
			if ( this.x < 0 )
			{
				x = 1;
				velocity.x *= -1;
			}
			else if ( this.x + width >= FlxG.width )
			{
				x = FlxG.width - width - 1;
				velocity.x *= -1; //ResetVelocity( 180 );
			}
			
			if ( this.y < 0 )
			{
				y = 1;
				ResetVelocity( 360 );
			}			
			else if ( this.y + height >= m_bottom )
			{
				y = m_bottom - height - 1;
				ResetVelocity( 360 );
			}	
		}
		
		public function onCollisionWithPad( pad:BoPad )
		{
			if (velocity.y > 0 )
			{
				this.y = pad.y - height - 1;
			}
			else
			{
				this.y = pad.y + pad.height + 1;
			}
			velocity.y *= -1;
		}
		
		public static function onCollisionWithBrick( ball:BoBall, brick:BoBrick )
		{
			//brick.exists = false;
			brick.kill();
			ball.velocity.y *= -1;
			//ResetVelocity( 360 );
		}
	}

}