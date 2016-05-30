package {
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.geom.Point;

	/**
	 * @author root
	 */
	public class Flyer extends MovieClip {
		public var target:Point = new Point(50,50);
		public function Flyer() {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function init(e:Event = null):void {
			graphics.beginFill(0xFFFFFF);
			graphics.drawCircle(0, 0, 2);
			graphics.endFill();
			addEventListener(Event.ENTER_FRAME, loop);
			x = Math.floor(Math.random() * stage.stageWidth);
			y = Math.floor(Math.random() * stage.stageHeight);
			target.x = Math.floor(Math.random() * stage.stageWidth);
			target.y = Math.floor(Math.random() * stage.stageHeight);
		}
		public function loop(e:Event = null):void {
			var speed:int = 10;
			var currPos:Point = new Point(x,y);
			var distance:Point = new Point(currPos.x - target.x, currPos.y - target.y);
			x -= distance.x / speed;
			y -= distance.y / speed;
			target.x += Math.floor(Math.random()*2) == 0 ? speed : -speed;
			target.y += Math.floor(Math.random()*2) == 0 ? speed : -speed;
			target.x = target.x > stage.stageWidth ? stage.stageWidth : (target.x < 0 ? 0 : target.x);
			target.y = target.y > stage.stageHeight ? stage.stageHeight : (target.y < 0 ? 0 : target.y);
		}
	}
}
