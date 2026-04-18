// Curtain Rod Hole Plug — twist-lock variant
// Cylindrical insert to block curtain rod mounting holes
// and prevent the curtain from falling off.
//
// Hole measurements:
//   Diameter: 12.5 mm
//   Depth:    14 mm
//
// Design: body is 1 mm shorter than the hole so the plug can
// drop in slightly and be twisted. Two opposing side tabs
// engage the hole wall for twist-lock retention.

$fn = 96;

// --- Tunables ---
HOLE_DIA    = 12.5;   // measured hole diameter
HOLE_DEPTH  = 14;     // measured hole depth
TOL         = 0.2;    // per-side tolerance (shrink plug body)
CAP_EXTRA   = 2.0;    // cap extends beyond hole diameter (per side)
CAP_H       = 2.0;    // cap thickness
BODY_SHORT  = 1.0;    // how much shorter the body is than the hole

// Locking tabs
TAB_RAD     = 2.0;    // radial extension beyond body surface
TAB_H       = 3.0;    // tab height (vertical) — reduced 2 mm to fit gap
TAB_W       = 2.0;    // tab width (tangential / arc chord) — reduced 2 mm to fit gap
TAB_TOP     = 10.0;   // tab top edge, measured above body base

// --- Derived ---
BODY_LEN    = HOLE_DEPTH - BODY_SHORT;   // 13 mm
BODY_DIA    = HOLE_DIA - TOL * 2;        // 12.1 mm
BODY_R      = BODY_DIA / 2;
CAP_DIA     = HOLE_DIA + CAP_EXTRA * 2;
CAP_R       = CAP_DIA / 2;
TAB_BOT     = TAB_TOP - TAB_H;           // 5 mm above body base
OVERLAP     = 0.1;                       // CSG safety

module tab() {
    translate([BODY_R - OVERLAP,
               -TAB_W / 2,
               CAP_H + TAB_BOT])
        cube([TAB_RAD + OVERLAP, TAB_W, TAB_H]);
}

union() {
    // Cap (flange) — sits on the surface
    cylinder(h = CAP_H, r = CAP_R);

    // Body — drops into the hole
    translate([0, 0, CAP_H])
        cylinder(h = BODY_LEN, r = BODY_R);

    // Small chamfer at insertion tip for easy press-in
    translate([0, 0, CAP_H + BODY_LEN])
        cylinder(h = 0.8, r1 = BODY_R, r2 = BODY_R - 0.6);

    // Two locking tabs, 180° apart
    for (a = [0, 180]) rotate([0, 0, a]) tab();
}
