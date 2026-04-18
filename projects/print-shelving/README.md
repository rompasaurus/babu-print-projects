# Print Shelving — Modular Display System

Stackable shelf tiers for displaying everything else in this repo —
Blob Buddies, Kirby figurines, electronics bins, the measuring
cylinder, etc. Print as many tiers as you need; they lock together
via corner pegs.

## Files

| File | Purpose | Print time |
|---|---|---|
| [shelf-tier.scad](shelf-tier.scad) / `.stl` / `.3mf` | Standard tier, 65 mm interior height | ~2 h |
| [shelf-tier-tall.scad](shelf-tier-tall.scad) / `.stl` / `.3mf` | Tall tier, 170 mm interior (fits upright cylinder) | ~5 h |
| [shelf-top-cap.scad](shelf-top-cap.scad) / `.stl` / `.3mf` | Closed lid with display lip | ~1 h |

## Dimensions

Every tier shares the same **230 × 140 mm** footprint, so they stack
cleanly regardless of interior height.

```
   top-cap          ←  closed lid, display lip around edge
  ┌────────┐
  │ tall   │        ←  cylinder, Waste Eater Kirby, tall Blob Buddies
  ├────────┤        ←  corner pegs + holes lock tiers together
  │ short  │        ←  electronics bins, small figurines
  ├────────┤
  │ short  │        ←  more bins
  └────────┘
```

## How stacking works

Each tier has **4 pegs on top** (∅5 mm × 4 mm tall) and **4 matching
holes** on its floor. Stack by aligning pegs to holes. No glue, no
fasteners — comes apart for cleaning / rearranging.

The top-cap has holes only (no pegs), so it's the terminator.

## A1 print settings

| Setting | Value |
|---|---|
| Layer height | 0.24 mm (Draft profile) — this is furniture, not art |
| Walls | 3 perimeters |
| Infill | 15 % gyroid |
| Supports | **None** — all geometry is vertical walls + horizontal floor |
| Brim | 3 mm brim — the tall variant especially needs it |
| Orientation | Print with the open top facing up (as authored) |

## Assembly ideas

Suggested 3-tier layout (short + short + tall, top-capped):

| Tier | Suggested contents |
|---|---|
| Bottom (short) | 6× electronics bins (2× medium + 4× small fit in 3 rows) |
| Middle (short) | Blob Buddies + small Kirby figurines |
| Top (tall) | Measuring cylinder upright + Kirby Waste Eater |
| Cap lip | One "hero" print on display |

Total height assembled: 65 + 65 + 170 + 18 = **318 mm**.

## Regenerating STL / 3MF

```bash
cd projects/print-shelving
openscad -o shelf-tier.stl         shelf-tier.scad
openscad -o shelf-tier.3mf         shelf-tier.scad
openscad -o shelf-tier-tall.stl    shelf-tier-tall.scad
openscad -o shelf-tier-tall.3mf    shelf-tier-tall.scad
openscad -o shelf-top-cap.stl      shelf-top-cap.scad
openscad -o shelf-top-cap.3mf      shelf-top-cap.scad
```

## Renders

See [../../assets/renders/](../../assets/renders/) for component
JPEGs and the assembled-view JPEG.
