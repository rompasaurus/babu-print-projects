# Kirby Figurines — curated downloads

Six different Kirby poses/variants, each in its own subfolder. The STL
files themselves are **not committed here** — Kirby is a Nintendo/HAL
Laboratory character, so the models are fan creations posted on hosting
sites under their own terms. Download each one from the linked source
into its folder for personal printing.

## The collection

| # | Folder | Pose / Variant | Source |
|---|---|---|---|
| 1 | [01-classic-standing/](01-classic-standing/) | Standard standing Kirby, no supports | Printables |
| 2 | [02-sleepy/](02-sleepy/) | Sleeping Kirby (cute, small footprint) | Cults3D |
| 3 | [03-sitting-easy/](03-sitting-easy/) | Sitting with arms on ground (flat-bottom, easy) | Thingiverse |
| 4 | [04-waste-eater/](04-waste-eater/) | Kirby as a desk-bin / trash eater | MakerWorld |
| 5 | [05-multipart-no-ams/](05-multipart-no-ams/) | Multi-part, assemble for color separation | MakerWorld |
| 6 | [06-color-sorted/](06-color-sorted/) | Color-sorted for no-AMS multi-color | MakerWorld |

Each subfolder has its own `README.md` with the direct link and any
pose-specific print notes.

## Bambu A1 settings — Kirby default

Works for any of the above unless the subfolder's README says otherwise.

| Setting | Value | Why |
|---|---|---|
| **Scale** | 40–60 mm tall | "Small" as requested; prints in ~45 min each |
| Layer height | 0.16 mm | Good balance for rounded shapes; 0.12 mm if you want mirror-smooth |
| Walls | 3 perimeters | Hides infill pattern on thin-walled areas |
| Infill | 10 % gyroid | These are hollow-ish figurines, not structural |
| Supports | **None** (check per-model) | Picked poses that are support-free |
| Brim | 3 mm brim if the model's base is small | Kirby has tiny feet on some variants |
| Seam | "Aligned, back" | Keeps the z-seam off the face |
| Filament | Pink PLA, obviously | Bambu PLA Basic "Magenta" or "Pink" |

Accent colors (eyes, cheeks, feet):

- **With AMS lite (4 colors):** use a pre-split model like #5 or #6.
- **Without AMS:** paint after printing (acrylic + clear topcoat), or
  do filament swaps via the Bambu Studio "Change Filament at Layer"
  feature for 2-color prints.

## Why I didn't commit the STLs

This repo is public. Republishing fan-made Kirby models into a public
GitHub would:
- violate the hosting sites' terms (most require downloads go through
  their platform for attribution / download counts)
- potentially draw a Nintendo DMCA takedown that would affect your
  whole repo, not just the Kirby folder

Downloading into a local folder on your machine for personal printing
is the normal flow and is what everyone does — just don't `git add` the
files. The repo's existing `.gitignore` doesn't block `.stl` files
(because your own cylinder's STL is committed), so for **these**
specific folders, if you download files into them, add an explicit
per-folder `.gitignore` — see each subfolder's README.

## If you want something original instead

I can generate a **"pink round blob character"** from scratch in
OpenSCAD — same vibe as Kirby (round body, little feet, wide eyes)
without being the trademarked character. It'd commit cleanly into the
public repo. Say the word and I'll make one per pose.
