/// @desc uc_shake
/// @param (optional)intensity
/// @param (optional)acceleration

if (argument_count>=1) var intensity = argument[0];
if (argument_count==2) var acc = argument[1];

/*
	With this function you can make the screen shake. The intensity and the acceleration of the shake can be specified.
	
	Arguments:
		(Optional)
		- intensity (real): Amplitude the camera will shift every step while the shake is enabled.
		- acceleration (real): This value will approach the intensity of the shake to 0. You can set this value to 0 so the shake
		can last forever.

	Returns:
		- This function returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid cam shake_intensity value.
if (argument_count>=1) {
	if (intensity<0) {
		uc_error_message("CODE 02 - The given parameter (intensity) is outside the boundaries. Value got clamped.");
		intensity = 0;
	}
	
	if (argument_count>1) {
		if (acc<0 ||acc>1) {
			uc_error_message("CODE 02 - The given parameter (acceleration) is outside the boundaries. Value got clamped.");
			acc = clamp(acc, 0, 1);	
		}
	}
}

// Enables the shake.
Camera.shake_enable = true;
if (argument_count>=1) Camera.shake_intensity = intensity;
if (argument_count==2) Camera.shake_acceleration = acc;