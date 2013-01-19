package states 
{
	/**
	 * ...
	 * @author ...
	 */
	public class EndState extends State 
	{
		
		public function EndState() 
		{
			//playButton.addEventListener(MouseEvent.CLICK, onPlayClick);
		}
		
		private function onPlayClick(e:MouseEvent):void
		{
			StateManager.goToState(StateManager.GAME);
		}
	}

}