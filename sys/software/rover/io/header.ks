// pkOS: The Pink Stars are Falling
// Display Rover Header
//-----------------------

set Core:Vessel:Type to "Rover". // setting this here for now to be lazy.... should be moved

// First Draw the basic framing.
// This should probably only be done once.
//     0        10        20        30        40        50       60        70
//    "012345678901234567890123456789012345678901234567890123457890123456789012345678"
print "+======================================================+=[Speed]=============+" AT(0,0).
print "| The Pink Stars are Falling                           |                     |" AT(0,1).
print "| ROVER SYSTEMS MANAGMENT                              |                     |" AT(0,2).
print "+------------------------------------------------------+                     |" AT(0,3).
print "| Body:              Bearing:         Heading:         |                     |" AT(0,4).
print "| Status:                                              |                     |" AT(0,5).
print "| Crew:                                                +-(      )------(m/s)-+" AT(0,6)
                                                              //(Breaks)

// now add the data to this. stuff...
print Core:Vessel:Body:PADRIGHT(17) AT(8,4).
print Core:Vessel:Status:PADRIGHT(14) AT(10,5).

print round(Core:Vessel:Bearing) AT(29,4).
print round(Core:Vessel:Heading) AT(46,4).

print "(0,4)".

// animation idea to indicate the system is running processes. (fancy blinker/spinner)
// play these cells in sequence each loop. each time it loops it should move to a new location between (29,1) and (49,1)

// [0]
// "*    "
// "     "
// "12345"

// [1]
// "\    "
// " *   "

// [2]
// " . ,,"
// "{\;/}"

// [3]
// " ~ ~ "
// "~ _ ~"

// [4]
// "     "
// "~   ~"

// [5]
// "    "
// "    "