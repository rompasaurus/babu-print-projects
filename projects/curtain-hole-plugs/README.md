# Curtain Rod Hole Plugs

Cylindrical press-fit inserts that block unused curtain rod mounting
holes in the window frame, preventing the curtain from slipping off
the track.

## Photos

| Photo | Description |
|---|---|
| [curtain-hole-closeup-single.jpg](../../Pictures/curtain-hole-closeup-single.jpg) | Single hole close-up — shows the round bore in the white window moulding |
| [curtain-holes-pair-bottom.jpg](../../Pictures/curtain-holes-pair-bottom.jpg) | Pair of holes at the bottom of the frame |

## Hole Measurements

- **Diameter:** 12.5 mm
- **Depth:** 14 mm

## Plug Dimensions

- **Body diameter:** 12.1 mm (0.2 mm per-side interference fit)
- **Body length:** 14 mm (full depth)
- **Cap diameter:** 16.5 mm (sits flush on the surface)
- **Cap thickness:** 2 mm
- **Chamfer tip:** 0.8 mm taper for easy insertion

## Files

| File | Purpose |
|---|---|
| [plug.scad](plug.scad) | Source — edit tolerances at the top |
| [plug.stl](plug.stl) | Mesh |
| [plug.3mf](plug.3mf) | Drop into Bambu Studio |

## A1 Print Settings

| Setting | Value |
|---|---|
| Orientation | Cap flat on bed (as authored) |
| Layer height | 0.2 mm (Standard) |
| Walls | 3 perimeters |
| Infill | 100 % — small part, full solid for strength |
| Supports | **None** |
| Brim | None needed (cap provides good bed adhesion) |

Prints in under 15 minutes per plug. Print multiple copies by
duplicating the object in Bambu Studio.

## If the fit is wrong

Edit `TOL` at the top of `plug.scad`:

- **Too tight:** increase `TOL` from 0.2 to 0.3
- **Too loose:** decrease `TOL` from 0.2 to 0.1

Re-export after edits:

```bash
openscad -o plug.stl plug.scad
python3 ../../scripts/stl_to_3mf.py plug.stl plug.3mf
```
