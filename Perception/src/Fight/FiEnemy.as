package Fight 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class FiEnemy extends FlxSprite
	{
		[Embed(source = "/image/lion_1.png")] private var m_texture1:Class;
		[Embed(source = "/image/goat.png")] private var m_texture2:Class;
		public var LifeTime:int;
		private var m_speed:int;
		private var m_isEnd:Boolean;
		private var m_isStop:Boolean;
		private var m_targetX:int;
		
		public function FiEnemy( posX:int, offsetY:int, speed:int ) 
		{
			var imagetoload:Class;
			if (Tools.getRandomBetween(0, 1) == 1)
				imagetoload = m_texture1;
			else
				imagetoload = m_texture2;
			super( posX, 0, imagetoload );
			this.y = FlxG.height - height - offsetY;
			m_speed = speed;
			//maxVelocity.x = speed;
			velocity.x = speed;
			LifeTime = 0;
			m_isStop = false;
			m_isEnd = false;
		}
		
		override public function update():void 
		{
			if ( m_isEnd )
			{
				if ( !m_isStop )
				{
					UpdateEnd();
				}
				return;
			}
			LifeTime++;
			velocity.x = m_speed;
			 
			//super.update();
		}
		
		public function Setupend():void
		{
			m_isEnd = true
			m_isStop = false;
			m_targetX = ( FlxG.width / 2 );
			this.x = FlxG.width - 1;
			velocity.x = -180; //-( m_speed *  2 );
		}
		
		public function UpdateEnd():void
		{
			if ( this.x <= m_targetX )
			{
				this.x = m_targetX;
				velocity.x = 0;
				m_isStop = true;
			}
		}
	}

}