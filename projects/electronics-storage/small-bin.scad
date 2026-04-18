// Electronics Storage — 1x1 Small Bin
// 40 x 40 x 25 mm open-top bin for small components:
// resistors, capacitors, LEDs, header pins, screw packs.
// Shares 40 mm footprint with all other bins in this project so
// they tile side-by-side on any flat surface.

$fn = 48;

W     = 40;
D     = 40;
H     = 25;
WALL  = 1.6;
FLOOR = 1.2;

difference() {
    cube([W, D, H]);
    translate([WALL, WALL, FLOOR])
        cube([W - 2*WALL, D - 2*WALL, H]);
}
