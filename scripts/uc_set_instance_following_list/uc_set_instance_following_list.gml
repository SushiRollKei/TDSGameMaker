/// @desc uc_set_instance_following_list
/// @param instance/s

var instances = argument0;

/*
	This script is in charge of assigning the instance or instances of an object
	which the camera will try to focus.
	
	Arguments:
		- instance (optional ID list): Contains an ID or a list of IDs of the instances
			we want to follow.
		
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Clear the old following list
ds_list_clear(Camera.cam_following_list);

// First of all, diferenciate if we are working with an array or a single instance.
if (!is_array(instances)) {
	
	// Check if the given instance does exists in the room.
	if (instance_exists(instances)) {
		Camera.cam_following_list[|0] = instances;	
	} else {
		uc_error_message("CODE 04 - No instance/s found to add/delete in the cam_following list.");
	}

} else {
	
	// Iterate over all the given array.
	var index = 0;
	var f_size = array_length_1d(instances);
	
	for( var i=0 ; i<f_size ; i++ ) {
		
		// If the instance actually exists in the room add it to the new array.
		if (instance_exists(instances[i])) {
			Camera.cam_following_list[|index] = instances[i];
			index++;
		}
	}
	
	// If any of the given instances exists just add an error
	if (!index) {
		uc_error_message("CODE 03 - No instance/s found to add to the cam_following list.");
	}
}