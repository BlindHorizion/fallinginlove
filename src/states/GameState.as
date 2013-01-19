package states 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import game.Globals;
	import gameobject.Letter;
	import gameobject.Player;
	import utils.LayerManager;
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class GameState extends State 
	{
		private var m_pAsset:MovieClip;
		private var m_letters:Vector.<Letter>
		private var m_player:Player;
		
		public function GameState() 
		{
			m_pAsset = new gameState();
			LayerManager.addToLayer( m_pAsset, Globals.STATE_LAYER );
			m_letters = new Vector.<Letter>();
			m_player = new Player();
			m_pAsset.addEventListener( Event.ENTER_FRAME, update );
			enter();
		}
		
		private function enter():void
		{
			for ( var i:uint = 0; i < 5; ++i )
			{
				m_letters.push( new Letter( i * 30 ) );
			}
		
		}
		
		private function update( e:Event ):void
		{
			for each( var letter:Letter in m_letters )
			{
				letter.update();
			}
		}
		
	}

}