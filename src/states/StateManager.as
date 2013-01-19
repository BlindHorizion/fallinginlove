package states 
{
	import game.Globals;
	import utils.LayerManager;
	
	public class StateManager 
	{
		public static const TITLE:int = 0, GAME:int = 1, END:int = 2;
		
		private static var gameStates:Array;
		private static var index:int;
		
		public static function init( ):void
		{
			gameStates = new Array();
			gameStates[TITLE] = new TitleState();
			gameStates[GAME] = new GameState();
			gameStates[END] = new EndState();
			index = TITLE;
			LayerManager.addToLayer(gameStates[index], Globals.STATE_LAYER);
		}
		
		public static function goToNext( ): void
		{
			LayerManager.removeFromParent(gameStates[index]);
			index++;
			if (index >= gameStates.length) { index = 0; }
			LayerManager.addToLayer(gameStates[index], Globals.STATE_LAYER);
		}
		
		public static function goToState(stateIndex:int): void
		{
			LayerManager.removeFromParent(gameStates[index]);
			index = stateIndex;
			LayerManager.addToLayer(gameStates[index], Globals.STATE_LAYER);
		}
	}

}