# Week 1 – VirtualBox and Kali Linux Lab Setup

This repository documents the Week 1 practical lab setup for cybersecurity practice using Oracle VirtualBox and Kali Linux. The aim is to keep the build steps, network settings and verification commands in one place so the environment can be checked and rebuilt when needed.

## Lab objective

Set up a Kali Linux virtual machine on a VirtualBox NAT Network, assign the required IPv4 address, enable the VM integration settings and confirm that the guest can reach the internet.

## Lab configuration

| Component | Configuration |
|---|---|
| Host machine | Windows PC |
| Virtualisation platform | Oracle VirtualBox |
| Guest machine | Kali Linux |
| Virtual network type | NAT Network |
| Network prefix | `10.0.0.0/24` |
| Kali IPv4 address | `10.0.0.2/24` |
| Shared host folder | Host Downloads folder, shared as `downloads` |
| Shared folder mount (typical) | `/media/sf_downloads` |
| Shared clipboard | Bidirectional |
| Drag and drop | Bidirectional |
| Internet access | Required |

The exact VirtualBox menu labels can vary slightly between releases. The required network and guest settings are the important parts.

## Repository contents

- **[Setup guide](docs/setup-guide.md)** – VirtualBox network, Kali VM, shared folder and integration settings.
- **[Lab architecture](docs/lab-architecture.md)** – network layout and the role of each component.
- **[Network verification](docs/network-verification.md)** – commands used to check the IP address, route, internet and DNS.
- **[Troubleshooting](docs/troubleshooting.md)** – common issues and checks from the Week 1 module.
- **[Verification script](scripts/verify-lab.sh)** – a small Bash script to check the guest configuration.
- **[Evidence folder](evidence/README.md)** – the screenshot checklist for the lab.

## Quick verification

Open a terminal inside Kali Linux and run:

```bash
ip -4 -br addr
ip route
ping -c 3 8.8.8.8
ping -c 3 google.com
```

To run the included checks:

```bash
chmod +x scripts/verify-lab.sh
./scripts/verify-lab.sh
```

The script checks the expected address, default route, connectivity, DNS resolution and the shared-folder mount. Run it inside the Kali guest, not on the Windows host. A result depends on the state of the VM and network at the time the script is run.

## Notes

- Keep `10.0.0.2` unique on the NAT Network. A duplicate address can cause intermittent connectivity.
- The shared folder must point to the host's actual Downloads directory. The Windows path differs from machine to machine.
- VirtualBox shared-folder access inside Kali may require the VirtualBox guest integration components and membership in the `vboxsf` group.
- Take a VirtualBox snapshot after the base configuration is working so the clean lab state can be restored.
- This repository documents the lab environment. It does not claim that optional attack exercises or additional guest VMs have been completed.

## Scope

Week 1 is focused on preparing and checking the virtual lab. Any later testing should be performed only against systems that are owned by the user or for which explicit permission has been given.
