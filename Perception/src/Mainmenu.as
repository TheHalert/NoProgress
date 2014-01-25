package  
{
	import Astroid.AstroidGame;
	import Breakout.BreakoutState;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import org.flixel.*;
	import flash.display.StageDisplayState;
	import SpaceInvader.InvaderGame;
	import Pong.PongGame;
	import Breakout.BreakoutState;
	
	/**
	 * ...
	 * @author Steven
	 */
	public class Mainmenu extends FlxState
	{
		public var startbuttonpong:FlxButton;
		public var startbuttoninvader:FlxButton;
		public var startbuttonastroid:FlxButton;
		public var startbuttonbreakout:FlxButton;
		public function Mainmenu() 
		{
			
		}
		override public function create():void {
			super.create();
			FlxG.mouse.show();
				FlxG.stage.addEventListener(KeyboardEvent.KEY_DOWN, downkey);
			//make browers take full window for the game
			FlxG.width = FlxG.stage.stageWidth / FlxCamera.defaultZoom;
            FlxG.height = FlxG.stage.stageHeight / FlxCamera.defaultZoom;
			FlxG.resetCameras(new FlxCamera(0, 0, FlxG.width, FlxG.height));
			//invader button
			startbuttoninvader = new FlxButton(0, 0, "Start invader" , startgameinvader);
			startbuttoninvader.x = FlxG.width / 2 - startbuttoninvader.width * 2;
			startbuttoninvader.y = FlxG.height / 2 - startbuttoninvader.height / 2;
			add(startbuttoninvader);
			//the pong button
			startbuttonpong = new FlxButton(0, 0, "Start pong" , startgamepong);
			startbuttonpong.x = FlxG.width / 2 - startbuttonpong.width / 2 ;
			startbuttonpong.y = FlxG.height / 2 - startbuttonpong.height / 2;
			add(startbuttonpong);
			
				startbuttonastroid = new FlxButton(0, 0, "Start Astroid" , stargameastroid);
			startbuttonastroid.x = FlxG.width / 2 - startbuttonastroid.width *4 ;
			startbuttonastroid.y = FlxG.height / 2 - startbuttonastroid.height / 2;
			add(startbuttonastroid);
			
			// breakout button
			startbuttonbreakout = new FlxButton( 0, 0, "Start Breakout", startbreakoutgame );
			startbuttonbreakout.x = startbuttonpong.x + startbuttonpong.width + 40;
			startbuttonbreakout.y = FlxG.height / 2 - startbuttonbreakout.height / 2;
			add( startbuttonbreakout );
		}
		public function startgameinvader():void {
			//hide mouse and switch state
		    FlxG.mouse.hide();
			FlxG.switchState(new  InvaderGame);
		}
		public function stargameastroid():void {
			//hide mouse and switch state
		    FlxG.mouse.hide();
			FlxG.switchState(new  AstroidGame);
		}
		public function startgamepong():void {
			//hide mouse and switch state
			FlxG.mouse.hide();
			FlxG.switchState(new PongGame);
		}
		public function startbreakoutgame():void {
			//hide mouse and switch state
			FlxG.mouse.hide();
			FlxG.switchState(new BreakoutState );
		}
		private function downkey(e:KeyboardEvent = null):void {
			//if F is press togglefullscreen
			if (FlxG.keys.justPressed("F")){
				//toggle_fullscreen();
				
			}
		}
		
        // By default, it will go to fullscreen if windowed, and windowed if fullscreen
        // Use the Force parameter to force it to go to a specific mode
        private function toggle_fullscreen(ForceDisplayState:String=null):void {
 
            // 1. Change the size of the Flash window to fullscreen/windowed
            //    This is easily done by checking stage.displayState and then setting it accordingly
            if (ForceDisplayState) {
                FlxG.stage.displayState = ForceDisplayState;
            } else {
                if (FlxG.stage.displayState == StageDisplayState.NORMAL) {
                    FlxG.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
                } else {
                    FlxG.stage.displayState = StageDisplayState.NORMAL;
                }
            }
 
            // The next function contains steps 2-4
            window_resized();
        }
 
        // This is called every time the window is resized
        // It's a separate function than toggle_fullscreen because we want to call it when the window
        // size changed even if the user didn't click the fullscreen button (eg by pressing escape to exit fullscreen mode)
        private function window_resized(e:Event = null):void {
 
            // 2. Change the size of the Flixel game window
            //    We already changed the size of the Flash window, so now we need to update Flixel.
            //    Just update the FlxG dimensions to match the new stage dimensions from step 1
            FlxG.width = FlxG.stage.stageWidth / FlxCamera.defaultZoom;
            FlxG.height = FlxG.stage.stageHeight / FlxCamera.defaultZoom;
 
            // 3. Change the size of the Flixel camera
            //    Lastly, update the Flixel camera to match the new dimensions from the previous step
            //    This is so that the camera can see all of the freshly resized dimensions
            FlxG.resetCameras(new FlxCamera(0, 0, FlxG.width, FlxG.height));
 
            // 4. Optionally, depening on your game, you may need to update couple more things:
            //    - Reposition / resize things such as the Hud to match the new screen dimensions
            //    - Camera bounds to allow the camera to travel everywhere within the resized dimensions
            //    - World bounds to allow everything to collide within the resized dimensions
            //    - For more information on camera/world bounds/hud positioning check out our other tutorial at
            //              http://www.funstormgames.com/blog/2011/10/flixel-setting-up-game-dimensions-swf-camera-level-hud-mouse/
            //    Anyways, we're just going to update the fullscreen button and dimensions text
			startbuttoninvader.x = FlxG.width / 2 - startbuttoninvader.width / 2;
			startbuttoninvader.y = FlxG.height / 2 - startbuttoninvader.height / 2;
			startbuttonpong.x = FlxG.width / 2 + startbuttonpong.width / 2 ;
			startbuttonpong.y = FlxG.height / 2 - startbuttonpong.height / 2;
		
 
        }
	}

}