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
		private var _mapProjects:Object = {};
		
		public function Library(key:SingletonKey)
		{
		}
		
		public function get projects():Vector.<Project> {
			return _projects;
		}
		
		public function hasProject(title:String):Boolean {
			return _mapProjects[title] !== undefined;
		}
		
		public function getProject(title:String):Project {
			return _mapProjects[title];
		}
		
		public function addProject(project:Project):void {
			if (!hasProject(project.title)) {
				_projects.push(project);
				_mapProjects[project.title] = project;
			}
		}
		
		public function removeProject(project:Project):void {
			if (hasProject(project.title)) {
				var idx:int = _projects.indexOf(project);
				if (idx !== -1) {
					_projects.removeAt(idx);
					delete _mapProjects[project.title];
				}
			}
		}
	}
}

internal class SingletonKey{}