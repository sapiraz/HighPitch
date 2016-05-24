package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class Enemy extends MovieClip
	{
		
		public function Enemy() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		public function init(e:Event = null):void {
			this.graphics.beginFill(0xb000ff);
			this.graphics.drawCircle(0, 0, 30);
			
			
		
		}
	}

}