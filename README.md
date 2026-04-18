# Babu Print Projects

Personal home-lab repo for the Bambu Lab **A1** 3D printer. Holds setup docs,
install tooling, and printable project sources (OpenSCAD / STL / 3MF).

## Contents

| Path | What's inside |
|---|---|
| [docs/A1-Setup-Walkthrough.md](docs/A1-Setup-Walkthrough.md) | Unbox → first print, step-by-step |
| [docs/Software-Installation.md](docs/Software-Installation.md) | Bambu Studio, Handy, drivers, alternatives |
| [docs/First-Print-Guide.md](docs/First-Print-Guide.md) | Slicing + sending your first job |
| [scripts/install.sh](scripts/install.sh) | One-shot installer (CachyOS / Arch) |
| [projects/wife-measuring-cylinder/](projects/wife-measuring-cylinder/) | 6" finger-width ruler cylinder |
| [projects/blob-buddy-figurines/](projects/blob-buddy-figurines/) | Original 3-pose figurine family |
| [projects/electronics-storage/](projects/electronics-storage/) | Modular 40 mm-grid bins + solder holder |
| [projects/a1-filament-catch-box/](projects/a1-filament-catch-box/) | Desk-side filament catch bin for the A1 |
| [projects/kirby-figurines/](projects/kirby-figurines/) | Six Kirby poses — external download links |
| [projects/example-benchy/](projects/example-benchy/) | The canonical "does it print?" test |
| [projects/community-prints/](projects/community-prints/) | Links + notes for free models to try |

## Quick start

```bash
# 1. Install Bambu Studio + tooling
./scripts/install.sh

# 2. Read the setup walkthrough
$EDITOR docs/A1-Setup-Walkthrough.md

# 3. Open a project to slice
bambu-studio projects/example-benchy/
```

## Printer

- **Model:** Bambu Lab A1 (full-size, 256×256×256 mm build volume)
- **Firmware updates:** OTA from the printer, or via Bambu Studio / Handy
- **Network:** already on Wi-Fi (verify via the A1 touchscreen: *Settings → Wi-Fi*)
