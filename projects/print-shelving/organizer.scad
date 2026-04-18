// Electronics Organizer Shelf
//
// Dedicated home for the bins and trays in ../electronics-storage/.
// Every slot is sized to its specific item with 0.3 mm per-side
// sliding tolerance — bins slide in like drawers and sit flush.
//
// Layout (looking at the front, rows stacked bottom → top):
//
//   ╔═══════════════════════════════════════════════╗
//   ║  Row A (22 mm tall):                          ║
//   ║   ┌──────── devboard tray ───────┐ ┌sm┐ ┌sm┐  ║
//   ║   │                              │ │  │ │  │  ║
//   ║   └──────────────────────────────┘ └──┘ └──┘  ║
//   ╠═══════════════════════════════════════════════╣
//   ║  Row B (27 mm tall):                          ║
//   ║   ┌sm┐ ┌sm┐ ┌sm┐ ┌sm┐ ┌sm┐                    ║
//   ║   │  │ │  │ │  │ │  │ │  │                    ║
//   ║   └──┘ └──┘ └──┘ └──┘ └──┘                    ║
//   ╠═══════════════════════════════════════════════╣
//   ║  Row C (37 mm tall):                          ║
//   ║   ┌── medium ──┐ ┌── medium ──┐ ┌sm┐          ║
//   ║   │            │ │            │ │  │          ║
//   ║   └────────────┘ └────────────┘ └──┘          ║
//   ╚═══════════════════════════════════════════════╝
//
// Total capacity:
//   - 1 × devboard tray (120 × 55 × 18)
//   - 2 × medium bin (80 × 40 × 35)
//   - 8 × small bin (40 × 40 × 25)
//
// Print upright (bottom face on bed). No supports — bin slots have
// hollow dead-space behind their backstops to save material; the
// sealed cavities are fully enclosed so nothing bridges.

$fn = 48;

// ---- Frame ----
OUTER_W     = 212.6;
OUTER_D     = 58;       // depth — devboard tray is 55 mm + 3 mm clearance
WALL        = 1.6;      // wall / divider thickness
FLOOR       = 2.0;      // row-separator floor thickness
TOL         = 0.3;      // per-side sliding tolerance

// ---- Row heights (interior) ----
ROW_A_H     = 22;       // fits 18 mm devboard tray + 4 mm finger clearance
ROW_B_H     = 27;       // fits 25 mm small bin
ROW_C_H     = 37;       // fits 35 mm medium bin

// ---- Slot depths ----
BIN_SLOT_D  = 42;       // 40 mm bin + 2 mm clearance
DBTR_SLOT_D = OUTER_D - WALL;  // devboard tray uses full interior depth

// ---- Slot widths ----
SMBIN_W     = 40  + 2*TOL;   // 40.6
MDBIN_W     = 80  + 2*TOL;   // 80.6
DBTR_W      = 120 + 2*TOL;   // 120.6

// ---- Dead space cavity (hollow behind bin backstops) ----
DEAD_START  = BIN_SLOT_D + WALL;   // 43.6
DEAD_END    = OUTER_D - WALL;      // 56.4
DEAD_DEPTH  = DEAD_END - DEAD_START;

// ---- Z positions (rows stack bottom → top: C, B, A) ----
Z_C_START   = FLOOR;
Z_C_END     = Z_C_START + ROW_C_H;
Z_B_START   = Z_C_END + FLOOR;
Z_B_END     = Z_B_START + ROW_B_H;
Z_A_START   = Z_B_END + FLOOR;
Z_A_END     = Z_A_START + ROW_A_H;
OUTER_H     = Z_A_END + FLOOR;   // 94 mm total

// ---- Slot X placements ----
C_OFFSETS = [
    WALL,
    WALL + MDBIN_W + WALL,
    WALL + 2*MDBIN_W + 2*WALL
];
C_WIDTHS  = [MDBIN_W, MDBIN_W, SMBIN_W];

A_OFFSETS = [
    WALL,
    WALL + DBTR_W + WALL,
    WALL + DBTR_W + 2*WALL + SMBIN_W
];
A_WIDTHS  = [DBTR_W, SMBIN_W, SMBIN_W];
A_DEPTHS  = [DBTR_SLOT_D, BIN_SLOT_D, BIN_SLOT_D];

// ---- Build ----
difference() {
    cube([OUTER_W, OUTER_D, OUTER_H]);

    // Row C: 2 medium + 1 small bin
    for (i = [0:2])
        translate([C_OFFSETS[i], 0, Z_C_START])
            cube([C_WIDTHS[i], BIN_SLOT_D, ROW_C_H]);

    // Row B: 5 small bins (equally spaced)
    for (i = [0:4])
        translate([WALL + i*(SMBIN_W + WALL), 0, Z_B_START])
            cube([SMBIN_W, BIN_SLOT_D, ROW_B_H]);

    // Row A: 1 devboard tray + 2 small bins
    for (i = [0:2])
        translate([A_OFFSETS[i], 0, Z_A_START])
            cube([A_WIDTHS[i], A_DEPTHS[i], ROW_A_H]);

    // Hollow dead-space cavities behind each bin backstop
    // (devboard tray slot has no backstop — uses full depth)
    if (DEAD_DEPTH > 0) {
        // Row C
        for (i = [0:2])
            translate([C_OFFSETS[i], DEAD_START, Z_C_START])
                cube([C_WIDTHS[i], DEAD_DEPTH, ROW_C_H]);
        // Row B
        for (i = [0:4])
            translate([WALL + i*(SMBIN_W + WALL), DEAD_START, Z_B_START])
                cube([SMBIN_W, DEAD_DEPTH, ROW_B_H]);
        // Row A (small-bin slots only, not devboard)
        for (i = [1:2])
            translate([A_OFFSETS[i], DEAD_START, Z_A_START])
                cube([A_WIDTHS[i], DEAD_DEPTH, ROW_A_H]);
    }
}
