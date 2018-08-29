// IKEA DOMBÅS handle
// Author: Jonas Friedmann (@frdmn) <j@frd.mn>
// Licensed under MIT license

$fn = 100;

// Variables
SUPPORT_HEIGHT=24;
HANDLE_LENGTH=136.4;

// Function to draw handle base
module handle(){
    difference(){
        translate([0,5,0]){
            rotate(a=90, v=[0,1,0]){
                cylinder(h=HANDLE_LENGTH, r=5);  
            }
        }

        translate([0,0,-5]){
            cube([HANDLE_LENGTH,10,5]);
        }
    }
}

// Function to draw (regular or flipped) support pillars
module support(flipped){
    difference(){
        if (flipped){
            cube([5,10,SUPPORT_HEIGHT]);

            translate([5,5,0]){
                cylinder(h=SUPPORT_HEIGHT,r=5);
            }
        } else {
            cube([5,10,SUPPORT_HEIGHT]);

            translate([0,5,0]){
                cylinder(h=SUPPORT_HEIGHT,r=5);
            }
        }
        
        translate([flipped ? 5 : 0,5,SUPPORT_HEIGHT-10]){
                cylinder(h=10, r=2);
        }
    }
}

// Draw stuff
handle();
support(true);
translate([HANDLE_LENGTH-5,0,0]){
    support();
}