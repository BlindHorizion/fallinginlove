package gameobject 
{
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	import game.Globals;
	import utils.LayerManager;
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class GameObject extends EventDispatcher
	{
		protected var m_pAsset:MovieClip;
		public function get asset():MovieClip { return m_pAsset; }
		protected var m_velocity:Point;
		
		public function get width(): Number { return m_pAsset.width; }
		
		public function GameObject( asset:MovieClip ) 
		{
			m_pAsset = asset;
			if ( m_pAsset )
			{
				LayerManager.addToLayer( m_pAsset, Globals.OBJECT_LAYER );
				trace( "created letter" );
			}
			
			init();
		}
		
		public function init():void
		{
			// stub
		}
		
		public function hitTestObject(obj:GameObject):Boolean
		{
			return m_pAsset.hitTestObject(obj.m_pAsset);
		}
	}

}