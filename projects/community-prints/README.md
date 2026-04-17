# Community Prints — curated free models

A shortlist of genuinely free (check the license tag on each) prints
worth running on the A1 once it's calibrated. Licenses noted where
they affect what you can do — "CC BY" = fine to print & share, "CC
BY-NC" = no commercial use, "CC BY-ND" = don't modify and redistribute.

## Where to browse

| Site | Notes |
|---|---|
| [MakerWorld](https://makerworld.com) | Bambu's own platform. Models tagged **Printer: A1** are one-click-ready from Bambu Handy. |
| [Printables](https://www.printables.com) | Prusa's site. Biggest catalog of quality free models; good curation. |
| [Thingiverse](https://www.thingiverse.com) | Old-school MakerBot site. Huge, but variable quality — sort by popular + recent. |
| [Thangs](https://thangs.com) | Aggregator. Good search; pulls from many sources. |
| [Cults3D](https://cults3d.com) | Mix of free and paid. Filter by "Free". |

## Suggested first prints after Benchy

These are small (< 1 hr), useful, and stress-test different things:

1. **Calibration Cube (XYZ 20mm)**  
   Classic dimensional-accuracy check. Measure with calipers — each
   axis should read 19.9–20.1 mm. [printables.com/model/5584](https://www.printables.com/model/5584-xyz-20mm-calibration-cube)

2. **Cable Drop / Desk Grommet**  
   Functional, prints in 20 minutes, immediately useful. Search
   MakerWorld: "cable grommet A1".

3. **Filament Swatch / Color Sample**  
   A 40×20 mm tag that shows a filament's actual color and finish.
   Print one for every spool you own — future-you will thank you.
   Search MakerWorld: "filament swatch".

4. **Articulated Dragon / Slug** (Cults3D "McGybeer" is the famous one)  
   Prints in place, no supports, joints flex after. Good "wow" print
   once you trust your printer.

5. **Bambu A1 accessories**  
   Spool holder enhancements, nozzle cleaner brackets, cable chain
   tidies. MakerWorld has an official "A1 Accessories" collection —
   filter by *"Official"* to see Bambu's own designs.

## How to pull one in

No automation — just:

```bash
cd projects/community-prints
mkdir my-download
cd my-download
# download the .stl or .3mf manually from the site
```

Commit the source files + your notes in a `README.md`. Don't commit the
site's zipped bundle — extract and keep just what you need.

## License hygiene

If you ever share a print or a remix (print it for a friend is fine;
posting photos to social media is fine), credit the designer. It's
the whole reason the free-model ecosystem keeps working.
