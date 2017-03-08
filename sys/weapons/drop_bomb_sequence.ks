// pkOS: The Pink Stars are Falling
// Drop the next available bomb
//-----------------------


// make sure bay doors are open
if(bay_doors = "closed"){
	runpath("/sys/weapons/open_bomb_bays.ks").
	wait 2.
}

for i in bomb_seq {

	runpath("/sys/weapons/drop_next_bomb.ks",i).
	set i to i + 1.
}


// close the doors because we're done with the sequence
runpath("/sys/weapons/close_bomb_bays.ks").
