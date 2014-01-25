package  Pong 
{
	import flash.automation.KeyboardAutomationAction;
	import Pong.*;
	import org.flixel.*;
	import SpaceInvader.InvaderGame;
	/**

	 * ...
	 * @author Steven
	 */
	public class PongGame extends FlxState
	{
		private var m_playerPad:PongPad;
		private var m_aiPad:PongPad;
		private var m_ball:PongBall;
		private var m_bullets:PongBulletManager;
		
		public var m_playerScore:int = 0;
		public var m_aiScore:int = 0;
		public var m_playerText:FlxText;
		public var m_aiText:FlxText;
		
		public function PongGame() 
		{
		}
	
		public override function create():void
		{
			m_playerPad = new PongPad( 20, FlxG.height / 2, false );
			add( m_playerPad );
			
			m_aiPad = new PongPad( FlxG.width - 20, FlxG.height / 2, true );
			add( m_aiPad );
			
			m_ball = new PongBall( FlxG.width / 2, FlxG.height / 2, 150 );
			add( m_ball );
			
			m_bullets = new PongBulletManager( 40 );
			add( m_bullets );
			
			// setup ui
			var fontSize:Number = 42;
			m_playerText = new FlxText( 100, 40, fontSize, m_playerScore.toString() ).setFormat( null, fontSize ); // , 0x263332, null, 128, "center");
			m_aiText = new FlxText( FlxG.width - 100, 40, fontSize, m_aiScore.toString() ).setFormat( null, fontSize ); // , 0x263332, null, 128, "center");
			add( m_playerText );
			add( m_aiText );
			super.create()
		}
		
		public override function update():void 
		{	
			if ( FlxG.keys.SPACE )
			{
				m_bullets.fire( m_playerPad.x, m_playerPad.getMidpoint().y - 5, 400 );
			}
			
			if ( m_ball.overlaps( m_playerPad ) )
			{
				m_ball.onPadCollision( m_playerPad );
			}
			else if ( m_ball.overlaps( m_aiPad ) )
			{
				m_ball.onPadCollision( m_aiPad );
			}

			if ( FlxG.overlap( m_aiPad, m_bullets, m_aiPad.onBulletCollision ) )
			{
				m_playerScore++;
				m_playerText.text = m_playerScore.toString();
				if ( m_playerScore >= 10 )
				{
					var ending:Ending = new Ending(true, new SpaceInvader.InvaderGame());
					add(ending);
				}
			}
				
			super.update();
		}
		
	}

}