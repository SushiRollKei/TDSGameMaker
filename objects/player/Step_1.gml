/// @description Insert description here
// You can write your code in this editor

#region Firing a bullet
//Establish Firing Delay + Recoil
//recoil				= max(0, recoil - 1);
//Firing
if (states = states.fire1) or (states = states.fire2) {
	if (timer = 15) {
		myAmmo --;
	//recoil = 5;
		with (instance_create_layer(x,y,"Bullets",oProj)){
			speed		= 50;
			direction	= other.myAngle + random_range(-0.5,0.5);
			image_angle = direction;
		}
	}
}
//Location Recoil ("jumps")
//x					= x - lengthdir_x(recoil,image_angle);
//y					= y - lengthdir_y(recoil,image_angle);
#endregion
