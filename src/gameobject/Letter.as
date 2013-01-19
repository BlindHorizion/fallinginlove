package gameobject 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class Letter extends GameObject
	{
		private var m_fwd:Point;
		public function Letter() 
		{
			super( mc_letter() );
			m_pAsset.gotoAndStop( "A" );
		}
		
		
		public function update():void
		{
			
		}
		
		private var seek( targPos:Point ):Point
		{
			// set desiredVelocity equal to a vector from position to targPos
			var desVel:Point;
			var steeringForce:Point;
			desVel = Vector2.subtract(targPos, position);
			// scale desired velocity so its magnitude equals max speed
			desVel.normalize( );
			desVel.timesEquals(maxSpeed);
			// to get steerinForce subtract current velocity from desired velocity
			steeringForce = Vector2.subtract(desVel, velocity)

			return steeringForce;
		}
	}

}