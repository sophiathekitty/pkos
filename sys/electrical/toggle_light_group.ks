// pkOS: The Pink Stars are Falling
// Toggle lights on or off
//-----------------------

parameter light_group is "all".
parameter light_state is "toggle".

if(light_group = "all"){
	LIST PARTS in partlist.
} else {
	SET partlist to SHIP:PARTSTAGGED(light_group).
}

for p in partlist {
	for m in p:modules {
		if(m:contains("Light")){
		
			set pm to p:getModule(m).
			
			if(light_state = "toggle") {
				if(pm:HasAction("togglelight")){
					//pm:DoAction("togglelight",true).
					if(pm:hasevent("lights on")){
						pm:DoAction("turn light on",true).
					} else if (pm:hasevent("lights off")){
						pm:DoAction("turn light off",true).
					}
				}
			}
			if(light_state = "on") {
				if(pm:HasAction("turn light on")){
					pm:DoAction("turn light on",true).
				}
			}
			if(light_state = "off") {
				if(pm:HasAction("turn light off")){
					pm:DoAction("turn light off",true).
				}
			}
			
		}
	}
}
