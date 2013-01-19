package gameobject 
{
	import flash.geom.Point;
	import game.Circle;
	import utils.LayerManager;
	import utils.MathUtils;
	/**
	 * ...
	 * @author Blake Gross
	 */
	public class Letter extends GameObject
	{
		private static const SPEED:uint = 5;
		private var m_fwd:Point;
		private var m_wanderCircle:Circle;
		
		public function Letter( startingXPos:Number ) 
		{
			super( new mc_letter() );
			m_pAsset.gotoAndStop( "A" );
			m_wanderCircle = new Circle();
			
			m_pAsset.x = startingXPos;
			m_pAsset.y = LayerManager.stage.stageHeight;
			
			m_fwd = new Point( 0, 1);
		}
		
		
		public function update():void
		{
			m_wanderCircle.update( MathUtils.vectorAdd( new Point( m_pAsset.x, m_pAsset.y ), MathUtils.vectorMultiply( m_fwd, 20 ) ) );
			var force:Point = seek( m_wanderCircle.getRandomPosition() );
			m_fwd = MathUtils.vectorNormalize( force );
			
			var velocity:Point = MathUtils.vectorMultiply( m_fwd, SPEED );
			
			m_pAsset.x += velocity.x;
			m_pAsset.y += velocity.y;
		}
		
		private function seek( targPos:Point ):Point
		{
			// set desiredVelocity equal to a vector from position to targPos
			var desVel:Point;
			desVel = MathUtils.vectorSubtract( targPos, new Point( m_pAsset.x, m_pAsset.y ) );
			// scale desired velocity so its magnitude equals max speed
			desVel = MathUtils.vectorNormalize( desVel );
			desVel = MathUtils.vectorMultiply( desVel, SPEED );

			return desVel;
		}
	}

}