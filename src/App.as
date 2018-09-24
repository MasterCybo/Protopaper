package
{
	import commands.LaunchCamera;
	import commands.LaunchGallery;
	import commands.ThemeConfigurator;
	
	import feathers.controls.Button;
	
	import flash.media.CameraUI;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class App extends Sprite
	{
		public function App()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			new ThemeConfigurator().execute();
			
			var btnGallery:Button = new Button();
			btnGallery.label = btnGallery.name = "Gallery";
			addChild(btnGallery);
			btnGallery.validate();
			
			var btnCamera:Button = new Button();
			btnCamera.label = btnCamera.name = "Camera";
			addChild(btnCamera);
			btnCamera.validate();
			
			btnGallery.x = int((stage.stageWidth - btnGallery.width) / 2);
			btnGallery.y = int((stage.stageHeight - btnGallery.height) / 2);
			
			btnGallery.addEventListener(Event.TRIGGERED, startGallery);
			btnCamera.addEventListener(Event.TRIGGERED, startCamera);
		}
		
		private function startGallery(event:Event = null):void
		{
			trace("*execute* " + this + "::startGallery()");
			new LaunchGallery().execute();
		}
		
		private function startCamera(event:Event = null):void
		{
			trace("*execute* " + this + "::startCamera(), isSupported: " + CameraUI.isSupported + ", permissionStatus: " + CameraUI.permissionStatus);
			new LaunchCamera().execute();
		}
	}
}
