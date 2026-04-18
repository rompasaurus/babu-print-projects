// Curtain Rod Hole Plug
// Cylindrical insert to block curtain rod mounting holes
// and prevent the curtain from falling off.
//
// Hole measurements:
//   Diameter: 12.5 mm
//   Depth:    14 mm
//
// Design: slight interference fit (0.2 mm under on diameter)
// with a small flange/cap so the plug sits flush and doesn't
// fall into the hole.

$fn = 64;  // smooth circles

// --- Tunables ---
HOLE_DIA   = 12.5;   // measured hole diameter
HOLE_DEPTH = 14;     // measured hole depth
TOL        = 0.2;    // per-side tolerance (shrink plug body)
CAP_EXTRA  = 2.0;    // cap extends beyond hole diameter (per side)
CAP_H      = 2.0;    // cap thickness

// --- Derived ---
BODY_DIA = HOLE_DIA - TOL * 2;   // 12.1 mm
BODY_R   = BODY_DIA / 2;
CAP_DIA  = HOLE_DIA + CAP_EXTRA * 2;
CAP_R    = CAP_DIA / 2;

// Cap (flange) — sits on the surface
cylinder(h = CAP_H, r = CAP_R);

// Body — press-fits into the hole
translate([0, 0, CAP_H])
    cylinder(h = HOLE_DEPTH, r = BODY_R);

// Small chamfer at insertion tip for easy press-in
translate([0, 0, CAP_H + HOLE_DEPTH])
    cylinder(h = 0.8, r1 = BODY_R, r2 = BODY_R - 0.6);
