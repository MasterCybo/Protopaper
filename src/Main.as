package
{
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	
	[SWF(width="393", height="738", frameRate="60", backgroundColor="#ffffff")]
	public class Main extends Sprite
	{
		private var _starling:Starling;
		
		public function Main()
		{
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var deviceScreen:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
			var defaultScreen:Rectangle = new Rectangle(0, 0, 393, 738);
			
			var stageScreen:Rectangle = RectangleUtil.fit(deviceScreen, defaultScreen, ScaleMode.SHOW_ALL, true);
			
			_starling = new Starling(App, stage, deviceScreen);
			_starling.stage.stageWidth = stageScreen.width;
			_starling.stage.stageHeight = stageScreen.height;
			_starling.start();
		}
	}
}
