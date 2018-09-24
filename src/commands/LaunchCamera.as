package commands
{
	import flash.events.ErrorEvent;
	import flash.events.MediaEvent;
	import flash.events.PermissionEvent;
	import flash.media.CameraUI;
	import flash.media.MediaType;
	import flash.permissions.PermissionStatus;
	
	import ru.aa.march.commands.Command;
	
	public class LaunchCamera extends Command
	{
		public function LaunchCamera()
		{
			super();
		}
		
		override public function execute(data:* = null):void
		{
			trace("*execute* " + this + "::startCamera(), isSupported: " + CameraUI.isSupported + ", permissionStatus: " + CameraUI.permissionStatus);
			if (CameraUI.isSupported) {
				var cameraUI:CameraUI = new CameraUI();
				cameraUI.addEventListener(ErrorEvent.ERROR, onError);
				cameraUI.addEventListener(flash.events.Event.CANCEL, onCancel);
				if (CameraUI.permissionStatus == PermissionStatus.GRANTED) {
					launchCamera(cameraUI);
				} else {
					cameraUI.addEventListener(PermissionEvent.PERMISSION_STATUS, onPermissionStatusCamera);
					cameraUI.requestPermission();
				}
			} else {
				trace("CameraUI not supported");
			}
		}
		
		private function onPermissionStatusCamera(event:PermissionEvent):void
		{
			trace("*execute* " + this + "::onPermissionStatusCamera(), status: " + event.status);
			if (event.status == PermissionStatus.GRANTED) {
				var cameraUI:CameraUI = event.target as CameraUI;
				cameraUI.removeEventListener(PermissionEvent.PERMISSION_STATUS, onPermissionStatusCamera);
				launchCamera(cameraUI);
			}
		}
		
		private function launchCamera(cameraUI:CameraUI):void {
			trace("*execute* " + this + "::launchCamera()");
			cameraUI.addEventListener(MediaEvent.COMPLETE, onCameraComplete);
			cameraUI.launch(MediaType.IMAGE);
		}
		
		private function onCameraComplete(event:MediaEvent):void
		{
			trace("*execute* " + this + "::onCameraComplete()");
		}
		
		private function onCancel(event:flash.events.Event):void
		{
			trace("*execute* " + this + "::onCancel()");
		}
		
		private function onError(event:ErrorEvent):void
		{
			trace("*execute* " + this + "::onError(), error: " + event);
		}
	}
}
