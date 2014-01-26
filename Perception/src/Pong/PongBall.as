package Pong
{
	import flash.events.DRMAuthenticationCompleteEvent;
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class PongBall extends FlxSprite
	{
		[Embed(source = "/image/ball.png")] private var m_texture:Class;
		[Embed(source = "/audio/pong.mp3")] private var pongsound:Class;
		private var m_ballAngle:Number = 0;
		private var m_ballSpeed:Number = 0;
		private var m_isSkip:Boolean;
		private var m_lastcheck:Number;
		public var m_ballpointforbat:Number;
		public var m_bottom:int = FlxG.height;
		
		public function PongBall(x:int, y:int, speed:int, rotation:int = 0) 
		{
			super( x, y, m_texture );
			m_ballSpeed = speed;	
			m_isSkip = false;
			
		
			m_ballAngle = ( rotation ) % 360;;
			velocity.y = Math.sin( m_ballAngle * Math.PI / 360 ) * m_ballSpeed;
			velocity.x = Math.cos( m_ballAngle * Math.PI / 360 ) * m_ballSpeed;
			
			
			
		}
		
		public function GetRandom( min:Number, max:Number ):Number 
		{
			return min + ( max - min ) * Math.random(); 
		}
		
		override public function update():void
		{			
			angle = ( angle += 5 ) % 360;
			if ( m_isSkip )
			{
				m_isSkip = false;
				return;
			}
			if(velocity.y < 0)
				m_ballpointforbat = y + (velocity.y );
			else
				m_ballpointforbat = y - (velocity.y );
			if (m_ballpointforbat < 0)
				m_ballpointforbat =  0;
			else if (m_ballpointforbat >FlxG.height - 40)
				m_ballpointforbat = FlxG.height - 40;
			
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
			FlxG.play(pongsound);
		}
	}
	
}