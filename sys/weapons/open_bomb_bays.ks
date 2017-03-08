// pkOS: The Pink Stars are Falling
// Setup the Bomb Bay
//-----------------------

SET partlist to SHIP:PARTSTAGGED("BombBay").
for p in partlist {
	set pm to p:getModule("ModuleAnimateGeneric").
	if(pm:hasevent("open bay doors"))
		pm:doevent("open bay doors").
}

set bay_doors to "open".