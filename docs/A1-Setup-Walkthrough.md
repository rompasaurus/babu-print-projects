# Bambu Lab A1 — Full Setup Walkthrough

End-to-end path from "it's on the desk" to "a part is coming off the bed."
Written for the **full-size A1** (not the A1 mini — they differ in bed size
and a couple of menu items). Budget **45–75 minutes** for first-time setup
if you're methodical; the printer itself takes ~12–15 minutes of internal
calibration that runs unattended.

---

## 0. Before you touch the machine

Checklist:

- [ ] Flat, **stable** surface. The A1 is a bedslinger — the Y-axis whips
      the bed back and forth. Vibration shows up in your prints. A solid
      desk or a concrete paver works; a wobbly IKEA shelf does not.
- [ ] Clear ~50 cm of space on **all four sides**. The bed travels outside
      the frame footprint when homed.
- [ ] Power outlet within reach (the A1 uses a standard IEC kettle cord).
- [ ] A Wi-Fi network you know the password for. 2.4 GHz works best —
      the A1's radio prefers it.
- [ ] A Bambu Lab account. Create it now at
      [bambulab.com](https://bambulab.com) if you haven't; you'll need it
      for binding.
- [ ] **Bambu Handy** installed on your phone. See
      [Software-Installation.md](Software-Installation.md).

---

## 1. Unbox and de-shipping-mode

The A1 ships with the gantry and bed locked against shipping jostling.
You must remove these before powering it on.

1. **Cut the packing straps** and lift the machine out of the foam.
   Grab the black frame uprights, not the gantry bar.
2. **Remove the Z-axis shipping screws.** On the A1, there are **4 screws**
   (red-tag labels) on the underside securing the bed in shipping position.
   Tilt the printer carefully or lay it on its back on soft material. Use
   the included hex driver.
3. **Remove foam inserts and zip ties.** There are foam blocks inside the
   toolhead's cable chain and around the extruder. Pull every red-tagged
   piece. Missing any of these = grinding noises on first homing.
4. **Attach the spool holder** to the back of the frame (included screws
   and holder arm).
5. **Attach the touchscreen** if it's not pre-mounted. The touchscreen
   cable is keyed — only goes in one way.
6. **Install the build plate.** The A1 ships with a dual-sided textured
   PEI plate. Align the notch at the front-right corner of the bed
   (matches the magnetic keying) and let it snap down flat.

> **Don't peel the PEI coating off the build plate.** It's the plate itself,
> not a protective film.

---

## 2. First power-on and firmware

1. Plug in the IEC cord. Flip the power switch on the back-left.
2. The touchscreen boots to a welcome wizard. Pick language, region.
3. **Wi-Fi binding:** tap *Select Wi-Fi* → choose your SSID → enter
   password. The A1 will connect and check for a firmware update.
4. **Accept the firmware update** if offered. This can take 5–10 minutes
   and reboots the printer. Don't power-cycle during the update.
5. **Account binding:** the screen shows a QR code. Open Bambu Handy on
   your phone, sign in, tap the "+" to add a printer, and **scan the QR
   code**. The printer now appears in your Handy device list.

> Once bound, only that Bambu Lab account can push prints over the cloud.
> LAN-only mode is available later (*Settings → General → LAN Only*) if
> you want to keep prints off the cloud.

---

## 3. Auto-calibration (runs on first boot)

The screen will prompt to run **initial calibration**. Just say yes. It
runs three routines, in order:

| Routine | What it does | Time |
|---|---|---|
| Bed leveling | Probes a mesh of the bed for a Z-offset compensation map | ~2 min |
| Vibration compensation | Vibrates the bed/gantry to fingerprint resonance at print speeds. The A1 uses this to cancel ghosting/ringing. | ~5 min |
| Motor noise cancellation | Tunes stepper drivers against belt/lead-screw resonance. Makes the printer noticeably quieter. | ~5 min |

**All three make alarming noises.** Loud, clacky, like-something-is-wrong
noises. That's normal. Don't interrupt them.

> You only need to re-run these if you move the printer to a new surface
> or swap the build plate. Bed leveling also runs before every print by
> default — leave that on.

---

## 4. Loading filament

A1 (base model, no AMS lite): single-color external spool.

1. Put a 1 kg spool on the rear spool holder.
2. Feed the filament into the PTFE tube at the back of the gantry until
   it reaches the toolhead. Push gently — don't force kinks.
3. On the touchscreen: *Filament → Load*.
4. The printer asks what filament you loaded. For starters, pick **Bambu
   PLA Basic** if that's what came in your combo box, otherwise **Generic
   PLA**.
5. The extruder heats (~220 °C for PLA), pulls the filament through, and
   purges a few cm of molten plastic. Wipe the ooze off the nozzle with
   tweezers or a wire brush once it cools slightly.

> Clip the filament end at a **diagonal angle** before loading — blunt
> ends can jam at the extruder gear.

If you have **AMS lite** (the 4-spool holder that some A1 Combo kits
include), bind it next: *Device → AMS → Bind*. Load each spool into a
slot; the AMS lite reads Bambu RFID tags automatically, or you set the
material type manually for generic spools.

---

## 5. Your first print (the easy path)

Simplest flow — no slicer required the first time:

1. Open **Bambu Handy** on your phone.
2. Tap the **MakerWorld** tab.
3. Search for "Benchy" or "A1 calibration cube" — pick one marked
   *"Printer: A1"* and with *"One-click print"*.
4. Tap *Print*, pick your A1 from the device list, pick the filament
   you loaded, tap **Start**.
5. The printer will auto-home, run a quick bed level + flow-dynamics
   calibration, then start.

This path skips the slicer entirely. The `.3mf` file has baked-in
settings from the uploader, so you get a known-good first print with no
decisions to make.

**The harder (but real) path** — slicing your own models — is in
[First-Print-Guide.md](First-Print-Guide.md).

---

## 6. While the first print runs

Watch the first **5–10 minutes closely**, specifically:

- **First layer adhesion.** Lines should be gently squished, uniformly
  shiny, with no gaps between lines. If you see gaps → bed too far from
  nozzle. If you see ridges where the nozzle plowed through plastic →
  too close. The A1 auto-tunes this well, but if a print fails at layer
  1, re-run bed leveling: *Device → Calibration → Bed Level*.
- **Filament is feeding smoothly.** Listen for clicking from the extruder
  — that's the gear skipping, usually a partial jam.
- **The print isn't walking on the bed.** If the whole model scoots across
  the plate, adhesion failed — stop the print, clean the plate with
  isopropyl alcohol (70%+), retry.

---

## 7. After the print

1. Wait for the bed to cool to ~40 °C. The PEI plate releases parts
   on its own once cool — if a part still clings, **flex the plate**
   (lift it off the magnet, bow it gently). Don't pry with a scraper
   unless you want to tear the coating.
2. Tweezers off the purge line and any stringing.
3. Inspect first-layer quality against
   [this guide](https://wiki.bambulab.com/en/general/printer-calibration)
   — it's the single best diagnostic for "is my printer OK?"

---

## 8. Maintenance you'll want to know about

| Task | Interval | Note |
|---|---|---|
| Wipe build plate with IPA | Every few prints | Skin oils kill adhesion |
| Clean nozzle | If stringing gets bad | Heat nozzle, brush with brass bristle |
| Lubricate lead screw | ~200 print-hours | Bambu ships a small tube of PTFE grease |
| Run Flow Dynamics Calibration | Every new filament brand | *Device → Calibration → Flow Dynamics* |
| Firmware update | When prompted | OTA. Don't skip major versions. |

---

## 9. Troubleshooting cheat sheet

| Symptom | Likely cause | Fix |
|---|---|---|
| Print detaches mid-print | Dirty bed, or first layer too high | IPA wipe + re-level |
| Stringing / whiskers between parts | Wet filament, retraction too low | Dry filament (air fryer @ 50 °C, 4 h), let the slicer tune retraction |
| Layer lines look like sound waves (ghosting) | Vibration compensation didn't run, or printer on wobbly surface | Re-run VC; move to solid surface |
| "Filament runout" mid-print on a full spool | Filament tangled on spool | Re-spool carefully, watch for crossed winds |
| Extruder clicks, no plastic | Jam or cold extrusion | Unload → cut tip diagonal → reload |
| A1 won't connect after router reboot | New DHCP lease | *Settings → Wi-Fi → Reconnect* |

---

## 10. What to read next

- [First-Print-Guide.md](First-Print-Guide.md) — sending your own sliced models
- [projects/wife-measuring-cylinder/README.md](../projects/wife-measuring-cylinder/README.md) — the first project in this repo
- Official wiki: [wiki.bambulab.com/en/a1](https://wiki.bambulab.com/en/a1) (deep reference; you don't need to read it top-to-bottom)
