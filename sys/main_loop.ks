// pkOS: The Pink Stars are Falling
// Main Loop
//-----------------------

clearscreen.

set main_done to false.
until main_done {
	
	// Keyboard Input
	// ==========
	// if there's software see if it has a main_start events to fire....
	// this is where any init code can by fired....
	//
	// if we have a char in the input queue
	//
	if terminal:input:haschar {
		set ch to terminal:input:getchar().
		print ch AT(0,0).
	}
	
	
	// Update Displays
	// ==========
	// if there's software see if it has a main_input events to fire....
	// this is where the main input loop should be called....
	//
	runpath("/sys/utils/do_event.ks","DRAW").
	
	
	// BACKGROUND_MONITORING
	// ==========
	// if there's any software see if it has background_monitoring to fire....
	// this should fire anything that's supposed to be running in the background....
	// this should live in a special script that can be called by input loops and
	//
	runpath("/sys/utils/do_event.ks","BACKGROUND_MONITORING").
	
}