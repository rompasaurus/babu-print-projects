# Wife's Measuring Cylinder

A 6-inch-tall cylinder with a finger-width diameter, engraved with
ruler markings:

- **One side:** inches (0–6), eighth-inch ticks, numbers at every inch
- **Other side:** centimeters (0–15), 1 mm ticks, 5 mm mid-ticks, numbers at every cm

Single piece, prints upright, no supports.

## Files

| File | Purpose |
|---|---|
| [cylinder.scad](cylinder.scad) | Source (OpenSCAD, parametric) — edit `HEIGHT` or `DIAMETER` to re-size |
| [cylinder.stl](cylinder.stl) | Exported mesh (committed for convenience) |
| [cylinder.3mf](cylinder.3mf) | 3MF bundle — drop straight into Bambu Studio |

## Drop-in print

Easiest path: double-click `cylinder.3mf` — Bambu Studio opens with the
cylinder already on the plate. Set the process profile (see below), hit
**Slice Plate → Send**.

## Regenerating from source

If you tweak parameters in the `.scad`, re-export both artifacts:

```bash
cd projects/wife-measuring-cylinder
openscad -o cylinder.stl cylinder.scad
openscad -o cylinder.3mf cylinder.scad
```

## Print settings (A1, PLA)

| Setting | Value | Why |
|---|---|---|
| Orientation | Flat base on bed, chamfered tip up | That's how the model is authored |
| Layer height | **0.12 mm** (Fine) | Engraved ticks and numbers need the resolution |
| Walls | 3 perimeters | Ticks are 0.8 mm deep — 3 walls guarantees they engrave cleanly |
| Infill | 15 % gyroid | It's a thin cylinder; more infill is wasted plastic |
| Supports | **None** | Chamfered top is self-supporting |
| Brim | 3 mm brim | Tall + narrow = high tip-over risk mid-print. Brim fixes it. |
| Seam | "Aligned, back" | Keeps the z-seam off the engraved faces |

Expect ~45–60 min print time, <10 g filament.

## Tuning parameters

Open `cylinder.scad` in OpenSCAD or any text editor and edit the block
near the top:

```scad
HEIGHT      = 152.4;    // 6 inches in mm — bump to 254 for 10 inches, etc.
DIAMETER    = 18;       // finger width — widen to 20-22 if hers is bigger
TICK_DEPTH  = 0.8;      // deeper = more readable, but weakens the wall
```

Re-run `openscad -o cylinder.stl cylinder.scad` after any change.

## If the ticks look shallow after printing

The A1's default 0.4 mm nozzle produces a ~0.42 mm line width. A 0.8 mm
radial engraving = 2 layers of wall removed, which reads well. If yours
looks faint:

1. Increase `TICK_DEPTH` to 1.0 or 1.2 and re-slice.
2. Or print with a dark filament and rub a light-colored marker/paint
   into the engravings, wipe the surface — the marks pop.

## Design notes

- The top has a 1 mm 45° chamfer so it prints without supports.
- Numbers are engraved (subtracted) rather than raised. Raised text
  would need a second-color toolchange, which the base A1 can't do
  without AMS lite.
- The "in" and "cm" labels near the top tell you which side is which.
