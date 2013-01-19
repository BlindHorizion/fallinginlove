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
			//playButton.addEventListener(MouseEvent.CLICK, onPlayClick);
		}
		
		private function onPlayClick(e:MouseEvent):void
		{
			StateManager.goToState(StateManager.GAME);
		}
	}

}