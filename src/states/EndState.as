package states 
{
	import flash.events.MouseEvent;
	import game.Globals;
	import utils.LayerManager;
	/**
	 * ...
	 * @author ...
	 */
	public class EndState extends State 
	{
		
		public function EndState() 
		{
			super(null);
		}
		
		public function init(won:Boolean):void
		{
			if (won) {
				m_pAsset = new mc_winScreen();
			} else {
				m_pAsset = new mc_loseScreen();
			}
			
			LayerManager.addToLayer( m_pAsset, Globals.STATE_LAYER );
			//playButton.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		override public function enter():void
		{
			//playButton.addEventListener(MouseEvent.CLICK, onPlayClick);
		}
		
		override public function exit():void
		{
			//playButton.removeEventListener(MouseEvent.CLICK, onPlayClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			StateManager.goToState(StateManager.TITLE);
		}
	}

}