# RedSmartKnob

This repository provides an ESPHome based firmware for an ESP32 based media
player, either controlling a Music Assistant Media Player via Home Assistant,
and optionally also having this device _be_ the sendspin media player via local
audio AUX output. This was inspired heavily by
https://github.com/RealDeco/sendspin-guition.

## Screenshots

| <img src="./devices/guition-redknob-jc3636k518c/device.jpg" width="250" alt="Red Smart Knob"> | <img src="./devices/guition-silverpuck-jc3636w518c/device.jpg" width="250" alt="Silver Puck"> |
|:---:|:---:|
| *Red Smart Knob, the repo's namesake.* | *Silver Puck, running off a QI charger.* |

## Expectations

This firmware expects use of ESPHome, Home Assistant and Music Assistant. Note
that any configuration requesting an HA Media Player should provide the entity
id pointing to the Music Assistant variant of that media player for best
results.

## Supported Devices

Follow the Flash It links to install.

<table>
  <thead>
    <tr>
        <th>Device model</th>
        <th>Image</th>
        <th>Description</th>
        <th>Details</th>
        <th>Flash It!</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><ul>
        <li>Guition JC3636K518C</li>
        <li>WaveShare ESP32-S3-Knob-Touch-LCD-1.8</li>
      </ul></td>
      <td><img src="./devices/guition-redknob-jc3636k518c/device.jpg" width="100" alt="Red Smart Knob"></td>
      <td>1.8" ESP32-S3 Rotary Knob (Red, Blue or Black)</td>
      <td><a href="devices/guition-redknob-jc3636k518c/README.md">Details</a></td>
      <td><a href="https://magdalar.github.io/RedSmartKnob/guition-redknob-jc3636k518c/"><img src="https://img.shields.io/badge/FLASH-FIRMWARE-ff6b00?style=for-the-badge&labelColor=111827" alt="Open Installer"></a></td>
    </tr>
    <tr>
      <td>Guition JC3636W518C</td>
      <td><img src="./devices/guition-silverpuck-jc3636w518c/device.jpg" width="100" alt="Silver Puck"></td>
      <td>1.8" ESP32-S3 Silver Puck</td>
      <td><a href="devices/guition-silverpuck-jc3636w518c/README.md">Details</a></td>
      <td><a href="https://magdalar.github.io/RedSmartKnob/guition-silverpuck-jc3636w518c/"><img src="https://img.shields.io/badge/FLASH-FIRMWARE-ff6b00?style=for-the-badge&labelColor=111827" alt="Open Installer"></a></td>
    </tr>
  </tbody>
</table>

## References and Inspirations

  - https://github.com/RealDeco/sendspin-guition
  - https://github.com/KrX3D/WaveShare-Knob-ESp32S3 - esphome setup w/ display, HA media player.
