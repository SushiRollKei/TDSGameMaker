/// @desc uc_error_message
/// @param error

var scr = debug_get_callstack();
scr = string_copy(scr[1], 0, string_length(scr[1])-3);
scr = string_copy(scr, 12, string_length(scr))
var err = uc_time() + " Ultimate Camera Error " + string_copy(argument0, 0, 7) + " at " + scr + " " + string_copy(argument0, 9, string_length(argument0));

/*
	Adds and error string to the error list (if the camera exists) and prints it in the console.
	
	Arguments:
		- error (string): contains the string with the error we want to log. The error should be started with "CODE XX" where
		XX is the number that identifies the error. This is optional but I work like this.
		
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists.
if (!instance_exists(Camera)) {
	// You can not even log this error LOL
	show_debug_message(uc_time() + "Ultimate Camera Error CODE 01 at " + scr + "  - The Camera instance does not exist in the room.");
	exit;
}

// Add the error to the camera error log
Camera.error_list[array_length_1d(Camera.error_list)] = err;
show_debug_message(err);