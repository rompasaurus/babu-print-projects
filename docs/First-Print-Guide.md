# First Print — slicing your own model

Covers the flow for **your own models** (from this repo, or an STL you
downloaded). If you haven't printed anything yet, start with the
"one-click MakerWorld" path in
[A1-Setup-Walkthrough.md § 5](A1-Setup-Walkthrough.md#5-your-first-print-the-easy-path)
first.

## The pipeline

```
.scad / .step / .stl  ──► Bambu Studio ──► sliced .3mf ──► A1 over Wi-Fi
  (source CAD)            (slicer)         (toolpath)       (print)
```

## 1. Open Bambu Studio

```bash
bambu-studio &
```

First launch asks two things:

1. **Choose a printer** — pick **Bambu Lab A1** (the full-size one, not
   A1 mini).
2. **Choose a filament** — pick whatever spool you loaded.

It then drops you into the main editor view.

## 2. Add the A1 as a device (if you haven't)

*Top-right → Device tab → Add Printer*

Bambu Studio auto-discovers A1s on your LAN via mDNS. Pick yours.

It prompts for an **access code**:

```
On the A1 touchscreen: Settings → WLAN → (i) info icon → Access Code
```

Type that 8-digit code into Studio. The printer is now paired.

## 3. Load a model

Drag any of these onto the build plate in the Studio viewport:

- `.stl`  — the common interchange mesh format
- `.3mf`  — Bambu's preferred format; carries settings inside the file
- `.step` — CAD solid model (Studio imports it and meshes it internally)

If you're working from an OpenSCAD source file in this repo, first
export to STL:

```bash
openscad -o cylinder.stl projects/wife-measuring-cylinder/cylinder.scad
```

…then drag `cylinder.stl` into Studio.

## 4. Arrange + settings

- **Auto-arrange:** *right-click the plate → Auto Arrange*. Or just
  leave one model centered.
- **Orientation matters.** Overhangs > 45° will print badly without
  support. Click the model → *Orient* tool → *Auto Orient* for a first
  pass, adjust by hand if needed.
- **Preset profile:** on the right sidebar, make sure:
  - Printer: `Bambu Lab A1 0.4 nozzle`
  - Filament: matches what's loaded
  - Process: `0.20mm Standard @BBL A1` is a good default. For finer
    detail use 0.12mm; for draft prints use 0.28mm.

For a first real print you rarely need to touch anything else.

## 5. Slice

Click **Slice Plate** (big blue button, top-right). Studio computes the
toolpath and flips to a *Preview* view showing:

- Print time estimate
- Filament length + weight
- Per-layer view (scrub the slider on the right)

Scrub the preview slider up from layer 0 and **look for**:

- First layer solid? (no holes, continuous perimeters)
- Do the walls go where you expect?
- Any weird floating support structures?

## 6. Send to printer

**Send** (next to Slice Plate) → pick your A1 from the dropdown →
**Send and Print**.

Studio uploads the `.3mf`, the A1 wakes up, runs its pre-print calibration
(bed level + flow dynamics) and starts.

Monitor progress in Studio's Device tab, or on your phone via Bambu
Handy.

## 7. File organization convention

For this repo, keep projects self-contained:

```
projects/my-thing/
  README.md              ← what it is, print settings notes
  my-thing.scad          ← source (OpenSCAD / FreeCAD / etc.)
  my-thing.stl           ← committed so Studio can open directly
  my-thing.3mf           ← optional: sliced, known-good settings
```

Commit sources (`.scad`, `.step`). Commit exported `.stl` for
convenience. Do **not** commit `.gcode` — the `.gitignore` blocks those.

## 8. Calibration tips for printable-quality prints

| When | Do this |
|---|---|
| New filament brand / color | Run **Flow Dynamics Calibration** in Studio (*Calibration → Flow Dynamics*). Picks the right pressure-advance value. Takes ~3 min. |
| Prints look dimensionally off | Run **Flow Rate Calibration**. |
| Ghosting on fast prints | Re-run **Vibration Compensation** on the printer. |

You don't need any of these for decorative/rough prints, but they matter
once you start printing functional parts that need to fit together.
