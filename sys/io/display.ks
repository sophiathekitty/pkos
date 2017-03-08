// pkOS: The Pink Stars are Falling
// Display Function
//-----------------------

function horizontal_line {
	parameter char.
	parameter x.
	parameter y.
	parameter length.
	set end_x to x + length.
	until x > end_x {
		print char AT(x,y).
		set x to x + 1.
	} 
}
function vertical_line {
	parameter char.
	parameter x.
	parameter y.
	parameter length.
	set end_y to y + length.
	until y > end_y {
		print char AT(x,y).
		set y to y + 1.
	} 
}
function box {
	parameter top_char.
	parameter side_char.
	parameter bottom_char.
	parameter top_corner_char.
	parameter bottom_corner_char.
	parameter x.
	parameter y.
	parameter width.
	parameter height.
	
	horizontal_line(top_char,x+1,y,width-2).
	horizontal_line(bottom_char,x+1,y+height,width-2).
	
	vertical_line(side_char,x,y+1,height-2).
	vertical_line(side_char,x+width,y+1,height-2).
	
	print top_corner_char at(x,y).
	print top_corner_char at(x+width,y).
	print bottom_corner_char at(x,y+height).
	print bottom_corner_char at(x+width,y+height).
	
}

box("=","|","-","#","+",3,3,16,6).