# Electronics Organizer Shelf

A dedicated shelf for the bins and trays in
[../electronics-storage/](../electronics-storage/). Every slot is
sized to its specific item with **0.3 mm per-side sliding tolerance**
— bins slide in from the front like drawers and sit flush with the
shelf face.

## Capacity

| Row | Contents |
|---|---|
| Row A (top) | 1× devboard tray + 2× small bin |
| Row B (middle) | 5× small bin |
| Row C (bottom) | 2× medium bin + 1× small bin |
| Top surface | Solder spool holder (sits on top) |

Total: **8× small bin + 2× medium bin + 1× devboard tray**.

## Files

| File | Purpose |
|---|---|
| [organizer.scad](organizer.scad) | Source — edit dimensions/tolerances at the top |
| [organizer.stl](organizer.stl) | Mesh |
| [organizer.3mf](organizer.3mf) | Drop into Bambu Studio |
| [showcase-assembled.scad](showcase-assembled.scad) | Mock-up for the assembly render (imports every storage STL) |

## Dimensions

- **Outer footprint:** 212.6 × 58 mm
- **Total height:** 94 mm
- **Wall thickness:** 1.6 mm (3 perimeters at 0.4 mm nozzle)
- **Row separators:** 2 mm

## How "sliding in" works

Each bin slot is exactly `bin_dim + 0.6 mm` (0.3 mm on each side).
Behind each bin slot is a **backstop wall at 42 mm depth** — bins
stop there, flush with the shelf's front face. Beyond the backstop
is a sealed hollow cavity, cutting ~200 cm³ of wasted material.

```
  FRONT                            BACK
  ▼                                ▼
  ┌────────────┬─────────────┐
  │  bin slot  │ sealed void │
  │  (42 mm)   │  (13 mm)    │
  └────────────┴─────────────┘
     bin slides in        back wall
     up to backstop        closes shelf
```

The devboard tray slot in Row A uses the **full depth** (56.4 mm) —
the tray fills it completely, no backstop needed.

## A1 print settings

| Setting | Value |
|---|---|
| Orientation | Upright (bottom face on bed, as authored) |
| Layer height | 0.2 mm (Standard) |
| Walls | 3 perimeters |
| Infill | 15 % gyroid — the dead-space cavities handle the bulk |
| Supports | **None** — all overhangs are supported on 3+ sides |
| Brim | 3 mm brim (tall-narrow aspect = brim for safety) |

Expect ~5–6 hours, ~150 g PLA.

## If something doesn't fit

The **tolerance** is the first knob — if bins are too tight, bump `TOL`
from 0.3 to 0.4 at the top of `organizer.scad` and re-export. If too
loose, drop to 0.2.

Other knobs:

```scad
OUTER_W     = 212.6;   // widen if you want more room for walls / cleaner math
OUTER_D     = 58;      // must stay ≥ 55 + WALL + clearance for devboard tray
ROW_A_H     = 22;      // top row clearance — raise if your tray has tall parts
```

Re-export after edits:

```bash
openscad -o organizer.stl organizer.scad
openscad -o organizer.3mf organizer.scad
```
