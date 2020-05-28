///@ description uc_fixed_lerp
/// @param value
/// @param target
/// @param amount
 
var value = argument[0];
var target = argument[1];
var amount = argument[2];
 
 /*
	This function fixes the old lerp function using the time_factor value of the camera.
	This will make work the camera equally with 30, 60 or any other game frequency.

	Arguments:
		- value (real): Origin value.
		- target (real): Target value.
		- amount (real): Percentage between these two values.
		
	Returns:
		- This script returns no value.
*/


// Calculate the fixed lerp
var fixed_amount = 1-power(1-amount, Camera.time_factor);
return lerp( value, target, fixed_amount);