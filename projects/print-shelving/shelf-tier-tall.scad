// Print Shelving — Tall Stackable Tier
//
// Same footprint + stacking-peg layout as shelf-tier.scad, but with
// 170 mm interior height — fits the 152 mm measuring cylinder
// standing upright, or a Kirby Waste Eater.
//
// Print time: ~5 hours at 0.24 mm draft.

$fn = 48;

W        = 230;
D        = 140;
H        = 170;  // taller
WALL     = 2.4;
FLOOR    = 2.0;
PEG_D    = 5.0;
PEG_H    = 4.0;
HOLE_D   = 5.4;
HOLE_H   = 4.2;
CORNER_INSET = WALL + 2;

PEG_POSITIONS = [
    [CORNER_INSET,         CORNER_INSET],
    [W - CORNER_INSET,     CORNER_INSET],
    [CORNER_INSET,         D - CORNER_INSET],
    [W - CORNER_INSET,     D - CORNER_INSET],
];

module tier_body() {
    union() {
        cube([W, D, FLOOR]);
        translate([0, D - WALL, 0]) cube([W, WALL, H]);
        cube([WALL, D, H]);
        translate([W - WALL, 0, 0]) cube([WALL, D, H]);
        for (p = PEG_POSITIONS)
            translate([p[0], p[1], H]) cylinder(h = PEG_H, d = PEG_D);
    }
}

difference() {
    tier_body();
    for (p = PEG_POSITIONS)
        translate([p[0], p[1], -0.01]) cylinder(h = HOLE_H, d = HOLE_D);
}
