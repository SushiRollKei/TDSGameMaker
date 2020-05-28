/// @desc uc_delete_instance_following_list
/// @param instance (list...)

var instances = argument0;

/*
	This script is in charge of deleting an specific instance or instances from the following list.
	
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
	uc_error_message("CODE 04 - No instance/s found to add/delete in the cam_following list.");
	exit;
}


	// First of all, diferenciate if we are working with an array or a single instance.
if (!is_array(instances)) {
	
	// Check if the given instance does exists in the room.
	if (instance_exists(instances)) {
		var inst_index = ds_list_find_index(Camera.cam_following_list, instances);
		if (inst_index!=NULL) {
			ds_list_delete(Camera.cam_following_list, inst_index);
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
			var inst_index = ds_list_find_index(Camera.cam_following_list, instances[i]);
			if (inst_index!=NULL) {
				ds_list_delete(Camera.cam_following_list, inst_index);
				index++;
			}
		}
	}
	
	// If any of the given instances exists just add an error
	if (!index) {
		uc_error_message("CODE 04 - No instance/s found to add/delete in the cam_following list.");
	}
}