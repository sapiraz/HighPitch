package 
{
	
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	
	/**
	 * ...
	 * @author ...
	 */
	
	 
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public var danielsplayer:Player;
		public var evilenemy:Enemy;
		public var hpdisplay:TextField = new TextField();
		
		public var enemies:Array = new Array();
		
		public var text:String = "";
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//hpdisplay.text = ()
			
			var gamebg:BG = new BG();
			addChild(gamebg);
			
			
			danielsplayer = new Player();
			addChild(danielsplayer);
			
			
			
			hpdisplay.text = danielsplayer.hp.toString();
			hpdisplay.textColor = 0x2D7B55
			
			addChild(hpdisplay);
			
			//old enemy functionality
			evilenemy = new Enemy();
			addChild(evilenemy);
			
			//new enemies functionality
			var enemy:Enemy = new Enemy();
			addChild(enemy);
			
			enemies.push(enemy);
			
		
			danielsplayer.x = stage.stageWidth/2;
			danielsplayer.y = stage.stageHeight/2;
			
			//Creating our controller
			
			var danielsController:PlayerController = new PlayerController(stage);
			danielsController.setPlayer(danielsplayer);
			
			addChild(new Flyer());
			addChild(new Flyer());
			addChild(new Flyer());
			addChild(new Flyer());
			addChild(new Flyer());
			stage.addEventListener(Event.ENTER_FRAME,everyframe);
			
			
			
			
			
			
		}
		
		public function everyframe(e:Event=null):void{
			
			
			
			if(danielsplayer.x < evilenemy.x){
				
				evilenemy.x -= 1;	
			
			} else{
				
				evilenemy.x += 1;
				
			}
			
			
			if(danielsplayer.y < evilenemy.y){
				
				evilenemy.y -= 1;	
			
			} else{
				
				evilenemy.y += 1;
				
			}
			
				
			//collison detection
			
			if(danielsplayer.hitTestObject(evilenemy)){
				
				danielsplayer.hp -= 1;
				
				hpdisplay.text = danielsplayer.hp.toString();
				
			}
			
			
		}
		
		
	}
	
}