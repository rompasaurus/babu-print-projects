// A1 Filament Catch Box
//
// Open-top bin that sits on the desk/surface next to the Bambu Lab A1.
// Catches filament trim scraps from the toolhead cutter, purge blobs
// during load/unload, and AMS-lite poop.
//
// Design: rectangular box with the front wall leaning INWARD at the
// top — bits bouncing out hit the lip and fall back in.
//
// Footprint: 150 x 110 mm — tucks on either side of the A1 without
// blocking bed travel. Adjust OUTER_* constants below if you want a
// different fit.

$fn = 48;

// --- Parameters ---
OUTER_W   = 150;   // width  (X, parallel to A1 front edge)
OUTER_D   = 110;   // depth  (Y, away from the printer)
OUTER_H   = 90;    // height (Z)
WALL      = 2.4;   // wall thickness — 6 perimeters at 0.4 mm nozzle
FLOOR     = 1.6;   // floor thickness
TOP_INSET = 18;    // inward lean of the front wall at the top

// --- Build ---

module outer_shell() {
    // Hull between the bottom footprint and a top footprint that has
    // pulled inward at the front edge (creates the leaning front wall).
    hull() {
        linear_extrude(height = 0.1)
            square([OUTER_W, OUTER_D]);
        translate([0, TOP_INSET, OUTER_H - 0.1])
            linear_extrude(height = 0.1)
                square([OUTER_W, OUTER_D - TOP_INSET]);
    }
}

module inner_cavity() {
    hull() {
        translate([WALL, WALL, FLOOR])
            linear_extrude(height = 0.1)
                square([OUTER_W - 2*WALL, OUTER_D - 2*WALL]);
        translate([WALL, WALL + TOP_INSET, OUTER_H + 0.1])
            linear_extrude(height = 0.1)
                square([OUTER_W - 2*WALL, OUTER_D - 2*WALL - TOP_INSET]);
    }
}

difference() {
    outer_shell();
    inner_cavity();
}
