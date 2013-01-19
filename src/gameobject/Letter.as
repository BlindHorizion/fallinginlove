package gameobject 
{
	import events.LetterDead;
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
		
		public function get currentLetter(): String { return m_pAsset.currentFrameLabel; }
		
		public function Letter( startingXPos:Number, letterName:String ) 
		{
			super( new mc_letters() );
			m_pAsset.gotoAndStop( letterName );
			m_wanderCircle = new Circle();
			
			m_pAsset.x = startingXPos;
			m_pAsset.y = LayerManager.stageHeight;
			
			m_fwd = new Point( 0, 1 );
		}
		
		
		public function update( letterList:Vector.<Letter> ):void
		{
			var collisionArray:Array = checkCollision( letterList );
			if ( collisionArray[ 0 ] )
			{
				m_wanderCircle.checkDirection( collisionArray[ 1 ] );
			}
			
			m_wanderCircle.update( MathUtils.vectorAdd( new Point( m_pAsset.x, m_pAsset.y ), MathUtils.vectorMultiply( m_fwd, 20 ) ) );
			var force:Point = seek( m_wanderCircle.getRandomPosition() );
			m_fwd = MathUtils.vectorNormalize( force );
			checkBounds();
			var velocity:Point = MathUtils.vectorMultiply( m_fwd, SPEED );
			
			m_pAsset.x += velocity.x;
			m_pAsset.y += velocity.y;
		}
		
		private function checkBounds():void
		{
			if ( m_pAsset.x < 0 )
			{
				m_wanderCircle.checkDirection( true );
			}
			else if( m_pAsset.x + width > LayerManager.stageWidth )
			{
				m_wanderCircle.checkDirection( false );
			}
			
			if ( m_pAsset.y + m_pAsset.height < 0 )
			{
				dispatchEvent( new LetterDead() );
			}
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
		
		private function checkCollision( checkers:Vector.<Letter> ):Array
		{
			for each( var letter:Letter in checkers )
			{
				if ( letter != this )
				{
					if ( letter.asset.hitTestObject( m_pAsset ) )
					{
						return [ true, letter.asset.x < m_pAsset.x ];
					}
				}
			}
			
			return [ false ];
		}
	}

}