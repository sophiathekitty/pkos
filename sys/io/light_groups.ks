// pkOS: The Pink Stars are Falling
// Display Lights on by Groups
//-----------------------

parameter light_group is "all".
parameter x is 0.
parameter y is 0.

// draw function
function draw_light_indicator {
	parameter lx.
	parameter ly.
	parameter state.
	if(state = "all_on") 	// all on
		print "+--(@)--------" AT(lx,ly).
	if(state = "some_on") 	// some on
		print "+--(O)--------" AT(lx,ly).
	if(state = "none_on") 	// none on
		print "+--( )--------" AT(lx,ly).
}

if(light_group = "all"){
	LIST PARTS in partlist.
} else {
	SET partlist to SHIP:PARTSTAGGED(light_group).
}

// track how many lights there are and how many one
set total_lights to 0.
set total_on to 0.

for p in partlist {
	for m in p:modules {
		if(m:contains("Light")){
			
			set total_lights to total_lights + 1.
			set pm to p:getModule(m).
			
			if(pm:hasevent("lights on")){
				// light off.
			} else if (pm:hasevent("lights off")){
				// light on
				set total_on to total_on + 1.
			}
			
		}
	}
}

if(total_on = 0){
	// none on....
	draw_light_indicator(x,y,"none_on").
} else if(total_on < total_lights){
	// some on....
	draw_light_indicator(x,y,"some_on").
} else if(total_on = total_lights) {
	// all on...
	draw_light_indicator(x,y,"all_on").
}

print "| " + light_group AT(x,y+1).
print "| " + total_on + "/" + total_lights AT(x,y+2).
