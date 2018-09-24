package base.views
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class View extends Sprite
	{
		public function View()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedHandler);
		}
		
		private function addedHandler(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
			show();
		}
		
		private function removedHandler(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
			remove();
		}
		
		public function show():void {
			// override me
		}
		
		public function remove():void {
			// override me
		}
	}
}
