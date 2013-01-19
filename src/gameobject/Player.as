package gameobject 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import utils.LayerManager;
	import utils.MathUtils;
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class Player extends GameObject
	{
		private static const SPEED:uint = 50;
		
		private var m_interpolationStartPos:Point;
		private var m_interpolationEndPos:Point;
		public function Player() 
		{
			super( new playerTempo() );
		}
		
		override public function init():void
		{
			LayerManager.stage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseClick );
		}
		
		public function exit():void
		{
			LayerManager.stage.removeEventListener( MouseEvent.MOUSE_MOVE, onMouseClick );
		}
		
		private function interpolate( e:Event ):void
		{
			var wayToGoTo:Point = subtract( new Point( m_pAsset.x, m_pAsset.y ), m_interpolationEndPos );
			var optimalAngle:Number = Math.atan2( wayToGoTo.y, wayToGoTo.x );
			
			m_pAsset.x += SPEED * Math.cos( optimalAngle );
			m_pAsset.y += SPEED * Math.sin( optimalAngle );
			
			if ( ( m_interpolationStartPos.x < m_interpolationEndPos.x && m_pAsset.x >= m_interpolationEndPos.x ) 
				&& ( m_interpolationStartPos.y < m_interpolationEndPos.y && m_pAsset.y >= m_interpolationEndPos.y ) )
			{
				m_pAsset.x = m_interpolationEndPos.x;
				m_pAsset.y = m_interpolationEndPos.y;
				m_pAsset.removeEventListener( Event.ENTER_FRAME, interpolate );
			}
			else if ( ( m_interpolationStartPos.x < m_interpolationEndPos.x && m_pAsset.x >= m_interpolationEndPos.x ) 
				&& ( m_interpolationStartPos.y > m_interpolationEndPos.y && m_pAsset.y <= m_interpolationEndPos.y ) )
			{
				m_pAsset.x = m_interpolationEndPos.x;
				m_pAsset.y = m_interpolationEndPos.y;
				m_pAsset.removeEventListener( Event.ENTER_FRAME, interpolate );
			}
			else if ( ( m_interpolationStartPos.x > m_interpolationEndPos.x && m_pAsset.x <= m_interpolationEndPos.x ) 
				&& ( m_interpolationStartPos.y > m_interpolationEndPos.y && m_pAsset.y <= m_interpolationEndPos.y ) )
			{
				m_pAsset.x = m_interpolationEndPos.x;
				m_pAsset.y = m_interpolationEndPos.y;
				m_pAsset.removeEventListener( Event.ENTER_FRAME, interpolate );
			}
			else if ( ( m_interpolationStartPos.x > m_interpolationEndPos.x && m_pAsset.x <= m_interpolationEndPos.x ) 
				&& ( m_interpolationStartPos.y < m_interpolationEndPos.y && m_pAsset.y >= m_interpolationEndPos.y ) )
			{
				m_pAsset.x = m_interpolationEndPos.x;
				m_pAsset.y = m_interpolationEndPos.y;
				m_pAsset.removeEventListener( Event.ENTER_FRAME, interpolate );
			}
			else if ( MathUtils.vectorDisplacement( m_interpolationStartPos, m_interpolationEndPos ) <= SPEED )
			{
				m_pAsset.x = m_interpolationEndPos.x;
				m_pAsset.y = m_interpolationStartPos.y;
			}
		}
		
		private function onMouseClick( e:MouseEvent ):void
		{
			m_pAsset.removeEventListener( Event.ENTER_FRAME, interpolate );
			var targetAsStage:Stage = e.currentTarget as Stage;
			
			m_interpolationEndPos = new Point( targetAsStage.mouseX, targetAsStage.mouseY );
			m_interpolationStartPos = new Point( m_pAsset.x, m_pAsset. y );
			
			m_pAsset.addEventListener( Event.ENTER_FRAME, interpolate );
			

		}
		
		private function subtract( p1:Point, p2:Point ):Point
		{
			return new Point( p2.x - p1.x, p2.y - p1.y );
		}
	}

}