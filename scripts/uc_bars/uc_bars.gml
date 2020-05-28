/// @desc uc_bars
/// @param (optional)enable
/// @param (optional)percentage
/// @param (optional)acceleration
/// @param (optional)color

if (argument_count>=1)var enable = argument[0];
if (argument_count>=2) var percentage = argument[1];
if (argument_count>=3) var acc = argument[2];
if (argument_count==4) var color = argument[3];

/*
	Enables or disables the bars in the scren. Other aspects as the amount of bars, the acceleration and the colors
	can be optionally specified.
	
	Arguments:
		- enable (boold): The state of the bars.
		(Optional)
		- percentage (real): Amount of the screen covered by the bars.
		- acceleration (real): Value between 0 and 1 that sets how fasts teh bars shows or hides.
		- color (color value): Color of the bars.
	
	Returns:
		- This function returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid enable value.
if (argument_count>=1) {
	if ((enable<0 || enable>1)) {
		uc_error_message("CODE 02 - The given parameter (enable) is outside the boundaries. Value got clamped.");
		enable = clamp(enable, 0, 1);
	}
}

// Check if we have a valid percentage value.
if (argument_count>=2) {
	if (percentage<0 || percentage>1) {
		uc_error_message("CODE 02 - The given parameter (percentage) is outside the boundaries. Value got clamped.");
		percentage = clamp(percentage, 0, 1);
	}
}

// Check if we have a valid acceleration value.
if (argument_count>=3) {
	if (acc<0 || acc>1) {
		uc_error_message("CODE 02 - The given parameter (acceleration) is outside the boundaries. Value got clamped.");
		acc = clamp(acc, 0, 1);
	}
}

// Check if we have a valid color value.
if (argument_count==4) {
	if (color<0) {
		uc_error_message("CODE 02 - The given parameter (color) is outside the boundaries. Value got clamped.");
		color = c_white;
	}
}

// Set all the variables.
Camera.bars_enabled = (argument_count>=1)?enable:!(uc_get_bars_enabled());
if (argument_count>=2) Camera.bars_percentage = percentage;
if (argument_count>=3) Camera.bars_acceleration = acc;
if (argument_count==4) Camera.bars_color = color;