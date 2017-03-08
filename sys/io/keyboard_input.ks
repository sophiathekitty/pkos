// pkOS: The Pink Stars are Falling
// Keyboard Input
//-----------------------


// setup the key inputs....

function find_keyinput {
	parameter events_file.
	parameter keyGroup.
	
	
	// if it has events
	if(events_file:haskey("action_inputs")){
		set events to events_file["action_inputs"].
		
		
		// and it has the one we want
		if(events:haskey(keyGroup)){
			runpath("/sys/utils/do_event.ks",events[keyGroup]).
		}
	}
}

function do_keyboard_input {
	parameter keyGroup.
	
	print keyGroup+" " AT(0,terminal:height-1).
	
	if(EXISTS("/sys/software.json")){
		set rL to READJSON("/sys/software.json").
		
		find_keyinput(rL,keyGroup).
		
		if(rL:haskey("install_files")){
			set in_f to rL["install_files"].
			for in_fi in in_f {
				set sL to READJSON(in_fi).
				find_keyinput(sL,keyGroup).
			}
		}	
	}
}

on AG1 { 
	do_keyboard_input("AG1").
	preserve.
}
on AG2 { 
	do_keyboard_input("AG2").
	preserve.
}
on AG3 { 
	do_keyboard_input("AG3").
	preserve.
}
on AG4 { 
	do_keyboard_input("AG4").
	preserve.
}
on AG5 { 
	do_keyboard_input("AG5").
	preserve.
}
on AG6 { 
	do_keyboard_input("AG6").
	preserve.
}
on AG7 { 
	do_keyboard_input("AG7").
	preserve.
}
on AG8 { 
	do_keyboard_input("AG8").
	preserve.
}
on AG9 { 
	do_keyboard_input("AG9").
	preserve.
}
on AG10 { 
	do_keyboard_input("AG10").
	preserve.
}


on AG11 { 
	do_keyboard_input("AG11").
	preserve.
}
on AG12 { 
	do_keyboard_input("AG12").
	preserve.
}
on AG13 { 
	do_keyboard_input("AG13").
	preserve.
}
on AG14 { 
	do_keyboard_input("AG14").
	preserve.
}
on AG15 { 
	do_keyboard_input("AG15").
	preserve.
}
on AG16 { 
	do_keyboard_input("AG16").
	preserve.
}
on AG17 { 
	do_keyboard_input("AG17").
	preserve.
}
on AG18 { 
	do_keyboard_input("AG18").
	preserve.
}
on AG19 { 
	do_keyboard_input("AG19").
	preserve.
}
on AG20 { 
	do_keyboard_input("AG20").
	preserve.
}


on AG21 { 
	do_keyboard_input("AG21").
	preserve.
}
on AG22 { 
	do_keyboard_input("AG22").
	preserve.
}
on AG23 { 
	do_keyboard_input("AG23").
	preserve.
}
on AG24 { 
	do_keyboard_input("AG24").
	preserve.
}
on AG25 { 
	do_keyboard_input("AG25").
	preserve.
}
on AG26 { 
	do_keyboard_input("AG26").
	preserve.
}
on AG27 { 
	do_keyboard_input("AG27").
	preserve.
}
on AG28 { 
	do_keyboard_input("AG28").
	preserve.
}
on AG29 { 
	do_keyboard_input("AG29").
	preserve.
}
on AG30 { 
	do_keyboard_input("AG30").
	preserve.
}


on AG31 { 
	do_keyboard_input("AG31").
	preserve.
}
on AG32 { 
	do_keyboard_input("AG32").
	preserve.
}
on AG33 { 
	do_keyboard_input("AG33").
	preserve.
}
on AG34 { 
	do_keyboard_input("AG34").
	preserve.
}
on AG35 { 
	do_keyboard_input("AG35").
	preserve.
}
on AG36 { 
	do_keyboard_input("AG36").
	preserve.
}
on AG37 { 
	do_keyboard_input("AG37").
	preserve.
}
on AG38 { 
	do_keyboard_input("AG38").
	preserve.
}
on AG39 { 
	do_keyboard_input("AG39").
	preserve.
}
on AG40 { 
	do_keyboard_input("AG40").
	preserve.
}




// and then we need to run background monitors...
runpath("/sys/utils/background_loop.ks").
