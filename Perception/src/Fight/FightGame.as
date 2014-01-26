package Fight 
{
	import Breakout.BreakoutState;
	import flash.automation.KeyboardAutomationAction;
	import flash.display.BitmapData;
	import org.flixel.*;
	import Mainmenu;
	
	/**
	 * ...
	 * @author ...
	 */
	public class FightGame extends FlxState
	{
		private var m_player:FiPlayer;
		[Embed(source = "/image/ground.png")] private var groundimage:Class;
		[Embed(source = "/audio/sword.mp3")] private var swordsound:Class;
		private var enemies:FlxGroup= new FlxGroup();
		private var lastspawn:Number;
		private const _SECONDS_TO_COMPLETE:int = 10;
		private var m_isEnd:Boolean;
		private var ground:FlxSprite;
		private var lastswing:Number;
		private var m_pauser:Pauser;
		
		public function FightGame() 
		{
			
		}
		
		public override function create():void
		{
			FlxG.bgColor = 0xFF3BB9FF;
			m_isEnd = false;
			ground = new FlxSprite(0, FlxG.height - 80, groundimage);
			add(ground);
			m_player = new FiPlayer( 50, 180 );
			add( m_player );
			lastspawn = new Date().time;
			lastswing = lastspawn;
			add(enemies);
			
			m_pauser = new Pauser( this );
		}
		
		public override function update():void 
		{
			m_pauser.update();
			if ( m_pauser.IsPaused )
			{
				return;
			}
			
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
					var ending:Ending = new Ending( true, new BreakoutState );
					add( ending );
					m_player.setupEnd();
					m_enemy.Setupend();
					m_isEnd = true;
				}
			}
			if ( FlxG.keys.SPACE && !m_player.m_isEnd && new Date().time - lastswing > 500)
			{
				FlxG.play(swordsound);
				m_player.swing();
				lastswing = new Date().time;
				FlxG.overlap(m_player, enemies, m_player.playerhitenemy);
			}
			if (new Date().time - lastspawn > 0 && !m_player.m_isEnd) {
				var newenemy:FiEnemy = new FiEnemy( FlxG.width - 10, 80, -80 );
				enemies.add( newenemy );
				lastspawn = new Date().time + Tools.getRandomBetween(500, 4000);
			}
		
		}

	}

}