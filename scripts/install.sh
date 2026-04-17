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
# meshlab moved out of the official repos — it's AUR-only now.

AUR_PKGS=(
  bambu-studio-bin
  orcaslicer-bin
  meshlab
)

for pkg in "${AUR_PKGS[@]}"; do
  if pacman -Qi "$pkg" >/dev/null 2>&1; then
    log "$pkg already installed; skipping"
    continue
  fi
  log "installing $pkg from AUR"
  "$AUR_HELPER" -S --needed --noconfirm "$pkg" || \
    warn "failed to install $pkg; see $AUR_HELPER output above"
done

# ---- Verify ----

log "verifying installs"
missing=()
for bin in bambu-studio orca-slicer openscad freecad; do
  if command -v "$bin" >/dev/null; then
    printf '   %-18s %s\n' "$bin" "$(command -v "$bin")"
  else
    missing+=("$bin")
  fi
done

if ((${#missing[@]})); then
  warn "not on PATH: ${missing[*]}"
  warn "(bambu-studio-bin sometimes installs as 'bambustudio' — check 'pacman -Ql bambu-studio-bin | grep bin/')"
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
