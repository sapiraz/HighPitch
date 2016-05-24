package 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class PlayerController 
	{
		
		
		private var player:Player = null;
		private var _stage:Stage = null; 
		
		public function PlayerController(stage:Stage = null ) 
		{
			
			this._stage = stage;
			
		}
		
		
		
		public function setPlayer(_player:Player):void{
		
			//_player.x = 700;
			
			this.player = _player;
			//this._player.x = 600;
			this._stage.addEventListener(KeyboardEvent.KEY_DOWN, this.keydownlisenter);
			this._stage.addEventListener(KeyboardEvent.KEY_UP, this.keyuplisenter);
			this._stage.addEventListener(Event.ENTER_FRAME,this.enterframelistener)
			
			
		}
		
		public function enterframelistener(e:Event = null):void {
			if(buttons_pressed.indexOf(87) >= 0) {
				
				
				
				
			}
				//down \/
			if (buttons_pressed.indexOf(83) >= 0) {
				this.player.y += 12;	
				
				
			}
			//up \/
			if (buttons_pressed.indexOf(87) >= 0){
				this.player.y -= 12;
			}
			
			//left \/
			if (buttons_pressed.indexOf(65) >= 0){
				
				this.player.x -= 12;
				
				this.player.setanimation("runleft");
			}
			//right \/
			if (buttons_pressed.indexOf(68) >= 0){
				
				this.player.x += 12;
				
				this.player.setanimation("runright");
				
			}
			 
			
			if(buttons_pressed.length == 0){
				
				this.player.setanimation("idle");
				
			}
			
			
			
			//down \/
			if (buttons_pressed.indexOf(40) >= 0) {
				
				var newbullet:Bullet = new Bullet("down");
				newbullet.x = this.player.x
				newbullet.y = this.player.y
				this._stage.addChild(newbullet);
				
			}
			//up \/
			if (buttons_pressed.indexOf(38) >= 0) {
				
				var newbullet:Bullet = new Bullet("up");
				newbullet.x = this.player.x
				newbullet.y = this.player.y
				this._stage.addChild(newbullet);
			}
			
			
			//left \/
			if (buttons_pressed.indexOf(37) >= 0){
				
				
				var newbullet:Bullet = new Bullet("left");
				newbullet.x = this.player.x
				newbullet.y = this.player.y
				this._stage.addChild(newbullet);
				
				
			}
			//right \/
			if (buttons_pressed.indexOf(39) >= 0){
				
				
				trace("Player pressed on the right button");
				var newbullet:Bullet = new Bullet("right");
				newbullet.x = this.player.x
				newbullet.y = this.player.y
				this._stage.addChild(newbullet);
				
			}
			
			
		}
		
		public var buttons_pressed:Array = new Array();
		
		public function keyuplisenter(e:KeyboardEvent = null):void {
			
			for(var i in buttons_pressed){
				if (buttons_pressed[i] == e.keyCode) {
					
					buttons_pressed.splice(i,1);
				}
			}
			//buttons_pressed.splice(buttons_pressed.indexOf(e.keyCode),1);
			
		}
		public function keydownlisenter(e:KeyboardEvent = null):void {
			
			
			
			if(buttons_pressed.indexOf(e.keyCode) == -1){
				buttons_pressed.push(e.keyCode);
			}
			
			
			
			
			
			return;
			//down \/
			if (e.keyCode == 83) {
				this.player.y += 12;	
				
				
			}
			//up \/
			if (e.keyCode == 87){
				this.player.y -= 12;
			}
			
			//left \/
			if (e.keyCode == 65){
				
				this.player.x -= 12;
				
			}
			//right \/
			if (e.keyCode == 68){
				
				this.player.x += 12;
				
			}
			
			
			
			
			
			//down \/
			if (e.keyCode == 40) {
				
				var newbullet:Bullet = new Bullet("down");
				newbullet.x = this.player.x
				newbullet.y = this.player.y
				this._stage.addChild(newbullet);
				
			}
			//up \/
			if (e.keyCode == 38) {
				
				var newbullet:Bullet = new Bullet("up");
				newbullet.x = this.player.x
				newbullet.y = this.player.y
				this._stage.addChild(newbullet);
			}
			
			
			//left \/
			if (e.keyCode == 37){
				
				
				var newbullet:Bullet = new Bullet("left");
				newbullet.x = this.player.x
				newbullet.y = this.player.y
				this._stage.addChild(newbullet);
				
				
			}
			//right \/
			if (e.keyCode == 39){
				
				
				
				var newbullet:Bullet = new Bullet("right");
				newbullet.x = this.player.x
				newbullet.y = this.player.y
				this._stage.addChild(newbullet);
			}
			
			
			
			
		}
		
		public function quack():void {
			
			trace("WUACK QUACK QUACK");
			
		}
		
	}
		
	
	
	
}