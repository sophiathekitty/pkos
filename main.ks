// pkOS: The Pink Stars are Falling
// Main Loop
//-----------------------

print("hello?").

// MAIN_START
// ==========
// if there's software see if it has a main_start events to fire....
// this is where any init code can by fired....
//
runpath("/sys/utils/do_event.ks","MAIN_START").


// MAIN_LOOP
// ==========
// this runs the main loop with input and display and running background events.
//
runpath("/sys/main_loop.ks").


// MAIN_INPUT
// ==========
// if there's software see if it has a main_input events to fire....
// this is where the main input loop should be called....
//
// runpath("/sys/io/keyboard_input.ks").
// i need to actually get for real keyboard inputs working and that might be done in the background loop
// or i need an UI scr

// BACKGROUND_MONITORING
// ==========
// if there's any software see if it has background_monitoring to fire....
// this should fire anything that's supposed to be running in the background....
// this should live in a special script that can be called by input loops and
//
//runpath("/sys/utils/background_loop.ks").
