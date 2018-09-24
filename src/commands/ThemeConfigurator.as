package commands
{
	import feathers.themes.TopcoatLightMobileTheme;
	
	import ru.aa.march.commands.Command;
	
	public class ThemeConfigurator extends Command
	{
		public function ThemeConfigurator()
		{
			super();
		}
		
		override public function execute(data:* = null):void
		{
			new TopcoatLightMobileTheme();
		}
	}
}
