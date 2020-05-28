/// @desc --- CONTROL CHECK

#region Check following list

// Here we will check if all the instances inside the cam_following_list are still
// existing. Other way our game would crash.

// Iterate for all elements in list
var a_len = ds_list_size(cam_following_list);
var i = 0;

repeat (a_len) {
	// If the element does not exist just delete it from the list.
	if (!instance_exists(cam_following_list[|i])) {
		ds_list_delete(cam_following_list, i);
	} else {
		// Since we are deleting an entire element from the list,
		// all the indexes get modified, so we will increment the index
		// when we are not deleting any elemnt.
		i++;	
	}
}

#endregion