package screen.views
{
	import base.views.View;
	
	import feathers.controls.Button;
	
	public class ScreenMenu extends View
	{
		public function ScreenMenu()
		{
			super();
		}
		
		override public function show():void
		{
			var addButton:Button = new Button();
			addButton.label = "Menu";
			addChild(addButton);
		}
		
		override public function remove():void
		{
			super.remove();
		}
	}
}
