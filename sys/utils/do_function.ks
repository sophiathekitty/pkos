// pkOS: The Pink Stars are Falling
// Do an event
//-----------------------

parameter e. // what event are we doing? (ie: "LIGHTS_ON")
if(e:length = 1){
	if(EXISTS(e[0]))
		runpath(e[0]).
	else 
		print e.
} else if(e:length = 2) {
	if(EXISTS(e[0]))
		runpath(e[0],e[1]).
	else 
		print e.
} else if(e:length = 3) {
	if(EXISTS(e[0]))
		runpath(e[0],e[1],e[2]).
	else 
		print e.
} else if(e:length = 4) {
	if(EXISTS(e[0]))
		runpath(e[0],e[1],e[2],e[3]).
	else 
		print e.
} else if(e:length = 5) {
	if(EXISTS(e[0]))
		runpath(e[0],e[1],e[2],e[3],e[4]).
	else 
		print e.
} else if(e:length = 6) {
	if(EXISTS(e[0]))
		runpath(e[0],e[1],e[2],e[3],e[4],e[5]).
	else 
		print e.
} else if(e:length = 7) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6]).
} else if(e:length = 8) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7]).
} else if(e:length = 9) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8]).
} else if(e:length = 10) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8],e[9]).
} else if(e:length = 11) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8],e[9],e[10]).
} else if(e:length = 12) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8],e[9],e[10],e[11]).
} else if(e:length = 13) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8],e[9],e[10],e[11],e[12]).
} else if(e:length = 14) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8],e[9],e[10],e[11],e[12],e[13]).
} else if(e:length = 15) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8],e[9],e[10],e[11],e[12],e[13],e[14]).
} else if(e:length = 16) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8],e[9],e[10],e[11],e[12],e[13],e[14],e[15]).
} else if(e:length = 17) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8],e[9],e[10],e[11],e[12],e[13],e[14],e[15],e[16]).
} else if(e:length = 18) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8],e[9],e[10],e[11],e[12],e[13],e[14],e[15],e[16],e[17]).
} else if(e:length = 19) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8],e[9],e[10],e[11],e[12],e[13],e[14],e[15],e[16],e[17],e[18]).
} else if(e:length = 20) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8],e[9],e[10],e[11],e[12],e[13],e[14],e[15],e[16],e[17],e[18],e[19]).
} else if(e:length = 21) {
	runpath(e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7],e[8],e[9],e[10],e[11],e[12],e[13],e[14],e[15],e[16],e[17],e[18],e[19],e[20]).
}
