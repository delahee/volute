package scene;
import com.Dice;
import flash.display.Sprite;
import postfx.Bloom;

/**
 * ...
 * @author de
 */

class FallingStar extends Scene
{
	public var stars : algo.Pool<prim.Star4>;
	
	public function new() 
	{
		super();
		stars = new algo.Pool( function() return new prim.Star4() );
		mkStars();
	}
	
	function mkStars(){
		for ( i in 0...10)
		{
			var s = stars.create();
			s.x += i * Lib.w() / 10;
			addChild( s );
		}
	}
	
	override function update()
	{
		for ( s in stars.getUsed() )
		{
			s.y++;
			s.rotationZ++;
			s.alpha = Dice.rollF( 0.5, 1.0)*Dice.rollF( 0.5, 1.0);
		}
	}
	
}