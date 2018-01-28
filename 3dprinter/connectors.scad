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
        translate([22.5, -22.5, -30]) cylinder(r=34, h=15);
      }
    }
    for (axis=[[0,0,0], [90,90,0], [90,0,90]])
        rotate(axis)
          for (i=[1,-1])
            translate([i*rod_center_offset, i*rod_center_offset, rod_origin_offset])
            cylinder(r=hole_r, h=rod_origin_offset+50);
    translate([22.5, -22.5, -50]) union() {
      translate([0, 0, 0]) rotate([0, 0, 20]) {nema17_simple();}
      translate([0, 0, -8]) rotate([0, 0, -20]) {nema17_simple();}
      hull() {
        translate([0, 0, 0]) cylinder(r=6, h=100);
        translate([160, 0, 0]) cylinder(r=6, h=100);
        translate([0, -160, 0]) cylinder(r=6, h=100);
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