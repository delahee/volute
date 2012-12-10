package com;
typedef EmbedLbd	= Lambda;
typedef EmbedLbdEx 	= LbdEx;
typedef EmbedArrEx 	= ArrEx;


class Ex
{
	public static function detach(v : flash.display.DisplayObject)
	{
		if (v!=null && v.parent != null)
			v.parent.removeChild( v );
	}
}