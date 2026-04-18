// Electronics Storage — 2x1 Medium Bin
// 80 x 40 x 35 mm open-top bin with a mid-wall divider, giving you
// two 40 x 40 mm compartments. Sized for jumper wires, alligator
// clips, heat-shrink tubing, spare cables, solder pump, etc.

$fn = 48;

W      = 80;
D      = 40;
H      = 35;
WALL   = 1.6;
FLOOR  = 1.2;
DIV_H  = H - 4;     // divider is slightly shorter than outer wall

difference() {
    cube([W, D, H]);
    // Left compartment
    translate([WALL, WALL, FLOOR])
        cube([(W - 3*WALL)/2, D - 2*WALL, H]);
    // Right compartment
    translate([(W + WALL)/2, WALL, FLOOR])
        cube([(W - 3*WALL)/2, D - 2*WALL, H]);
}
