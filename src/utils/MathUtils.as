package utils 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class MathUtils 
	{
		public static function vectorSubtract( p1:Point, p2:Point ):Point
		{
			return new Point( p2.x - p1.x, p2.y - p1.y );
		}
		
		public static function vectorAdd( p1:Point, p2:Point ):Point 
		{
			return new Point( p2.x + p1.x, p2.y + p1.y );
		}
		
		public static function vectorNormalize( p1:Point ):Point 
		{
			var newPoint:Point = new Point();
			
			var mag : Number = Math.sqrt(p1.x * p1.x + p1.y * p1.y);
			if (mag == 0)
			{
				newPoint = 0;
				newPoint = 0;
			}
			else
			{
				newPoint.x = p1.x / mag;
				newPoint.y = p1.y / mag;
			}
			
			return newPoint;
		}
		
		public static function vectorMultiply( p1:Point, scalar:Number ):Point
		{
			return new Point( p1.x * scalar, p1.y * scalar );
		}
	}

}