package utils 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class LayerManager 
	{
		private static var m_layerDictionary:Dictionary;
		private static var m_stage:Stage;
		public static function get stage():Stage { return m_stage; }
		
		public static var stageHeight:Number;
		public static var stageWidth:Number;
		
		public static function init( stage:Stage ):void
		{
			m_layerDictionary = new Dictionary();
			m_stage = stage;
			stageWidth = m_stage.stageWidth;
			stageHeight = m_stage.stageHeight;
		}
		
		public static function addLayer( layerName:String ):void
		{
			m_layerDictionary[ layerName ] = new Sprite();
			stage.addChild( m_layerDictionary[ layerName ] );
		}
		
		public static function removeLayer( layerName:String ):void
		{
			m_layerDictionary[ layerName ] = null;
			stage.removeChild( m_layerDictionary[ layerName ] );
		}
		
		public static function addToLayer( assetToAdd:DisplayObject, layerToAddTo:String ):void
		{
			if ( m_layerDictionary[ layerToAddTo ] )
			{
				m_layerDictionary[ layerToAddTo ].addChild( assetToAdd );
			}
		}
		
		public static function removeFromParent( assetToRemove:DisplayObject ):void
		{
			assetToRemove.parent.removeChild( assetToRemove );
		}
	}

}