# Guition 1.8" Rotary Knob

![Device image](device.jpg)

This directory supports an ESPHome configuration for a WaveShare
ESP32-S3-Knob-Touch-LCD-1.8 (SKU 31623) or Guition JC3636K518C-I-YR1 -
Knob-ESP32S3. That is, the
"V1" referred to by
https://github.com/RealDeco/sendspin-guition/tree/main#guition-185-rotary-knob
which that repo does not support at the time of writing.

## Where To Get

 - [AliExpress](https://www.aliexpress.us/item/3256808637654546.html)
 - [WaveShare](https://www.waveshare.com/esp32-s3-knob-touch-lcd-1.8.htm?sku=31623)

## How to use this

This firmware comes in two modes:

  - Sendspin mode: the device _is_ the media player (e.g. use the AUX out) <a href="https://magdalar.github.io/RedSmartKnob/redknob-sendspin/"><img src="https://img.shields.io/badge/FLASH-Sendspin-brightgreen?style=for-the-badge" alt="Open Installer for Sendspin mode"></a>
  - Controls mode: the device controls a remote Music Assistant Media Player <a href="https://magdalar.github.io/RedSmartKnob/redknob-controls/"><img src="https://img.shields.io/badge/FLASH-Controls-blue?style=for-the-badge" alt="Open Installer for Controls mode"></a>

There are also two `*.dev.yaml` files for local development, or to assign passwords and encryption via `secrets.yaml`.

Once flashed, be sure to:

  - Add the device in Home Assistant
  - Enable "Allow the device to perform Home Assistant actions" from the ESPHome integration overview. [Screenshot](../../screenshots/homeassistant-perform-actions.png)
  - Configure the device in Home Assistant, to set the relevant entity ids. The device will reboot to enact the changes.

NOTE: If using TTS announcements, remember to use the Music Assistant `media_player` entity within Home Assistant, rather than the device directly. MA will handle the audio stream format mismatches much more gracefully.

## Device Notes

This device (GUITION `JC3636K518C_I_YR1`, red knob device) has two chips, an
ESP32 and an ESP32-S3. The ESP32 has the DAC, the S3 has the rest. Rotate the
USB-C connector by 180deg to flip between them; you'll want to use an A-to-C
USB cable.

  - Red round case
    - Also available from WaveShare in blue.
  - 1.8" 360x360 TFT LCD display (`JC3636W518V2`, driver chip `ST77916`, touchscreen `CST816`)
  - an ESP32-S3 chip driving the majority
    - 240MHz, 520KB SRAM, 448KB ROM, 8M PSRAM, 16M Flash
  - an ESP32 chip driving the DAC
  - USB-C powered, plus inbuilt lithium battery (~3.5h runtime unoptimized)
  - PCM5100 DAC with 3.5mm AUX Audio Line Out ([details](https://community.home-assistant.io/t/display-knob/905249/16))
  - Physical rotary knob (GPIO 8 + 7)
  - Haptic feedback (drv2605)
  - Power toggle switch
  - TF / SD card 512MB, but not ejectable from case.
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
    - https://www.waveshare.com/wiki/ESP32-S3-Knob-Touch-LCD-1.8
    - https://pan.jczn1688.com/directlink/1/HMI%20display/JC3636K518CN_knob_EN.zip?lang=en
  - For this model
    - https://devices.esphome.io/devices/esp32s3-18-inch-jc3636k518c/
      - Note: the i2s audio pins are wrong.
    - https://github.com/nkinnan/Waveshare-ESP32-S3-Knob-Touch-LCD-1.8_and_Guition-K5-Knob-Series-JC3636K518 - description of devices
    - https://github.com/VolosR/Knob18Meters - arduino project for RGB controls
    - https://github.com/KrX3D/WaveShare-Knob-ESp32S3 - esphome setup w/ display, HA media player.
    - https://github.com/muness/roon-knob - hi-fi controller
    - https://github.com/orgs/esphome/discussions/3253 - ESPHome discussion thread
    - https://github.com/marcinmajkowski44-ship-it/ESP32S3-1.8-inch-JC3636K518C 
    - https://github.com/taweili/Agent-Knob
  - For newer S3-only model
    - https://github.com/RealDeco/sendspin-guition
