package Pong 
{
	import org.flixel.*;
	import Pong.*;
	/**
	 * ...
	 * @author ...
	 */
	public class PongBulletManager extends FlxGroup
	{
		private var m_maxBullets:int;
		private var m_waitFrame:int;
		private const _BULLET_INTERVAL:int = 12;
		
		public function PongBulletManager(maxBullets:int) 
		{
			super();
            m_maxBullets = maxBullets;
			m_waitFrame = 0;
            for ( var i:int = 0; i < maxBullets; ++i )
            {
                add( new PongBullet );
            }
		}
	
		override public function update():void 
		{
			super.update();
			if ( m_waitFrame > 0 )
			{
				m_waitFrame--;
			}
		}
		
		public function fire(posX:int, posY:int, speedX:int):void
		{
			if ( m_waitFrame > 0 )
			{
				return;
			}
			
			if ( getFirstAvailable() )
			{
				m_waitFrame = _BULLET_INTERVAL;
				PongBullet( getFirstAvailable() ).Start( posX, posY, speedX );
			}
		}
	}

}