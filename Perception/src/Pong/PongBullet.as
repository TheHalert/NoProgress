package Pong 
{
	import org.flixel.*;
	import Pong.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class PongBullet extends FlxSprite
	{
		[Embed(source = "/image/pongBall.png")] private var m_texture:Class;
		private var m_xSpeed:int;
		
		public function PongBullet() 
		{
			super( 0, 0, m_texture );
			exists = false;
		}
		
		public function Start(posX:int, posY:int, xSpeed:int)
		{
			this.x = posX;
			this.y = posY;
			m_xSpeed = xSpeed;
			velocity.x = xSpeed;
			//maxVelocity.x = xSpeed;
			exists = true;
		}
		
		override public function update():void
		{
			if ( this.x > FlxG.width )
			{
				exists = false;
			}
		}
	}
}