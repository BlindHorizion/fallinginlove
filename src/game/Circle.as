package game 
{
	import flash.display.Graphics;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class Circle 
	{
		private static const CIRCLE_ANGLE:Number = .05;
		
		private var m_radius:uint;
		private var m_position:Point;
		private var m_previousOffset:Number;
		
		public function Circle() 
		{
			m_position = new Point();
			m_radius = 50;
			m_previousOffset = Math.random() * ( Math.PI / 2 ) + Math.PI / 4;
		}
		
		public function update( newPosition:Point ):void
		{
			m_position = newPosition;
		}

		public function getRandomPosition():Point
		{
			var randomAngle:Number = Math.random() * ( CIRCLE_ANGLE * 2 ) - CIRCLE_ANGLE;
			if ( m_previousOffset + randomAngle < ( 3 * Math.PI ) / 4 && m_previousOffset + randomAngle > Math.PI / 4 )
			{
				m_previousOffset += randomAngle;
			}
			
			var xPos:Number = Math.cos( m_previousOffset ) * m_radius + m_position.x;
			var yPos:Number = Math.sin( m_previousOffset ) * m_radius + m_position.y;

			return new Point( xPos, yPos );
		}
		
		public function checkDirection( isLeft:Boolean ):void
		{
			if ( isLeft )
			{
				m_previousOffset = ( 3 * Math.PI ) / 4;
			}
			else
			{
				m_previousOffset = Math.PI / 4;
			}
		}
	}

}