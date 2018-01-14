d1=0.1;d2=0.2;d3=0.3;d4=0.4;
d20=d1*20;

$fn=200;

// gat 53mm
module filamentum() {
	union() {
		// outer
		difference() {
			cylinder(h=2.0,r=63/2); // outer
			translate([0,0,-d1]) cylinder(h=2.0+d2,r=53/2); // inner
		}
		// inside filament
		difference() {
			cylinder(h=8.0,r=53/2); // outer
			#translate([0,0,-d1]) cylinder(h=8.0+d2,r=46/2); // inner
		}
		// to ballbaring mount
		difference() {
			cylinder(h=2.0,r=48/2); // outer
			translate([0,0,-d1]) cylinder(h=2.0+d2,r=25/2); // inner
		}
		// ballbaring mount
		difference() {
			cylinder(h=9.0,r=25/2); // outer
			translate([0,0,-d1]) cylinder(h=9.0+d2,r=22/2+0.4); // inner
		}
		// ballbaring top
		difference() {
			translate([0,0,7]) cylinder(h=2.0,r=22/2+0.4); // outer
			translate([0,0,7-d1]) cylinder(h=2.0+d2,r=22/2-1); // inner
		}
		
	}
}
translate([0,0,0]) filamentum();
translate([0,70,0]) filamentum();
//translate([70,0,0]) filamentum();
//translate([70,70,0]) filamentum();