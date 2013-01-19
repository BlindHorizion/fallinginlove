package gameobject 
{
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class Letter extends GameObject
	{
		private var m_letter:String;
		
		public function Letter() 
		{
			super( mc_letter() );
			m_pAsset.gotoAndStop( 1 );
		}
		
	}

}