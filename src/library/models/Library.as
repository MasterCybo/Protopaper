package library.models
{
	import project.models.Project;
	
	public class Library
	{
		private static var _instance:Library;
		
		public static function get me():Library {
			if (!_instance) {
				_instance = new Library(new SingletonKey());
			}
			
			return _instance;
		}
		
		
		public var currentProject:Project;
		
		private var _projects:Vector.<Project> = new Vector.<Project>();
		
		public function Library(key:SingletonKey)
		{
		}
		
	}
}

internal class SingletonKey{}