/// @desc uc_wave
/// @param from
/// @param to
/// @param duration
/// @param offset

var from = argument0;
var to = argument1;
var duration = argument2;
var offset = argument3;

/*
	This script creates a sin wave.
	
	Arguments:
		- from (real): lower value.
		- to (real): higher value.
		- time (real): period in seconds of the wave.
		- offset (real): start offset of the wave.
		
	Returns:
		- Returns wave position.
*/

var A = (to-from)/2;
var _x = (current_time*0.001);

return from + A + A*sin((2*pi*_x)/duration + offset);