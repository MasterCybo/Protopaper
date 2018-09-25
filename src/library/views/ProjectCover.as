package library.views
{
	import feathers.controls.Label;
	
	import ru.aa.march.views.SpriteStarling;
	
	import starling.display.DisplayObject;
	
	import starling.display.Quad;
	
	public class ProjectCover extends SpriteStarling
	{
		private var _image:DisplayObject;
		private var _title:Label;
		
		public function ProjectCover()
		{
			super();
		}
		
		override protected function init():void
		{
			_image = new Quad(100, 200, 0xA4C47F);
			addChild(_image);
			
			_title = new Label();
			_title.text = "Project";
			addChild(_title);
		}
		
		override protected function addedToStage():void
		{
			super.addedToStage();
		}
		
		override protected function removedFromStage():void
		{
			super.removedFromStage();
		}
		
		private function applySize():void {
			_title.x = int((_image.width - _title.width) / 2);
			_title.y = _image.height;
		}
	}
}
