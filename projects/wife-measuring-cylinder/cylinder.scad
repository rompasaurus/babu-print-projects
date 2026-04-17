// =============================================================
// wife-measuring-cylinder.scad
//
// A ~6 inch tall cylinder with a finger-width diameter, engraved
// with ruler markings: inches on one side, centimeters on the
// opposite side.
//
// Designed for the Bambu Lab A1 in PLA. Print upright (flat base
// on the bed, chamfered tip up). No supports required.
//
// Export to STL:
//   openscad -o cylinder.stl cylinder.scad
//
// Tweak PARAMETERS below if you want a different size.
// =============================================================

$fn = 128;                  // smoothness of circles

// ---------------- PARAMETERS ----------------
HEIGHT         = 152.4;     // 6 inches, in mm
DIAMETER       = 18;        // finger-width diameter (mm) — average adult index finger
RADIUS         = DIAMETER / 2;

INCH           = 25.4;      // mm per inch
TICK_DEPTH     = 0.8;       // radial depth of engraving (mm)
TICK_H         = 0.8;       // thickness of each tick line (mm along Z)

MAJOR_LEN      = 5.5;       // width (arc-length) of full-unit tick
MID_LEN        = 3.0;       // half-unit / half-cm
MINOR_LEN      = 1.6;       // eighth-inch / mm

NUMBER_SIZE    = 3.2;       // font height (mm)
NUMBER_FONT    = "Liberation Sans:style=Bold";

TOP_CHAMFER    = 1.0;       // size of the 45° chamfer on the top edge (printable overhang)

// Sides
INCH_ANGLE     = 0;         // +X direction
CM_ANGLE       = 180;       // -X direction

// ---------------- BUILD ----------------
difference() {
    body();

    // ---- Inch side (every 1/8", numbered every 1") ----
    // Full-inch ticks and numbers (0 through 6)
    for (i = [0:6]) {
        z = i * INCH;
        if (z <= HEIGHT - 6) {
            tick(z, length = MAJOR_LEN, angle = INCH_ANGLE);
            numberLabel(z, txt = str(i), angle = INCH_ANGLE);
        }
    }
    // Half-inch ticks (at 0.5, 1.5, 2.5, ... — odd halves)
    for (i = [1:2:11]) {
        z = i * INCH / 2;
        if (z <= HEIGHT) tick(z, length = MID_LEN, angle = INCH_ANGLE);
    }
    // Eighth-inch ticks (skip any position that's already a half or full inch)
    for (i = [0:47]) {
        if (i % 4 != 0) {
            z = i * INCH / 8;
            if (z <= HEIGHT) tick(z, length = MINOR_LEN, angle = INCH_ANGLE);
        }
    }

    // ---- Centimeter side (every 1mm, numbered every cm) ----
    for (i = [0:15]) {
        z = i * 10;
        if (z <= HEIGHT - 6) {
            tick(z, length = MAJOR_LEN, angle = CM_ANGLE);
            numberLabel(z, txt = str(i), angle = CM_ANGLE);
        }
    }
    // 5mm mid-ticks (5, 15, 25 ... — skip whole cm)
    for (i = [0:150]) {
        if (i % 5 == 0 && i % 10 != 0 && i <= HEIGHT) {
            tick(i, length = MID_LEN, angle = CM_ANGLE);
        }
    }
    // mm ticks (skip 5mm and cm positions)
    for (i = [0:150]) {
        if (i % 5 != 0 && i <= HEIGHT) {
            tick(i, length = MINOR_LEN, angle = CM_ANGLE);
        }
    }

    // "in" and "cm" labels near the top, on their respective sides
    sideLabel(z = HEIGHT - 8,  txt = "in", angle = INCH_ANGLE);
    sideLabel(z = HEIGHT - 8,  txt = "cm", angle = CM_ANGLE);
}

// ---------------- MODULES ----------------
module body() {
    union() {
        // Main shaft, leaving room for a top chamfer
        cylinder(h = HEIGHT - TOP_CHAMFER, d = DIAMETER);
        // 45° chamfered tip — prints cleanly, no support
        translate([0, 0, HEIGHT - TOP_CHAMFER])
            cylinder(h = TOP_CHAMFER,
                     d1 = DIAMETER,
                     d2 = DIAMETER - 2 * TOP_CHAMFER);
    }
}

// A horizontal tick mark engraved into the cylinder surface.
module tick(z, length, angle) {
    rotate([0, 0, angle])
        translate([RADIUS - TICK_DEPTH + 0.01,
                   -length / 2,
                   z - TICK_H / 2])
            cube([TICK_DEPTH + 0.1, length, TICK_H]);
}

// A number engraved next to a tick, reading horizontally.
module numberLabel(z, txt, angle) {
    rotate([0, 0, angle])
        translate([RADIUS - 0.6, (MAJOR_LEN / 2) + 0.8, z])
            rotate([90, 0, 90])
                linear_extrude(height = 1.2)
                    text(txt,
                         size = NUMBER_SIZE,
                         halign = "left",
                         valign = "center",
                         font = NUMBER_FONT);
}

// A unit label ("in" / "cm") near the top.
module sideLabel(z, txt, angle) {
    rotate([0, 0, angle])
        translate([RADIUS - 0.6, 0, z])
            rotate([90, 0, 90])
                linear_extrude(height = 1.2)
                    text(txt,
                         size = 2.6,
                         halign = "center",
                         valign = "center",
                         font = NUMBER_FONT);
}
