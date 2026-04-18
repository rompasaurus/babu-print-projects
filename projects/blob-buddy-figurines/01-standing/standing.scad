// Blob Buddy — standing pose.
// Arms at sides, feet on ground, looking straight ahead.
include <../common/blob_buddy.scad>

BODY_CZ = BODY_R * BODY_FLAT - 1.5;  // lift body so feet meet bed at z=0

difference() {
    union() {
        blob_body(BODY_CZ);
        blob_foot(-FOOT_OFFSET);
        blob_foot( FOOT_OFFSET);
        blob_arm_side(-1, BODY_CZ + 2);
        blob_arm_side( 1, BODY_CZ + 2);
    }
    bed_cut();
    blob_face(BODY_CZ);
}
