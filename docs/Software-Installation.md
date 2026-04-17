# Software Installation

You need two pieces of Bambu software, and a couple of optional extras.

## 1. Bambu Studio (desktop slicer — required)

The official slicer. Turns `.stl` / `.3mf` / `.step` models into gcode the A1
can print, sends jobs over Wi-Fi, monitors print progress.

**CachyOS / Arch (your system):** run the installer script.

```bash
./scripts/install.sh
```

Under the hood it runs:

```bash
paru -S bambu-studio-bin
```

**Other systems (for reference):**

| OS | Source |
|---|---|
| Windows / macOS | [bambulab.com/en/download/studio](https://bambulab.com/en/download/studio) |
| Linux (AppImage) | [github.com/bambulab/BambuStudio/releases](https://github.com/bambulab/BambuStudio/releases) |
| Linux (Flatpak, community) | `flatpak install flathub com.bambulab.BambuStudio` |

The Bambu Studio release cadence is roughly monthly. As of early 2026 the
current stable series is **v2.x** — don't pin to older 1.x, the A1 needs
newer firmware-compatibility fixes that live in 2.x.

## 2. Bambu Handy (mobile app — strongly recommended)

Phone app. You'll use it to:

- Bind the printer to your Bambu Lab account (scan QR on A1 screen)
- Monitor prints from away from the machine
- Browse and one-click-print from **MakerWorld** (Bambu's model site)

Install: search "Bambu Handy" in the **iOS App Store** or **Google Play**.

> **Heads-up:** account binding is *single-account*. Whoever scans the QR
> first owns the printer until you factory-reset network settings.

## 3. MakerWorld account (optional but useful)

Bambu's model repository. It's the easiest source of printer-ready `.3mf`
files already tuned for the A1 — no slicing decisions required for your
first prints.

Sign up at [makerworld.com](https://makerworld.com) with the same email you
use for Bambu Handy.

## 4. Optional extras (the installer also sets these up)

| Tool | Why you'd want it |
|---|---|
| **OrcaSlicer** | Community fork of Bambu Studio. Sometimes has features before they land upstream. |
| **OpenSCAD** | Edit the `.scad` source files in this repo (parametric CAD — code-driven). |
| **FreeCAD** | Full mouse-driven parametric CAD for heavier design work. |
| **MeshLab** | Inspect, repair, and simplify `.stl` files. |

## Verifying the install

```bash
bambu-studio --version
openscad --version
```

Both should print a version and exit cleanly.

## Firmware

You don't install firmware from the PC side — the A1 pulls its own
firmware OTA. When Bambu Studio first connects it may prompt you to
accept a firmware update; say yes.

You can also trigger updates from the printer:

```
Settings → General → Firmware Update
```
