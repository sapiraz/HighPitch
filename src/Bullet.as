package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class Bullet extends MovieClip
	{
		private var direction:String;
		
		public function Bullet(direction) 
		{
			this.direction = direction;
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			
		}
		
		public function init(e:Event = null):void {
			this.graphics.beginFill(0x234f81);
			this.graphics.drawCircle(0, 0, 10);
			
			addEventListener(Event.ENTER_FRAME, move);
			
		
		}
		
		public function move (e:Event = null):void {
			
			var bulletspeed = 25;
			
			if(this.direction == "left"){
				
				this.x -= bulletspeed;
			}
			
			
			if(this.direction == "right"){
				
				this.x += bulletspeed;
			}
			
			if(this.direction == "up"){
				
				this.y -= bulletspeed;
			}
			if(this.direction == "down"){
				
				this.y += bulletspeed;
			}
		}
	}

}
