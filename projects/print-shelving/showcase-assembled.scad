// Electronics Organizer — Showcase Render
//
// Populates the organizer with every item from ../electronics-storage/
// for the assembled-view JPEG. This is the visual mock-up, not a
// print file. The organizer itself prints as a single piece from
// organizer.stl / organizer.3mf.

$fn = 48;

// Must match organizer.scad exactly
OUTER_W     = 212.6;
OUTER_D     = 58;
WALL        = 1.6;
FLOOR       = 2.0;
TOL         = 0.3;
ROW_A_H     = 22;
ROW_B_H     = 27;
ROW_C_H     = 37;

SMBIN_W     = 40  + 2*TOL;
MDBIN_W     = 80  + 2*TOL;
DBTR_W      = 120 + 2*TOL;

Z_C_START   = FLOOR;
Z_B_START   = Z_C_START + ROW_C_H + FLOOR;
Z_A_START   = Z_B_START + ROW_B_H + FLOOR;
OUTER_H     = Z_A_START + ROW_A_H + FLOOR;

C_OFFSETS   = [WALL, WALL + MDBIN_W + WALL, WALL + 2*MDBIN_W + 2*WALL];
A_OFFSETS   = [WALL, WALL + DBTR_W + WALL, WALL + DBTR_W + 2*WALL + SMBIN_W];

// --- The organizer itself ---
color("steelblue")
    import("organizer.stl");

// --- Row C: 2 medium + 1 small bin ---
color("burlywood") {
    translate([C_OFFSETS[0] + TOL, TOL, Z_C_START])
        import("../electronics-storage/medium-bin.stl");
    translate([C_OFFSETS[1] + TOL, TOL, Z_C_START])
        import("../electronics-storage/medium-bin.stl");
    translate([C_OFFSETS[2] + TOL, TOL, Z_C_START])
        import("../electronics-storage/small-bin.stl");
}

// --- Row B: 5 small bins ---
color("burlywood")
    for (i = [0:4])
        translate([WALL + i*(SMBIN_W + WALL) + TOL, TOL, Z_B_START])
            import("../electronics-storage/small-bin.stl");

// --- Row A: devboard tray + 2 small bins ---
color("lightgray")
    translate([A_OFFSETS[0] + TOL, TOL, Z_A_START])
        import("../electronics-storage/devboard-tray.stl");
color("burlywood") {
    translate([A_OFFSETS[1] + TOL, TOL, Z_A_START])
        import("../electronics-storage/small-bin.stl");
    translate([A_OFFSETS[2] + TOL, TOL, Z_A_START])
        import("../electronics-storage/small-bin.stl");
}

// --- Solder spool holder on top ---
color("goldenrod")
    translate([OUTER_W - 50, OUTER_D/2, OUTER_H])
        import("../electronics-storage/solder-spool-holder.stl");
