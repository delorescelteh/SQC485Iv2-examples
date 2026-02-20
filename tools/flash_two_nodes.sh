#!/usr/bin/env bash
set -euo pipefail

# flash_two_nodes.sh
#
# Purpose: serially flash two SQC485Iv2/HT62-compatible nodes with PlatformIO.
#
# Usage:
#   ./tools/flash_two_nodes.sh /dev/cu.usbserial-21220 /dev/cu.usbserial-21230
#
# Notes:
# - You may need to manually put each board into bootloader mode.

PORT_A="${1:-}"
PORT_B="${2:-}"

if [[ -z "$PORT_A" || -z "$PORT_B" ]]; then
  echo "Usage: $0 <PORT_A> <PORT_B>"
  exit 1
fi

env="sqc485iv2-esp32c3-sx1262"

flash_one() {
  local port="$1"
  echo "\n=== Flashing $port (env=$env) ==="
  echo "If it fails to connect, put the board into bootloader mode then retry."
  pio run -e "$env" -t upload --upload-port "$port"
}

flash_one "$PORT_A"
flash_one "$PORT_B"

echo "\nDone."
