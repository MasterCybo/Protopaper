package library.views
{
	import base.views.AppButton;
	
	import feathers.controls.Button;
	
	import feathers.controls.Screen;
	import feathers.core.FeathersControl;
	import feathers.core.PopUpManager;
	import feathers.events.FeathersEventType;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	import feathers.layout.VerticalLayoutData;
	
	import library.views.popups.NewProjectPopup;
	
	import starling.events.Event;
	
	public class LibraryScreen extends Screen
	{
		public function LibraryScreen()
		{
			super();
			addEventListener(FeathersEventType.CREATION_COMPLETE, creationCompleteHandler);
		}
		
		private function creationCompleteHandler(event:Event):void
		{
			trace("*execute* " + this + "::creationCompleteHandler()");
			trace("w x h: " + width, height);
			validate();
		}
		
		override protected function initialize():void
		{
			trace("*execute* " + this + "::initialize()");
			super.initialize();
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.distributeHeights = true;
			layout.gap = 10;
			this.layout = layout;
			
			
			trace("w x h: " + width, height);
			
			var newProjectButton:Button = new Button();
			newProjectButton.addEventListener(Event.TRIGGERED, newProjectHandler);
			newProjectButton.label = "New";
			
			var anchor:AnchorLayoutData = new AnchorLayoutData();
			anchor.left = 0;
			anchor.bottom = 0;
			newProjectButton.layoutData = anchor;
			
//			newProjectButton.x = 0;
//			newProjectButton.y = height - newProjectButton.height;
//			var layoutData:VerticalLayoutData = new VerticalLayoutData();
//			layoutData.percentWidth = 100;
//			layoutData.bottom = 0;
//			newProjectButton.layoutData = layoutData;
			addChild(newProjectButton);
		}
		
		private function newProjectHandler(event:Event):void
		{
			PopUpManager.addPopUp(new NewProjectPopup());
		}
	}
}
