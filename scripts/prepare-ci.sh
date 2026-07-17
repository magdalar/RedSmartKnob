#!/bin/bash
# Prepare the repo for continuous-integration builds.

FW_VERSION=""

# Function to display usage and exit
usage() {
  echo "Usage: $0 -f <fwversion>" >&2
  exit 1
}

while getopts "f:" opt; do
  case ${opt} in
    f )
      FW_VERSION="$OPTARG"
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

shift $((OPTIND -1))

if [ -z "$FW_VERSION" ]; then
    echo "::error:FAILED: No FW_VERSION set."
    usage
fi

set -xeuo pipefail
shopt -s nullglob

echo "Rewriting configs for continuous integration..."
echo "Firmware version: $FW_VERSION"

sed -i "s/firmware_version: .*/firmware_version: \"$FW_VERSION\"/g" RedSmartKnob/esphome.yaml

configs=(devices/*/*.sendspin.yaml devices/*/*.controls.yaml)
if [ ${#configs[@]} -eq 0 ]; then
  echo "No firmware config files found."
  exit 1
fi

for config in "${configs[@]}"; do
  # Point the includes to the local copy, rather than the github branch.
  echo "Modifying: $config"
  sed -i \
    -e 's/^  #repo_base_uri:/  repo_base_uri:/' \
    -e 's|^  setup:.*|  setup: !include device/packages.yaml|' \
    -e '/^    url:.*/d' \
    -e '/^    files:.*/d' \
    -e '/^    refresh:.*/d' \
     "${config}"
done

echo "Done!"

# vim: set tabstop=2 shiftwidth=2 expandtab:
