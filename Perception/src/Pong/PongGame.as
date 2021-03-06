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
		[Embed(source = "/image/centerline.png")] private var m_lineTexture:Class;
		[Embed(source = '../audio/cannon.mp3')] private var cannon:Class;
		
		private var m_playerPad:PongPad;
		private var m_aiPad:PongPad;
		private var m_ball:PongBall;
		private var m_bullets:PongBulletManager;
		private var m_line:FlxSprite;
		
		public var m_playerScore:int = 0;
		public var m_aiScore:int = 0;
		public var m_playerText:FlxText;
		public var m_aiText:FlxText;
		private var lastshot:Number;	
		
		private var m_pauser:Pauser;
		
		public function PongGame() 
		{
		}
	
		public override function create():void
		{
			m_pauser = new Pauser( this );
			
			m_line = new FlxSprite( 0, 0, m_lineTexture );
			m_line.x = ( FlxG.width / 2 ) - ( m_line.width / 2 );
			add( m_line );
			
			m_playerPad = new PongPad( 20, FlxG.height / 2, false );
			add( m_playerPad );
			
			m_aiPad = new PongPad( FlxG.width - 20, FlxG.height / 2, true );
			add( m_aiPad );
			
			m_ball = new PongBall( FlxG.width / 2, FlxG.height / 2, 180, 315 );
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
			lastshot = new Date().time;
		}
		
		public override function update():void 
		{	
			m_pauser.update();
			if ( m_pauser.IsPaused )
			{
				return;
			}
			
			if ( FlxG.keys.SPACE && new Date().time - lastshot > 400 )
			{
				m_bullets.fire( m_playerPad.x, m_playerPad.getMidpoint().y - 5, 400 );
				lastshot = new Date().time;
				FlxG.play(cannon);
			}
			m_aiPad.y = m_ball.m_ballpointforbat;
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
				if ( m_playerScore >= 3 )
				{
					var ending:Ending = new Ending(true, new SpaceInvader.InvaderGame());
					add(ending);
				}
			}
				
			super.update();
		}
		
	}

}