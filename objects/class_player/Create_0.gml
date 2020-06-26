//	States
states = states.free;
projectiles = projectiles.none;

//  Variables
w_spd = 0.5;			//	This variable does x
n_spd = 4;				//	This variable does blablabla
r_spd = 6;				//	Set this variable to meme the squeeme
tactDelay = -1;			//	etc
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


global.PlayerCurrentState = states;

//Timer
timer = -1
fireAgain = false;