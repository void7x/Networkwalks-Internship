# PM5 — Network Scanning with Zenmap

## Objective

Use Zenmap (the Nmap graphical interface) to perform an authorized local-network host-discovery scan, review responding hosts, and export the network topology.

## Environment and configuration

- Host operating system: Windows
- Scanner: Zenmap with Nmap 7.993
- Scan profile: Ping scan
- Nmap operation: host discovery (`-sn`)
- Scope: the authorized local Wi-Fi subnet (`/24`)

## Npcap troubleshooting

The first scan displayed a warning that Nmap could not import all required Npcap functions and fell back to connect() mode; it reported two hosts. Npcap was updated. The subsequent scan completed without the warning and reported three hosts. The later scan is the final result used in the report.

## Corrected scan result

- Nmap version: 7.993
- Addresses scanned: 256
- Hosts reported up: 3
- Scan duration: 13.81 seconds
- Nmap reported two MAC addresses.
- The scanner workstation's Wi-Fi MAC was retrieved separately using Windows `ipconfig /all`.

The three responding hosts were the local gateway, a device whose MAC vendor lookup identified Xiaomi Communications, and the Windows workstation running Zenmap. The private IP and MAC values are redacted in the public XML and Wi-Fi details files.

## Commands and exports

The Zenmap Ping Scan profile generated an Nmap host-discovery command equivalent to:

```text
nmap -sn <authorized-local-subnet>/24
```

The [results folder](results/README.md) contains the sanitized public Nmap XML export, the Zenmap topology PDF (`zenmap-ping-scan.pdf`) and redacted Windows Wi-Fi details.

The [screenshots folder](screenshots/README.md) contains four authentic screenshots captured from Zenmap and Windows PowerShell.

## Privacy note

The uploaded screenshots are original captures and still display private LAN IP/MAC identifiers and workstation details. They should be replaced with redacted copies before public submission. Do not publish the original local network identifiers. The original, unmodified scan artifacts should remain in the private assignment archive.

## Interpretation and limitations

- A Ping Scan is host discovery, not port scanning, vulnerability assessment or proof that a host is secure.
- Three hosts responded during this scan; other devices may exist but not respond to the selected probes.
- A MAC vendor lookup does not establish the exact device model or owner.
- The topology graph is a visualization of discovered hosts, not a complete physical network diagram.

## Completion

The corrected Zenmap scan completed successfully after the Npcap update. The XML and topology PDF are uploaded to this branch; the public XML and Wi-Fi details are redacted copies. The four original screenshots are also uploaded and still need privacy-safe replacements.
