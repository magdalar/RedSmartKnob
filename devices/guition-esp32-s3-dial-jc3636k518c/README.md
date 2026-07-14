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

## Device Notes

This device (GUITION `JC3636K518C_I_YR1`, red knob device) has two chips, an
ESP32 and an ESP32-S3. The ESP32 has the DAC, the S3 has the rest. Rotate the
USB-C connector by 180deg to flip between them; you'll want to use an A-to-C
USB cable.

https://devices.esphome.io/devices/esp32s3-18-inch-jc3636k518c/

  - Red round case
    - Also available from WaveShare in blue.
  - 1.8" 360x360 display (`JC3636W518V2`)
  - an ESP32-S3 chip driving the majority
  - an ESP32 chip driving the DAC
  - PCM5100 DAC with 3.5mm AUX Audio Line Out ([details](https://community.home-assistant.io/t/display-knob/905249/16))
  - USB-C powered
  - Lithium battery (~3.5h runtime unoptimized)
  - Physical rotary knob (GPIO 8 + 7)
  - Haptic feedback (drv2605)
  - Power switch
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

  - Factory Supplied Examples
    - https://pan.jczn1688.com/directlink/1/HMI%20display/JC3636K518CN_knob_EN.zip?lang=en
  - For this model
    - https://devices.esphome.io/devices/esp32s3-18-inch-jc3636k518c/
    - https://github.com/nkinnan/Waveshare-ESP32-S3-Knob-Touch-LCD-1.8_and_Guition-K5-Knob-Series-JC3636K518 - description of devices
    - https://github.com/VolosR/Knob18Meters - arduino project for RGB controls
    - https://github.com/KrX3D/WaveShare-Knob-ESp32S3 - esphome setup w/ display, HA media player.
    - https://github.com/muness/roon-knob - hi-fi controller
    - https://github.com/orgs/esphome/discussions/3253 - ESPHome discussion thread
    - https://github.com/marcinmajkowski44-ship-it/ESP32S3-1.8-inch-JC3636K518C 
    - https://github.com/taweili/Agent-Knob
  - For newer S3-only model
    - https://github.com/RealDeco/sendspin-guition
