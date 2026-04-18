// blob_buddy.scad — shared modules for the Blob Buddy figurine family.
// Original design: round friendly blob with face, feet, and arms.
// Not a depiction of any specific trademarked character.
//
// Each pose file `include`s this file and composes the modules below
// into a difference() tree. Print upright on the A1; no supports.

$fn = 96;

// ---- Parameters (shared across all poses) ----
BODY_R      = 16;      // body radius (mm)
BODY_FLAT   = 0.92;    // vertical squash factor (1.0 = sphere)
FOOT_R      = 4.5;     // foot radius
FOOT_OFFSET = 6;       // half-spacing between feet (X axis)
ARM_R       = 4;       // arm radius
EYE_SP      = 3.8;     // eye half-spacing (X axis)

// Given a world z, return the body's radius in XY at that height.
function body_y_at(z_world, body_cz) =
    let(local_z = (z_world - body_cz) / BODY_FLAT)
    let(s = BODY_R * BODY_R - local_z * local_z)
    s > 0 ? sqrt(s) : 0.01;

module blob_body(cz) {
    translate([0, 0, cz])
        scale([1, 1, BODY_FLAT])
            sphere(r = BODY_R);
}

module blob_foot(x_off) {
    translate([x_off, 1.5, FOOT_R - 1.2])
        sphere(r = FOOT_R);
}

module blob_arm_side(sx, z) {
    translate([sx * (BODY_R - 0.5), 0, z])
        sphere(r = ARM_R);
}

module blob_arm_raised(sx, body_cz) {
    // curved sausage from body side up and outward — waving pose
    hull() {
        translate([sx * (BODY_R - 2), 0, body_cz + 4])
            sphere(r = ARM_R * 0.85);
        translate([sx * (BODY_R + 2), 2, body_cz + 14])
            sphere(r = ARM_R * 0.9);
    }
}

module blob_arm_forward(sx) {
    // arm resting on the ground in front of a seated body
    translate([sx * 7, BODY_R - 3, ARM_R - 0.5])
        sphere(r = ARM_R);
}

// Subtractive face: engraved eyes, mouth, cheeks.
// Set sleepy=true for closed-eye variant.
module blob_face(body_cz, sleepy = false) {
    body_top = body_cz + BODY_R * BODY_FLAT;
    eye_z    = body_top - 4;
    mouth_z  = body_top - 9;
    cheek_z  = body_top - 8;

    eye_y    = body_y_at(eye_z,    body_cz);
    mouth_y  = body_y_at(mouth_z,  body_cz);
    cheek_y  = body_y_at(cheek_z,  body_cz);

    // Eyes
    for (sx = [-1, 1]) {
        translate([sx * EYE_SP, eye_y - 0.3, eye_z])
            rotate([-90, 0, 0])
                if (sleepy)
                    scale([2.3, 0.4, 1]) sphere(r = 1.3);
                else
                    scale([0.75, 1.4, 1]) sphere(r = 1.8);
    }

    // Mouth
    translate([0, mouth_y - 0.3, mouth_z])
        rotate([-90, 0, 0])
            scale([1.6, 0.6, 1]) sphere(r = 1.3);

    // Cheeks
    for (sx = [-1, 1]) {
        translate([sx * 8, cheek_y - 0.3, cheek_z])
            rotate([-90, 0, 0])
                sphere(r = 1.4);
    }
}

// Flat cut below z = 0 (makes the bed plane).
module bed_cut() {
    translate([-60, -60, -120])
        cube([120, 120, 120]);
}
