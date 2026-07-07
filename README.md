# RedSmartKnob

This repository supports an ESPHome configuration for a WaveShare ESP32-S3
1.8inch Knob Display or Guition JC3636K518C-I-YR1 - Knob-ESP32S3. That is, the
"V1" referred to by
https://github.com/RealDeco/sendspin-guition/tree/main#guition-185-rotary-knob
which that repo does not support at the time of writing.

## Origins

I came across https://github.com/RealDeco/sendspin-guition, and wanted to try it. So, I bought two devices. And naturally, I got the "wrong one". The v1 device is not supported there, so I dug in.

This repository started by using https://github.com/KrX3D/WaveShare-Knob-ESp32S3, and adopting the audio configuration posted by user trinitytest on https://community.home-assistant.io/t/display-knob/905249/15. I then refactored all of it, and blended in sendspin configurations.

I fully intend to blend further, as my goal is to provide a local media control device for my children to use in their rooms. And the parents, too.

## Local and Remote Media Players

The `red-smartknob.yaml` supports two modes: running as a local sendspin player, or controlling a remote HomeAssistant media player. The UI is identical for both, achieved by way of using scripts to abstract the entity interactions.

## How to use this

1. Edit `red-smartknob.yaml` to set your device names, home assistant entities, and local vs remote mediplayer choice.
1. Copy `secrets.yaml.example` to `secrets.yaml` and edit it as appropriate for your setup.
1. Compile and flash your device: `esphome run red-smartknob.yaml`
1. Add the device in Home Assistant
1. If using sendspin, then you should already see your device in Music Assistant too. Play some music!

NOTE: If using TTS announcements, remember to use the Music Assistant `media_player` entity within Home Assistant, rather than the device directly. MA will handle the audio stream format mismatches much more gracefully.

## Device Notes

This device (`JC3636K518C`) has two chips, an ESP32 and an ESP32-S3. The ESP32
has the DAC, the S3 has the rest. Rotate the USB-C connector by 180deg to flip
between them; you'll want to use an A-to-C USB cable.

### The ESP32-S3

```
$ esptool flash-id
esptool v5.3.0
Connected to ESP32-S3 on /dev/ttyACM0:
Chip type:          ESP32-S3 (QFN56) (revision v0.2)
Features:           Wi-Fi, BT 5 (LE), Dual Core + LP Core, 240MHz, Embedded PSRAM 8MB (AP_3v3)
Crystal frequency:  40MHz
USB mode:           USB-Serial/JTAG
MAC:                <redacted>

Stub flasher running.

Flash Memory Information:
=========================
Manufacturer: 68
Device: 4018
Detected flash size: 16MB
Flash type set in eFuse: quad (4 data lines)
Flash voltage set by eFuse: 3.3V
```

### The ESP32

```
$ esptool flash-id
esptool v5.3.0
Connected to ESP32 on /dev/ttyUSB0:
Chip type:          ESP32-U4WDH (revision v3.1)
Features:           Wi-Fi, BT, Dual Core + LP Core, 240MHz, Embedded Flash, Vref calibration in eFuse, Coding Scheme None
Crystal frequency:  40MHz
MAC:                <redacted>

Stub flasher running.

Flash Memory Information:
=========================
Manufacturer: 20
Device: 4016
Detected flash size: 4MB
Flash voltage set by a strapping pin: 3.3V
```

## References

  - For this model
    - https://github.com/nkinnan/Waveshare-ESP32-S3-Knob-Touch-LCD-1.8_and_Guition-K5-Knob-Series-JC3636K518 - description of devices
    - https://github.com/VolosR/Knob18Meters - arduino project for RGB controls
    - https://github.com/KrX3D/WaveShare-Knob-ESp32S3 - esphome setup w/ display, HA media player.
    - https://github.com/muness/roon-knob - hi-fi controller
    - https://github.com/orgs/esphome/discussions/3253 - ESPHome discussion thread
    - https://github.com/marcinmajkowski44-ship-it/ESP32S3-1.8-inch-JC3636K518C 
    - https://github.com/taweili/Agent-Knob
  - For newer S3-only model
    - https://github.com/RealDeco/sendspin-guition
