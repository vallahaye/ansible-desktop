# ansible-desktop

Ansible playbook for my desktop computer. This works on Manjaro based linux
systems. Tested platforms are:

* Manjaro 20.02

The following hardware is required for this configuration to work:

* CPU: [Intel Core i9-9900K](https://www.intel.com/content/www/us/en/products/processors/core/i9-processors/i9-9900k.html)
* Motherboard: [MSI MPG Z390 Gaming Edge AC](https://www.msi.com/Motherboard/MPG-Z390-GAMING-EDGE-AC)
* GPUs:
  * [EVGA GeForce GTX 1070 Ti](https://www.evga.com/articles/01161/evga-geforce-gtx-1070-ti/) (plugged in PCI-E1)
  * [MSI GeForce GT 1030](https://www.msi.com/Graphics-card/GeForce-GT-1030-2GH-LP-OC.html) (plugged in PCI-E6)
* Miscellaneous hardware: [Renesas USB 3.0 Host Controller](https://www.renesas.com/us/en/products/usb-assp/upd720202.html) (plugged in PCI-E5)

## Getting started

### BIOS configuration

From the default optimized settings, configure the BIOS as follow:

```
Initiate Graphic Adapter: [PEG]→[IGD]
Internal Graphics: [Auto]→[Enabled]
Boot mode select: [LEGACY+UEFI]→[UEFI]
IGD Multi-Monitor: [Disabled]→[Enabled]
OC Explore Mode: [Normal]→[Expert]
Intel VT-D Tech: [Disabled]→[Enabled]
```

### Installation

Run the following commands to install the dependencies and run the playbook:

```
$ ansible-galaxy install -r requirements.yml
$ ansible-playbook -b --ask-become-pass playbook.yml
```

## License

© 2020 Valentin Lahaye

This project is licensed under the terms of the MIT [license](LICENSE).
