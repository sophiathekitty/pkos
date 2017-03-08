// Pink Stars: Flight Controls.
// Throttle Control Script.
// This should handle smooth throttle handling.

PARAMETER targetThrottle is 0.
set currentThrottle to throttle.
set deltaThrottle to targetThrottle - currentThrottle.

print("Throttle Control<[T: " + targetThrottle + "] | [C: " + currentThrottle + "] | [D: " + deltaThrottle + "]>").

set changeStep to 1.

until ABS(deltaThrottle) < 0.001 {
	
	set currentThrottle to currentThrottle + deltaThrottle/2.
	
	print("Throttle Change Step<["+changeStep+"]=[T: " + targetThrottle + "] | [C: " + currentThrottle + "] | [D: " + deltaThrottle + "]>").
	
	lock throttle to currentThrottle.
	
	set deltaThrottle to targetThrottle - currentThrottle.
}