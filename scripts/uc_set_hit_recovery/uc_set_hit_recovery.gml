/// @desc uc_set_hit_recovery
/// @param speed

var recovery = argument0;

/*
	Setter of the hit_recovery variable. Each step the hit_intensity will be decreased by this value.
	The hit_recovery works as gravity does in a platformer does.
	
	Arguments:
		- recovery (real): Value of the desired recovery for the hit effect.
		
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid cam hit_recovery.
if (recovery<0) {
	uc_error_message("CODE 02 - A given parameter (recovery) is outside the boundaries. Value got clamped.");
	recovery = 0;
}

// Sets the shake_acceleration value
Camera.hit_recovery = recovery;