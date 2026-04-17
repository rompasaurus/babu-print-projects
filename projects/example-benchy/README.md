# Example Project — 3DBenchy

**What it is:** the internet's standard "does your printer work?" test.
A small tugboat with overhangs, bridges, fine features, and round
surfaces — it exercises pretty much every slicer setting in one print.

Designed by [Creative Tools](https://www.3dbenchy.com), released under
CC BY-ND 4.0 (share freely, don't modify and redistribute).

## Get the model

This folder is intentionally empty of binaries. Fetch the STL from one
of the official mirrors:

- [3dbenchy.com](https://www.3dbenchy.com) — original source
- [makerworld.com](https://makerworld.com) — search "Benchy", pick one tagged **Printer: A1**
- [printables.com](https://www.printables.com) — the community mirror

Save it here as `benchy.stl`.

## Recommended print settings (A1, PLA)

| Setting | Value |
|---|---|
| Layer height | 0.20 mm (Standard profile) |
| Infill | 10 % gyroid |
| Walls | 2 perimeters |
| Supports | **None** — benchy is designed to print without |
| Brim/skirt | skirt only (Benchy has enough bed contact on its own) |
| Print speed | Standard profile (~150 mm/s on A1) |
| Temp | PLA default (220 °C nozzle / 55 °C bed) |

Total time on the A1: ~45 minutes. Filament: ~12 g.

## What to look for

After the print, look at the boat with good light and check:

- **Hull sides** — smooth, no layer-line bulging? (tells you e-step / flow)
- **Bow "curl"** overhang — clean, or drooping? (cooling + speed)
- **Cabin roof** — flat and sharp, or saggy? (bridging)
- **Chimney** — round and centered? (retraction / XY accuracy)
- **Nameplate text** on the stern — legible? (perimeter precision)

Benchy is good for diagnostics, not art. If yours looks rough in one
specific area, that's your starting point for what to calibrate next.
