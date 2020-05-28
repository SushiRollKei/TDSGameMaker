/// @description Insert description here
// You can write your code in this editor

//GUI Debugging
if instance_exists(player) with player {
	 draw_set_color(c_red);
	 draw_text(1200, 200, string("Debugging"));
	 draw_set_color(c_orange);
	 draw_text(1200, 220,string("Timer: ") + string(timer));
	 draw_text(1200, 240,string("FireAgain: ") + string(fireAgain));
	 draw_set_color(c_white);
	 draw_text(1200, 260, string("MoveX: ") + string(moveX));
	 draw_text(1200, 280, string("MoveY: ") + string(moveY));
	 draw_text(1200, 300, string("Total Speed: ") + string(spd_o));
	 draw_text(1200, 320, string("Speed: ") + string(spd));
	 draw_text(1200, 340, string("Variable Speed: ") + string(spd_var));
	 draw_text(1150, 440, string("Tact Delay: ") + string(tactDelay));
	 draw_text(1150, 480, string("Can Use Tactical?: ") + string(tact_canUse));
}