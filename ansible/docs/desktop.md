# Desktop

## About KeeWeb Desktop

[KeeWeb Desktop](https://keeweb.info/) must be installed manually for now. On Debian based systems,
download and install the [distributed DEB file](https://github.com/keeweb/keeweb/releases/latest)
using `dpkg` and `apt`. On Archlinux based systems, use `yay` to build and install the package
`keeweb-desktop-bin` available in AUR.

## Hardware configuration

### Components

- CPU: [Intel Core i9-9900K](https://www.intel.com/content/www/us/en/products/processors/core/i9-processors/i9-9900k.html)
- Motherboard: [MSI MPG Z390 Gaming Edge AC](https://www.msi.com/Motherboard/MPG-Z390-GAMING-EDGE-AC)
- GPUs:
  * [EVGA GeForce GTX 1070 Ti](https://www.evga.com/articles/01161/evga-geforce-gtx-1070-ti/) (plugged in PCI-E1)
  * [MSI GeForce GT 1030](https://www.msi.com/Graphics-card/GeForce-GT-1030-2GH-LP-OC.html) (plugged in PCI-E6)
- Miscellaneous hardware: [Renesas USB 3.0 Host Controller](https://www.renesas.com/us/en/products/usb-assp/upd720202.html) (plugged in PCI-E5)

### BIOS configuration

```
Initiate Graphic Adapter: [PEG]→[IGD]
Internal Graphics: [Auto]→[Enabled]
Boot mode select: [LEGACY+UEFI]→[UEFI]
IGD Multi-Monitor: [Disabled]→[Enabled]
OC Explore Mode: [Normal]→[Expert]
Intel VT-D Tech: [Disabled]→[Enabled]
```

### Disks partitioning

| Physical drive | Partition table | Logical partitions                                                           |
|----------------|-----------------|------------------------------------------------------------------------------|
| `nvme0n0`      | `GPT`           | System partitions; install Manjaro on this drive, use automatic partitioning |
| `nvme1n1`      | `GPT`           | LVM2 partition; contains `libvirt` VMs's storage disks                       |

### Reddit AMA

A more detailed explanation of the setup is [available on Reddit](https://www.reddit.com/r/VFIO/comments/icn45w/sharing_my_working_gaming_virtual_machine/).
Feel free to ask any question related to the topic in the comments section.
