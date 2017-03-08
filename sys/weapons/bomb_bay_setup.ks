// pkOS: The Pink Stars are Falling
// Setup the Bomb Bay
//-----------------------


set bahaMk82Bombs to LIST().
set bahaMk82BombBrake to LIST().
set bahaJdamMk83 to LIST().
set bahaClusterBomb to LIST().


LIST PARTS in partlist.
for p in partlist {
	if(p:name = "bahaMk82Bomb"){
		bahaMk82Bombs:add(p).
		set pm to p:getmodule("MissileLauncher").
		pm:setfield("in cargo bay: ",true).
		// pm:doevent("fire missile"). // to drop bomb...
	}
	
	if(p:name = "bahaMk82BombBrake"){
		bahaMk82BombBrake:add(p).
		set pm to p:getmodule("MissileLauncher").
		pm:setfield("in cargo bay: ",true).
		// pm:doevent("fire missile"). // to drop bomb...
	}

	if(p:name = "bahaJdamMk83"){
		bahaJdamMk83:add(p).
		set pm to p:getmodule("MissileLauncher").
		pm:setfield("in cargo bay: ",true).
		// pm:doevent("fire missile"). // to drop bomb...
	}
	
	if(p:name = "bahaClusterBomb"){
		bahaClusterBomb:add(p).
		set pm to p:getmodule("MissileLauncher").
		pm:setfield("in cargo bay: ",true).
		// pm:doevent("fire missile"). // to drop bomb...
	}
	
}
set bomb_names to LIST("Basic","Breaking","Smart","Cluster").
set bombs to LIST().
bombs:add(bahaMk82Bombs).
bombs:add(bahaMk82BombBrake).
bombs:add(bahaJdamMk83).
bombs:add(bahaClusterBomb).