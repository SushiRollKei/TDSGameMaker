/// @description Insert description here
// You can write your code in this editor
//if instance_exists(player) with player {
//	if (projectiles = projectiles.kunai){
	//myProjType = "Kunai";
	//} else if (projectiles = projectiles.smoke){
	//myProjType = "Smoke";
	
//	}
//}

if (collision_line(xprevious,yprevious,x,y,oCollision,0,false)){
		instance_destroy();
	}

//if myProjType = "Kunai"{
	//if (collision_line(xprevious,yprevious,x,y,oCollision,0,false)){
	//	instance_destroy();
//	}
//}else if myProjType = "Smoke" {
//	if (collision_line(xprevious,yprevious,x,y,oCollision,0,false)){
//		instance_destroy();
//	}
//}