package Pong
{
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
		
		public var m_bottom:int = FlxG.height;
		
		public function PongBall(x:int, y:int, speed:int, rotation:int = 0, isSetRandom:Boolean = true) 
		{
			super( x, y, m_padTexture );
			m_ballSpeed = speed;	
			m_isSkip = false;
			
			if ( isSetRandom )
			{
				ResetVelocity( 360 );
			}
			else
			{
				m_ballAngle = ( rotation - 15 ) % 360;;
				velocity.y = Math.sin( m_ballAngle * Math.PI / 360 ) * m_ballSpeed;
				velocity.x = Math.cos( m_ballAngle * Math.PI / 360 ) * m_ballSpeed;
			}
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
			
			RestrictToScreen();
		}		
		
		public function RestrictToScreen():void 
		{
			if ( this.x < 0 )
			{
				x = 1;
				ResetVelocity( 180 );
			}
			else if ( this.x + width >= FlxG.width )
			{
				x = FlxG.width - width - 1;
				ResetVelocity( 180 );
			}
			
			if ( this.y < 0 )
			{
				y = 1;
				ResetVelocity( 360 );
			}			
			else if ( this.y + height >= m_bottom )
			{
				y = FlxG.height - height - 1;
				ResetVelocity( 360 );
			}	
		}
		
		public function ResetVelocity(maxAngle:int):void
		{
			//FlxG.play( HitSnd );
			m_isSkip = true;
			m_ballAngle = ( maxAngle - m_ballAngle ) % 360;
			velocity.y = Math.sin( m_ballAngle * Math.PI / 180 ) * m_ballSpeed;
			velocity.x = Math.cos( m_ballAngle * Math.PI / 180 ) * m_ballSpeed;
		}
		
		public function onPadCollision(pad:PongPad):void 
		{
			if ( x < 100 ) 
			{
				if ( !pad.m_isAi )
				{
					this.x = pad.x + pad.width + 1;
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
			
			if ( pad.m_isAi )
			{
				this.x = pad.x - width - 1;
			}
			else
			{
				this.x = pad.x + pad.width + 1;
			}
			ResetVelocity( 180 );
		}
	}
	
}