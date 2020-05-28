/// @desc uc_flash
/// @param (optional)color
/// @param (optional)speed_list
/// @param (optional)max_alpha

if (argument_count>=1) var color = argument[0];
if (argument_count>=2) var spd = argument[1];
if (argument_count==3) var alpha = argument[2];

/*
	Sets the flash state into true. Other parameters as the color, the speed and
	the max_alpha of the flash can be optionally set.
	
	Arguments:
		(Optional)
		- color (color value): Sets the color of the flash.
		- speed_list (real list): List with in speed and out speed of the falsh.
		- max_alpha (real): Maximum opacity of the falsh.
	
	Returns:
		- This function returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid color value.
if (argument_count>=1) {
	if (color<0) {
		uc_error_message("CODE 02 - The given parameter (color) is outside the boundaries. Value got clamped.");
		color = c_white;
	}
}

// Check if we have a valid speed_list value.
if (argument_count>=2) {
	if (!is_array(spd)) {
		uc_error_message("CODE 07 - The speed parameter is not a list. The speed should have in_speed and out_speed values inside.");
		exit;
	} else {
		if (spd[0]<0 || spd[0]>1) {
			uc_error_message("CODE 02 - The given parameter (in speed) is outside the boundaries. Value got clamped.");
			spd[0] = clamp(spd[0], 0, 1);
		}
	
		if (spd[1]<0 || spd[1]>1) {
			uc_error_message("CODE 02 - The given parameter (out speed) is outside the boundaries. Value got clamped.");
			spd[1] = clamp(spd[1], 0, 1);
		}
	}
}

// Check if we have a valid max_alpha value.
if (argument_count>=3) {
	if (alpha<0 || alpha>1) {
		uc_error_message("CODE 02 - The given parameter (maX_alpha) is outside the boundaries. Value got clamped.");
		alpha = clamp(alpha, 0, 1);
	}
}

// Enable the flash and set the rest of the variables.
Camera.flash_enable = true;
if (argument_count>=1) Camera.flash_color = color;
if (argument_count>=2) Camera.flash_in_speed = spd[0];
if (argument_count>=2) Camera.flash_out_speed = spd[1];
if (argument_count==3) Camera.flash_max_alpha = alpha;