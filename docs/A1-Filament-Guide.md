# Bambu Lab A1 — Filament Guide

Every filament the A1 can actually run, what each is good for, visual
examples, and where to buy it without getting ripped off. Written for
the **full-size A1** (the A1 mini has the same hotend and ecosystem, so
everything here applies equally except print volume).

![3D printing filament spools](https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/3D_Printing_Materials_%2816863368275%29.jpg/640px-3D_Printing_Materials_%2816863368275%29.jpg)

*Filament spools, image via [Wikimedia Commons](https://commons.wikimedia.org/wiki/Category:3D_printing) (CC BY 2.0).*

---

## Table of contents

- [What the A1 can print (at a glance)](#what-the-a1-can-print-at-a-glance)
- [Nozzle: when stainless is fine, when to upgrade to hardened steel](#nozzle-when-stainless-is-fine-when-to-upgrade-to-hardened-steel)
- [PLA family](#pla-family)
  - [PLA Basic](#pla-basic)
  - [PLA+ / PLA Pro / Tough PLA](#pla--pla-pro--tough-pla)
  - [Matte PLA](#matte-pla)
  - [Silk PLA](#silk-pla)
  - [Marble PLA](#marble-pla)
  - [Wood-filled PLA](#wood-filled-pla)
  - [Glow-in-the-dark PLA](#glow-in-the-dark-pla)
  - [PLA Aero (lightweight foaming)](#pla-aero-lightweight-foaming)
- [PETG](#petg)
- [TPU (flexibles)](#tpu-flexibles)
- [Carbon-fiber / glass-fiber reinforced (PLA-CF, PETG-CF)](#carbon-fiber--glass-fiber-reinforced-pla-cf-petg-cf)
- [Support materials](#support-materials)
- [Specialty: conductive, heat-treatable, metal-filled (Proto-Pasta)](#specialty-conductive-heat-treatable-metal-filled-proto-pasta)
- [Not recommended on the A1 (ABS, ASA, PC, PA)](#not-recommended-on-the-a1-abs-asa-pc-pa)
- [Supplier guide — best quality & price per type](#supplier-guide--best-quality--price-per-type)
- [Storage, drying, and humidity](#storage-drying-and-humidity)
- [Sources](#sources)

---

## What the A1 can print (at a glance)

The A1 is an **open-frame bedslinger** with a max nozzle temp of 300 °C
and a heated bed capped around 80 °C. That design window makes it
excellent for low-temp filaments and *possible-but-compromised* for
anything that benefits from a heated chamber.

| Type | A1 support | Notes |
|---|---|---|
| **PLA** (all variants) | ✅ Ideal | Gold-standard fit for this printer |
| **PETG** (incl. HF) | ✅ Ideal | Pre-tuned Bambu profiles, excellent layer bond |
| **TPU 95A** | ✅ Supported | Print from external spool holder; AMS Lite works but not officially recommended for flexibles |
| **TPU 85A–90A** (softer) | ⚠ External spool only | AMS Lite is too tortuous for very soft TPU |
| **PVA** (water-soluble support) | ⚠ Not recommended via AMS Lite | PVA absorbs moisture in the open AMS Lite and fails. Use sealed dry-box feed only |
| **Support for PLA/PETG** (Bambu) | ✅ Ideal | Bambu's breakaway support interface material |
| **PLA-CF / PLA-GF** | ✅ With hardened nozzle | Stock nozzle wears fast — swap to hardened steel first |
| **PETG-CF** | ✅ With hardened nozzle | Same — hardened steel required |
| **ABS / ASA** | ⚠ Small parts only | Warps badly without enclosure; keep prints <100 mm and low infill |
| **PC / PA / PA-CF / PET-CF / PPA-CF** | ❌ Not recommended | These need heated chambers (X1C, P1S). Small test prints may succeed but layer bond is weak |

Source: [Bambu Lab Wiki — Filament Guide Material Table](https://wiki.bambulab.com/en/general/filament-guide-material-table) and [A1 FAQ](https://wiki.bambulab.com/en/a1/manual/faq).

---

## Nozzle: when stainless is fine, when to upgrade to hardened steel

The A1 ships with a **stainless steel 0.4 mm nozzle**. It's great for
unfilled plastics but wears rapidly on anything abrasive.

| Filament | Stainless OK? |
|---|---|
| PLA Basic, PLA+, PETG, TPU | ✅ |
| Silk PLA | ✅ (silk polymers aren't abrasive) |
| Matte PLA | ⚠ Slightly abrasive — fine short-term, hardened recommended for heavy use ([Polymaker note](https://polymaker.com/product/polyterra-pla/)) |
| Wood-filled PLA | ⚠ Wood fibers erode brass over time, but stainless holds up decently |
| Marble PLA (polymer speckles) | ✅ |
| **Glow-in-the-dark PLA** | ❌ Phosphor particles are *very* abrasive — hardened required |
| **PLA-CF / PLA-GF** | ❌ Hardened required |
| **PETG-CF / PETG-GF** | ❌ Hardened required |
| Metal-filled (ProtoPasta Iron/Steel) | ❌ Hardened required |

Upgrade path: [Bambu Lab Hotend with Hardened Steel Nozzle — A1 Series](https://us.store.bambulab.com/products/bambu-hotend-a1-series), ~$20 USD, one-minute swap.

---

## PLA family

PLA (polylactic acid) is a corn-starch-derived bioplastic. Easiest
filament on Earth to print. Almost every print you make on the A1 in
year one will be PLA.

**Properties:** prints at 190–220 °C, 55 °C bed; brittle at thin walls,
plenty strong at 3+ walls with 20 % infill; loses shape above ~55 °C
(don't leave PLA prints in a hot car).

**Example prints:** [MakerWorld PLA gallery](https://makerworld.com/en/3d-models/701-organizers)

### PLA Basic

The default. Matte-ish glossy finish, cheap, ±0.03 mm typical tolerance
on good brands.

**Use cases:** prototypes, figurines, toys, organizers, most functional
parts that don't live outdoors or near heat.

**Example:** [Bambu Lab PLA Basic](https://bambulab.com/en-us/filament/pla-list)

### PLA+ / PLA Pro / Tough PLA

Blended PLA with toughness modifiers — roughly 2× the impact strength
of basic PLA with similar print settings. Different brands call it
different names.

**Use cases:** mechanical parts that take impact (RC car bodies, tool
handles, clips that flex). Better first layer adhesion too.

**Source:** [PLA Filament Flavors Explained — jcprintfarm](https://www.jcprintfarm.com/blogs/3d-printing-tech/pla-filament-flavors-explained-pla-tough-pla-silk-pla-and-the-tradeoffs)

### Matte PLA

PLA loaded with a diffusing filler (calcium carbonate is common). Hides
layer lines visually, slightly more brittle than basic PLA. Velvety
look, zero glare under light.

**Use cases:** display models, cosplay props, photography accessories
(no reflections), anything where you want shape to read cleanly.

**Example:** [Polymaker PolyTerra / Panchroma Matte](https://us.polymaker.com/products/polyterra-pla) — the reference matte PLA.

### Silk PLA

PLA with polymer additives that make it highly light-reflective. Looks
like satin or brushed metal. **Lower layer bond** than basic — don't
use for structural parts.

**Use cases:** vases, decorative busts, jewelry, dragons / slugs /
articulated prints, anything aesthetic. Stunning on spiral-vase prints.

**Reference:** [SUNLU aesthetic filament guide](https://uk.store.sunlu.com/blogs/3d-printing-guide/aesthetic-filament-guide-want-to-try-high-visual-prints-but-dont-know-where-to-start)

### Marble PLA

PLA with dark polymer speckles mimicking natural stone. Matte base,
stony finish.

**Use cases:** architectural models, Greek/Roman busts, geometric
sculpture, ancient-ruin dioramas. Looks phenomenal on flat, broad
surfaces that show the speckle flow.

**Reference:** [Marble PLA brand comparison — FacFox](https://facfox.com/docs/kb/marble-pla-marble-filament-brands-compared)

### Wood-filled PLA

PLA with ~20–30 % real wood particles. Smells like sawdust while
printing, sands and stains like real wood.

**Use cases:** home décor, tabletop miniatures, architectural models,
anywhere you want tactile warmth. Can be finished with woodworking
techniques (stain, wax, polyurethane).

**Note:** raise nozzle temp by ~10 °C and use ≥0.5 mm nozzle if possible
to avoid clogs from fiber clumps.

### Glow-in-the-dark PLA

PLA with phosphorescent strontium aluminate particles. Charges under
any light, glows green/blue for hours in the dark.

**Use cases:** light switches, keychains, night-light bezels, Halloween
props. The phosphor is *extremely abrasive* — **hardened steel nozzle
required** on the A1.

**Example:** Search "glow in the dark PLA" on [MakerWorld](https://makerworld.com).

### PLA Aero (lightweight foaming)

A specialty PLA that foams as it extrudes, producing ~50 % density
parts. Requires a temperature tower to tune.

**Use cases:** RC aircraft wings, lightweight props, buoyant parts.

**Source:** [Bambu Lab PLA Aero](https://bambulab.com/en-us/filament/pla-list).

---

## PETG

PETG (glycol-modified PET — same family as soda bottles) is the other
workhorse. Tougher, slightly more flexible, much more heat-resistant
than PLA (~70 °C service temp). Slight stringing tendency, but Bambu's
PETG HF profile nails it.

**Properties:** prints at 230–250 °C, 70–80 °C bed; chemically resistant;
food-contact grade for many brands.

**Use cases:**
- Outdoor parts (UV and water resistant)
- Parts near heat (car interior, around lights, electronics enclosures)
- Mechanical prints where PLA would snap — PETG bends instead
- Bottle adapters, planters, plumbing-adjacent parts

**Bambu recommendation:** [PETG HF](https://bambulab.com/en-us/filament/collections) (high-flow, pre-tuned profile). One-click print.

**Example prints:** [Printables PETG collection](https://www.printables.com/tag/petg).

**Gotcha:** PETG sticks *aggressively* to the PEI plate. Use a thin glue
stick layer on the textured plate if you want to peel parts off without
chunks of PEI lifting.

---

## TPU (flexibles)

Thermoplastic polyurethane. Rubber-like, bounces. Sold by shore
hardness — **95A** is the standard and the only one to start with.

| Shore | Feel | A1 AMS Lite? |
|---|---|---|
| 95A | Firm rubber (phone case hardness) | ⚠ Works for many users but unofficial |
| 90A | Medium-soft (wristband hardness) | ❌ Use external spool |
| 85A | Soft (shoe sole hardness) | ❌ Use external spool |

**Use cases:** phone cases, gaskets, wheels, shoe inserts, vibration
dampeners, belts, grippers, cable strain reliefs.

**Print tips:** slow (30–40 mm/s), retract minimally or not at all, use
the lowest fan speed that still cools.

**Bambu product:** [TPU 95A HF](https://us.store.bambulab.com/products/tpu-95a-hf) — 3× faster than standard TPU 95A.

**TPU guide:** [Bambu Lab Wiki — TPU Printing Guide](https://wiki.bambulab.com/en/knowledge-sharing/tpu-printing-guide).

---

## Carbon-fiber / glass-fiber reinforced (PLA-CF, PETG-CF)

Base plastic with chopped carbon or glass fiber (typically 10–20 %).
Dramatically stiffer, **harder**, better dimensional stability, matte
black aesthetic (CF) or matte translucent (GF).

| Property | PLA | PLA-CF |
|---|---|---|
| Stiffness | Baseline | ~2× |
| Impact strength | Baseline | Slightly lower (more brittle) |
| Abrasion on nozzle | None | Severe |

**Hardware requirement:** [hardened steel nozzle](https://us.store.bambulab.com/products/bambu-hotend-a1-series) — non-negotiable.

**Use cases:** drone frames, jigs and fixtures, brackets, structural
clips, camera mounts. Anywhere you want PLA ease-of-print with
engineering-plastic stiffness.

**Example:** [Bambu PLA-CF](https://shop3duniverse.com/products/bambu-lab-pla-cf-carbon-fiber-reinforced-pla-1-75mm-1kg).

**Forum reference:** [A1 with hardened steel + PETG-CF thread](https://forum.bambulab.com/t/a1-with-hardened-steel-nozzle-petg-cf-able/28547).

---

## Support materials

The A1 Combo (with AMS Lite) can print supports in a *different*
material from the model itself — supports snap off cleanly and leave
a better surface finish.

### Support for PLA/PETG (Bambu)

Bambu's breakaway support interface. Different polarity than PLA/PETG,
so it won't fuse to either. Peels off in one piece.

**Use case:** 90 % of dual-filament support needs. Load it as the
"support" slot and Bambu Studio handles the rest.

**Product:** [Support for PLA/PETG](https://us.store.bambulab.com/products/support-for-pla-petg).

### PLA ↔ PETG mutual support

PETG HF / PETG Basic and PLA Basic can be used as support for each
other — they don't adhere well across the polarity gap. Works as a free
alternative if you already have both on hand.

**Guide:** [Bambu Wiki — PLA and PETG mutual support](https://wiki.bambulab.com/en/filament-acc/filament/h2d-pla-and-petg-mutual-support).

### PVA (water-soluble)

PVA dissolves in warm water, letting you print true internal supports
that a breakaway material can't reach.

**A1 caveat:** ⚠ **Not recommended via AMS Lite.** PVA is hygroscopic —
the open AMS Lite exposes it to room humidity, and it gets gummy and
clogs within hours. Use it only from a sealed dry-box spool feed.

---

## Specialty: conductive, heat-treatable, metal-filled (Proto-Pasta)

[Proto-Pasta](https://proto-pasta.com/) is the go-to U.S. maker for
exotic PLA blends. All Proto-Pasta blends print at standard PLA
temperatures — but most are abrasive (hardened nozzle).

| Product | What it does |
|---|---|
| [Conductive PLA](https://proto-pasta.com/products/conductive-pla) | Prints with ~2–3.5 kΩ per 10 cm — enough for touch sensors, LED traces, low-current circuits |
| Iron-filled PLA | Prints rust like cast iron after a light vinegar bath |
| Steel-filled PLA | Machinable, magnetic, heavy feel |
| Heat-treated PLA (HTPLA) | Bake at 100 °C for 10 min after printing → raises service temp to ~90 °C |
| Carbon-fiber PLA | Stiffer, matte-black, light |

**Use case:** anything where the filament *is* the feature — touch
pads, tactile jewelry, HTPLA for parts that go near heat.

---

## Not recommended on the A1 (ABS, ASA, PC, PA)

These high-temp engineering plastics can be *loaded* into the A1 and
will physically print, but the open frame means:

- ABS/ASA: warps on any part larger than ~80 mm square; first layer
  cracks loose during the print
- PC (polycarbonate): weak interlayer bond without a heated chamber —
  prints delaminate
- PA / PA-CF (nylon): same, plus nylon absorbs moisture from air
  during the print

If you *must* try, Bambu's official guidance is: small parts only,
low infill, expect warping. For anything real, use an X1C or P1S with
enclosure.

**Official stance:** see the caveats section of the [Bambu Lab Wiki —
Filament Guide Material Table](https://wiki.bambulab.com/en/general/filament-guide-material-table).

---

## Supplier guide — best quality & price per type

Prices are USD for a 1 kg spool, rounded, as of early 2026. Check the
vendor — filament prices swing ±20 % on sales.

### Overall quality tiers

| Tier | Brands | Tolerance | Price/kg |
|---|---|---|---|
| Premium (± tight) | Prusament, Polymaker PolyLite | ±0.02 mm | $25–36 |
| Mainline (A1-native) | Bambu Lab | ±0.03 mm | $19–25 |
| Value | Overture, eSUN PLA+, Elegoo | ±0.05 mm | $15–22 |
| Budget | Sunlu, Inland | ±0.05 mm | $14–18 |

### PLA — best picks

| Brand + product | Quality | Price | Buy where |
|---|---|---|---|
| **Bambu Lab PLA Basic** | Excellent, pre-tuned profiles | ~$25 | [Bambu store](https://bambulab.com) |
| **Polymaker PolyLite PLA** | Near-Prusament tolerance at half the price | ~$22 | [Polymaker](https://polymaker.com), Amazon |
| **Polymaker PolyTerra Matte** | The reference matte PLA, 30+ colors | ~$19 | [Polymaker](https://us.polymaker.com/products/polyterra-pla) |
| **eSUN PLA+** | Value pick — toughened PLA that just works | ~$18 | Amazon, [eSUN](https://www.esun3d.com) |
| **Overture PLA+** | Budget value, huge color range | ~$17 | Amazon |
| **Prusament PLA** | Gold standard, QR-traceable, ±0.02 mm | ~$33 | [prusa3d.com](https://www.prusa3d.com) |
| **Elegoo Rapid PLA+** | Best speed/price for the A1's 500 mm/s capability | ~$16 | Amazon |

### PETG — best picks

| Brand + product | Quality | Price | Why |
|---|---|---|---|
| **Bambu Lab PETG HF** | Pre-tuned, zero-guess | ~$22 | [Bambu store](https://bambulab.com) |
| **Polymaker PolyLite PETG** | Mechanical consistency, tight tolerance | ~$24 | [Polymaker](https://polymaker.com/best-petg-filament-for-3d-printing-speed-strength-value/) |
| **Overture PETG** | Value pick — most forgiving budget PETG for Bambu | ~$18 | Amazon |
| **Prusament PETG** | Best layer adhesion in class | ~$35 | Prusa |

### TPU — best picks

| Brand + product | Hardness | Price | Use case |
|---|---|---|---|
| **Bambu Lab TPU 95A HF** | 95A | ~$35 | AMS-Lite-tolerant, prints 3× faster than generic |
| **Bambu Lab TPU for AMS** | 95A | ~$33 | Specifically tuned for AMS Lite path |
| **Overture TPU 95A** | 95A | ~$25 | Budget option, external spool only |
| **Ninjatek NinjaFlex** | 85A | ~$55 | Genuine soft rubber — external spool only |

### PLA-CF / PETG-CF — best picks

| Brand + product | Price | Notes |
|---|---|---|
| **Bambu Lab PLA-CF** | ~$35 | First-party profile, tuned for the A1 hotend |
| **Polymaker PolyMide PA6-CF** | ~$65 | If you try nylon-CF on small parts |
| **Proto-Pasta Carbon Fiber PLA** | ~$50 | U.S. made, tight QC |

### Support material — best picks

| Brand + product | Price | Notes |
|---|---|---|
| **Bambu Support for PLA/PETG** | ~$30 | The only one worth buying — drop-in interface material |
| **Polymaker PolyDissolve S1** | ~$55 | If you need truly soluble — use with sealed spool only on A1 |

### Specialty — best picks

| Brand + product | Price | Notes |
|---|---|---|
| **Proto-Pasta Conductive PLA** | ~$30/500 g | Real electrical conductivity for LEDs and touch sensors |
| **Proto-Pasta HTPLA** | ~$30 | Bake-to-anneal, ~90 °C service temp |
| **Polymaker PolyWood** | ~$35 | Actual wood particles, stains beautifully |
| **eSUN eMarble** | ~$22 | Stone-effect speckle finish |

### Supplier summary

| Supplier | Ship from | Strength | Weakness |
|---|---|---|---|
| [Bambu Lab](https://bambulab.com) | Global | Pre-tuned profiles, AMS RFID, reliable | Premium price, slow shipping to EU |
| [Polymaker](https://polymaker.com) | Global | Tightest tolerance at mid-price; strongest color range | Can be pricey via Amazon resellers |
| [Prusa Research (Prusament)](https://www.prusa3d.com) | EU (Czechia) | Best QC, QR-traceable every spool | Most expensive in the list |
| [Overture](https://overture3d.com) | US/Global | Best value/kg for high-volume printing | QC more variable batch to batch |
| [eSUN](https://www.esun3d.com) | China/Global | PLA+ is the budget-reliable pick | Profile tuning needed |
| [Sunlu](https://www.sunlu.com) | China/Global | Cheapest functional PLA | Batch QC varies widely |
| [Proto-Pasta](https://proto-pasta.com) | US | Only source for genuine conductive + HTPLA | Small-batch, intermittent stock |
| [MatterHackers (Build Series)](https://www.matterhackers.com) | US | Good house brand value, bulk deals | No AMS RFID tags |
| [3DJake](https://www.3djake.com) | EU | Big EU reseller for Polymaker, Bambu, Overture | — |

**A1-specific tip:** Bambu's spools carry RFID tags that auto-load the
right slicer profile when inserted into the AMS Lite. Third-party spools
don't — you pick the profile manually in Bambu Studio. Not a dealbreaker,
but it's why a lot of A1 Combo owners start with Bambu rolls and
graduate to third-party after the first five spools.

---

## Storage, drying, and humidity

Every filament on this list is **hygroscopic** to some degree — it
absorbs water from the air and that water flashes to steam during
extrusion, causing popping, stringing, and weak layers.

| Filament | Ambient humidity tolerance | Needs drying? |
|---|---|---|
| PLA | Medium (≤60 % RH) | Rarely — only after months in humid climates |
| PETG | Medium-low | Every 2–3 months if stored loose |
| TPU | Low | Dry before every print in humid climates |
| PVA | Extremely low | Dry before every print, store sealed |
| PA/Nylon | Extremely low | Dry before every print |
| CF/GF filled | Same as base material | Same as base |

**Cheap storage:** sealed bin + silica gel packs, rotate the packs
monthly in the microwave (30 s on low).

**Active drying:** a Sunlu S1/S2/S4 filament dryer (~$50–100) doubles
as a heated spool holder during printing. Worth it once you own 5+
spools.

**Indicator:** if prints sound like popcorn popping, your filament is
wet. Dry it (PLA 45 °C × 4 h, PETG 65 °C × 4 h, TPU 50 °C × 6 h).

---

## Sources

### Official Bambu Lab references

- [Bambu Lab Wiki — Filament Guide Material Table](https://wiki.bambulab.com/en/general/filament-guide-material-table)
- [Bambu Lab Wiki — A1 FAQ](https://wiki.bambulab.com/en/a1/manual/faq)
- [Bambu Lab Wiki — TPU Printing Guide](https://wiki.bambulab.com/en/knowledge-sharing/tpu-printing-guide)
- [Bambu Lab Wiki — Support Filament Usage Guide](https://wiki.bambulab.com/en/filament/support)
- [Bambu Lab Wiki — PLA / PETG mutual support](https://wiki.bambulab.com/en/filament-acc/filament/h2d-pla-and-petg-mutual-support)
- [Bambu Lab A1 technical specs](https://bambulab.com/en/a1/tech-specs)
- [Bambu Lab filament collections](https://bambulab.com/en-us/filament/collections)
- [Bambu Lab Hardened Steel Hotend for A1](https://us.store.bambulab.com/products/bambu-hotend-a1-series)

### Brand/supplier references

- [Polymaker — PolyTerra / Panchroma Matte PLA](https://us.polymaker.com/products/polyterra-pla)
- [Polymaker — best PETG guide](https://polymaker.com/best-petg-filament-for-3d-printing-speed-strength-value/)
- [Proto-Pasta — home](https://proto-pasta.com/)
- [Proto-Pasta — Conductive PLA](https://proto-pasta.com/products/conductive-pla)
- [Prusament — via All3DP guide](https://all3dp.com/2/prusament-filament-guide/)

### Independent reviews & comparisons

- [ADP Industries — Best Bambu Lab Filament Brands 2026](https://www.adpindustries.com/blog/best-bambu-lab-filament-brands-2026/)
- [ADP Industries — Best Filament for Bambu Lab 2026 (6-printer farm test)](https://www.adpindustries.com/blog/best-filament-bambu-lab-2026/)
- [ADP Industries — PLA vs PETG 2026](https://www.adpindustries.com/blog/pla-vs-petg-3d-printing-comparison/)
- [ADP Industries — Nozzle & Hotend Guide](https://www.adpindustries.com/blog/bambu-lab-nozzle-hotend-guide/)
- [ADP Industries — Bambu TPU guide](https://adpindustries.com/blog/bambu-lab-tpu-printing-guide/)
- [3DPut — Complete Filament Brand Comparison 2026](https://3dput.com/complete-filament-brand-comparison-2026-tolerance-quality-value-ratings/)
- [STL3D Hub — Best filament brands 2026](https://stl3dhub.com/best-filament-brands-2026)
- [Wevolver — Best PETG Filament 2026](https://www.wevolver.com/article/best-petg-filament-in-2026-high-speed-matte-reinforced)
- [3DTechValley — Best PETG 2026](https://www.3dtechvalley.com/best-petg-filament/)
- [SigmaFilament — 2026 Bambu filament guide](https://sigmafilament.com/expert-bambu-filament-guide-2026/)
- [SigmaFilament — PETG brand guide 2026](https://sigmafilament.com/guide-petg-filament-brands-2026/)
- [Siraya Tech — Best filament for Bambu A1](https://siraya.tech/blogs/news/best-filament-for-bambu-a1)
- [Siraya Tech — How to print TPU on Bambu Lab AMS](https://siraya.tech/blogs/news/how-to-print-tpu-on-bambu-lab-ams)
- [3DJake — Bambu AMS compatible filaments](https://www.3djake.com/info/guide/bambu-lab-ams-guide)
- [Makers101 — Best filaments for Bambu / Creality / Prusa 2026](https://makers101.com/best-filaments-for-bambu-creality-prusa/)
- [Dreaming3D — Best filament 2026 complete guide](https://dreaming3d.net/blogs/news/the-best-3d-printer-filament-of-2026-every-material-every-use-case-one-definitive-guide)

### Filament-type explainers

- [SUNLU — Aesthetic filaments (silk, dual-color, marble)](https://uk.store.sunlu.com/blogs/3d-printing-guide/aesthetic-filament-guide-want-to-try-high-visual-prints-but-dont-know-where-to-start)
- [jcprintfarm — PLA flavors explained](https://www.jcprintfarm.com/blogs/3d-printing-tech/pla-filament-flavors-explained-pla-tough-pla-silk-pla-and-the-tradeoffs)
- [Filament2print — PLA finishes (matte, glossy, silk)](https://filament2print.com/en/blog/pla-finishes-matte-glossy-silk)
- [FacFox — Marble PLA brand comparison](https://facfox.com/docs/kb/marble-pla-marble-filament-brands-compared)
- [Snapmaker — PLA Matte vs Basic](https://www.snapmaker.com/blog/pla-matte-vs-basic/)
- [MakerBuildIt — PLA vs Matte vs Silk](https://makerbuildit.com/blogs/filament/pla-vs-matte-pla-vs-silk-pla-how-filament-finish-changes-the-look-of-your-3d-prints)

### Community discussion

- [Bambu Lab Forum — PLA compatibility with A1](https://forum.bambulab.com/t/pla-compatibility-with-a1/102700)
- [Bambu Lab Forum — Filament recommendations (PLA)](https://forum.bambulab.com/t/filament-recommendations-pla/125745)
- [Bambu Lab Forum — A1 hardened nozzle + PETG-CF](https://forum.bambulab.com/t/a1-with-hardened-steel-nozzle-petg-cf-able/28547)

### General reference

- [Wikipedia — 3D printing filament](https://en.wikipedia.org/wiki/3D_printing_filament)
- [Wikimedia Commons — Category: 3D printing](https://commons.wikimedia.org/wiki/Category:3D_printing)
