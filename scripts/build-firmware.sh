#!/bin/bash

FW_VERSION=""
OUTPUT_DIR=""
PAGES_BASE_URL="https://magdalar.github.io/RedSmartKnob/"

# Function to display usage and exit
usage() {
  echo "Usage: $0 -f <fwversion> -p <pages_base_url> -o <output_dir>" >&2
  exit 1
}

while getopts "f:p:o:" opt; do
  case ${opt} in
    f )
      FW_VERSION="$OPTARG"
      ;;
    p )
      PAGES_BASE_URL="$OPTARG"
      ;;
    o )
      OUTPUT_DIR="$OPTARG"
      ;;
    \? )
      # Invalid flag passed
      usage
      ;;
    : )
      # Flag passed without an argument
      echo "Error: Invalid option: -$OPTARG requires an argument" >&2
      usage
      ;;
  esac
done

# Shift off the parsed options so $1, $2, etc. point to any remaining non-flag arguments
shift $((OPTIND -1))

# Validation: Check if any required variables are still empty
if [ -z "$FW_VERSION" ] || [ -z "$PAGES_BASE_URL" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Error: Missing required arguments." >&2
    usage
fi

set -xeuo pipefail
shopt -s nullglob

echo "Pages base URL: $PAGES_BASE_URL"
echo "Firmware version: $FW_VERSION"
echo "Output Directory: $OUTPUT_DIR"

configs=(devices/*/*.sendspin.yaml devices/*/*.controls.yaml)
if [ ${#configs[@]} -eq 0 ]; then
  echo "No firmware config files found."
  exit 1
fi

echo "Found configs:"
printf ' - %s\n' "${configs[@]}"

mkdir -p "${OUTPUT_DIR}"
failed=0

for config in "${configs[@]}"; do
  name="$(basename "${config%.yaml}")"
  echo "::group::Generating page for $config"
  echo "Config: $config"
  echo "Output: ${OUTPUT_DIR}/$name"
  echo "Publish URL: ${PAGES_BASE_URL%/}/$name"

  if uvx ewt-gen "$config" \
    -t "$name" \
    -o "${OUTPUT_DIR}/$name" \
    --publish-url "${PAGES_BASE_URL%/}/$name" \
    --fw-version "$FW_VERSION"; then
    echo "OK: $config"
  else
    echo "::error::FAILED: $config"
    failed=1
  fi

  echo "::endgroup::"
done

{
  echo '<!doctype html>'
  echo '<html><head><meta charset="utf-8"><title>Firmware pages</title><meta name="viewport" content="width=device-width"><style>li { margin: 4px 0 }</style></head><body>'
  echo '<h1>Firmware pages</h1><ul>'
  for config in "${configs[@]}"; do
    name="$(basename "${config%.yaml}")"
    echo "<li><a href=\"./$name/\">$name</a></li>"
  done
  echo '</ul></body></html>'
} > ${OUTPUT_DIR}/index.html

if [ "$failed" -ne 0 ]; then
  echo "One or more configs failed."
  exit 1
fi

# vim: set tabstop=2 shiftwidth=2 expandtab:
