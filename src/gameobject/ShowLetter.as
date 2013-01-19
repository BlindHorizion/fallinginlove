package gameobject 
{
	import flash.display.MovieClip;
	
	public class ShowLetter
	{
		protected var m_pAsset:MovieClip;
		public function get asset()	: MovieClip 	{ return m_pAsset; }
		
		public function get letter()				: String 	{ return m_pAsset.currentFrameLabel; }
		public function set alpha(a:Number)			: void 		{ m_pAsset.alpha = a; }
		public function set owned(value:Boolean) 	: void 		{ if (value) { alpha = 1; } else { alpha = 0.5; } }
		public function set x(x:Number)				: void 		{ m_pAsset.x = x; }
		public function set y(y:Number)				: void 		{ m_pAsset.y = y; }
		public function get width()					: Number 	{ return m_pAsset.width; }
		
		public function ShowLetter(letter:String)
		{
			m_pAsset = new mc_letters();
			m_pAsset.gotoAndStop( letter );
			
			y = 25;
			owned = false;
		}
	}

}