/// @description - - INITIALIZE THE CAMERA

// ==============================================================
// ------------------------------------	CAMERA MAIN PARAMETERS	-------------------------------
// ==============================================================
#region Set all the camera main parameters

window_set_fullscreen(false);
// view_width --> Width of the portion of room we will be seeing
// view_height --> Height of the portion of the room we will be seeing

aspect_ratio = view_width/view_height; // Relation between the windows size and screen size
port_width = port_height*aspect_ratio; // Width of the window where the game will be drawn
// port_height --> Height of the window where the game will be drawn

display_set_gui_size(port_width, port_height); //  < ------------------------ THIS LINE IS TOTALLY OPTIONAL

x = view_width/2; // Adjust the camera to the top left corner
y = view_height/2;

primitive_view_x = x-view_width/2; // Calculate the x position of the view relative to the camera object position
primitive_view_y = y-view_height/2; // Calculate the y position of the view relative to the camera object position
view_x = primitive_view_x;
view_y = primitive_view_y;

// Here we apply the size of the window and the surface where we will be drawing the game.
window_set_size(port_width, port_height);
surface_resize(application_surface, port_width, port_height);
uc_window_center();

// Here we are saying all the values we are setting in this code
// are thought for a 60FPS running game, other frequencies will
// be adapted with time factor using delta time.
time_factor = delta_time * BASE_FPS / 1000000;

#endregion

// ==============================================================
// -------------------------------------	CAMERA STATE MACHINE	----------------------------------
// ==============================================================
#region Initialize the camera state machine

// Here we define the different modes the camera can take.
// Every different camera mode is stored in this enum.
enum CMODE {
	STATIC,
	OBJECT_FOLLOWING,
	OBJECT_BORDERS,
	MOUSE_BORDERS,
	MOUSE_SHOOTER,
	MOUSE_DRAG,
	CMODE_SIZE
}

// This string list is made to have the name of the mode in text.
cam_mode_string_list = ["STATIC", "OBJECT_FOLLOWING", "OBJECT_BORDERS",
							"MOUSE_BORDERS", "MOUSE_SHOOTER", "MOUSE_DRAG"];

#endregion

// ==============================================================
// -----------------------------------------	CAMERA MODES	-----------------------------------------
// ==============================================================
#region Set all the camera modes variables

// General variables
uc_set_target_x(x);
uc_set_target_y(y);

// ----------------------------------- Object Following Variables --------------------------------------
cam_following_list = ds_list_create();

// ----------------------------------- Object Border Variables --------------------------------------------
cam_object_borders_rx = 0;
cam_object_borders_ry = 0;

// ----------------------------------- Mouse Border Variables ----------------------------------
cam_mouse_borders_movdir = 0;
cam_mouse_borders_hspd = 0;
cam_mouse_borders_vspd = 0;


// ----------------------------------- Drag Variables --------------------------------------------
cam_mouse_drag_mx = 0;
cam_mouse_drag_my = 0;
cam_mouse_drag_cx = 0;
cam_mouse_drag_cy = 0;
cam_mouse_drag_hspd = 0;
cam_mouse_drag_vspd = 0;

uc_set_mouse_drag_button(mb_middle);

#endregion

// ==============================================================
// -----------------------------------------	CAMERA EFFECTS	-----------------------------------------
// ==============================================================
#region Set all the camera effects variables

//  -------------------------------------- Scaling Variables --------------------------------------
// The scale will be a factor which we will be multipliying the view_width and
// view height with. The scale limits are set in order to not crash the game.
// I highly recommend keeping the maximum limit in a reasonable size.
view_scale_target = view_scale;

//  ------------------------------------ Auto Scaling Variables ------------------------------------
// The auto scaling is in charge of automatically scalling the viewby the average
// distance between all the instances in the following list and the center point.
avg_dis_to_center = 0;
view_auto_scale = 1;
view_total_scale = view_scale*view_auto_scale;

//  ------------------------------------ Inclination Variables ------------------------------------
// The inclination of the camera is the camera angle. I called this variable as
// view_inclination because view_angle is already a built in variable.
view_inclination_target = view_inclination;

//  ------------------------------------ Shaking Variables ------------------------------------
// The shaking will set the camera position at a shake_intensity distance within a
// random angle. The shake amplitude will approach to 0  every step by shake_acceleration.
// You can set the shake speed at 0 and the shake will persist on time.
shake_current = 0;

shake_enable = false;

//  ------------------------------------- Hit Variables ---------------------------------------
// The hit effect is like the jump in a platformer but it can be displayed in any direction.
// Once the hit is triggered it will make a knockback effect that can be cool to enfasize
// an attack like people do in some turn-based games.
hit_length = 0;

hit_intensity = 0;
hit_direction = 0;

// ----------------------------------------- Bars variables -----------------------------------------
// The bars are just two rectangles filled with the desired color drawn in the GUI.
// The bars will appear or not deppending of the bars_enabled variable. The speed
// of the bars hidding or showing is defined by bars_acceleration and the amount of screen
// taken by the bars is defined by bars_percentage.
bars_position = 0;

// -------------------------------------------- Flash variables ----------------------------------------
// The flash is a rectangle drawn in the GUI in the desired color. The speed of 
// the flash is separated by two different parameters, one for introduction and
// one for dissappearing.
flash_alpha= 0;
flash_threshold = 0.01;
flash_enable = false;

#endregion

// ==============================================================
// ---------------------------------------------	MISCELLANY	--------------------------------------------
// ==============================================================
#region Debugging and drawing variables

// Debbuging variables
uc_set_debug_mode(false);
error_list = [];
debug_color = c_white;

// Drawing Variables
image_alpha = 0; // Make sure to not show the sprite of the Camera

#endregion

#region Per Room Switches
switch (room){
	case 0:
		uc_set_mode(CMODE.MOUSE_SHOOTER);
		uc_set_instance_following_list(1);
		uc_set_view_scale(1.8);
		cam_mouse_shooter_percentage = 0.333;
		cam_mouse_shooter_acceleration = 1;
		camera_debug_mode = false;

	break;
}
#endregion