// Print Shelving — Assembled Showcase
//
// Renders the full shelf unit with representative prints placed on
// each tier. Used to generate the assembled-view JPEG in
// ../../assets/renders/.
//
// Render:
//   openscad --imgsize=1600,1200 --camera=115,70,200,65,0,25,750 \
//            -o ../../assets/renders/showcase-assembled.png \
//            showcase-assembled.scad
//   convert ../../assets/renders/showcase-assembled.png \
//           ../../assets/renders/showcase-assembled.jpg

$fn = 48;

TIER_W = 230;
TIER_D = 140;
TIER_H_SHORT = 65;
TIER_H_TALL  = 170;
CAP_H        = 18;

// ---------- Shelf frame ----------
module short_tier() {
    import("shelf-tier.stl");
}
module tall_tier() {
    import("shelf-tier-tall.stl");
}
module top_cap() {
    import("shelf-top-cap.stl");
}

// ---------- Content ----------
module blob_standing() {
    import("../blob-buddy-figurines/01-standing/standing.stl");
}
module blob_waving() {
    import("../blob-buddy-figurines/02-waving/waving.stl");
}
module blob_sitting() {
    import("../blob-buddy-figurines/03-sitting/sitting.stl");
}
module small_bin() {
    import("../electronics-storage/small-bin.stl");
}
module medium_bin() {
    import("../electronics-storage/medium-bin.stl");
}
module devboard_tray() {
    import("../electronics-storage/devboard-tray.stl");
}
module solder_holder() {
    import("../electronics-storage/solder-spool-holder.stl");
}
module cylinder_ruler() {
    import("../wife-measuring-cylinder/cylinder.stl");
}

// ---------- Assembly ----------
// Bottom tier: electronics bins
color("steelblue") short_tier();
translate([10,  15, 2]) color("lightgray") devboard_tray();
translate([140, 20, 2]) color("wheat")     medium_bin();
translate([140, 70, 2]) color("wheat")     small_bin();
translate([185, 70, 2]) color("wheat")     small_bin();

// Middle tier: blob buddies
translate([0, 0, TIER_H_SHORT]) color("steelblue") short_tier();
translate([40,  50, TIER_H_SHORT + 2]) color("hotpink")  blob_standing();
translate([115, 50, TIER_H_SHORT + 2]) color("hotpink")  blob_waving();
translate([180, 50, TIER_H_SHORT + 2]) color("hotpink")  blob_sitting();

// Top tier (tall): cylinder + solder holder
translate([0, 0, 2*TIER_H_SHORT]) color("steelblue") tall_tier();
translate([55, 60, 2*TIER_H_SHORT + 2]) color("lightcoral") cylinder_ruler();
translate([170, 70, 2*TIER_H_SHORT + 2]) color("goldenrod") solder_holder();

// Top cap
translate([0, 0, 2*TIER_H_SHORT + TIER_H_TALL]) color("dimgray") top_cap();
