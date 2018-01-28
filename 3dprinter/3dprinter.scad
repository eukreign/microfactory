use <rods.scad>;
use <connectors.scad>;
use <nema17.scad>;

rods();
cube_corners();
translate([-170, 0, -170]) rotate([-90]) z_axis_motion();
translate([170, 0, -170]) rotate([-90, 0, 180]) z_axis_motion();
translate([210, 0, -170]) {nema17(); nema17_screw();}
translate([-210, 0, -170]) {nema17(); nema17_screw();}
translate([147.5, -147.5, 220]) rotate([180, 0, 45]) nema17();
translate([147.5, 147.5, 220]) rotate([180, 0, 45]) nema17();