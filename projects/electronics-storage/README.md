# Electronics Parts Storage

Modular print-and-tile storage for your electronics bench. Every bin
uses a **40 mm footprint grid**, so they sit flush next to each other
on a shelf or desk — arrange as many as you need, in any layout.

## What's here

| File | Purpose | Outer size (mm) |
|---|---|---|
| [small-bin.3mf](small-bin.3mf) | Resistors, caps, LEDs, screws — tiny parts | 40 × 40 × 25 |
| [medium-bin.3mf](medium-bin.3mf) | Wire, jumpers, heat-shrink — two-compartment | 80 × 40 × 35 |
| [devboard-tray.3mf](devboard-tray.3mf) | Shallow tray for Arduino/ESP32/Pico boards | 120 × 55 × 18 |
| [solder-spool-holder.3mf](solder-spool-holder.3mf) | Vertical post with weighted disc base | 80 dia × 49 |

Each also has its `.scad` source (edit to re-size) and a `.stl` export.

## How it "pieces together"

No snap-fit or magnets — all bins share a **40 mm-multiple footprint**,
so they sit flush on a flat surface:

```
  .----.----.----.----.
  |    |    |    |    |       4x small-bin (4 × 1 cells)
  '----'----'----'----'

  .----.----.----.----.
  |  dev board tray   |       1x devboard-tray (3 × 1 cells)
  .--------.----.     .
  |    med     |sm |sm|       1x medium-bin + 2x small-bin
  '--------'----'----'
```

Want rigid locking between bins? Open any `.scad` and add a 1 mm
lip + matching groove — or glue neighboring bins with a dot of CA.

## Print all of them

```bash
cd projects/electronics-storage
# .3mf files are pre-generated — just drag into Bambu Studio.
# If you edit a .scad, regenerate:
openscad -o small-bin.stl             small-bin.scad
openscad -o small-bin.3mf             small-bin.scad
openscad -o medium-bin.stl            medium-bin.scad
openscad -o medium-bin.3mf            medium-bin.scad
openscad -o devboard-tray.stl         devboard-tray.scad
openscad -o devboard-tray.3mf         devboard-tray.scad
openscad -o solder-spool-holder.stl   solder-spool-holder.scad
openscad -o solder-spool-holder.3mf   solder-spool-holder.scad
```

## A1 print settings

| Setting | Value |
|---|---|
| Layer height | 0.20 mm (Standard) |
| Walls | 3 perimeters (matches 1.6 mm design wall) |
| Infill | 15 % grid for bins, **100 % for solder-spool-holder base** (it needs the weight) |
| Supports | **None** — all parts are self-supporting |
| Brim | 3 mm brim for solder-spool-holder only; others have large bases |
| Orientation | As saved in the 3MF — open-top facing up |

Total print time for the full set: ~4 hours, ~40 g PLA.

## Customization

Open any `.scad` — the top of each file has the outer dimensions as
named constants. Change them and re-export. Two common tweaks:

- **Taller small-bins** — bump `H = 25` to `H = 40` in `small-bin.scad`
  for storing longer parts (trimpots, tall ICs).
- **More dev boards on one tray** — widen `W = 120` to `160` in
  `devboard-tray.scad` for a 4×1 tray that holds two Arduinos side by
  side.
