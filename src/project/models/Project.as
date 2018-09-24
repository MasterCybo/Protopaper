package project.models
{
	import page.models.Page;
	
	public class Project
	{
		public var title:String = "project";
		
		private var _pages:Vector.<Page> = new Vector.<Page>();
		private var _mapPages:Object = {};
		
		public function Project()
		{
		}
		
		public function get pages():Vector.<Page> {
			return _pages.slice();
		}
		
		public function hasPage(title:String):Boolean {
			return _mapPages[title] !== undefined;
		}
		
		public function getPage(title:String):Page {
			return _mapPages[title];
		}
		
		public function addPage(page:Page):Page {
			if (!hasPage(page.title)) {
				_pages.push(page);
				_mapPages[page.title] = page;
			}
			return page;
		}
		
		public function removePage(page:Page):Page {
			if (hasPage(page.title)) {
				var idx:int = _pages.indexOf(page);
				if (idx !== -1) {
					_pages.removeAt(idx);
					delete _mapPages[ page.title ];
				}
			}
			
			return page;
		}
	}
}
