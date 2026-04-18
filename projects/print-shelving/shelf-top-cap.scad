// Print Shelving — Top Cap
//
// Closed lid that sits on the topmost tier. Same footprint, has
// peg-holes underneath to lock onto the tier below, and a shallow
// display ledge on top (10 mm lip around the perimeter) so you can
// set a finished print on top without it rolling off.
//
// Print time: ~1 hour at 0.24 mm draft.

$fn = 48;

W        = 230;
D        = 140;
CAP_H    = 8;     // solid cap thickness
LIP_H    = 10;    // decorative lip height
LIP_WALL = 2.4;
HOLE_D   = 5.4;
HOLE_H   = 4.2;
CORNER_INSET = 2.4 + 2;

PEG_POSITIONS = [
    [CORNER_INSET,         CORNER_INSET],
    [W - CORNER_INSET,     CORNER_INSET],
    [CORNER_INSET,         D - CORNER_INSET],
    [W - CORNER_INSET,     D - CORNER_INSET],
];

module cap_body() {
    union() {
        // Base plate
        cube([W, D, CAP_H]);
        // Display lip around the perimeter
        difference() {
            translate([0, 0, CAP_H])
                cube([W, D, LIP_H]);
            translate([LIP_WALL, LIP_WALL, CAP_H - 0.01])
                cube([W - 2*LIP_WALL, D - 2*LIP_WALL, LIP_H + 0.02]);
        }
    }
}

difference() {
    cap_body();
    for (p = PEG_POSITIONS)
        translate([p[0], p[1], -0.01]) cylinder(h = HOLE_H, d = HOLE_D);
}
