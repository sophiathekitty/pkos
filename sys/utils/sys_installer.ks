// The Pink Stars
// System Install Manager
//-----------------------
// Sequence:
// - Check to see if files are installed
// - Attempt to copy files if missing
// -- report success or failure of copy
// -- provide reason for failure


//
// check for file
//
function check_install_file {
	parameter scr_path.
	parameter dest_path.
	
	if(EXISTS(dest_path)){
		print time:clock+" "+dest_path+" [FOUND]". // file exists
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
function install_file_set {
	parameter ins_f.

	// install setup
	set rL to READJSON(ins_f).
	set install_folder to rL["install_folder"].
	set install_files to rL["install_files"].
	
	// check for sat control software
	print time:clock+" Looking for "+rL["category"]+" files... ".
	
	// loop through install_files 
	for in_file in install_files {
		check_file(install_folder+in_file,in_file).
	}
}

// install system
install_file_set("/sys/system.json").

// check to see if we need to install software
if(EXISTS("/sys/software.json")){
	
	// install software lists
	install_file_set("/sys/software.json").
	
	// install software packages.....
	set sL to READJSON("/sys/software.json").
	set install_files to sL["install_files"].
	
	// loop through all the software packages
	for in_file in install_files {
		install_file_set(in_file).
	}
}