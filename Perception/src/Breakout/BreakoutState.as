package Breakout 
{
	import flash.automation.KeyboardAutomationAction;
	import org.flixel.*;
	import Mainmenu;
	
	/**
	 * ...
	 * @author Kenji
	 */
	public class BreakoutState extends FlxState
	{
		private const _BRICK_LINES = 4;
		private var m_pad:BoPad;
		private var m_ball:BoBall;
		private var m_topBricks:FlxGroup;
		private var m_mirrorBlocks:FlxGroup;		
		private var m_worldBoundAtStart:FlxRect;
		[Embed(source = "/audio/ding.mp3")] private var dingsound:Class;
		public function BreakoutState() 
		{
			
		}
		
		public override function create():void
		{
			m_pad = new BoPad( FlxG.width / 2, FlxG.height - 100, 400 );
			add( m_pad );
			
			m_ball = new BoBall( FlxG.width / 2, FlxG.height / 2, 300, -15 );
			m_ball.ResetVelocity( 360 );
			add( m_ball );
					
			var brickWidth = 80;
			var brickHeight = 20;
			var numCols = FlxG.width / brickWidth;
			
			m_topBricks = new FlxGroup( numCols * _BRICK_LINES );
			m_mirrorBlocks = new FlxGroup( numCols * _BRICK_LINES );
			var mirrorGap = 60;
			var blockOffset = 16;
			
			for ( var ii = 0; ii < numCols; ++ii )
			{
				for ( var kk = 0; kk < _BRICK_LINES; ++kk )
				{
					var xPos = ii * ( brickWidth + 1 ) + 3;
					var yPos = ( kk * ( brickHeight + 1 ) ) + blockOffset;
					var id = ( ii * numCols ) + kk;
					var col = ( 0x2EF8E300 ) *  ( kk + 1 );
					m_topBricks.add( new BoBrick( id, xPos, yPos, brickWidth, brickHeight, col ) );
					
					yPos = FlxG.height + mirrorGap + ( ( _BRICK_LINES - 1 - kk ) * ( brickHeight + 1 ) ) + blockOffset;
					m_mirrorBlocks.add( new BoBrick( id, xPos, yPos, brickWidth, brickHeight, col ) );
				}
			}
			
			add( m_topBricks );
			add( m_mirrorBlocks );
			
			m_worldBoundAtStart = FlxG.worldBounds;
			var bottom = FlxG.height + mirrorGap + ( ( _BRICK_LINES ) * ( brickHeight + 1 ) ) + blockOffset;
			FlxG.worldBounds = new FlxRect( 0, 0, FlxG.width, bottom ); //FlxG.height + 520 );
			m_ball.m_bottom = bottom;
			super.create();
		}
	
		public override function update():void 
		{
			if ( m_ball.overlaps( m_pad ) )
			{
				m_ball.onCollisionWithPad( m_pad );
			}
			
			if ( FlxG.overlap( m_ball, m_topBricks, this.onBallToBrickCollision ) )
			{
			
			}
			
			if ( FlxG.overlap( m_ball, m_mirrorBlocks, this.onBallToMirrorBrickCollision ) )
			{			
				if ( m_topBricks.countLiving() == 0 )
				{
					// reset world bounds
					FlxG.worldBounds = m_worldBoundAtStart;
					var ending:Ending = new Ending( true, new Mainmenu );
					add( ending );
				}
			}
			super.update();
		}
		
		public function onBallToBrickCollision( ball:BoBall, brick:BoBrick )
		{
			m_ball.y = brick.y + brick.height + 1;
			m_ball.velocity.y *= -1;
			
			//m_ball.ResetVelocity( 360 );
		}
		
		public function onBallToMirrorBrickCollision( ball:BoBall, brick:BoBrick )
		{
			for each ( var b:BoBrick in m_topBricks.members ) 
			{
				if ( b.m_ID == brick.m_ID )
				{
					b.kill();
				}
			}
			
			brick.kill();
			//m_ball.velocity.y *= -1;
			m_ball.ResetVelocity( 360 );
			FlxG.play(dingsound);
		}
	}

}