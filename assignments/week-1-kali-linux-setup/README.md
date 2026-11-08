# WK1-PM1 — Week 1 Project Module 1: VirtualBox and Kali Linux Lab Setup

## Assignment objective

Set up a Kali Linux virtual machine in Oracle VirtualBox for authorised cybersecurity and networking practice, using the required NAT Network, static IPv4 configuration, internet connectivity and host/guest integration features.

This is the **Kali Linux setup assignment**. It is documented separately from the existing Wireshark SOC lab assignment in this repository.

## Lab environment

| Component | Result |
|---|---|
| Host operating system | Windows 11 |
| Virtualisation platform | Oracle VirtualBox (already installed on the host) |
| Guest operating system | Kali Linux |
| VM used for this assignment | `Kali-WK1-PM1` |
| VM preparation method | Full clone of the existing Kali VM |
| Virtual network | NAT Network |
| NAT Network name | `NatNetwork` |
| IPv4 network | `10.0.0.0/24` |
| NAT gateway | `10.0.0.1` |
| DHCP | Enabled on the NAT Network |
| IPv6 | Disabled |
| Kali IPv4 address | `10.0.0.2/24` (static) |
| DNS configured in Kali | `8.8.8.8` |
| Host folder shared with Kali | Windows Downloads folder |
| Shared-folder name | `Downloads` |
| Kali shared-folder mount | `/media/sf_Downloads` |

## Important setup note

The assignment guide describes downloading and importing a Kali VirtualBox image. An existing Kali VM was already available on the host, so a **Full Clone** named `Kali-WK1-PM1` was used instead. This kept the original Kali VM separate and unchanged. The resulting clone was then configured for this assignment.

The clone-based preparation is documented accurately here; it should not be described as a fresh download/import.

## Implementation and verification

### 1. NAT Network

Created and verified a VirtualBox NAT Network with:

- Name: `NatNetwork`
- IPv4 prefix: `10.0.0.0/24`
- Gateway reported by VirtualBox: `10.0.0.1`
- DHCP: enabled
- IPv6: disabled

Kali's Adapter 1 was attached to this NAT Network.

### 2. Static IPv4 configuration

The Kali connection profile `Wired connection 1` was configured with NetworkManager:

```bash
sudo nmcli connection modify "Wired connection 1" \
  ipv4.method manual \
  ipv4.addresses "10.0.0.2/24" \
  ipv4.gateway "10.0.0.1" \
  ipv4.dns "8.8.8.8"
```

The resulting checks showed:

```text
eth0    UP    10.0.0.2/24
```

The default route was:

```text
default via 10.0.0.1 dev eth0 proto static
```

### 3. Network troubleshooting

After the static configuration was applied, NetworkManager initially failed to reactivate the connection. The workaround shown in the supplied assignment guide was applied:

```bash
sudo nmcli connection modify "Wired connection 1" ipv4.dad-timeout 0
sudo nmcli connection up "Wired connection 1"
```

The connection then activated successfully and the expected static IPv4 address and default route were visible.

### 4. Guest Additions and shared folder

The following VirtualBox guest modules were present:

- `vboxguest`
- `vboxsf`

The host Windows Downloads folder was configured as a permanent, auto-mounted shared folder named `Downloads`. Kali detected it at:

```text
/media/sf_Downloads
```

The Kali user was a member of the `vboxsf` group. A read/write check was completed by creating, listing and deleting a temporary test file inside the mount.

### 5. Clipboard and drag-and-drop

Shared Clipboard and Drag and Drop were configured as **Bidirectional** in the VM settings. Both transfer features were tested and reported working.

### 6. Internet and DNS tests

The following tests were run inside Kali:

```bash
ping -c 4 1.1.1.1
ping -c 4 google.com
```

Observed results:

| Test | Result |
|---|---|
| `1.1.1.1` | 4 packets transmitted, 4 received |
| Packet loss to `1.1.1.1` | 0% |
| `google.com` | Name resolved and replies received |
| Packet loss to `google.com` | 0% |

These results verify IP connectivity and DNS-based hostname resolution at the time the tests were run.

## Completion status

- [x] VirtualBox NAT Network created with `10.0.0.0/24`.
- [x] Kali clone attached to `NatNetwork`.
- [x] Kali static IPv4 address configured as `10.0.0.2/24`.
- [x] Default gateway configured as `10.0.0.1`.
- [x] DNS configured as `8.8.8.8`.
- [x] Guest Additions modules detected.
- [x] Windows Downloads folder mounted in Kali.
- [x] Shared-folder read/write access tested.
- [x] Bidirectional clipboard tested.
- [x] Bidirectional drag-and-drop tested.
- [x] External IP connectivity and DNS resolution tested.
- [ ] Final VirtualBox snapshot — **not yet confirmed in the available evidence**.
- [ ] Actual setup screenshots uploaded to this assignment folder.

## Evidence

See [evidence/README.md](evidence/README.md) for the evidence checklist and intended screenshot filenames.

Only screenshots captured from the actual host and VM should be added. No screenshots have been included in this change because the actual screenshot image files were not provided to the repository update.

## Scope and safety

This is a lab environment for authorised training. Use it only for systems and networks that you own or have explicit permission to test. Review screenshots before publishing and remove passwords, personal Windows paths, private files and other sensitive information.

## Source assignment

The setup requirements and troubleshooting procedure were taken from the supplied NetworkWalks document:

**WK1-PM1 — Week 1, Project Module 1: Lab Setup VirtualBox and Kali Linux.**
