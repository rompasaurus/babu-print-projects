// Print Shelving — Stackable Tier
//
// One modular shelf tier: three walls (back + two sides), a floor,
// open front for access, open top. Print as many as you need and
// stack them via the corner pegs.
//
// Footprint: 230 x 140 x 65 mm (fits comfortably on the A1).
// Print time: ~2 hours per tier at 0.24 mm draft.
//
// Designed to hold the other projects in this repo:
//   - Blob Buddies (3x on one tier)
//   - Electronics bins (up to 5x 40mm bins per tier)
//   - Kirby figurines
//   - Waste Eater (on its own tier)
//
// For the 152 mm measuring cylinder, stack two tiers and lay it on
// its side, or print the TALL variant (see shelf-tier-tall.scad).

$fn = 48;

W        = 230;   // width (X)
D        = 140;   // depth (Y)
H        = 65;    // height (Z) — interior is H - FLOOR
WALL     = 2.4;
FLOOR    = 2.0;
PEG_D    = 5.0;   // stacking peg diameter
PEG_H    = 4.0;   // peg height above tier
HOLE_D   = 5.4;   // peg-hole diameter (0.4 mm fit tolerance)
HOLE_H   = 4.2;
CORNER_INSET = WALL + 2;  // where the pegs sit relative to the outer edge

// Four stacking peg positions (relative to outer origin)
PEG_POSITIONS = [
    [CORNER_INSET,         CORNER_INSET],
    [W - CORNER_INSET,     CORNER_INSET],
    [CORNER_INSET,         D - CORNER_INSET],
    [W - CORNER_INSET,     D - CORNER_INSET],
];

module tier_body() {
    union() {
        // Floor
        cube([W, D, FLOOR]);
        // Back wall (Y = D-WALL)
        translate([0, D - WALL, 0])
            cube([W, WALL, H]);
        // Left wall
        cube([WALL, D, H]);
        // Right wall
        translate([W - WALL, 0, 0])
            cube([WALL, D, H]);
        // Stacking pegs on top
        for (p = PEG_POSITIONS)
            translate([p[0], p[1], H])
                cylinder(h = PEG_H, d = PEG_D);
    }
}

difference() {
    tier_body();
    // Stacking holes in the floor (match pegs of the tier below)
    for (p = PEG_POSITIONS)
        translate([p[0], p[1], -0.01])
            cylinder(h = HOLE_H, d = HOLE_D);
}
