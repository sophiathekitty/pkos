// pkOS: The Pink Stars are Falling
// Open and close doors...
//-----------------------

parameter part_group is "all".
parameter set_state is "toggle".

if(part_group = "all"){
	LIST PARTS in partlist.
} else {
	SET partlist to SHIP:PARTSTAGGED(part_group).
}



function open_door{
	parameter pm.
	
	if(pm:hasevent("open bay doors"))
		pm:doevent("open bay doors").
	if(pm:hasevent("open right"))
		pm:doevent("open right").
	if(pm:hasevent("open left"))
		pm:doevent("open left").
	if(pm:hasevent("open doors"))
		pm:doevent("open doors").
	if(pm:hasevent("open"))
		pm:doevent("open").
}
function door_is_closed{
	parameter pm.
	
	if(pm:hasevent("open bay doors"))
		return true.
	if(pm:hasevent("open right"))
		return true.
	if(pm:hasevent("open left"))
		return true.
	if(pm:hasevent("open doors"))
		return true.
	if(pm:hasevent("open"))
		return true.
	return false.
}

function close_door{
	parameter pm.
	
	if(pm:hasevent("close bay doors"))
		pm:doevent("close bay doors").
	if(pm:hasevent("retract bay doors"))
		pm:doevent("retract bay doors").
	if(pm:hasevent("close right"))
		pm:doevent("close right").
	if(pm:hasevent("close left"))
		pm:doevent("close left").
	if(pm:hasevent("close doors"))
		pm:doevent("close doors").
	if(pm:hasevent("retract doors"))
		pm:doevent("retract doors").
	if(pm:hasevent("close"))
		pm:doevent("close").
}


for p in partlist {
	if(p:hasmodule("ModuleAnimateGeneric")){
		set pm to p:getModule("ModuleAnimateGeneric").
		
		// openning....
		if(set_state = "open"){
			open_door(pm).
		}
		
		// closing....
		if(set_state = "close"){
			close_door(pm).
		}
		
		// toggle....
		if(set_state = "toggle"){
			if(door_is_closed(pm)){
				open_door(pm).
			} else {
				close_door(pm).
			}	
		}
		
	}	
}

