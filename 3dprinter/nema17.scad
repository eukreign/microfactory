module nema17() {
  motor_height = 34.0;
	difference(){
	  union(){
			translate([0,0,motor_height/2]) {
				intersection(){
					cube([42.3,42.3,motor_height], center = true);
					rotate([0,0,45]) translate([0,0,-1])
            cube([74.3*sin(45), 73.3*sin(45) ,motor_height+2], center = true);
				}
			}
			translate([0, 0, motor_height-.1]) cylinder(h=2.1, r=11, $fn=24);
			translate([0, 0, motor_height+2]) cylinder(h=20, r=2.5, $fn=24);
		}
		for(i=[0:3]){
				rotate([0, 0, 90*i])translate([15.5, 15.5, motor_height-4.5]) cylinder(h=5, r=1.5, $fn=24);
			}
	}
}

module nema17_simple() {
  motor_height = 34.0;
  translate([0,0,motor_height/2]) {
    intersection(){
      cube([42.3,42.3,motor_height], center = true);
      rotate([0,0,45]) translate([0,0,-1])
        cube([74.3*sin(45), 73.3*sin(45) ,motor_height+2], center = true);
    }
  }
  translate([0, 0, motor_height-.1]) cylinder(h=2.1, r=11, $fn=24);
  translate([0, 0, motor_height+2]) cylinder(h=20, r=2.5, $fn=24);
}


module nema17_holes() {
    for(i=[0:3]){
      rotate([0, 0, 90*i]) translate([15.5, 15.5, 0]) cylinder(h=100, r=1.501, $fn=24);
    }
}

module nema17_screw() {
  translate([0,0,56])
  cylinder(h=250, r=3, $fn=24);
}
nema17_screw();
nema17();