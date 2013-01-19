package states 
{
	import game.Globals;
	import utils.LayerManager;
	
	public class StateManager 
	{
		public static const TITLE:int = 0, GAME:int = 1, END:int = 2;
		
		private static var m_gameStates:Array;
		private static var m_index:int;
		
		public static function init( ):void
		{
			m_gameStates = new Array();
			m_gameStates[TITLE] = new TitleState();
			m_gameStates[GAME] = new GameState();
			m_gameStates[END] = new EndState();
			m_index = TITLE;
			LayerManager.addToLayer(m_gameStates[index], Globals.STATE_LAYER);
		}
		
		public static function goToNext( ): void
		{
			LayerManager.removeFromParent(m_gameStates[index]);
			m_index++;
			if (index >= gameStates.length) { m_index = 0; }
			LayerManager.addToLayer(m_gameStates[m_index], Globals.STATE_LAYER);
		}
		
		public static function goToState(stateIndex:int): void
		{
			LayerManager.removeFromParent(m_gameStates[m_index]);
			m_index = stateIndex;
			LayerManager.addToLayer(m_gameStates[m_index], Globals.STATE_LAYER);
		}
	}

}