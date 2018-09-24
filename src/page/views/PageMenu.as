package page.views
{
	import feathers.controls.Button;
	
	import ru.aa.march.views.SpriteStarling;
	
	public class PageMenu extends SpriteStarling
	{
		public function PageMenu()
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
