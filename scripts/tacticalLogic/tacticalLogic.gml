	//myCurrentSprite = spr_id;

myCurrentSprite = sTestTact;
if (timer >0) {
	timer--;
	if !(tact_Dash = 10){
	tact_Dash = 10;
	}
} else if (timer == 0){
			states = states.free;
			timer = -1;
			tact_canUse = 0;
			tact_Dash = 1;
	}
