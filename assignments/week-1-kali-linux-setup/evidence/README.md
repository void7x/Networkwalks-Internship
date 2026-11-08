# WK1-PM1 evidence

This folder contains curated screenshots captured from the actual `Kali-WK1-PM1` VM and its VirtualBox settings, plus a portrait collage for sharing the work on LinkedIn.

## Evidence index

| Filename | What it shows |
|---|---|
| [01-nat-network-adapter.png](01-nat-network-adapter.png) | Adapter 1 attached to `NatNetwork`; the VM-specific MAC value is masked. |
| [02-shared-downloads-settings.png](02-shared-downloads-settings.png) | Shared folder named `Downloads` with auto-mount enabled; the host user path is masked. |
| [03-static-ip-route-and-connectivity.png](03-static-ip-route-and-connectivity.png) | Kali static address `10.0.0.2/24`, default route through `10.0.0.1`, and successful IP/DNS ping tests. |
| [04-shared-folder-write-and-connectivity.png](04-shared-folder-write-and-connectivity.png) | Shared-folder test file creation/listing/removal and connectivity results. Unrelated Downloads filenames have been cropped out. |
| [05-final-vm-snapshot.png](05-final-vm-snapshot.png) | VirtualBox Snapshots view showing the `Kali-WK1-PM1` snapshot. |
| [kali-wk1-pm1-linkedin-collage.png](kali-wk1-pm1-linkedin-collage.png) | Portrait collage composed from the five screenshots above. |

## Curation and privacy

The screenshots are genuine captures supplied in the setup ZIP. They have been selected and lightly prepared for public sharing: the host Windows user path and VM MAC address are masked, and the terminal capture is cropped to remove the unrelated Downloads directory listing.

One duplicate terminal capture containing an accidental `s: command not found` line was omitted as it adds no useful evidence.

No passwords or unrelated personal files are intentionally included. Review images once more before public posting.

## Snapshot

The VirtualBox screenshot shows a snapshot named `Kali-WK1-PM1` dated 8 November 2026. The snapshot name differs from the suggested name in the setup chat, so this evidence index records the actual name shown in VirtualBox.
