// Pink Stars: Flight Controls.
// Simple Circularization Script
// This should handle smooth throttle handling.

PARAMETER mode is "Now".

// calculate ship's max acceleration
set max_acc to ship:maxthrust/ship:mass.

set init_ap to apoapsis.
set init_pe to periapsis.

//print out nod's basic parameters - ETA and deltaV
print "==========================".
print " Circularize Orbit "+mode.
print "==========================".
print " Apoapsis: " + round(APOAPSIS/1000).
print " Periapsis: " + round(PERIAPSIS/1000).
print "--------------------------".
print " Differemce: " + round((APOAPSIS-PERIAPSIS)/1000).
print "==========================".
print " ETA to Apoapsis: " + round(ETA:APOAPSIS) + " [t+" + round(ABS(ETA:APOAPSIS - Orbit:PERIOD)) +"]".
print " ETA to Periapsis: " + round(ETA:PERIAPSIS) + " [t+" + round(ABS(ETA:PERIAPSIS - Orbit:PERIOD)) +"]".
print "--------------------------".
print " Period: " + round(Orbit:PERIOD).
print "==========================".
print " Max Acceleration: " + round(max_acc).
print "==========================".


///
///
/// run modes
///
if(mode = "Ap"){

	if(ABS(ETA:APOAPSIS - Orbit:PERIOD) > 240) {
		print " Waiting till next apoapsis".
		wait until ETA:APOAPSIS <= 60.
	}	
	print " Lock Steering to Prograde".
	lock steering to PROGRADE.

} else if(mode = "Pe") {

	if(ABS(ETA:PERIAPSIS - Orbit:PERIOD) > 240) {
		print " Waiting till next periapsis".
		wait until ETA:PERIAPSIS <= 60.
	}

	print " Lock Steering to Retrograde".
	lock steering to RETROGRADE.

} else if(mode = "Now") {
	
	print " Now mode not supported".
}

set WARP to 0.

RCS on.
//we only need to lock throttle once to a certain variable in the beginning of the loop, and adjust only the variable itself inside it
set tset to 0.
lock throttle to tset.


print " Starting Burn".
print " ".
print " ".

set dif to APOAPSIS - PERIAPSIS.
set done to false.
until done {
	
	// if the difference is high use max thrust otherwise use low thrust
	if(dif > 200){
		set tset to 1.
	} else if(dif > 10) {
		set tset to 0.1.
	} else {
		set tset to 0.
		set done to true.
	}
	print "Change: " + round(dif - (APOAPSIS - PERIAPSIS)) AT(0,18).
	if((dif - (APOAPSIS - PERIAPSIS)) < -1) {
		set done to true.
	}
	// last difference
	set dif to APOAPSIS - PERIAPSIS.
}
print " Finished Burn".

lock throttle to 0.
unlock steering.
unlock throttle.
wait 1.
