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

The three responding hosts were the local gateway, a device whose MAC vendor lookup identified Xiaomi Communications, and the Windows workstation running Zenmap. The detailed addresses and MAC mappings are included in the assignment report and results file.

## Commands and exports

The Zenmap Ping Scan profile generated an Nmap host-discovery command equivalent to:

```text
nmap -sn <authorized-local-subnet>/24
```

The [results folder](results/README.md) documents the XML scan export, topology PDF and Windows Wi-Fi details. The Windows Wi-Fi details text file is already committed; the XML and PDF remain to be uploaded as binary files.

The [screenshots folder](screenshots/README.md) lists four authentic screenshots from the corrected scan and adapter inspection. They remain to be uploaded as binary files.

## Interpretation and limitations

- A Ping Scan is host discovery, not port scanning, vulnerability assessment or proof that a host is secure.
- Three hosts responded during this scan; other devices may exist but not respond to the selected probes.
- A MAC vendor lookup does not establish the exact device model or owner.
- The topology graph is a visualization of discovered hosts, not a complete physical network diagram.

## Completion

The corrected Zenmap scan completed successfully after the Npcap update. The XML and topology PDF were saved locally, and the host details and screenshots were organized in the private PM5 evidence folder.
