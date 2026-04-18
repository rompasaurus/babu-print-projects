# A1 Filament Catch Box

An open-top bin sized to sit on your desk next to the Bambu Lab A1 and
catch:

- filament trim scraps when the toolhead cutter fires
- purge blobs during load / unload
- AMS-lite "poop" if you have the 4-spool AMS attached
- stringing and layer-zero purge worms that come off the bed

## Files

| File | Purpose |
|---|---|
| [catch-box.scad](catch-box.scad) | OpenSCAD source — edit dimensions up top |
| [catch-box.stl](catch-box.stl) | Exported mesh |
| [catch-box.3mf](catch-box.3mf) | Drop into Bambu Studio |

## Dimensions

- **Footprint:** 150 × 110 mm (tucks beside the A1 without blocking bed travel)
- **Height:** 90 mm (comes up above the A1's bed level when the box is on the desk)
- **Front wall:** leans inward 18 mm at the top — material that bounces off hits the lip and falls back in
- **Walls:** 2.4 mm (6 perimeters at 0.4 mm nozzle — rigid)

## Positioning

Put it on your desk beside the printer, front wall facing the A1. The
A1's filament cutter is on the toolhead; when you load or change
filament, the toolhead parks at a known position (usually back-left).
Set the catch box so its opening is below that parked-position purge
point.

```
        [ A1 printer ]
          bed travels ←→
                          ┌──────────┐
                          │  catch   │
                          │   box    │
                          └──────────┘
```

If you have AMS lite installed, the filament changes happen above the
bed. A 90 mm tall box set flush against the printer side works — use
painter's tape to lock its position so it doesn't drift.

## A1 print settings

| Setting | Value |
|---|---|
| Layer height | 0.24 mm (Draft — it's a desk accessory, not an art piece) |
| Walls | 3 perimeters |
| Infill | 10 % gyroid |
| Supports | **None** — the 18 mm front lean is a self-supporting overhang (~77°-from-vertical-ish at worst) |
| Brim | 3 mm brim (tall-ish part with narrow footprint aspect → safe to add) |
| Orientation | Print as authored — open top facing up |

Print time: ~3.5 hours. ~40 g PLA. Any color — gray or black hides scuffs
from scraping against the printer frame.

## Tweaking size / fit

Open `catch-box.scad`. Top of the file:

```scad
OUTER_W   = 150;   // make wider if your A1 area has space
OUTER_D   = 110;   // make deeper to catch bounce-off
OUTER_H   = 90;    // match to your A1's bed/purge height
TOP_INSET = 18;    // more inset = more aggressive "funnel back in"
```

Re-export:

```bash
openscad -o catch-box.stl catch-box.scad
openscad -o catch-box.3mf catch-box.scad
```

## Not included (yet)

This version **sits freely on the desk**. If you want it to **clip to
the A1 frame**, you'd need to measure your specific frame extrusion
profile and add a matching clip. Happy to add a clip variant — just
send me the profile dimensions.
