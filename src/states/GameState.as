package states 
{
	import events.LetterDead;
	import flash.display.MovieClip;
	import flash.events.Event;
	import game.Globals;
	import game.GUI;
	import game.LetterManager;
	import gameobject.Letter;
	import gameobject.Player;
	import utils.LayerManager;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class GameState extends State 
	{
		private var m_player:Player;
		private var pause_mc:MovieClip;
		private var m_paused:Boolean;
		private var m_gui:GUI;
		
		private var m_letterManager:LetterManager;
		
		public function GameState() 
		{
			super( new mc_gameState() );
			m_player = new Player();
			
			//LayerManager.addToLayer(pause_mc = new pause_mc(), Globals.TOP_LAYER);
			
			enter();
		}
		
		override public function enter():void
		{
			m_gui = new GUI();
			m_pAsset.addEventListener( Event.ENTER_FRAME, update );
			m_letterManager = new LetterManager();
			m_gui.setWord(Globals.WORDS[m_letterManager.currentLevel]);
			m_letterManager.start();
			
			unPause();
		}
		
		override public function exit():void
		{
			m_pAsset.removeEventListener( Event.ENTER_FRAME, update );
			m_player.exit();
			LayerManager.removeFromParent(m_gui.asset);
			LayerManager.removeFromParent(m_player.asset);
			m_letterManager.clear();
		}
		
		public function nextLevel():void
		{
			if ( m_letterManager.currentLevel <= Globals.WORDS.length )
			{
				m_letterManager.goToNextLevel(Globals.WORDS[m_letterManager.currentLevel + 1]);
				m_gui.setWord(Globals.WORDS[m_letterManager.currentLevel]);
				
				if ( m_letterManager.currentLevel == 2 )
				{
					StateManager.goToState(StateManager.END);
					(StateManager.state as EndState).init(true);
				}
			}
			else
			{
				StateManager.goToState(StateManager.END);
				(StateManager.state as EndState).init(true);
			}
		}
		
		private function update( e:Event ):void
		{
			m_letterManager.update();
			catchLetters();
		}
		
		public function catchLetters( ):void
		{
			for each (var lttr:Letter in m_letterManager.letterList)
			{
				if (m_player.hitTestObject(lttr))
				{
					trace( lttr.currentLetter );
					m_gui.checkLetter(lttr.currentLetter);
					lttr.dispatchEvent( new LetterDead() );
				}
			}
		}
		
		public function pause():void
		{
			//pause_mc.visible = true;
			m_paused = true;
		}
		
		public function unPause():void
		{
			//pause_mc.visible = false;
			m_paused = false;
		}
	}

}