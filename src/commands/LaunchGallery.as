package commands
{
	import flash.events.MediaEvent;
	import flash.events.PermissionEvent;
	import flash.media.CameraRoll;
	import flash.permissions.PermissionStatus;
	
	import ru.aa.march.commands.Command;
	
	public class LaunchGallery extends Command
	{
		public function LaunchGallery()
		{
			super();
		}
		
		override public function execute(data:* = null):void
		{
			if (CameraRoll.supportsBrowseForImage) {
				var cameraRoll:CameraRoll = new CameraRoll();
				if (CameraRoll.permissionStatus == PermissionStatus.GRANTED) {
					launchGallery(cameraRoll);
				} else {
					cameraRoll.addEventListener(PermissionEvent.PERMISSION_STATUS, onPermissionStatusGallery);
					cameraRoll.requestPermission();
				}
			} else {
				trace("CameraRoll not supported");
			}
		}
		
		private function onPermissionStatusGallery(event:PermissionEvent):void
		{
			trace("*execute* " + this + "::onPermissionStatusGallery(), status: " + event.status);
			if (event.status == PermissionStatus.GRANTED) {
				var cameraRoll:CameraRoll = event.target as CameraRoll;
				cameraRoll.removeEventListener(PermissionEvent.PERMISSION_STATUS, onPermissionStatusGallery);
				
				launchGallery(cameraRoll);
			}
		}
		
		private function launchGallery(cameraRoll:CameraRoll):void {
			trace("*execute* " + this + "::launchGallery()");
			cameraRoll.addEventListener(MediaEvent.SELECT, onPhotoSelected);
			cameraRoll.browseForImage();
		}
		
		private function onPhotoSelected(event:MediaEvent):void
		{
			trace("*execute* " + this + "::onPhotoSelected(), file: " + event.data.file.nativePath);
		}
	}
}
