d1=0.1;d2=0.2;d3=0.3;d4=0.4;
d20=d1*20;

$fn=200;

module reprapworld_cheap (){
	difference() {
		union() {
			cylinder(h=8.5+d1,r=30/2); // inner
			cylinder(h=3.0+d1,r=40/2); // outer
		}
		// whole
		translate([0,0,-d1]) cylinder(h=8.5+d3,r=19.5/2);
		// ball bearing
		translate([0,0,-d1]) cylinder(h=7+d3,r=22/2+0.8/2);
	}
}

reprapworld_cheap();
