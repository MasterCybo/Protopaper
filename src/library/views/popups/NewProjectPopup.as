package library.views.popups
{
	import feathers.controls.Button;
	import feathers.controls.LayoutGroup;
	import feathers.controls.Panel;
	import feathers.controls.TextInput;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.core.PopUpManager;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.HorizontalLayoutData;
	import feathers.layout.VerticalLayout;
	
	import starling.events.Event;
	
	public class NewProjectPopup extends Panel
	{
		public function NewProjectPopup()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			title = "Create new Project";
			var verticalLayout:VerticalLayout = new VerticalLayout();
			
			var contentGroup:LayoutGroup = new LayoutGroup();
			contentGroup.layout = verticalLayout;
			addChild(contentGroup);
			
			var titleInput:TextInput = new TextInput();
			titleInput.maxChars = 25;
			titleInput.layoutData = new HorizontalLayoutData(100);
			titleInput.setFocus();
			contentGroup.addChild(titleInput);
			
			var horizontalLayout:HorizontalLayout = new HorizontalLayout();
			var buttonsGroup:LayoutGroup = new LayoutGroup();
			buttonsGroup.layoutData = new HorizontalLayoutData(100);
			buttonsGroup.layout = horizontalLayout;
			contentGroup.addChild(buttonsGroup);
			
			var acceptButton:Button = new Button();
			acceptButton.label = "Accept";
			acceptButton.addEventListener(Event.TRIGGERED, acceptHandler);
			buttonsGroup.addChild(acceptButton);
			
			var cancelButton:Button = new Button();
			cancelButton.label = "Cancel";
			cancelButton.addEventListener(Event.TRIGGERED, cancelHandler);
			buttonsGroup.addChild(cancelButton);
			
			contentGroup.validate();
			buttonsGroup.validate();
		}
		
		private function acceptHandler(event:Event):void
		{
			PopUpManager.removePopUp(this, true);
		}
		
		private function cancelHandler(event:Event):void
		{
			PopUpManager.removePopUp(this, true);
		}
	}
}
