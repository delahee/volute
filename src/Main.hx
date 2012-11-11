package ;

/**
 * ...
 * @author de
 */

//todo http://philippseifried.com/blog/2011/07/24/flash-effects-creating-metaball-style-effects-in-as3/
//todo http://philippseifried.com/blog/2011/07/30/real-time-bloom-effects-in-as3/
class Main 
{
	public static var me 			= new Main();
	public var cur : scene.Scene;
	
	public function new() { 
		addChild( new com.Stats() );
		cur = new scene.FallingStar();
		addChild(cur);
	}
	
	public function addChild(c) return flash.Lib.current.addChild(c)
	
	public function update() 
	{
		if (cur != null)
			cur.update();
	}
	
	
	static function main() 
	{
		var stage = flash.Lib.current.stage;
		stage.addEventListener( flash.events.Event.ENTER_FRAME, function(_) Main.me.update());
	}
	
}