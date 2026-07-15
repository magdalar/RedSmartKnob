# RedSmartKnob

This repository provides an ESPHome based firmware for an ESP32 based media
player, either controlling a Music Assistant Media Player via Home Assistant,
and optionally also having this device _be_ the sendspin media player via local
audio AUX output. This was inspired heavily by
https://github.com/RealDeco/sendspin-guition.

## Screenshots

<img src="./devices/guition-esp32-s3-dial-jc3636k518c/device.jpg" width="250" height="250" alt="Red Smart Knob">
<img src="./devices/guition-esp32-s3-puck-jc3636w518c/device.jpg" width="250" height="250" alt="Silver Puck">

## Expectations

This firmware expects use of ESPHome, Home Assistant and Music Assistant. Note
that any configuration requesting an HA Media Player should provide the entity
id pointing to the Music Assistant variant of that media player for best
results.

## Supported Devices

Follow the Instructions links to proceed.

| Device Model | Description | Links |
|---|:-:|:-:|
| Guition JC3636W518C | 1.8" ESP32-S3 Silver Puck | [Instructions](devices/guition-esp32-s3-puck-jc3636w518c/README.md) |
| Guition JC3636K518C | 1.8" ESP32-S3+ESP32 Rotary Knob, Red | [Instructions](devices/guition-esp32-s3-dial-jc3636k518c/README.md) |
| WaveShare ESP32-S3-Knob-Touch-LCD-1.8 | 1.8" ESP32-S3+ESP32 Rotary Knob, Blue or Black | [Instructions](devices/guition-esp32-s3-dial-jc3636k518c/README.md) |

## References and Inspirations

  - https://github.com/RealDeco/sendspin-guition
  - https://github.com/KrX3D/WaveShare-Knob-ESp32S3 - esphome setup w/ display, HA media player.
