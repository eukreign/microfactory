use <rods.scad>;
use <nema17.scad>;

module corner(rod_r=4, rod_center_offset=8, rod_origin_offset=20) {
  hole_r = rod_r * 1.04;
  wall_r = hole_r * 2.5;
  difference() {
    union() {
      hull() {
        for (axis=[[0,0,0], [90,90,0], [90,0,90]])
          rotate(axis)
            for (i=[1,-1])
              translate([i*rod_center_offset, i*rod_center_offset, 0])
              cylinder(r=wall_r, h=rod_origin_offset*2);
      }
      hull() {
        rotate([90,90,0]) translate([rod_center_offset, rod_center_offset, 0])
          cylinder(r=wall_r, h=rod_origin_offset*2);
        rotate([90,0,90]) translate([-rod_center_offset, -rod_center_offset, 0])
          cylinder(r=wall_r, h=rod_origin_offset*2);
        translate([41, -41, -(wall_r+rod_center_offset)]) cylinder(r=30, h=wall_r*2.11);
      }
    }
    for (axis=[[0,0,0], [90,90,0], [90,0,90]])
        rotate(axis)
          for (i=[1,-1])
            translate([i*rod_center_offset, i*rod_center_offset, rod_origin_offset])
            cylinder(r=hole_r, h=rod_origin_offset+50);
    translate([-17.5, 17.5, -13]) union() {
      //translate([41, -41, -(wall_r+rod_center_offset)+wall_r*2.1]) cylinder(r=30, h=20);
      translate([40, -40, -35]) rotate([0, 0, 20]) {nema17();}
      translate([40, -40, -45]) rotate([0, 0, -20]) {nema17();}
      hull() {
        cut_z=-30;
        translate([40, -40, cut_z]) cylinder(r=6, h=100);
        translate([180, -40, cut_z]) cylinder(r=6, h=100);
        translate([40, -180, cut_z]) cylinder(r=6, h=100);
      }
    }
  }
}

module four_corners() {
  translate([-170, 170, -170]) corner();
  rotate([0,0,90]) translate([-170, 170, -170]) corner();
  rotate([0,0,180]) translate([-170, 170, -170]) corner();
  rotate([0,0,270]) translate([-170, 170, -170]) corner();
}

module cube_corners() {
  four_corners();
  rotate([180,0,0]) four_corners();
}

module z_axis_motion(rod_r=4, rod_center_offset=8) {
  hole_r = rod_r * 1.04;
  wall_r = hole_r * 2.5;
  motor = 42;
  motor_frame = 50;
  hull() {
        for (i=[1,-1])
          translate([i*rod_center_offset, i*rod_center_offset, -motor_frame/2])
          cylinder(r=wall_r, h=motor_frame);
        translate([-(motor_frame+rod_center_offset), rod_center_offset, -motor_frame/2])
          cylinder(r=wall_r, h=motor_frame);
    }
}

corner();