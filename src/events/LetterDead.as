package events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class LetterDead extends Event 
	{
		public static const LETTER_DEAD:String = "letter_dead";
		
		public function LetterDead() 
		{ 
			super(LETTER_DEAD, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new LetterDead();
		} 
		
		public override function toString():String 
		{ 
			return formatToString("LetterDead", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}