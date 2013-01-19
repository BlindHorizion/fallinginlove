package states 
{
	import game.Globals;
	import utils.LayerManager;
	
	public class StateManager 
	{
		public static const TITLE:int = 0, GAME:int = 1, END:int = 2;
		
		private static var m_gameStates:Array;
		private static var m_index:int;
		
		public static function get state(): State { return m_gameStates[m_index]; }
		public static function init( ):void
		{
			m_gameStates = new Array();
			m_gameStates[TITLE] = new TitleState();
			m_gameStates[GAME] = new GameState();
			m_gameStates[END] = new EndState();
			m_index = GAME;

			LayerManager.addToLayer(state.asset, Globals.STATE_LAYER);
		}
		
		public static function goToNext( ): void
		{
			LayerManager.removeFromParent(state.asset);
			m_index++;
			if (m_index >= m_gameStates.length) { m_index = 0; }
			LayerManager.addToLayer(state.asset, Globals.STATE_LAYER);
		}
		
		public static function goToState(stateIndex:int): void
		{
			if ( state.asset )
			{
				state.exit();
				LayerManager.removeFromParent(state.asset);
			}
			m_index = stateIndex;
			if ( state.asset )
			{
				LayerManager.addToLayer(state.asset, Globals.STATE_LAYER);
			}
		}
	}

}