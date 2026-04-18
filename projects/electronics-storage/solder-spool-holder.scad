// Electronics Storage — Solder Spool Holder
// Vertical post + wide base. Drop a standard solder spool over the
// post; the weighted base keeps it from tipping when you pull solder.
//
// Fits spool hub IDs from 12 mm up to ~25 mm (post is tapered).

$fn = 64;

BASE_D = 80;    // base disc diameter
BASE_H = 4;     // base disc thickness (keep it heavy-ish — fill at 100 % infill)
POST_H = 45;    // post height (clears typical spool hub width of ~22-30 mm)
POST_D1 = 20;   // post diameter at base
POST_D2 = 11;   // post diameter at tip (taper for easier drop-on)

// Footprint: round disc. Stands freely, doesn't need a grid tile.

union() {
    // Base disc with a small chamfer at the top edge
    cylinder(h = BASE_H, d = BASE_D);
    translate([0, 0, BASE_H - 0.01])
        cylinder(h = 1.5, d1 = BASE_D, d2 = BASE_D - 3);

    // Post
    translate([0, 0, BASE_H])
        cylinder(h = POST_H, d1 = POST_D1, d2 = POST_D2);
}
