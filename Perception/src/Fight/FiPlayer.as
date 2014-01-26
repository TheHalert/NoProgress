package Fight 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class FiPlayer extends FlxSprite
	{
		[Embed(source = "/image/sword_1.png")] private var m_texture1:Class;
		[Embed(source = "/image/sword_2.png")] private var m_texture2:Class;
		private var m_speed:int;
		public var m_isEnd:Boolean;
		public var m_isStop:Boolean;
		public var swingtime:Number;
		private var m_targetX:int;
		
		public function FiPlayer( posX:int, speed:int ) 
		{
			super( posX, 0, m_texture1 );
			m_speed = speed;
			maxVelocity.x = speed;
			this.y = FlxG.height - height - 80;
			m_isStop = false;
			m_isEnd = false;
			swingtime = 0;
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
			if (swingtime != 0 && new Date().time - swingtime > 250) {
				loadGraphic(m_texture1);
			}
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
			
			//super.update();
		}
		public function swing() {
			loadGraphic(m_texture2);
			swingtime = new Date().time;
		}

		public function setupEnd():void
		{
			m_isEnd = true
			m_targetX = ( FlxG.width / 2 ) - width - 15;
			this.x = 0;
			velocity.x = m_speed;
			//if ( this.x < m_targetX )
			//{
			//	velocity.x = Math.abs( m_speed );
			//}
			//else 
			//{
			//	velocity.x = -Math.abs( m_speed );
			//}
		}
		
		private function UpdateEnd():void
		{
			if ( this.x >= m_targetX )
			{
				this.x = m_targetX;
				velocity.x = 0;			
				m_isStop = true;
				return;
			}
			
			//velocity.x = m_speed;
		}
		public function playerhitenemy(player:FiPlayer, enemy:FiEnemy):void {
			enemy.kill();
		}
	}

}