package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Pauser
	{
		private var m_pauseText:FlxText;
		private var m_owner:FlxState;
		public var IsPaused:Boolean;
		
		public function Pauser(owner:FlxState) 
		{
			m_owner = owner;
			IsPaused = false;
			var fontSize = 40;
			m_pauseText = new FlxText( ( FlxG.width / 2 ) - ( fontSize * 2 ), FlxG.height / 2, fontSize * 6, "PAUSED" ).setFormat( null, fontSize );
		}
		
		public function update():void
		{
			if ( IsPaused )
			{
				if ( FlxG.keys.justPressed( "ESCAPE" ) )
				{
					IsPaused = false;
					m_owner.remove( m_pauseText );
				}
				return;
			}
			
			if ( FlxG.keys.justPressed( "ESCAPE" ) )
			{
				IsPaused = true;
				m_owner.add( m_pauseText );
				return;
			}
		}
	}

}