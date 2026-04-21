# Gridfinity Parametric Generator

**Category:** Foundation system — drawer & bench bins
**Source:** [MakerWorld — Parametric Gridfinity Generator](https://makerworld.com/en/models/466168-parametric-gridfinity-generator-create-your-own)
**License:** Check the page before redistributing — MakerWorld shows the license badge under the title. Printing for personal use is always fine; don't re-upload the files.

## Why this one

Gridfinity is the de-facto modular storage standard for workbenches. The parametric generator lets you punch out any bin size, depth, compartment layout, magnet-hole pattern, and label slot straight from MakerWorld's Model Maker — no CAD needed. Use this as the foundation, then layer themed bins on top of it.

## What to download

From the MakerWorld page, either:
- **Customize in browser** via Model Maker → set your cell count (e.g. 2×3×6 cells), lip, magnet holes → download the configured 3MF.
- Grab one of the pre-made 3MFs if a stock size fits.

Save files into this folder once downloaded (they are not mirrored here due to licensing).

## Baseplate generator (mount all the bins together)

The MakerWorld generator punches out the **bins**. For the **baseplate** — the flat platform that holds a set of bins together on a shelf or desk — use ExtraBold Tools' browser generator:

- [ExtraBold Gridfinity Baseplate Generator — 3×3 (126×126 mm) preset](https://www.extrabold.tools/gridfinity-baseplate?baseplateType=normal&tolerance=standard&dimensionsWidth=126&dimensionsDepth=126&gridAlignmentAlignment=center&gridAlignmentOffsetX=0&gridAlignmentOffsetY=0&marginType=solid&toggleMagnets=false&magnetDiameter=6&magnetHeight=2&toggleScrewHoles=false&screwHoleSize=3&screwHeadSize=6&removeHolesOnSplitLines=true&splitToBuildplates=false&plateMarginMm=10&splitStrategy=fewerParts&partsConnector=none&enablePlateNesting=false&pieceSpacingMm=3&showAdvanced=false&advancedWarning=&gridUnitWidth=42&gridUnitDepth=42&borderRadius=4&overrideMaxOuterBorderRadius=false&outerBorderRadius=4&magnetBaseHeight=2.8&bottomPadding=0&topCutoff=0.4&v=0.5.15)

Preset values in that link:
- 126 × 126 mm baseplate = **3 × 3 cells** at the standard 42 mm grid
- Normal baseplate, standard tolerance, solid margin, 4 mm border radius
- Magnets / screw holes **off** (toggle on in the UI if you want the bins to lock down)

Resize in the UI — bump `dimensionsWidth` / `dimensionsDepth` in multiples of 42 mm to cover more bins (e.g. 210 × 168 = 5 × 4 cells). Export the STL/3MF and drop it into this folder next to the bin 3MFs so a full set (baseplate + bins) prints as one project.

## A1 print settings

| Setting | Value |
|---|---|
| Filament | PLA (PETG fine if you want heat tolerance) |
| Layer height | 0.20 mm Standard |
| Walls | 3 |
| Infill | 15 % grid |
| Supports | None |
| Brim | None — baseplate footprint holds plenty |
| Orientation | Open-top up (as saved in the 3MF) |

One 42×42 mm cell bin prints in ~12 min and uses ~3 g PLA. A full drawer of bins is an overnight job.

## Pairs well with

- [rugged-drawer-system](../rugged-drawer-system/) — stackable drawer chassis that holds Gridfinity bins
- [ultimate-gridfinity-bins](../ultimate-gridfinity-bins/) — library of ready-made specialized bins
- The repo's own [electronics-storage](../../electronics-storage/) — already uses a 40 mm grid, so Gridfinity bins slot in visually even though they're not magnetically coupled
