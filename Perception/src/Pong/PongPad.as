package  Pong
{
	//import flash.geom.Point;
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class PongPad extends FlxSprite
	{
		//[Embed(source = "/image/pongBall.png")] private var m_padTexture:Class;
		private var m_speed:int = 300;
		public var m_isAi:Boolean;		
		private var m_isSkip:Boolean;
		
		public function PongPad(x:int, y:int, isAi:Boolean) 
		{
			super( x, y );// , m_padTexture );
			makeGraphic( 10, 65 );
			maxVelocity.y = 200;
			m_isAi = isAi;	
			m_isSkip = false;
		}
		
		override public function update():void 
		{
			//acceleration.y = 0;
			velocity.y = 0;
			if ( !m_isAi )
			{
				updatePlayer();
			}
			else 
			{
				updateAi();	
			}			
		}		
		
		private function updatePlayer():void 
		{
			if ( this.y + height > FlxG.height )
			{
				this.y = FlxG.height - height;
				return;
			}
			else if ( this.y <= 0 )
			{
				this.y = 1;
				return;
			}
			
			if ( FlxG.keys.DOWN )
			{
				velocity.y = maxVelocity.y;
			}
			else if ( FlxG.keys.UP )
			{
				velocity.y = -maxVelocity.y;
			}	
		}
		
		private function updateAi():void
		{
			velocity.y = m_speed;
			
			if ( m_isSkip )
			{
				m_isSkip = false;
				return;
			}
			return;
			if ( this.y <= 0 )//isTouching( UP ) )
			{		
				this.y = 10;
				m_speed *= -1;
				m_isSkip = true;
			}
			else if ( this.y + height >= FlxG.height ) // isTouching( DOWN ) )
			{
				velocity.y = 0;
				m_speed *= -1;
				m_isSkip = true;
				this.y = FlxG.height - height - 10;
			}
		}
		
		public function onBulletCollision(pad:PongPad, bullet:FlxObject):void 
		{
			if ( !pad.m_isAi )
			{
				return;
			}
			
			bullet.kill();
		}
	}
}