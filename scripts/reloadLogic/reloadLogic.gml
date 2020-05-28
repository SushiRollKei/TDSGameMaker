myCurrentSprite = sTestTact;
if (timer >0) {
	timer--;
} else if (timer == 0){
			myAmmo = 6;
			states = states.free;
			timer = -1;
	}
