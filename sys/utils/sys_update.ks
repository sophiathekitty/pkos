// The Pink Stars
// System Install Manager
//-----------------------
// Sequence:
// - Check to see if files are installed
// - Attempt to copy files if missing
// -- report success or failure of copy
// -- provide reason for failure

set true to false.

clearscreen.
print "=============================================".
print " The Pink Stars are Falling ".
print " "+Core:CurrentVolume:Name + " | " + Core:Vessel:Name.
print "=============================================".
print " Update Log on: "+time:calendar+ " at " + time:clock.
print "---------------------------------------------".



//
// check for file
//
function check_update_file {
	parameter scr_path.
	parameter dest_path.
	
	if(EXISTS(dest_path)){
		print time:clock+" "+dest_path+" [FOUND]". // file exists
		deletepath(dest_path).
		
		copypath(scr_path,dest_path).
		if(EXISTS(dest_path)){
			print time:clock+" "+scr_path+" [UPDATED]".		// this file already installed
		} else {
			print time:clock+" "+scr_path+" [FAIL]".		// this file already installed
		}		
	} else {
		print time:clock+" "+dest_path+" [MISS]". // file exists
		
		copypath(scr_path,dest_path).
		if(EXISTS(dest_path)){
			print time:clock+" "+scr_path+" [INST]".		// this file already installed
		} else {
			print time:clock+" "+scr_path+" [FAIL]".		// this file already installed
		}
	}
}

//
// install files in an install json
//
function update_file_set {
	parameter ins_f.
	
	print ins_f.
	
	// install setup
	set rL to READJSON(ins_f).
	set install_folder to rL["install_folder"].
	
	// update the json file
	check_update_file(install_folder+rL["system_file"],rL["system_file"]).
	
	set install_files to rL["install_files"].
	
	// check for sat control software
	print time:clock+" Looking for "+rL["category"]+" files... ".
	
	// loop through install_files 
	for in_file in install_files {
		check_update_file(install_folder+in_file,in_file).
	}
}

hudtext(Core:CurrentVolume:Name+" now [Updating]",5,1,18,rgb(1,0,0.5),true).



// update the system file
set sL to READJSON("/sys/system.json").
set folder to sL["install_folder"].
copypath(folder+"/sys/system.json","/sys/system.json").

// update system
update_file_set("/sys/system.json").

// check to see if we need to install software
if(EXISTS("/sys/software.json")){
	
	// update the software package definition.
	set sL to READJSON("/sys/software.json").
	set system_file to sL["system_file"].
	copypath(folder+system_file,"/sys/software.json").
	
	// update it's packages
	update_file_set("/sys/software.json").
	
	// now reload the file and update it's children's packages....
	set sL to READJSON("/sys/software.json").
	// loop through all the software packages
	for in_file in install_files {
		update_file_set(in_file).
	}
}


hudtext(Core:CurrentVolume:Name+" now [Updated]",5,1,18,rgb(1,0,0.5),true).

set c to 3.
until c = 0 {
	print "|Rebooting in "+c+"|" AT(1,terminal:height-1).
	set c to c - 1.
	wait 1.
}
reboot.