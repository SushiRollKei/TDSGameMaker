/// @desc uc_get_instance_following_list
/// @param index

if (argument_count>0) {
	var ind = argument[0];
}

/*
	This script returns the id of an instance inside the cam_following list or the full following list.
	
	Arguments:
		(Optional)
		- index (integer): Index inside the list to look for.
	
	Returns:
		- This script returns an instance ID.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if the index is valid
if (argument_count>0) {
	if (ind>=ds_list_size(Camera.cam_following_list)) || (ind<0) {
		uc_error_message("CODE 05 - There is no instance in the cam_following list within the index: " + string(ind) + ".");
		return NULL;
	}
}

if (argument_count>0) {
	// If we have index give only the indicated instance.
	return (Camera.cam_following_list[|ind]);
} else {
	// If index not given, return the whole list
	return(Camera.cam_following_list);	
}