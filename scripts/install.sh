#!/usr/bin/env bash
#
# install.sh — Bambu Studio + 3D printing toolchain installer
# Target: CachyOS / Arch Linux (pacman + paru)
#
# What this installs:
#   - Bambu Studio       (official Bambu slicer, via AUR: bambu-studio-bin)
#   - OrcaSlicer         (community fork, AUR: orcaslicer-bin) — optional
#   - OpenSCAD           (for editing .scad source files in this repo)
#   - FreeCAD            (general-purpose parametric CAD) — optional
#   - Meshlab            (STL inspect/repair) — optional
#   - git, base-devel    (ensured, required by AUR builds)
#
# Safe to re-run. Prompts once for sudo; skips already-installed packages.

set -euo pipefail

log()   { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn()  { printf '\033[1;33m!! \033[0m %s\n' "$*" >&2; }
die()   { printf '\033[1;31mXX \033[0m %s\n' "$*" >&2; exit 1; }

# ---- Preflight ----

[[ -f /etc/os-release ]] || die "cannot detect OS (no /etc/os-release)"
# shellcheck disable=SC1091
. /etc/os-release

case "${ID_LIKE:-$ID}" in
  *arch*|arch) : ;;
  *) die "this script targets Arch-based distros (got: $PRETTY_NAME)" ;;
esac

command -v sudo >/dev/null || die "sudo is required"
command -v pacman >/dev/null || die "pacman is required"

# Prefer paru (ships on CachyOS). Fall back to yay if present.
AUR_HELPER=""
if   command -v paru >/dev/null; then AUR_HELPER="paru"
elif command -v yay  >/dev/null; then AUR_HELPER="yay"
else
  warn "no AUR helper found; installing paru via pacman (CachyOS repo)"
  sudo pacman -S --needed --noconfirm paru || \
    die "paru is not in your repos. Install paru or yay manually, then re-run."
  AUR_HELPER="paru"
fi

log "using AUR helper: $AUR_HELPER"

# ---- System packages ----

log "syncing package databases"
sudo pacman -Syu --needed --noconfirm

PACMAN_PKGS=(
  base-devel
  git
  openscad
  freecad
)
log "installing from official repos: ${PACMAN_PKGS[*]}"
sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"

# ---- AUR packages ----
# Actual AUR/chaotic-aur package names (CachyOS ships with chaotic-aur
# enabled, which has pre-built binaries for bambustudio-bin — paru will
# prefer that over a from-source AUR build automatically):
#   bambustudio-bin  (no hyphen between "bambu" and "studio")
#   orca-slicer
#   meshlab          (moved out of official Arch repos)

AUR_PKGS=(
  bambustudio-bin
  orca-slicer
  meshlab
)

for pkg in "${AUR_PKGS[@]}"; do
  if pacman -Qi "$pkg" >/dev/null 2>&1; then
    log "$pkg already installed; skipping"
    continue
  fi
  log "installing $pkg"
  "$AUR_HELPER" -S --needed --noconfirm "$pkg" || \
    warn "failed to install $pkg; see $AUR_HELPER output above"
done

# ---- Verify ----
#
# Each entry is "<label>:<candidate1>[,candidate2,...]" — we accept the
# first candidate found on PATH. Different AUR maintainers ship these
# under slightly different binary names.

log "verifying installs"
missing=()
for spec in \
    "Bambu Studio:bambu-studio,bambustudio,BambuStudio" \
    "OrcaSlicer:orca-slicer,orcaslicer,OrcaSlicer" \
    "OpenSCAD:openscad" \
    "FreeCAD:freecad,FreeCAD" \
    "Meshlab:meshlab,MeshLab"
do
  label="${spec%%:*}"
  cands="${spec#*:}"
  found=""
  IFS=',' read -r -a candidates <<< "$cands"
  for c in "${candidates[@]}"; do
    if command -v "$c" >/dev/null; then
      found="$(command -v "$c")"
      printf '   %-14s %s\n' "$label" "$found"
      break
    fi
  done
  [[ -z "$found" ]] && missing+=("$label ($cands)")
done

if ((${#missing[@]})); then
  warn "not on PATH: ${missing[*]}"
  warn "If a package installed but the binary is named differently, run:"
  warn "    pacman -Ql bambustudio-bin | grep -E 'bin/|\\.desktop\$'"
fi

# ---- Post-install notes ----

cat <<'EOF'

-------------------------------------------------------------
Install complete.

Next steps:
  1. Launch Bambu Studio:    bambu-studio &
  2. Sign in to your Bambu Lab account (same one you used on Handy).
  3. Add your A1 printer:    Device tab → "Add Printer" → pick A1 from LAN.
     If your printer is on Wi-Fi already, Bambu Studio finds it over mDNS.
     Enter the access code from the A1 touchscreen:
        Settings → WLAN → (i) icon → Access Code
  4. Install Bambu Handy on your phone for remote monitoring:
        iOS/Android: search "Bambu Handy" in the app store.

Slicer profiles for A1 ship with Bambu Studio — you do NOT need to
download them separately.

Filament: if you're using a non-Bambu spool, pick a "Generic PLA" profile
and run Flow Dynamics Calibration on the A1 (Device → Calibration).
-------------------------------------------------------------
EOF
