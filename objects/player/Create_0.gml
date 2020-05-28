/// @description Insert description here
// You can write your code in this editor
//CAMERA

//States
states = states.free

//Define Variables
w_spd = 0.5;
n_spd = 4;
r_spd = 6;
tactDelay = -1;
tact_canUse = 1;
tact_Dash = 1;
moving = 0;

myAmmo = 6;

spd = n_spd;
spd_var = 1;
spd_o = 0;

myAngle = 0;
myCurrentSprite = 0;

//Define Move Variables
moveX = 0;
moveY = 0;


//Timer
timer = -1
fireAgain = false;
//-1 = not set
//0 = just finished
//0 = in progress