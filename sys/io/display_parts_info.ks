// The Pink Stars
// Display parts info
//-----------------------

Print "================================================".
Print " full parts info dump test ".
Print "================================================".
list PARTS in myParts.
for my_part in myParts {
	Print "======--------------======".
	Print " ".
	Print "--------------------------".
	Print "--------------------------".
	print "UID:        " + my_part:uid.
	print "Title:      " + my_part:title.
	print "Name:       " + my_part:name.
	print "Tag:        " + my_part:tag.
	print "Stage:      " + my_part:stage.
	print "Targetable: " + my_part:targetable.
	Print "--------------------------".
	if(my_part:hasparent)
		print my_part:parent.
	print my_part:children.
	Print "--------------------------".
	print my_part:resources.
	Print "--------------------------".
	set modules to my_part:modules.
	print " Modules".
	for module in modules {
		set mdl to my_part:getmodule(module).
		Print "..........................".
		print mdl:name.
		if(mdl:allfields:length > 0){
			print "Fields:".
			print mdl:allfields.
		}
		if(mdl:alleventnames:length > 0){
			print "Events:".
			print mdl:alleventnames.
		}
		if(mdl:allactionnames:length > 0){
			print "Actions:".
			print mdl:allactionnames.
		}
	}
	Print "--------------------------".
	Print " ".
	Print "------==============------".
}
Print "================================================".
