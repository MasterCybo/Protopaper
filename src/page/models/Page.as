package page.models
{
	public class Page
	{
		public var title:String = "page";
		private var _areas:Vector.<InteractiveArea> = new Vector.<InteractiveArea>();
		
		public function Page() {
		}
		
		public function get areas():Vector.<InteractiveArea> {
			return _areas.slice();
		}
		
		public function addArea(area:InteractiveArea):void {
			_areas.push(area);
		}
		
		public function removeArea(area:InteractiveArea):void {
			var idx:int = _areas.indexOf(area);
			if (idx !== -1) {
				_areas.removeAt(idx);
			}
		}
	}
}
