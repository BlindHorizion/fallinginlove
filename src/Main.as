package 
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import game.Globals;
	import gameobject.Player;
	import utils.LayerManager;
	
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class Main extends Sprite 
	{
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			init();
			// entry point
		}
		
		private function init():void
		{
			LayerManager.init( stage );
			LayerManager.addLayer( Globals.OBJECT_LAYER );
		}
		
		private function deactivate(e:Event):void 
		{
			// auto-close
			NativeApplication.nativeApplication.exit();
		}
		
	}
	
}