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
	
		private var enemies:FlxGroup= new FlxGroup();
		private var lastspawn:Number;
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
			lastspawn = new Date().time;
			add(enemies);
		}
		
		public override function update():void 
		{
			
				super.update();
			
			
			if (!m_isEnd  )
			{
				var endingreach:Boolean = false;
				var m_enemy:FiEnemy;
				for (var i:int = 0; i < enemies.length; i++)
				{
					m_enemy = enemies.members[i];
					if (m_enemy.x <= 0){
						endingreach = true;
						break;
					}
				}
				if(endingreach){
					var ending:Ending = new Ending( true, new Mainmenu );
					add( ending );
					m_player.setupEnd();
					m_enemy.Setupend();
					m_isEnd = true;
				}
			}
			if ( FlxG.keys.SPACE && !m_player.m_isEnd )
			{
				FlxG.overlap(m_player, enemies, m_player.playerhitenemy);
			}
			if (new Date().time - lastspawn > 0) {
				var newenemy:FiEnemy = new FiEnemy( FlxG.width - 10, 80, -80 );
				enemies.add( newenemy );
				lastspawn = new Date().time + Tools.getRandomBetween(500, 4000);
			}
		
		}
	}

}