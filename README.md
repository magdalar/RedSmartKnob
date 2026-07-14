# RedSmartKnob

This repository provides an ESPHome based firmware for an ESP32 based media
player, either controlling a Music Assistant Media Player via Home Assistant,
and optionally also having this device _be_ the sendspin media player via local
audio AUX output. This was inspired heavily by
https://github.com/RealDeco/sendspin-guition.


This repository supports an ESPHome configuration for a WaveShare ESP32-S3
1.8inch Knob Display or Guition JC3636K518C-I-YR1 - Knob-ESP32S3. That is, the
"V1" referred to by
which that repo does not support at the time of writing.

## How to use this

TODO: Update this following the refactor.

1. Edit `red-smartknob.yaml` to set your device names, home assistant entities, and local vs remote mediplayer choice.
1. Copy `secrets.yaml.example` to `secrets.yaml` and edit it as appropriate for your setup.
1. Compile and flash your device: `esphome run red-smartknob.yaml`
1. Add the device in Home Assistant
1. If using sendspin, then you should already see your device in Music Assistant too. Play some music!

NOTE: If using TTS announcements, remember to use the Music Assistant `media_player` entity within Home Assistant, rather than the device directly. MA will handle the audio stream format mismatches much more gracefully.

## References and Inspirations

  - https://github.com/RealDeco/sendspin-guition
  - https://github.com/KrX3D/WaveShare-Knob-ESp32S3 - esphome setup w/ display, HA media player.
