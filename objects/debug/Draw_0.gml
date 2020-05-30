/// @description Insert description here
// You can write your code in this editor


//Temp Variable set up

var array = []
array[states.free] = "free";
array[states.fire1] = "fire1";
array[states.fire2] = "fire2";
array[states.tactical] = "tactical";
array[states.reload] = "reloading";
array[states.secfire] = "secfire";
array[states.sectact] = "sectact";

//Draw States

if debugActive = 1{
if instance_exists(player) with player {
     var xx = x + 64;
     var yy = y - 64;
	 draw_set_color(c_white);
     draw_text(xx,yy,"states: " + array[states] ) ;
	 yy -= 64;
}

//Draw Readable Tactical Status
if instance_exists(player) with player {
	 draw_set_color(c_orange);
	 var debugx = x - 64;
     var debugy = y + 64;
	 
	 if (tactDelay > -1) {
     draw_text(debugx,debugy,"Tactical: " + string(tactDelay/room_speed) ) ;
	 } else {
		 draw_text(debugx,debugy,"Tactical: " + string("Ready") ) ;
	 }
}
}
