package postfx;

//ref http://philippseifried.com/blog/2011/07/30/real-time-bloom-effects-in-as3/
import flash.display.BitmapData;
import flash.filters.ColorMatrixFilter;
import flash.geom.Point;
import Type;
import Lib;

/**
 * ...
 * @author de
 */

class Bloom extends Sprite
{
	var src : DOC;
	
	var result : BitmapData;
	var render : BitmapData;
	var resStub : Bitmap;
	
	static var grayMatrix :Array<Float> = [
	  0.3, 0.59, 0.11, 0, 0,
	  0.3, 0.59, 0.11, 0, 0,
	  0.3, 0.59, 0.11, 0, 0,
	  0,    0,    0,    1, 0];
	 
	static var grayFilter = new ColorMatrixFilter( grayMatrix );
	
	public function new( r : DOC ) 
	{
		src = r;
		result = new BitmapData( Std.int(src.width), Std.int(src.height), false, 0x0 );
		render = new BitmapData( Std.int(src.width), Std.int(src.height), false, 0x0 );
		addChild( resStub = new Bitmap( result));
		super();
	}
	
	public function update()
	{
		//result.fillRect(result.rect, 0x0);
		//result.draw( src );
		render.draw( src );
		result.applyFilter( render, result.rect, Const.Point_ZERO, grayFilter);
		for ( i in 0...4)
		{
			result.draw( result, null, null, flash.display.BlendMode.MULTIPLY);
		}
		
		result.draw(render, null, null, flash.display.BlendMode.ADD);
	}
	
}