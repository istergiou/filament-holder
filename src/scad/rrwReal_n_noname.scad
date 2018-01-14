d1=0.1;d2=0.2;
d20=d1*20;

$fn=200;

module a(radius, sides, height, twist) {
	slices=height/20;
	linear_extrude(height = height, center = false, convexity = 0, twist = twist, slices=slices)
		circle(r = radius, $fn=sides);
}

module vase(radius=60, sides=6, wall = 3, bottom=3, height=100, twist = 5*100/6) {
	echo(twist=twist);
	difference() {
		// outer
		color("red") a(radius=radius, sides=sides, height=height, twist=twist);
		color("white") difference() {
			// inner
			a(radius=radius-wall, sides=sides, height=height+d1, twist=twist);
			// bottom
			cube(size=[radius*2,radius*2,bottom*2], center=true);	
		}
	}
}

//vase(radius=45, sides=6, wall = 2.0, bottom=2.5, height=100, twist=5*100/6);
//vase(radius=55, sides=8, wall = 2.0, bottom=2.5, height=100, twist=5*100/11);
//vase(radius=55, sides=8, wall = 1.6, bottom=2.5, height=100, twist=5*100/11);
//vase(radius=55, sides=8, wall = 1.5, bottom=1.75, height=100, twist=5*100/11);

difference() {
	union() {
		cylinder(h=10,r=60/2); // inner
		cylinder(h=2.0,r=70/2); // outer
	}
	// whole
	translate([0,0,-d1]) cylinder(h=10+d2,r=19.5/2);
	// ball bearing
	translate([0,0,-d1]) cylinder(h=6.5+d2,r=22/2+0.9/2);
	//
	translate([0,0,2]) { 
		difference() {
			cylinder(h=8.0+d1,r=57/2); //outer
			cylinder(h=8.0+d1,r=30/2); //inner
		}
	}
	translate([0,0,6]) { 
		difference() {
			cylinder(h=4.0+d2,r=60/2+d1); //outer
			cylinder(h=4.0+d2,r=55/2-d1); //inner
		}
	}
}
