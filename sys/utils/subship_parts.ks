// pkOS: The Pink Stars are Falling
// Detect Systems
//-----------------------


// find the current core's part...
SET partlist to SHIP:PARTSTAGGED(Core:CurrentVolume:Name).
for p in partlist {
	// get modules
	set mods to p:modules.
	set hasProcessor to false.
	set hasCommand to false.
	for m in mods{
		if(m = "kOSProcessor"){
			set hasProcessor to true.
		} else if(m = "ModuleCommand"){
			set hasCommand to true.
		}
	}
	if(hasProcessor and hasCommand){
		set localRootPart to p.
		print localRootPart:hasparent.
	}
}

set parts_count to 0.

set local_parts to list().

function has_module {
	parameter pt.
	parameter mod.
	for m in pt:modules {
		if(m = mod)
			return true.
	}
	return false.
}

function check_children {
	parameter pnt.
	
	local_parts:ADD(pnt).
	set parts_count to parts_count + 1.
	
	if(not has_module(pnt,"ModuleDockingNode"))
		for kid in pnt:children {
			check_children(kid).
		}
}


check_children(localRootPart).
print local_parts.
print "parts count: "+parts_count + " out of "+ship:parts:length.