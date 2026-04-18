// Blob Buddy — sitting pose.
// Large flat base (wider cut through the body), arms resting forward.
// No feet — legs tucked under the body.
include <../common/blob_buddy.scad>

BODY_CZ = BODY_R * 0.5;  // sits low; cut plane removes lower ~1/3 of body

difference() {
    union() {
        blob_body(BODY_CZ);
        blob_arm_forward(-1);
        blob_arm_forward( 1);
    }
    bed_cut();
    blob_face(BODY_CZ);
}
