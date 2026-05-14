# Pineapple Garden Stake — Modular System

Garden stake for Emma's pineapple plant. Holds the stem stiff below the fruit.

## Parts

| Part | Length | Description |
|------|--------|-------------|
| **Stake** | 310mm | Main piece — tapered soil tip + twine hole + edge notch |
| **Extension Rod** | 200mm | Straight segment if plant grows taller |
| **Connector Sleeve** | 24mm | Slides over junction to join two rods |

## Specs

- **Profile:** 5 x 3mm flat rectangle (stiffer per gram than round)
- **Soil insertion:** 20mm tapered tip, ~75mm pushed into soil
- **Twine hole:** 2.5mm diameter, 30mm from top
- **Edge notch:** small rectangular notch at hole height for extra twine grip

## How to Use

1. Open FreeCAD
2. **Macro > Execute Macro** → select `pineapple_stake.FCMacro`
3. All three parts generate in the viewport
4. Export each part as STL for slicing

## Print Settings

- **Orientation: PRINT STANDING UP** — layer lines must run along the length
- Cross-grain layers on a thin stake = weak, will snap
- Material: PLA or PETG both work fine
- Infill: 100% (it's tiny, no reason not to)
- Layer height: 0.2mm is fine

## Fit Notes

- Connector sleeve has 0.2mm clearance per side — should be snug friction fit
- If too tight, sand lightly or bump `SLEEVE_GAP` to 0.3mm in the macro
- All dimensions are parametric at the top of the macro file
