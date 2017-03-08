// pkOS: The Pink Stars are Falling
// Drop the next available bomb
//-----------------------

parameter bomb_id is 1.

// make sure bay doors are open
if(bay_doors = "closed"){
	runpath("/sys/weapons/open_bomb_bays.ks").
	wait 2.
}

if(bombs[bomb_id]:length > 0){
	// we can drop a bomb!
	set bomb_to_drop to bombs[bomb_id][0].
	
	print bomb_to_drop:name AT(0,8).
	hudtext("Dropping "+bomb_to_drop:title,5,1,18,rgb(1,0,0.5),true).
	
	set pm to bomb_to_drop:getmodule("MissileLauncher").
	pm:doevent("fire missile"). // to drop bomb...
	wait 0.2.
}
// lets update the bombs list once we're done so the display is correct....
runpath("/sys/weapons/bomb_bay_setup.ks").
