/// @desc uc_hit
/// @param direction
/// @param intensity
/// @param (optional)recovery

var dir = argument0;
var intensity = argument1;
if (argument_count==3) var recovery = argument[2];

/*
	Triggers the hit effect of the Camera.
	
	Arguments:
		- Direction (Degrees): Defines where the camera is going to get knockbacked.
		- Intensity (Integer): Is the amount of knockback the camera will get.
		(Optional)
		- Recovery (Integer): This variable is the acceleration that takes the camera to return back to its original position.
	
	Returns:
		- This function returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid cam hit_recovery.
if (argument_count==3) {
	if (recovery<0) {
		uc_error_message("CODE 02 - A given parameter (recovery) is outside the boundaries. Value got clamped.");
		recovery = 0;
	}
}

// If the intensity is negative just invert the direction.
if (intensity<0) {
	intensity *= -1;
	dir += 180;
}

// Enable the hit effect and set the variables.
if (!Camera.hit_length) {
	Camera.hit_direction = dir;
	Camera.hit_intensity = intensity;
	if (argument_count==3) Camera.hit_recovery = recovery;
}