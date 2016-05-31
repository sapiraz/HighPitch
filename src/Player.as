package 
{
	import flash.geom.Transform;
	import flash.geom.ColorTransform;
	import flash.filters.ShaderFilter;

	import flash.geom.Matrix;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class Player extends MovieClip
	{
		
		
		
		public var mygraphics:player_animations = null;
		public var shadow:player_animations = null;
		public var hp:Number = 100;
		
		public function Player() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		public function init(e:Event = null):void { 	
			
			//Add graphics
			this.mygraphics = new player_animations();

			
			
			var toCopy:MovieClip = new MovieClip();
			toCopy.graphics.beginFill(0x000000);
			toCopy.graphics.drawRect(0, 0, 100, 100);
			toCopy.graphics.endFill();
			
			
			//Draw Shadow
			shadow = new player_animations();
			
			
			
			
			//addChild(bmap);
			
			
			
			var t:ColorTransform = new ColorTransform(1,1,1,1);
			t.color = 0x000000;
			
			
			shadow.transform.colorTransform = t;
			shadow.height = shadow.height / 2;
			shadow.scaleY = -1;
			shadow.y = mygraphics.height / 1.5;
			addChild(mygraphics);
			addChild(shadow);
			shadow.alpha = 0.3;
		}
		
		public function setanimation(mode:String):void{
			
			
			if(mode == "idle"){
				
				this.mygraphics.gotoAndStop(1);
				this.shadow.gotoAndStop(1);
				
			}
			 else if(mode == "runright"){
				 
				this.mygraphics.gotoAndStop(2);
				this.shadow.gotoAndStop(2);
				 
			 } else if(mode == "runleft"){
				 
				this.mygraphics.gotoAndStop(3);
				this.shadow.gotoAndStop(3);
				 
			 }
			
		}
	}
	
}