package game 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import gameobject.*
	import states.EndState;
	import states.GameState;
	import states.StateManager;
	import utils.LayerManager;
	
	public class GUI
	{
		public static const MAX_HEALTH:int = 5;
		public static const DAMAGE:int = 1;
		
		protected var m_pAsset:MovieClip;
		public function get asset()	: MovieClip 	{ return m_pAsset; }
		private var m_neededLetters:Array;
		private var m_currentLetters:Array;
		private var m_health:int;
		
		public function GUI() 
		{
			m_pAsset = new mc_gui();
			LayerManager.addToLayer( m_pAsset, Globals.GUI_LAYER );
			m_pAsset.x = 15;
			m_pAsset.y = 15;
			
			m_health = MAX_HEALTH;
			m_neededLetters = new Array();
			m_currentLetters = new Array();
			//pauseButton.addEventListener(MouseEvent.CLICK, onPlayClick);
		}
		
		public function setWord( word:String ):void
		{
			m_currentLetters = new Array();
			if (m_currentLetters != null && m_currentLetters.length > 0) {
				for each (var lttr:ShowLetter in m_currentLetters)
				{
					m_pAsset.removeChild(lttr.asset);
				}
			}

			m_neededLetters = new Array();
			for (var i:int = 0; i < word.length; i++)
			{
				var sLetter:ShowLetter = new ShowLetter(word.charAt( i ));
				var spaceOver:Number = sLetter.width + 2;
				sLetter.x = m_pAsset.x + 300 + (spaceOver * (i));
				
				m_neededLetters.push(sLetter); m_pAsset.addChild(sLetter.asset);
			}
			

		}
		
		public function checkLetter( letter:String ):void
		{
			if (m_neededLetters != null && m_neededLetters.length > 0)
			{
				var letterToCheck:ShowLetter = m_neededLetters[0];
				if (letterToCheck.letter == letter) {
					letterToCheck.owned = true;
					m_currentLetters.push(letterToCheck);
					m_neededLetters.splice(0, 1);
					
					if (m_neededLetters.length == 0) {
						( StateManager.state as GameState ).nextLevel();
					}
				} else {
					damage();
				}
			}
		}
		
		public function damage():void
		{
			m_health -= DAMAGE;
			if (m_health < 0) {
				//die
				StateManager.goToState(StateManager.END);
				(StateManager.state as EndState).init(false);
			}
		}
		
		private function onPauseClick(e:MouseEvent):void
		{
			//Pause
			(m_pAsset.parent as GameState).pause();
		}
	}

}