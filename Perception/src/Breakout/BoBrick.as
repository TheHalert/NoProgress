package Breakout 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BoBrick extends FlxSprite
	{
		public var m_ID:int;
		
		//private var m_ball:boba
		public function BoBrick( id:int, posX:int, posY:int, w:int, h:int, col:uint ) 
		{
			super( posX, posY );
			this.makeGraphic( w, h, col );
			exists = true;
			m_ID = id;
		}
		
		override public function update():void
		{
		//	super.update();			
		}
	}

}