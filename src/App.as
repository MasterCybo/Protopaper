package
{
	import commands.ThemeConfigurator;
	
	import constants.ScreenName;
	
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.events.FeathersEventType;
	
	import library.views.LibraryScreen;
	
	import page.views.PageScreen;
	
	import project.views.ProjectScreen;
	
	import starling.events.Event;
	
	public class App extends ScreenNavigator
	{
		public function App()
		{
			super();
			addEventListener(FeathersEventType.CREATION_COMPLETE, creationCompleteHandler);
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			new ThemeConfigurator().execute();
		}
		
		private function creationCompleteHandler(event:Event):void
		{
			removeEventListener(FeathersEventType.CREATION_COMPLETE, creationCompleteHandler);
			
			addScreen(ScreenName.LIBRARY_SCREEN, new ScreenNavigatorItem(LibraryScreen));
			addScreen(ScreenName.PROJECT_SCREEN, new ScreenNavigatorItem(ProjectScreen));
			addScreen(ScreenName.PAGE_SCREEN, new ScreenNavigatorItem(PageScreen));
			
			showScreen(ScreenName.LIBRARY_SCREEN);
		}
	}
}
