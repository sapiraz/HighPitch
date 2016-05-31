package {
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;

	/**
	 * @author root
	 */
	public class Land extends MovieClip {
		private static const TYPE_DIRT:uint = 0xE0C790;
		private static const TYPE_DIRT_WET:uint = 0xAD9663;
		private static const TYPE_WATER:uint = 0x62C1DE;
		private static const TYPE_GRASS:uint = 0xBDDE62;
		private static const TYPE_LAVA:uint = 0xFF8000;
		private var bmp:Bitmap;
		private var bmpdata:BitmapData;
		public function Land() {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function init(e:Event = null):void {
			bmp = new Bitmap();
			bmpdata = new BitmapData(250,250,true);
			
			bmpdata.setPixel(50, 50, 0x000000);
			bmp.bitmapData = bmpdata;
			addChild(bmp);
			generateLand();
			addEventListener(Event.ENTER_FRAME, tick);
		}
		public var lastrun:int = (new Date()).time;
		public function tick(e:Event = null):void {
			var delta:int = (new Date()).time - lastrun;
			if(delta > 1000){
				
				for(var _x:int = 0;_x<=250;_x++){
					for(var _y:int = 0;_y<=250;_y++){
						
						switch(bmpdata.getPixel(_x,_y)){
							case TYPE_DIRT:
								//bmpdata.setPixel(_x, _y, 0xFF0000);						
							break;
							case TYPE_DIRT_WET:
								//cause dryness
								if(!findNearOfType(_x,_y,TYPE_WATER).length){
									bmpdata.setPixel(_x, _y, TYPE_DIRT);
								}
								if(findNearOfType(_x,_y,TYPE_DIRT).length){
									for each(var i:Point in findNearOfType(_x,_y,TYPE_DIRT)){
										bmpdata.setPixel(i.x,i.y,TYPE_GRASS);
									}
								}
							break;
							
							case TYPE_WATER:
								if(findNearOfType(_x,_y,TYPE_DIRT).length){
									for each(var i:Point in findNearOfType(_x,_y,TYPE_DIRT)){
										bmpdata.setPixel(i.x,i.y,TYPE_DIRT_WET);
									}
								}
							break;
							case TYPE_LAVA:
								if(findNearOfType(_x,_y,TYPE_DIRT_WET,10).length){
									for each(var i:Point in findNearOfType(_x,_y,TYPE_DIRT_WET,10)){
										bmpdata.setPixel(i.x,i.y,TYPE_DIRT);
									}
								}
								if(findNearOfType(_x,_y,TYPE_WATER,10).length){
									for each(var i:Point in findNearOfType(_x,_y,TYPE_WATER,10)){
										bmpdata.setPixel(i.x,i.y,TYPE_DIRT_WET);
									}
								}
								if(findNearOfType(_x,_y,TYPE_GRASS,10).length){
									for each(var i:Point in findNearOfType(_x,_y,TYPE_GRASS,10)){
										bmpdata.setPixel(i.x,i.y,TYPE_DIRT);
									}
								}
							break;
						}
						
					}
				}
					
				lastrun = (new Date()).time;
				
				
			}
		}
		public function findNearOfType(x,y,type:uint,radius:int = 4):Array {
			var matches:Array = new Array();
			
			for(var _x:int = x-radius; _x < x + radius; _x++){
				for(var _y:int = y-radius; _y < y + radius; _y++){
					if(bmpdata.getPixel(_x,_y) == type){
						matches.push(new Point(_x,_y));
					}
				}
			}
			return matches;
		}
		public function generateLand():void {
			for(var _x:int = 0;_x<=250;_x+=10){
				for(var _y:int = 0;_y<=250;_y+=10){
					var type:uint = TYPE_DIRT;
					var rand:int = Math.floor(Math.random() * 20);
					if(rand == 10){
						type = TYPE_WATER;
					} else if(rand == 1){
						if(Math.floor(Math.random() * 20) == 1){
							type = TYPE_LAVA;
						}
					}
					for(var __x:int = _x; __x < _x + 10; __x++){
						for(var __y:int = _y; __y < _y + 10; __y++){
							bmpdata.setPixel(__x, __y, type);						
						}
					}
					
					
				}
			}	
		}
	}
}
