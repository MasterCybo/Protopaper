package library.views
{
	import base.views.AppButton;
	
	import feathers.controls.Button;
	
	import feathers.controls.Screen;
	import feathers.core.PopUpManager;
	
	import library.views.popups.NewProjectPopup;
	
	import starling.events.Event;
	
	public class LibraryScreen extends Screen
	{
		public function LibraryScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			var newProjectButton:Button = new Button();
			newProjectButton.label = "New";
			newProjectButton.addEventListener(Event.TRIGGERED, newProjectHandler);
			addChild(newProjectButton);
		}
		
		private function newProjectHandler(event:Event):void
		{
			PopUpManager.addPopUp(new NewProjectPopup());
		}
	}
}
