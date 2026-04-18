#!/usr/bin/env bash
#
# render-previews.sh — generate a JPEG preview of every printable
# project in this repo, plus a single assembled-showcase JPEG.
# Outputs to assets/renders/.
#
# Requires: openscad, imagemagick (convert)

set -euo pipefail

cd "$(dirname "$0")/.."
OUT="assets/renders"
mkdir -p "$OUT"

render() {
    local scad="$1" name="$2" size="${3:-1024,768}"
    printf '  -> %-24s' "$name"
    openscad --imgsize="$size" --colorscheme=Tomorrow \
             --viewall --autocenter \
             -o "$OUT/$name.png" "$scad" 2>/dev/null
    convert "$OUT/$name.png" -quality 88 "$OUT/$name.jpg"
    rm -f "$OUT/$name.png"
    printf 'done\n'
}

echo "rendering components..."

# Blob Buddy figurines
render "projects/blob-buddy-figurines/01-standing/standing.scad"  "blob-standing"
render "projects/blob-buddy-figurines/02-waving/waving.scad"      "blob-waving"
render "projects/blob-buddy-figurines/03-sitting/sitting.scad"    "blob-sitting"

# Electronics storage
render "projects/electronics-storage/small-bin.scad"             "small-bin"
render "projects/electronics-storage/medium-bin.scad"            "medium-bin"
render "projects/electronics-storage/devboard-tray.scad"         "devboard-tray"
render "projects/electronics-storage/solder-spool-holder.scad"   "solder-spool-holder"

# Measuring cylinder
render "projects/wife-measuring-cylinder/cylinder.scad"          "cylinder"

# Filament catch box
render "projects/a1-filament-catch-box/catch-box.scad"           "catch-box"

# Shelving
render "projects/print-shelving/shelf-tier.scad"                 "shelf-tier"
render "projects/print-shelving/shelf-tier-tall.scad"            "shelf-tier-tall"
render "projects/print-shelving/shelf-top-cap.scad"              "shelf-top-cap"

# Assembled showcase (bigger image)
render "projects/print-shelving/showcase-assembled.scad"         "showcase-assembled" "1600,1200"

echo ""
echo "renders saved to $OUT/"
ls -lh "$OUT/"
