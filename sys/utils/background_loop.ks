// pkOS: The Pink Stars are Falling
// Main Background Loop
//-----------------------


set display_changed to true.

set aDotsText to ".....".
// clear screen and then dive into the loop.
clearscreen.
set done to false.
until done {
	
	if terminal:input:haschar {
		set ch to terminal:input:getchar().
		
		if ch = terminal:input:DOWNCURSORONE {
			print "You typed the down-arrow key." AT(0,0).
		} else if ch = terminal:input:UPCURSORONE {
			print "You typed the up-arrow key.  " AT(0,0).
		} else {
			print ch AT(0,0).
		}
	} else {
		  print "                             " AT(0,0).
	}
	
	// background monitoring phase
	
	
	// display phase
	if display_changed {
		runpath("/sys/io/display.ks").
		set display_changed to false.
	}
	
	// display a notice about background loop being active
	print "|pkOS:"+aDotsText+"|" AT(0,terminal:height-1).
	if(aDotsText = "....."){
		set aDotsText to "     ".
	} else if(aDotsText = "...  "){
		set aDotsText to ".... ".
	} else if(aDotsText = ".... "){
		set aDotsText to ".....".
	} else if(aDotsText = "..   "){
		set aDotsText to "...  ".
	} else if(aDotsText = ".    "){
		set aDotsText to "..   ".
	} else if(aDotsText = "     "){
		set aDotsText to ".    ".
	}
	wait 0.1.
}