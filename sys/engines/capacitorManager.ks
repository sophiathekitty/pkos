// Pink Stars: Engine Controls.
// Capacitor Manager
// This should discharge capacitors to ensure engines don't run out of electricity.


set next_cap to 1.
set cap_count to 6.
set elect_charge to 0.
set stored_charge to 0.

// find the electrical charge and stored charge resources
list resources in myRes.
for res in myRes {
	if(res:name = "ElectricCharge"){
		set elect_charge to res.
	}
	if(res:name = "StoredCharge"){
		set stored_charge to res.
	}
	
}

if(EXIST("/settings/capacitors.json"){
	set cap_list to readjson("/settings/capacitors.json").
} else {
	SET capacitors TO SHIP:PARTSTAGGED(Core:CurrentVolume:Name+"capacitor").
	// build a smart list of capacitors so we can track which ones have been used.
	set cap_list to list().
	for c in capacitors {
		set cap_info to lexicon().
		cap_info:add("part", c).
		cap_info:add("charged",true).
		cap_list:add(cap_info).
	}
	writejson(cap_list,"/settings/capacitors.json").
	copypath("/settings/capacitors.json","0:/settings/capacitors.json").
}

set cpm_first_run to true.

when (elect_charge:amount < elect_charge:capacity * 0.5 or cpm_first_run) then {
	if(cpm_first_run){
		HUDTEXT("Discharge Capacitor "+next_cap+"!",10,1,18,rgb(0,1,0),true).
		set cpm_first_run to false.
		preserve.
	} else {
		HUDTEXT("Discharge Capacitor "+next_cap+"!",10,1,18,rgb(0,1,0),true).
		if(next_cap = 1){
			AG51 on.
			set next_cap to next_cap + 1.
		} else if(next_cap = 2){
			AG52 on.
			set next_cap to next_cap + 1.
		} else if(next_cap = 3){
			AG53 on.
			set next_cap to next_cap + 1.
		} else if(next_cap = 4){
			AG54 on.
			set next_cap to next_cap + 1.
		} else if(next_cap = 5){
			AG55 on.
			set next_cap to next_cap + 1.
		} else if(next_cap = 6){
			AG56 on.
			set next_cap to next_cap + 1.
		}
		if(next_cap > cap_count){
			set next_cap to 1.
		}
		wait 0.1.
	}
	preserve.
}
