package states 
{
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class TitleState extends State 
	{
		
		public function TitleState() 
		{
			super(null);
		}
		
		override public function enter():void
		{
			//playButton.addEventListener(MouseEvent.CLICK, onPlayClick);
		}
		
		override public function exit():void
		{
			
		}
		
		private function onPlayClick(e:MouseEvent):void
		{
			StateManager.goToState(StateManager.GAME);
		}
	}

}