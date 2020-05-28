///@param spr_id
///@param ae_states

var spr_id = argument[0]
var ae_states = argument[1]

		if (input.mouseLeftPress){
			if myAmmo > 0 {
				fireAgain = true;
			}
	}
		if (timer >0) {
			timer--;
	}	else if (timer == 0){
				if (fireAgain = true) {
					states = ae_states;
					fireAgain = false;
					timer = 15;
			}	else {
					states = states.free;
					timer = -1;
			}
	}
myCurrentSprite = spr_id;