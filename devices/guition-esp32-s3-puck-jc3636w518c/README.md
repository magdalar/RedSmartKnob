# Guition 1.8" Silver Puck v2

![Device image](device.jpg)

This directory supports an ESPHome configuration for a Guition JC3636W518C\_I\_Y silver 1.8" puck with an ESP32-S3 chip.

## Where To Get

 - [AliExpress](https://www.aliexpress.us/item/3256807152276100.html)

## How to use this

1. Edit `esphome.yaml` to set your device names, home assistant entities, and local vs remote mediplayer choice.
1. Copy `secrets.yaml.example` to `secrets.yaml` and edit it as appropriate for your setup.
1. Compile and flash your device: `esphome run esphome.yaml`
1. Add the device in Home Assistant
1. If using sendspin, then you should already see your device in Music Assistant too. Play some music!

NOTE: If using TTS announcements, remember to use the Music Assistant `media_player` entity within Home Assistant, rather than the device directly. MA will handle the audio stream format mismatches much more gracefully.

## Device Notes

This device (GUITION `JC3636W518C_I_Y`, silver puck device) has a single ESP32-S3 chip.

  - Silver round case
  - 1.8" 360x360 TFT LCD display (`JC3636W518V2`, driver chip `ST77916`, touchscreen `CST816`)
  - a single ESP32-S3 chip
  - 512KB SRAM, 384KB ROM, 8M PSRAM, 16M Flash
  - Powered by USB-C or QI (Wireless Charging). No battery.
  - PCM5100 DAC with 3.5mm AUX Audio Line Out
  - No rotary knob
  - No power toggle switch
  - No haptic feedback
  - Accessible TF / SD card
  - Microphone

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

  - Manufacturer References
    - https://pan.jczn1688.com/directlink/1/HMI%20display/JC3636W518EN.zip?lang=en
  - For this model
    - https://github.com/RealDeco/sendspin-guition "Silver Puck v2"
