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
		private var _acceptButton:Button;
		private var _titleInput:TextInput;
		
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
			
			_titleInput = new TextInput();
			_titleInput.maxChars = 25;
			_titleInput.layoutData = new HorizontalLayoutData(100);
			_titleInput.setFocus();
			_titleInput.addEventListener(Event.CHANGE, changeTitleHandler);
			contentGroup.addChild(_titleInput);
			
			var horizontalLayout:HorizontalLayout = new HorizontalLayout();
			var buttonsGroup:LayoutGroup = new LayoutGroup();
			buttonsGroup.layoutData = new HorizontalLayoutData(100);
			buttonsGroup.layout = horizontalLayout;
			contentGroup.addChild(buttonsGroup);
			
			_acceptButton = new Button();
			_acceptButton.label = "Accept";
			_acceptButton.addEventListener(Event.TRIGGERED, acceptHandler);
			buttonsGroup.addChild(_acceptButton);
			_acceptButton.isEnabled = false;
			
			var cancelButton:Button = new Button();
			cancelButton.label = "Cancel";
			cancelButton.addEventListener(Event.TRIGGERED, cancelHandler);
			buttonsGroup.addChild(cancelButton);
			
			contentGroup.validate();
			buttonsGroup.validate();
		}
		
		private function changeTitleHandler(event:Event):void
		{
			var titleInput:TextInput = event.target as TextInput;
			_acceptButton.isEnabled = titleInput.text !== "" && titleInput.text !== " ";
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
