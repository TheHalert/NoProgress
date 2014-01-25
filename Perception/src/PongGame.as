package  
{
	import flash.automation.KeyboardAutomationAction;
	import Pong.*;
	import org.flixel.*;
	/**

	 * ...
	 * @author Steven
	 */
	public class PongGame extends FlxState
	{
		private var m_playerPad:PongPad;
		private var m_aiPad:PongPad;
		private var m_ball:PongBall;
		
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
			if ( m_ball.overlaps( m_playerPad ) )
			{
				m_ball.onPadCollision( m_playerPad );
			}
			else if ( m_ball.overlaps( m_aiPad ) )
			{
				m_ball.onPadCollision( m_aiPad );
			}

			super.update();
		}
		
	}

}