rodr = 4;
rodl = 300;

module edge(radius=rodr, length=rodl) {
  translate([-radius*2,-radius*2,-length/2]) cylinder(r=radius, h=length);
  translate([radius*2,radius*2,-length/2]) cylinder(r=radius, h=length);
}

module parallel(radius, length) {
  offset = 20;
  distance = length/2 + offset;
  translate([-distance,offset,0]) edge(radius, length);
  translate([distance,offset,0]) rotate([0,0,90]) edge(radius, length);
}

module four() {
  translate([0, rodl/2, 0]) parallel(rodr, rodl);
  translate([0, -rodl/2, 0]) rotate([0,0,180]) parallel(rodr, rodl);
}

module rods() {
  four();
  rotate([90,0,0]) four();
  rotate([0,90,0]) four();
}

module rod_corner() {
  translate([0,0,170]) edge(rodr, rodl);
  rotate([0, -90, 0]) translate([0,0,-170]) edge(rodr, rodl);
  rotate([-90, 0, 0]) translate([0,0,-170]) edge(rodr, rodl);
}

rods();