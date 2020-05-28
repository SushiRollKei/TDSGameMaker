/// @desc uc_wrap
/// @param value
/// @param min
/// @param max

var val = argument0;
var minimum = argument1;
var maximum = argument2;

/*
	It wraps a value between a max and a min. If the value gets smaller than the min it 
	turns arround becoming the max. Otherwise, if the value gets larger than the max
	the value turns becoming the min value
	
	Arguments:
		- value (real): value to check.
		- min (real): lower value.
		- max (real): higher value.
		
	Returns:
		- Returns wraped value
*/

var range = maximum - minimum;
while(val >= maximum) val -= range;
while(val < minimum) val += range;
return val