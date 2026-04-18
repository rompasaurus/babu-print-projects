// Blob Buddy — waving pose.
// Left arm at side, right arm raised in a friendly wave.
include <../common/blob_buddy.scad>

BODY_CZ = BODY_R * BODY_FLAT - 1.5;

difference() {
    union() {
        blob_body(BODY_CZ);
        blob_foot(-FOOT_OFFSET);
        blob_foot( FOOT_OFFSET);
        blob_arm_side(-1, BODY_CZ + 2);
        blob_arm_raised( 1, BODY_CZ);
    }
    bed_cut();
    blob_face(BODY_CZ);
}
