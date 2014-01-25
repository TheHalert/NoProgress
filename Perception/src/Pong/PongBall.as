package Pong
{
	import flash.geom.Point;
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class PongBall extends FlxSprite
	{
		[Embed(source = "/image/pongBall.png")] private var m_padTexture:Class;
		
		private var m_ballAngle:Number = 0;
		private var m_ballSpeed:Number = 0;
		private var m_isSkip:Boolean;
		
		public function PongBall(x:int, y:int, speed:int) 
		{
			super( x, y, m_padTexture );
			m_ballSpeed = speed;
			ResetVelocity( 360 );
			m_isSkip = false;
		}
		
		public function GetRandom( min:Number, max:Number ):Number 
		{
			return min + ( max - min ) * Math.random(); 
		}
		
		override public function update():void
		{			
			if ( m_isSkip )
			{
				m_isSkip = false;
				return;
			}
			
			if ( this.x <= 0 )
			{
				x = 10;
				ResetVelocity( 180 );
			}
			else if ( this.x + width >= FlxG.width )
			{
				x = FlxG.width - width - 10;
				ResetVelocity( 180 );
			}
			
			if ( this.y <= 0 )
			{
				y = 10;
				ResetVelocity( 360 );
			}			
			else if ( this.y + height >= FlxG.height )
			{
				y = FlxG.height - height - 10;
				ResetVelocity( 360 );
			}	
		}
		
		private function ResetVelocity(maxAngle:int):void
		{
			//FlxG.play( HitSnd );
			m_isSkip = true;
			m_ballAngle = ( maxAngle - m_ballAngle ) % 360;
			velocity.y = Math.sin( m_ballAngle * Math.PI / 180 ) * m_ballSpeed;
			velocity.x = Math.cos( m_ballAngle * Math.PI / 180 ) * m_ballSpeed;
		}
		
		public function onPadCollision(pad:PongPad):void 
		{
			if (x < 100) 
			{
				if ( !pad.m_isAi )
				{
					if ( FlxG.keys.UP )
					{
						m_ballAngle = ( m_ballAngle - 15 ) % 360;
						m_ballSpeed += 20;
					}
					else if ( FlxG.keys.DOWN )
					{
						m_ballAngle = ( m_ballAngle + 15 ) % 360;
						m_ballSpeed += 20;
					}
				}
			}
			ResetVelocity( 180 );
		}
	}
	
}