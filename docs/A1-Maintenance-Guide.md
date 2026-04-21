# Bambu Lab A1 — Maintenance & Spares Guide

Keeping a full-size A1 printing **PETG non-stop** (24/7, multiple spools a
week) without surprise downtime. Covers the tool kit you should own, the
maintenance cadence by runtime hours, what wears out and when, and a
vendor-by-vendor parts list with approximate 2026 USD pricing.

> **Prices** in this doc are approximate US retail, Q1–Q2 2026. Always
> re-check the Bambu Lab Store and Amazon at purchase time — consumable
> prices move ±20 % quarterly.

---

## Table of contents

- [Why PETG changes the maintenance picture](#why-petg-changes-the-maintenance-picture)
- [Tool kit — what to own](#tool-kit--what-to-own)
- [Maintenance cycle](#maintenance-cycle)
  - [Every print (pre-flight, 30 s)](#every-print-pre-flight-30-s)
  - [Daily — end of day (2 min)](#daily--end-of-day-2-min)
  - [Weekly (~60 print hours, 10 min)](#weekly-60-print-hours-10-min)
  - [Monthly (~250 print hours, 30 min)](#monthly-250-print-hours-30-min)
  - [Quarterly (~750 print hours, 60 min)](#quarterly-750-print-hours-60-min)
  - [As-needed triggers](#as-needed-triggers)
- [Wear parts — lifetimes & symptoms](#wear-parts--lifetimes--symptoms)
- [Replacement parts — what to stock](#replacement-parts--what-to-stock)
- [Vendors — where to buy](#vendors--where-to-buy)
- [PETG-specific operating rules](#petg-specific-operating-rules)
- [Running-cost estimate (PETG, non-stop)](#running-cost-estimate-petg-non-stop)
- [Sources](#sources)

---

## Why PETG changes the maintenance picture

PETG is friendlier than ABS but harder on the printer than PLA in three
specific ways:

1. **It sticks to the build plate more aggressively.** Cool Plate / PEI
   plates can **tear PETG chunks out of the surface** if you over-adhere.
   Use a glue-stick release layer for every PETG print, or a textured PEI
   plate where the grain breaks adhesion cleanly.
2. **It's hygroscopic.** PETG absorbs moisture from the air within
   **4–24 hours** of opening a spool. Wet PETG causes stringing, surface
   pitting, and under-extrusion. Dry storage is not optional.
3. **Higher print temps (230–250 °C) and thermal cycling wear the
   hotend faster** than PLA. Nozzles, silicone socks, and the thermistor
   crimp will all age quicker on continuous PETG than on continuous PLA.

For 24/7 PETG, the failure modes to pre-empt are: plate adhesion damage,
nozzle clogs from retained PETG, and extruder gear grooving from the
harder-than-PLA filament.

---

## Tool kit — what to own

Keep these within arm's reach of the printer. Everything in this table
is one-time purchase unless marked *(consumable)*.

| Tool | Purpose | Approx. cost (USD) | Source |
|---|---|---|---|
| Metric hex key / Allen set (1.5–6 mm, ball-end) | Every screw on the A1 | $10–20 | Amazon (Wera / Bondhus) |
| Needle-nose pliers | Pulling blobs, clearing nozzle purge | $8 | Amazon / hardware store |
| Side cutters / flush cutters | Trimming filament, brim removal | $10 | Amazon |
| Brass wire brush (NOT steel) | Cleaning outside of nozzle tip | $5 | Amazon (3-pack) |
| Silicone scraper, plastic only | Removing prints without gouging the plate | $6 | Bambu or Amazon |
| Metal scraper (stainless, thin) | Stubborn PETG-on-PEI only | $8 | Bambu Lab accessory kit |
| Isopropyl alcohol (99 %) *(consumable)* | Plate degreasing between prints | $10 / quart | Amazon / pharmacy |
| Microfiber cloths | Wiping plate + frame | $8 / 10-pack | Amazon |
| Glue stick (PVA, washable) *(consumable)* | PETG release layer | $3 / stick | any grocery / Amazon |
| Feeler gauge (0.05–1 mm set) | Belt tension reference, nozzle gap | $6 | Amazon |
| Digital calipers (0.01 mm) | Checking print dimensions, filament diameter | $25 | Amazon (iGaging / Mitutoyo budget) |
| Super-lube synthetic grease (PTFE) | Z-leadscrew lubrication | $8 / tube | Amazon / Bambu |
| 3-in-1 light machine oil | Linear rail light lube | $5 | hardware store |
| Cleaning filament, 1.75 mm *(consumable)* | Purging between color/material changes | $15 / 100 g | eSUN, Bambu |
| Dust blower bulb (camera lens type) | Clearing particles from the lidar lens | $8 | Amazon |
| Nozzle torque wrench (optional) | Torquing nozzle to 1.5 N·m (prevents over-tightening) | $25 | E3D / Amazon |
| Label maker or masking tape + Sharpie | Dating spools when opened | ~$0 | existing |

**Total tool kit investment:** ~$140 new from scratch; most people
already own half of this.

---

## Maintenance cycle

Treat each tier as cumulative: the weekly checks include the daily ones.

### Every print (pre-flight, 30 s)

- Glance at the **build plate** — no old blobs, no oil smears, no torn
  PEI patches. Wipe with 99 % IPA if it looks dull.
- Glance at the **nozzle tip** — no hanging filament snot. If there is,
  heat to 240 °C and wipe with the brass brush.
- Verify the **filament path** (spool → PTFE → extruder) isn't knotted.
- Confirm the **chamber intake area** is clear (A1 is open-frame, so
  "chamber" means ~30 cm of clean air around the printer).

### Daily — end of day (2 min)

- Empty the **purge poop chute / catch box** (see
  [a1-filament-catch-box](../projects/a1-filament-catch-box/)).
- Wipe the **build plate** with IPA, both sides. Let dry before
  re-seating. For PETG: re-apply a thin glue-stick film.
- Check **spool humidity** if you have an in-dry-box hygrometer. Target
  **< 20 % RH** for PETG. Above 30 % → dry the spool before next use.
- Close Bambu Studio / sync job history if you batch-track prints.

### Weekly (~60 print hours, 10 min)

- **Brass-brush the nozzle tip** at 240 °C. Rotate brush, not nozzle.
- **Inspect the silicone sock** around the hotend. PETG burn-on is
  normal; a **torn** or **hardened-brittle** sock should be replaced
  (see wear parts).
- **Clean the lidar module lens** (underside of the toolhead) with the
  dust blower and a dry microfiber. Do **not** use IPA on the lidar —
  it can fog the optics.
- **Wipe down the linear rails** (X and Y) with a dry microfiber.
  Gritty dust here transfers to your extruder gears.
- **Check belt tension** — pluck the X-belt and Y-belt like a guitar
  string. They should sound similar. If one is muted/dull, it's slack;
  adjust per the [Bambu A1 belt-tension doc](https://wiki.bambulab.com/en/a1/maintenance/belts).
- **Run a self-test** in Bambu Handy (*Device → Calibration → Full*) if
  you've noticed any layer shifts during the week.

### Monthly (~250 print hours, 30 min)

- **Lubricate the Z-leadscrew** with a pea-sized dab of PTFE grease.
  Home Z, apply, then jog Z up/down 3× to distribute. Wipe excess.
- **Light-oil the linear rails** (one drop per rail, worked in by
  jogging). Too much oil collects dust — less is more.
- **Pop the extruder cover** and inspect the drive gear. Brass PETG
  dust between the gear teeth → clean with a stiff toothpick and brass
  brush. Heavy grooving in the gear → replacement due (see wear parts).
- **Inspect the PTFE tube** from extruder to hotend. Discoloration is
  fine; **melting, kinking, or a gap** at either end → replace.
- **Check the hotend thermistor wire** for fraying at the crimp.
  Frayed → order a replacement hotend module before it fails mid-print.
- **Re-tram the bed** with an auto-level if prints have shown any
  first-layer inconsistency.

### Quarterly (~750 print hours, 60 min)

- **Replace the nozzle** if you've been running PETG continuously.
  Stainless nozzles last ~500–1000 hrs of PETG; inspect under a loupe —
  if the orifice is egg-shaped or wider than spec (±0.05 mm on a 0.4 mm
  nozzle), replace. Hardened steel lasts 2–3× longer.
- **Replace the silicone sock** regardless — they cook into brittle
  rubber after ~750 hrs of 240 °C service.
- **Deep-clean the build plate** with dish soap + warm water, no oils.
  Towel-dry, then IPA. Retire the plate if you see **delamination
  bubbles** on the PEI.
- **Firmware check** — apply any pending A1 firmware update via
  Bambu Handy or Studio.
- **AMS Lite service** (if used): wipe the rollers, inspect the
  PTFE-tube ends for filament grooves, replace worn tube sections.

### As-needed triggers

| Symptom | Action |
|---|---|
| First-layer suddenly patchy | Re-wash plate, re-glue, re-level |
| Persistent stringing on PETG | Dry the spool (65 °C for 6 h) |
| Clicking / skipping in the extruder | Clean drive gear; check for partial nozzle clog |
| Layer shift mid-print | Check belt tension; tighten eccentric nuts |
| Thermistor runaway error | Replace hotend module immediately |
| Prints have ghosting / ringing | Tighten belts, check bed screws, reduce accel |
| Lidar first-layer scan fails | Clean the lidar lens (dust blower) |

---

## Wear parts — lifetimes & symptoms

Lifetimes assume **continuous PETG at 240 °C**. PLA extends most of
these by 1.5–2×; CF/GF cuts them by 3–5×.

| Part | Typical lifetime | Symptoms that it's due | Stock quantity |
|---|---|---|---|
| Stainless nozzle (0.4 mm) | 500–1000 h | Egg-shaped orifice, inconsistent extrusion, surface dull | 2 |
| Hardened steel nozzle (0.4 mm) | 1500–3000 h | Same as above, but takes far longer | 1 |
| Silicone hotend sock | 500–750 h | Brittle, cracked, or PETG-crusted hard | 3 |
| PTFE tube (hotend insert, short) | 500–1000 h | Discoloration + melting at the tip | 3 |
| Full hotend module (A1 quick-swap) | 1500–2500 h | Thermistor fraying, heater cartridge issues, clogs that won't clear | 1 |
| Extruder drive gear | 2000–3000 h | Visible grooving, bite marks dulled | 1 |
| Cool Plate / PEI build plate | 500–1000 h or 1 major gouge | Delamination, torn patches, won't hold first layer even after cleaning | 2 |
| X-axis belt (GT2) | 3000+ h | Visible teeth wear, stretched beyond tensioner range | 1 |
| Y-axis belt (GT2) | 3000+ h | Same | 1 |
| Lead screw nut (Z) | 3000+ h | Z-wobble, banding in prints that lubrication doesn't fix | 1 |
| Z-leadscrew grease | ~monthly top-up | Dry/squeaky Z motion | 1 tube |
| Cleaning filament | Per color change | N/A | 1 spool on hand |
| AMS Lite PTFE tubes | 1000 h | Grooves from filament, reduced feed reliability | 4 (one per slot) |

---

## Replacement parts — what to stock

**Stock-at-home "uptime kit"** (covers you for ~6 months of non-stop
PETG without an emergency order):

| Part | Qty | Unit price (USD) | Subtotal | Notes |
|---|---|---|---|---|
| A1 full hotend module (0.4 mm, stainless) | 1 | $19 | $19 | Bambu OEM, quick-swap |
| A1 full hotend module (0.4 mm, hardened steel) | 1 | $29 | $29 | For when you want longer life on PETG |
| Silicone socks (A1 hotend) | 3 | $4 | $12 | Bambu or aftermarket |
| PEI textured plate | 1 | $19 | $19 | PETG release without as much glue |
| Cool plate (replacement) | 1 | $25 | $25 | The stock one eventually wears out |
| GT2 belt set (X + Y, pre-cut lengths) | 1 | $14 | $14 | Bambu lists these individually |
| Extruder drive gear | 1 | $9 | $9 | Bambu part |
| PTFE tubing, 2 × 4 mm × 1 m | 1 | $6 | $6 | Cut to length for hotend + AMS Lite |
| PTFE grease, synthetic | 1 | $8 | $8 | Super Lube 21030 or equivalent |
| Glue stick, 3-pack | 1 | $9 | $9 | PVA washable |
| Cleaning filament, 100 g | 1 | $15 | $15 | eSUN or Bambu |
| Brass wire brush, 3-pack | 1 | $6 | $6 | Softer than nozzle, harder than PETG |
| **Total — uptime kit** | | | **~$171** | |

**Deep-reserve kit** (add if the printer is commercial or a critical
workflow item):

| Part | Qty | Unit price (USD) | Subtotal |
|---|---|---|---|
| Complete A1 toolhead assembly | 1 | $99 | $99 |
| Full hotend module × 2 extra | 2 | $19 | $38 |
| Lidar module | 1 | $55 | $55 |
| Heatbed (256 × 256 mm, A1) | 1 | $89 | $89 |
| Stepper motor (spare, NEMA 17) | 1 | $19 | $19 |
| Power supply unit | 1 | $69 | $69 |
| **Total — deep reserve** | | | **~$369** |

Together the two kits run ~**$540**. For a hobby setup the uptime kit
alone is plenty; the deep reserve makes sense only if a day of
downtime actually costs you money.

---

## Vendors — where to buy

Ranked by value-for-money for A1-specific parts in the US.

| Vendor | Best for | Shipping | Notes |
|---|---|---|---|
| [Bambu Lab Store (US)](https://us.store.bambulab.com/) | All OEM A1 parts, build plates, hotend modules | 3–5 business days | First-party. Occasionally backordered — don't wait until your only nozzle dies to reorder. |
| [MatterHackers](https://www.matterhackers.com/) | Filament + general parts | 2–3 days | Reliable domestic stock of PETG and PLA, good pricing on bulk spools |
| [Amazon (Bambu Official store)](https://www.amazon.com/stores/BambuLab/page/) | Fast consumables (brushes, IPA, tools) | 1–2 days (Prime) | Prices can be 10–20 % above Bambu direct; pay for speed when you need it |
| [Micro Swiss](https://store.micro-swiss.com/) | Hardened steel nozzle upgrades | 3–5 days | A1-compatible hotend mods; quality is excellent |
| [Printables marketplace — Bambu-made parts](https://www.printables.com/@BambuLab) | STL files for printable spares (cable guides, spool rollers) | N/A | Free designs you can print yourself |
| [MakerWorld — A1 collection](https://makerworld.com/en/@bambulab) | Printable mods & accessories | N/A | Bambu's own upload collection — curated quality |
| [Aliexpress (E3D clones, GT2 belts)](https://www.aliexpress.com/) | Generic mechanicals (belts, bearings, hex sets) | 10–21 days | Cheap but slow; order well before you need it |
| [Polymaker](https://us.polymaker.com/) | PETG filament (excellent PolyLite PETG) | 2–4 days | Consistent diameter and color batch-to-batch |
| [eSUN official store (Amazon)](https://www.amazon.com/stores/eSUN/page/) | Budget PETG + cleaning filament | 1–2 days | Best $/kg on PETG in bulk packs |
| [Prusament PETG](https://prusament.com/) | Premium PETG, tight tolerance | 5–7 days (from EU) | Tight ±0.02 mm diameter; pricier |

**Quick-reference link for this printer** — Bambu's official A1
replacement-parts landing page: <https://store.bambulab.com/collections/a1-series>

---

## PETG-specific operating rules

Breaking these is what causes most unscheduled downtime on a continuous
PETG workload.

1. **Dry every spool before mounting it.** 65 °C for 6 hours in a
   filament dryer (eSUN eBox, SUNLU S2, or a food dehydrator at the
   lowest setting). A fresh spool out of vacuum is usually OK for the
   first 24 h; after that, dry again.
2. **Store spools in sealed boxes with desiccant.** A cereal-dry-box
   with color-change silica will keep PETG at <15 % RH for weeks. Bake
   desiccant in the oven at 120 °C for 2 h when it turns pink.
3. **Always use release (glue stick OR textured PEI).** PETG will
   rip out of smooth PEI. A swipe of glue stick costs 1 ¢ per print and
   saves a $25 plate.
4. **Increase retraction by 0.5 mm from the PLA default profile** (the
   Bambu A1 PETG profile does this already — don't override).
5. **Run the part cooling fan at 30–50 %, not 100 %.** PETG layer bond
   degrades with too much cooling; you get brittle prints that
   delaminate in your hand.
6. **Never print PETG on top of PLA residue without cleaning first.**
   PLA softens around 180 °C; PETG cruise temps pull it into the
   nozzle bore and clog it.
7. **Let PETG prints cool fully** before trying to remove. A flexed
   plate releases 90 % of PETG prints on its own once cool.

---

## Running-cost estimate (PETG, non-stop)

Assuming one A1 running ~20 print hours/day on PETG, a full calendar
year is ~7300 print hours.

| Cost bucket | Annual cost (USD) |
|---|---|
| PETG filament (1 kg spool ≈ 40 print hours at typical settings → ~180 spools/yr @ $20) | ~$3,600 |
| Nozzles (~10 stainless OR ~4 hardened @ avg $20) | ~$100 |
| Hotend modules (~3–4 / year under continuous PETG) | ~$80 |
| Silicone socks (~10 / year) | ~$40 |
| Build plates (~4 / year) | ~$100 |
| Glue sticks + IPA + misc consumables | ~$80 |
| Belts / gears / PTFE (~every 18 mo) | ~$25 |
| Electricity (A1 @ ~150 W avg × 7300 h @ $0.14/kWh) | ~$155 |
| **Total per year** | **~$4,180** |

Filament dominates; everything else is ~$580/yr combined. The
cheapest optimization is buying PETG in 5-spool packs and drying it
yourself — that alone saves $400–600/year vs. buying by the single
spool.

---

## Sources

- [Bambu Lab Wiki — A1 Maintenance](https://wiki.bambulab.com/en/a1/maintenance)
- [Bambu Lab Wiki — Filament Guide](https://wiki.bambulab.com/en/general/filament-guide-material-table)
- [Bambu Lab Wiki — A1 FAQ](https://wiki.bambulab.com/en/a1/manual/faq)
- [Bambu Lab Store — A1 Series parts](https://store.bambulab.com/collections/a1-series)
- [Prusa Knowledge Base — PETG printing](https://help.prusa3d.com/article/petg_2059)
- [All3DP — PETG print settings reference](https://all3dp.com/2/petg-print-settings-the-ideal-petg-settings/)
