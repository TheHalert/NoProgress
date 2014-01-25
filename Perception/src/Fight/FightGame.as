package Fight 
{
	import flash.automation.KeyboardAutomationAction;
	import org.flixel.*;
	import Mainmenu;
	
	/**
	 * ...
	 * @author ...
	 */
	public class FightGame extends FlxState
	{
		private var m_player:FiPlayer;
		private var m_enemy:FiEnemy;
		private const _SECONDS_TO_COMPLETE:int = 10;
		private var m_isEnd:Boolean;
		
		public function FightGame() 
		{
			
		}
		
		public override function create():void
		{
			m_isEnd = false;
			m_player = new FiPlayer( 50, 180 );
			add( m_player );
			
			m_enemy = new FiEnemy( FlxG.width - 10, 80, -80 );
			add( m_enemy );
		}
		
		public override function update():void 
		{
			if ( FlxG.keys.SPACE && !m_player.m_isEnd )
			{
				if ( m_player.overlaps( m_enemy ) )
				{
					m_enemy.x = FlxG.width;
					m_enemy.LifeTime = 0;
					FlxG.shake();
				}
			}
			
			if ( !m_isEnd )
			{
				if ( m_enemy.LifeTime >= FlxG.framerate * _SECONDS_TO_COMPLETE )
				{
					var ending:Ending = new Ending( true, new Mainmenu );
					add( ending );
					m_player.setupEnd();
					m_enemy.Setupend();
					m_isEnd = true;
				}
			}
			super.update();
		}
	}

}