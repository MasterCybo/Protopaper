package screen.views
{
	import feathers.controls.Button;
	
	import ru.aa.march.views.SpriteStarling;
	
	public class ScreenMenu extends SpriteStarling
	{
		public function ScreenMenu()
		{
			super();
		}
		
		override protected function init():void
		{
			var addButton:Button = new Button();
			addButton.label = "Menu";
			addChild(addButton);
		}
	}
}
