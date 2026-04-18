// Electronics Storage — 3x1 Dev Board Tray
// 120 x 55 x 18 mm shallow tray for dev boards:
// Arduino Uno/Mega, ESP32 dev boards, Raspberry Pi Pico, breakouts.
// Low walls so pins don't catch; one long edge has a finger-access
// scoop so you can flick a board out.

$fn = 48;

W          = 120;
D          = 55;
H          = 18;
WALL       = 1.6;
FLOOR      = 1.4;
SCOOP_R    = 18;   // radius of the finger-scoop on the front edge
SCOOP_DROP = 8;    // how far below the rim the scoop dips

difference() {
    cube([W, D, H]);
    // Inner cavity
    translate([WALL, WALL, FLOOR])
        cube([W - 2*WALL, D - 2*WALL, H]);
    // Finger scoop on the front edge (Y=0 side)
    translate([W/2, -0.01, H - SCOOP_DROP + SCOOP_R])
        rotate([-90, 0, 0])
            cylinder(h = WALL + 0.02, r = SCOOP_R);
}
