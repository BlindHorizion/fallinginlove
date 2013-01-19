package gameobject 
{
	public class ShowLetter extends GameObject
	{
		public function get letter()		: String 	{ return m_pAsset.currentFrameLabel; }
		public function set alpha(a:Number)	: void 		{ m_pAsset.alpha = a; }
		
		public function set owned(value:Boolean) : void { if (value) { alpha = 1; } else { alpha = 0.5; } }
		
		public function ShowLetter(letter:String) 
		{
			y = 0;
			owned = false;
		}
	}

}