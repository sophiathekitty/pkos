// The Pink Stars
// pkOS Boot Manager
//-----------------------
// Sequence:
// - Check for sat control software
// - Run sat_main.ks
SET software_files to "none". // "0:/pkOS/[path to file]".

// say hello
clearscreen.
print "=============================================".
print " The Pink Stars are Falling ".
print " "+Core:CurrentVolume:Name + " | " + Core:Vessel:Name.
print "=============================================".
print " Boot Log on: "+time:calendar+ " at " + time:clock.
print "---------------------------------------------".

// if we're in prelaunch apply the breaks
if(Core:Vessel:Status = "PRELAUNCH"){
	BRAKES ON.
}



function check_file {
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

check_file("0:/pkOS/sys/system.json","/sys/system.json").
check_file("0:/pkOS/sys/utils/sys_installer.ks","/sys/utils/sys_installer.ks").
check_file("0:/pkOS/sys/utils/sys_update.ks","/sys/utils/sys_update.ks").

if(software_files = "none"){
	print time:clock+" no software installed". // file exists
} else {
	check_file(software_files,"/sys/software.json").
}

runpath("/sys/utils/sys_installer.ks").

set rL to READJSON("/sys/system.json").
set auto_run to rL["auto_run"].
if(auto_run = ""){
	print "---------------------------------------------".
	print time:clock+" system ready".		// this file already installed
} else {
	print "---------------------------------------------".
	print time:clock+" running: "+auto_run.		// this file already installed
	print "---------------------------------------------".
	runpath(auto_run).
}
