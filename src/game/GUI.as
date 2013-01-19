package game 
{
	import flash.display.MovieClip;
	import gameobject.*
	import utils.LayerManager;
	
	public class GUI extends GameObject
	{
		public static const MAX_HEALTH:int = 100;
		public static const DAMAGE:int = 10;
		
		private var m_neededLetters:Array;
		private var m_currentLetters:Array;
		private var m_health:int;
		
		public function GUI() 
		{
			m_health = MAX_HEALTH;
			m_neededLetters = new Array();
		}
		
		public function setWord( word:String ):void
		{
			if (m_currentLetters != null && m_currentLetters.length > 0) {
				for each (var lttr:ShowLetter in m_currentLetters
			}
			var spaceOver:Number = sLetter.width + 2;
			m_neededLetters = new Array();
			for (var i:int = 0; i < word.length; i++)
			{
				var sLetter:ShowLetter = new ShowLetter(word[i]);
				sLetter.x = LayerManager.stage.stageWidth - (spaceOver * (i + 1));
				
				m_neededLetters.push(sLetter); m_pAsset.addChild(sLetter);
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
						// next word?
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
			}
		}
	}

}