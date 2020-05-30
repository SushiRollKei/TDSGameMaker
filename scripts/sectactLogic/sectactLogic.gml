projectiles = projectiles.smoke;

if (timer >0) {
			timer--;
	}	else if (timer == 0){
			states = states.free;
			timer = -1;
	}
myCurrentSprite = sSecFire;

if (timer > 8){
	image_index = 1;
} else {
	image_index = 0;
}