package states 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import game.Globals;
	import gameobject.GameObject;
	import utils.LayerManager;

	public class State
	{
		protected var m_pAsset:MovieClip;
		public function get asset()	: MovieClip 	{ return m_pAsset; }
		
		public function State(aAsset:MovieClip)
		{
			m_pAsset = aAsset;
			if ( m_pAsset )
			{
				LayerManager.addToLayer( m_pAsset, Globals.STATE_LAYER );
			}
		}
		
		public function enter():void
		{
			// override
		}
		
		public function exit():void
		{
			// override
		}
		
		public function addChild(obj:DisplayObject):DisplayObject
		{
			return m_pAsset.addChild(obj);
		}
		
		public function removeChild(obj:DisplayObject):DisplayObject
		{
			return m_pAsset.removeChild(obj);
		}
	}

}