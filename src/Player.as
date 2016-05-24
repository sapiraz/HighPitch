package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class Player extends MovieClip
	{
		
		
		
		public var mygraphics:player_animations = null;
		
		public var hp:Number = 100;
		
		public function Player() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		public function init(e:Event = null):void { 	
			
			this.mygraphics = new player_animations();
			addChild(mygraphics);
		
		}
		
		public function setanimation(mode:String):void{
			
			
			if(mode == "idle"){
				
				this.mygraphics.gotoAndStop(1);
				
				
				
			}
			 else if(mode == "runright"){
				 
				this.mygraphics.gotoAndStop(2);
				 
			 } else if(mode == "runleft"){
				 
				this.mygraphics.gotoAndStop(3);
				 
			 }
			
		}
	}
	
}