package page.views
{
	import feathers.controls.Screen;
	
	import page.controllers.PageScreenController;
	
	public class PageScreen extends Screen
	{
		public function PageScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			trace("PageScreen::inititalize");
			
			new PageScreenController(this);
		}
	}
}
