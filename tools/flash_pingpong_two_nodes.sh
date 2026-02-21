#!/usr/bin/env bash
set -euo pipefail

# Flash LoRa ping-pong example to TWO SQC485Iv2 nodes.
#
# Usage:
#   ./tools/flash_pingpong_two_nodes.sh \
#     --initiator /dev/cu.usbserial-21220 \
#     --responder /dev/cu.usbserial-21230
#
# Notes:
# - We force upload speed to 115200 for stability.
# - Initiator sends the first packet; Responder starts in RX and waits.
# - This script rewrites the IS_INITIATOR macro in the sketch between flashes.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKETCH_REL="arduino/examples/03_lora_pingpong_sx1262"
SKETCH_FILE="$ROOT_DIR/$SKETCH_REL/03_lora_pingpong_sx1262.ino"
FQBN="esp32:esp32:esp32c3"
UPLOAD_SPEED="115200"

INITIATOR_PORT=""
RESPONDER_PORT=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --initiator)
      INITIATOR_PORT="$2"; shift 2 ;;
    --responder)
      RESPONDER_PORT="$2"; shift 2 ;;
    -h|--help)
      sed -n '1,120p' "$0" | sed 's/^# \{0,1\}//' ; exit 0 ;;
    *)
      echo "Unknown arg: $1" >&2
      exit 2
      ;;
  esac
done

if [[ -z "$INITIATOR_PORT" || -z "$RESPONDER_PORT" ]]; then
  echo "ERROR: must provide --initiator and --responder" >&2
  exit 2
fi

if [[ ! -f "$SKETCH_FILE" ]]; then
  echo "ERROR: sketch not found: $SKETCH_FILE" >&2
  exit 2
fi

set_initiator_flag() {
  local flag="$1" # 1 or 0
  # Replace the *first* occurrence of '#define IS_INITIATOR X'
  perl -0777 -i -pe "s/#define\s+IS_INITIATOR\s+[01]/#define IS_INITIATOR ${flag}/" "$SKETCH_FILE"
}

compile_sketch() {
  (cd "$ROOT_DIR" && \
    arduino-cli compile \
      --fqbn "$FQBN" \
      "$SKETCH_REL" \
      --libraries arduino/lib \
      --warnings all)
}

upload_sketch() {
  local port="$1"
  (cd "$ROOT_DIR" && \
    arduino-cli upload \
      -p "$port" \
      --fqbn "$FQBN" \
      "$SKETCH_REL" \
      --upload-property "upload.speed=${UPLOAD_SPEED}")
}

echo "[1/4] Set Initiator (IS_INITIATOR=1)"
set_initiator_flag 1

echo "[2/4] Compile"
compile_sketch

echo "[3/4] Upload Initiator -> $INITIATOR_PORT"
upload_sketch "$INITIATOR_PORT"

echo "[4/4] Set Responder (IS_INITIATOR=0), recompile+upload -> $RESPONDER_PORT"
set_initiator_flag 0
compile_sketch
upload_sketch "$RESPONDER_PORT"

# Restore default to Initiator=1 for convenience
set_initiator_flag 1

echo "Done. To monitor logs (115200):"
echo "  arduino-cli monitor -p $INITIATOR_PORT -c baudrate=115200"
echo "  arduino-cli monitor -p $RESPONDER_PORT -c baudrate=115200"
