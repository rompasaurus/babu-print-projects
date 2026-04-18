# Blob Buddy — original figurine family

Three poses of an original round-blob character. Everything here is
from-scratch OpenSCAD so the `.stl` and `.3mf` artifacts are safe to
commit to this public repo. This is the "I want something cute to
print today" alternative to the fan-made Kirby models in
[../kirby-figurines/](../kirby-figurines/).

## Files

| Pose | Folder | Scad | STL | 3MF |
|---|---|---|---|---|
| Standing | [01-standing/](01-standing/) | [standing.scad](01-standing/standing.scad) | `standing.stl` | `standing.3mf` |
| Waving | [02-waving/](02-waving/) | [waving.scad](02-waving/waving.scad) | `waving.stl` | `waving.3mf` |
| Sitting | [03-sitting/](03-sitting/) | [sitting.scad](03-sitting/sitting.scad) | `sitting.stl` | `sitting.3mf` |

Shared geometry lives in [common/blob_buddy.scad](common/blob_buddy.scad)
— the pose files `include` it.

## Drop-in print

Double-click any `<pose>.3mf` — Bambu Studio opens with the figure on
the plate. Confirm the filament, slice, send.

## A1 print settings

| Setting | Value |
|---|---|
| Scale | **Leave at 100 %** — authored at ~35 mm tall |
| Layer height | 0.16 mm (Standard profile) |
| Walls | 3 perimeters |
| Infill | 10 % gyroid |
| Supports | **None** — poses authored support-free |
| Brim | 3 mm brim for the waving pose (raised arm creates a tall-narrow silhouette) |
| Filament | Any PLA color; pink reads most "Kirby-adjacent" if that's the vibe |

Expect ~25–40 min per figure, 5–8 g filament each.

## Painting after the fact

The face indents are geometric, not colored. Options:

1. **Paint pass** — dab acrylic paint into the eye/mouth/cheek
   indents with a toothpick. Wipe the surface; paint stays in the
   recesses.
2. **Filament swap** — do a manual filament change at the face layer
   via Bambu Studio's "Change Filament at Layer" — but the face
   features span multiple layers, so this gets messy.
3. **Leave monochrome** — the indents still read well under side
   light, and mono figurines look clean.

## Tweaking the design

Open `common/blob_buddy.scad` and adjust the top parameter block:

```scad
BODY_R      = 16;    // bigger body
BODY_FLAT   = 0.92;  // 1.0 = perfect sphere, <1 = squashed
FOOT_R      = 4.5;
```

Re-export after any change:

```bash
cd projects/blob-buddy-figurines
openscad -o 01-standing/standing.stl  01-standing/standing.scad
openscad -o 01-standing/standing.3mf  01-standing/standing.scad
# ... etc for the other poses
```
