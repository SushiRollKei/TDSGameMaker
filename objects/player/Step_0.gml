/// @description Insert description here
// You can write your code in this editor

#region Abilities Timers
if tact_canUse = 0 {
	if tactDelay = -1 {
		tactDelay = room_speed * 2;
	} else if tactDelay > 0 {
		tactDelay --;
	}else {
		tactDelay = -1;
		tact_canUse = 1;
	}
}
#endregion
#region States Handler
switch (states)
{
	case states.free:
	myCurrentSprite = sTest
		if (input.mouseLeftPress) {
			if myAmmo > 0{
				timer = 15;
				states = states.fire1;
			}
	}	else if (!input.mouseLeftPress){
			if (input.tactPress) {
				if tact_canUse = 1{
					if (moving = 1) {
						states = states.free;
						timer = 10;
						states = states.tactical;
				}
			}
		} else if (!input.tactPress) {
			if (input.reloadPress){
				timer = 20;
				states = states.reload;
		}
	}	
	}
	break;
	case states.fire1:
		fireLogic(sTestFire1_1, states.fire2)
	break;
	case states.fire2:
		fireLogic(sTestFire1_12, states.fire1)
		break;
	case states.tactical:
		tacticalLogic();
	break;
	case states.reload:
		reloadLogic();
	break;
}
#endregion
#region Controls
key_Up			 = keyboard_check(ord("W"));
key_Left		 = keyboard_check(ord("A"));
key_Down		 = keyboard_check(ord("S"));
key_Right		 = keyboard_check(ord("D"));

if (states = states.fire1) or (states = states.fire2) or (states = states.free){
input_walk       = keyboard_check(vk_control);
input_run        = keyboard_check(vk_shift);
} else if (states = states.tactical) {
input_walk       = 0;
input_run        = 0;
}
#endregion
#region Movement Defining
//Speed Altering Depending on Button Input
	if (input_walk or input_run){
    spd = abs((input_walk * w_spd) - (input_run * r_spd));
}

else { 
    spd = n_spd;
}

//INTENDED MOVEMENT based on formula
spd_o = spd_var * spd
moveX = (key_Right - key_Left) * spd_o * tact_Dash;
moveY = (key_Down - key_Up) * spd_o * tact_Dash;
#endregion
#region Collision
//Handles Player collision
//Horizontal
if (moveX != 0) {
    if (place_meeting (x+moveX, y, oCollision)){
        repeat (abs(moveX)) {
        if (!place_meeting(x+sign(moveX), y, oCollision)){ x += sign(moveX); } 
            else { break;}
        }
        moveX = 0;
    }
}

//Vertical
if (moveY != 0) {
    if (place_meeting (x, y+moveY, oCollision)){
        repeat (abs(moveY)) {
        if (!place_meeting(x, y+sign(moveY), oCollision)){ y += sign(moveY); } 
            else { break;}
        }
        moveY = 0;
    }
}
#endregion
#region Movement
//Apply Movement
if (moveX = 0) && (moveY = 0){
	moving = 0;
} else {
	moving = 1;
}
x += moveX;
y += moveY;


#endregion
#region Handle Image
//Point towards mouse 
myAngle = point_direction(x,y,mouse_x,mouse_y);
#endregion