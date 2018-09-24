package project.views
{
	import feathers.controls.Button;
	import feathers.controls.Screen;
	
	import project.controllers.ProjectScreenController;
	
	public class ProjectScreen extends Screen
	{
		public function ProjectScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			var button:Button = new Button();
			button.label = "Menu";
			addChild(button);
			button.validate();
			
			new ProjectScreenController(this);
		}
	}
}
