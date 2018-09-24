package page.models
{
	import flash.geom.Rectangle;
	
	public class InteractiveArea extends Rectangle
	{
		public var linkPage:String;
		
		public function InteractiveArea(x:Number = 0, y:Number = 0, width:Number = 0, height:Number = 0)
		{
			super(x, y, width, height);
		}
	}
}
