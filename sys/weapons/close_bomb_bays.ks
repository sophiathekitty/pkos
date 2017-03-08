// pkOS: The Pink Stars are Falling
// Setup the Bomb Bay
//-----------------------

SET partlist to SHIP:PARTSTAGGED("BombBay").
for p in partlist {
	set pm to p:getModule("ModuleAnimateGeneric").
	if(pm:hasevent("close bay doors"))
		pm:doevent("close bay doors").
	if(pm:hasevent("retract bay doors"))
		pm:doevent("retract bay doors").
}

set bay_doors to "closed".