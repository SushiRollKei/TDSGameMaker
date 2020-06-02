/// @description Insert description here
// You can write your code in this editor
if (fullscreenActive = 1){
	fullscreenActive = 0;
	window_set_fullscreen(false);
}else {
	fullscreenActive = 1;
	window_set_fullscreen(true);
}