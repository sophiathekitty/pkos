// pkOS: The Pink Stars are Falling
// Do an event
//-----------------------

parameter draw_event_name. // what event are we doing? (ie: "LIGHTS_ON")


// Draw Helper Functions
// ==========


function draw_large_char {
	parameter char.
	parameter x.
	parameter y.

	if(char = "1"){
		print " ## " AT(x,y).
		print "# # " AT(x,y+1).
		print "  # " AT(x,y+2).
		print "  # " AT(x,y+3).
		print "####" AT(x,y+4).
	}
	if(char = "2"){
		print " ## " AT(x,y).
		print "#  #" AT(x,y+1).
		print "  # " AT(x,y+2).
		print " #  " AT(x,y+3).
		print "####" AT(x,y+4).
	}
	if(char = "3"){
		print " ## " AT(x,y).
		print "#  #" AT(x,y+1).
		print "  # " AT(x,y+2).
		print "#  #" AT(x,y+3).
		print " ## " AT(x,y+4).
	}
	if(char = "4"){
		print "#  #" AT(x,y).
		print "#  #" AT(x,y+1).
		print " ###" AT(x,y+2).
		print "   #" AT(x,y+3).
		print "   #" AT(x,y+4).
	}
	if(char = "5"){
		print "####" AT(x,y).
		print "#   " AT(x,y+1).
		print "### " AT(x,y+2).
		print "   #" AT(x,y+3).
		print "### " AT(x,y+4).
	}
	if(char = "6"){
		print " ###" AT(x,y).
		print "#   " AT(x,y+1).
		print "### " AT(x,y+2).
		print "#  #" AT(x,y+3).
		print " ## " AT(x,y+4).
	}
	if(char = "7"){
		print "####" AT(x,y).
		print "   #" AT(x,y+1).
		print "  # " AT(x,y+2).
		print " #  " AT(x,y+3).
		print "#   " AT(x,y+4).
	}
	if(char = "8"){
		print " ## " AT(x,y).
		print "#  #" AT(x,y+1).
		print " ## " AT(x,y+2).
		print "#  #" AT(x,y+3).
		print " ## " AT(x,y+4).
	}
	if(char = "9"){
		print " ## " AT(x,y).
		print "#  #" AT(x,y+1).
		print " ###" AT(x,y+2).
		print "   #" AT(x,y+3).
		print " ## " AT(x,y+4).
	}
	if(char = "0"){
		print " ## " AT(x,y).
		print "#  #" AT(x,y+1).
		print "#  #" AT(x,y+2).
		print "#  #" AT(x,y+3).
		print " ## " AT(x,y+4).
	}
	if(char = "."){
		print "    " AT(x,y).
		print "    " AT(x,y+1).
		print " ## " AT(x,y+2).
		print " ## " AT(x,y+3).
		print "    " AT(x,y+4).
	}
	if(char = "-"){
		print "    " AT(x,y).
		print "    " AT(x,y+1).
		print "####" AT(x,y+2).
		print "    " AT(x,y+3).
		print "    " AT(x,y+4).
	}
	if(char = "+"){
		print "    " AT(x,y).
		print "  # " AT(x,y+1).
		print " ###" AT(x,y+2).
		print "  # " AT(x,y+3).
		print "    " AT(x,y+4).
	}
	if(char = "="){
		print "    " AT(x,y).
		print "####" AT(x,y+1).
		print "    " AT(x,y+2).
		print "####" AT(x,y+3).
		print "    " AT(x,y+4).
	}
	
}



// Event Handling logic
// ==========
/

// Look for draw events in the system/software .json file
function find_draw_events {
	parameter draw_events_file.
	
	// if it has draw_events
	if(draw_events_file:haskey("draw")){
		set draw_events to draw_events_file["draw"].
		// and it has the one we want
		if(draw_events:haskey(draw_event_name)){
			// grab the function scripts it wants to call and pass that to do_function
			set draw_event_list to draw_events[draw_event_name].
			for e in draw_event_list {
				runpath("/sys/utils/do_function.ks",e).
			}
		}
	}
}

// see if there's any software
if(EXISTS("/sys/software.json")){

	// Grabs the software file and looks for draw events in it.
	set rL to READJSON("/sys/software.json").
	find_draw_events(rL).
	
	// If the software installed any system package .json files look through those.
	if(rL:haskey("install_files")){
		set in_f to rL["install_files"].
		
		for in_fi in in_f {
			set sL to READJSON(in_fi).
			
			find_draw_events(sL).
		}
	}	
}
