package gameobject 
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	import game.Globals;
	import utils.LayerManager;
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class GameObject 
	{
		protected var m_pAsset:MovieClip;
		protected var m_velocity:Point;
		
		public function GameObject( asset:MovieClip ) 
		{
			m_pAsset = asset;
			if ( m_pAsset )
			{
				LayerManager.addToLayer( m_pAsset, Globals.OBJECT_LAYER );
			}
			
			init();
		}
		
		public function init():void
		{
			// stub
		}
		
	}

}