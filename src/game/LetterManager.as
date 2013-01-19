package game 
{
	import events.LetterDead;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import gameobject.Letter;
	import utils.LayerManager;
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class LetterManager extends EventDispatcher
	{
		private var m_lettersPerLevel:Vector.<String> = new < String > [ "love", "why", "death" ];
		private var m_letterNameList:Vector.<String> = new < String > 
			["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", 
			"N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
		private var m_currentLetter:String;
		private var m_letterList:Vector.<Letter>;
		private var m_currentLevel:uint = 0;
		
		private var m_currentSpawnTimer:Timer;
		private var m_currentWord:String;
		
		public function get letterList():Vector.<Letter> { return m_letterList; }
		public function get currentLevel():uint { return m_currentLevel; }
		public function set currentLevel( value:uint ):void { m_currentLevel = value; }
		
		public function LetterManager() 
		{
			m_letterList = new Vector.<Letter>();
			m_currentWord = "YOU";
		}
		
		public function start():void
		{
			spawnLetters();
			nextLevel();
		}
		
		public function clear():void
		{
			for each( var letter:Letter in m_letterList )
			{
				//LayerManager.removeFromParent( letter.asset );
				letter.dispatchEvent( new LetterDead() );
			}
		}
		
		public function update():void
		{
			for each( var letter:Letter in m_letterList )
			{
				letter.update( m_letterList );
			}
		}
		
		public function goToNextLevel( currentWord:String ):void
		{
			++m_currentLevel;
			m_currentWord = currentWord;
			nextLevel();
		}
		
		private function nextLevel():void
		{
			if ( m_currentSpawnTimer )
			{
				m_currentSpawnTimer.removeEventListener( TimerEvent.TIMER, spawnLetters );
			}
			
			m_currentSpawnTimer = new Timer( ( 1 / ( m_currentLevel + 1 ) ) * 9000 );
			m_currentSpawnTimer.addEventListener( TimerEvent.TIMER, spawnLetters );
			m_currentSpawnTimer.start();
		}
		
		private function spawnLetters( e:TimerEvent = null ):void
		{
			var numToSpawnPer:uint = ( m_currentLevel + 1 );
			if ( numToSpawnPer < 3 )
			{
				numToSpawnPer = 3;
			}
			var letterToChoose:String;
			trace( "spawning" );
			for ( var i:uint = 0; i < numToSpawnPer; ++i )
			{
				// whether we choose from word is dependent upon how many we spawn
				if( Math.random() > ( 1 / numToSpawnPer ) )
				{
					var indexOfLetter:uint = Math.random() * m_currentWord.length; // TODO: check this
					letterToChoose = m_currentWord.charAt( indexOfLetter );
				}
				else
				{
					var randomIndex:uint = Math.random() * m_letterNameList.length;
					letterToChoose = m_letterNameList[ randomIndex ];
				}
				var letterToAdd:Letter = new Letter( Math.random() * LayerManager.stage.stageWidth, letterToChoose );
				letterToAdd.addEventListener( LetterDead.LETTER_DEAD, onLetterDead );
				m_letterList.push( letterToAdd );
			}
		}
		
		private function onLetterDead( e:LetterDead ):void
		{
			var currentTargetAsLetter:Letter = e.currentTarget as Letter;
			LayerManager.removeFromParent( currentTargetAsLetter.asset );
			currentTargetAsLetter.removeEventListener( LetterDead.LETTER_DEAD, onLetterDead );
			var indexOfLetter:uint = m_letterList.indexOf( currentTargetAsLetter );
			m_letterList.splice( indexOfLetter, 1 );
		}
		
	}

}