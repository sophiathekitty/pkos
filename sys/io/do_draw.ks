// pkOS: The Pink Stars are Falling
// Do an event
//-----------------------

parameter draw_event_name. // what event are we doing? (ie: "LIGHTS_ON")


function find_draw_events {
	parameter draw_events_file.
	
	// if it has draw_events
	if(draw_events_file:haskey("draw")){
		set draw_events to draw_events_file["draw"].
		// and it has the one we want
		if(draw_events:haskey(draw_event_name)){
			set draw_event_list to draw_events[draw_event_name].
			for e in draw_event_list {
				runpath("/sys/utils/do_function.ks",e).
			}
		}
	}
}

// see if there's any software
if(EXISTS("/sys/software.json")){
	set rL to READJSON("/sys/software.json").
	
	find_draw_events(rL).
	
	if(rL:haskey("install_files")){
		set in_f to rL["install_files"].
		
		for in_fi in in_f {
			set sL to READJSON(in_fi).
			
			find_draw_events(sL).
		}
	}	
}
