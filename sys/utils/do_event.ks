// pkOS: The Pink Stars are Falling
// Do an event
//-----------------------

parameter event_name. // what event are we doing? (ie: "LIGHTS_ON")


function find_events {
	parameter events_file.
	
	// if it has events
	if(events_file:haskey("events")){
		set events to events_file["events"].
		// and it has the one we want
		if(events:haskey(event_name)){
			set event_list to events[event_name].
			for e in event_list {
				runpath("/sys/utils/do_function.ks",e).
			}
		}
	}
}

// see if there's any software
if(EXISTS("/sys/software.json")){
	set rL to READJSON("/sys/software.json").
	
	find_events(rL).
	
	if(rL:haskey("install_files")){
		set in_f to rL["install_files"].
		
		for in_fi in in_f {
			set sL to READJSON(in_fi).
			
			find_events(sL).
		}
	}	
}
