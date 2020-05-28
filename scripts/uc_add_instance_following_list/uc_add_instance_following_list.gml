/// @desc uc_add_instance_following_list
/// @param instance (list...)

var instances = argument0;

/*
	This script is in charge of adding to the current cam_following_list variable an specific instance without deleting the old value.
	If the old value was noone, it just fills the variable, if it was a list, it adds to the array.
	
	Arguments:
		- instance (ID or IDs List): Contains an ID or a list of IDs of the instances
			we want to follow.
		
	Returns:
		- This script returns no value.
*/

// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// If the variable was noone just fill the variable
if (Camera.cam_following_list == noone) {
	uc_set_instance_following_list(instances);
} else {
	// First of all, diferenciate if we are working with an array or a single instance.
	if (!is_array(instances)) {
	
		// Check if the given instance does exists in the room.
		if (instance_exists(instances)) {
			if (ds_list_find_index(Camera.cam_following_list, instances)==-1) {
				Camera.cam_following_list[|ds_list_size(Camera.cam_following_list)] = instances;
			}
		} else {
			uc_error_message("CODE 04 - No instance/s found to add/delete in the cam_following list.");
		}

	} else {
	
		// Iterate over all the given array.
		var index = 0;
		var f_size = array_length_1d(instances);
	
		for( var i=0 ; i<f_size ; i++ ) {
		
			// Check if the instance exists in the room
			if (instance_exists(instances[i])) {
				
				// Check if the instance was already in the list
				if (ds_list_find_index(Camera.cam_following_list, instances[i])==-1) {
					Camera.cam_following_list[|ds_list_size(Camera.cam_following_list)] = instances[i];
					index++;
				}
			}
		}
	
		// If any of the given instances exists just add an error
		if (!index) {
			uc_error_message("CODE 04 - No instance/s found to add/delete in the cam_following list.");
		}
	}
}