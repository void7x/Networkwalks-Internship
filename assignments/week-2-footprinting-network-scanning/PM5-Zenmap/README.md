# PM5 — Network Scanning with Zenmap

## Objective

Use Zenmap (the Nmap graphical interface) to perform an authorized local-network host-discovery scan, review the responding hosts, and export a network topology graphic.

## Environment and configuration

- Host operating system: Windows
- Scanner: Zenmap with Nmap 7.993
- Scan profile: Ping scan
- Nmap operation: host discovery (-sn)
- Scope: the assigned/authorized local Wi-Fi subnet (/24)

The exact private subnet, host IP addresses and MAC addresses are kept in the private assignment evidence package and are intentionally not disclosed in this public repository.

## Npcap troubleshooting

The first scan produced a warning that Nmap could not import all required Npcap functions and had fallen back to connect() mode. The initial scan reported two responding hosts.

Npcap was then upgraded. The subsequent scan completed without the Npcap warning and reported three responding hosts.

The corrected scan is the result used for the practical summary.

## Corrected scan result

- Nmap version: 7.993
- Address count scanned: 256
- Hosts reported up: 3
- Scan duration: 13.81 seconds
- Two MAC addresses were returned by Nmap.
- The scanner workstation's own MAC address was retrieved separately from Windows ipconfig /all, because Nmap did not print a MAC address for the scanning host.

Host roles identified in the private report:
1. Local network gateway
2. A device whose MAC vendor lookup identified Xiaomi Communications
3. The Windows workstation running Zenmap

The detailed local IP and MAC mapping is retained in the private report and evidence package; it is not published here.

## Commands and exports

The Zenmap Ping Scan profile generated an Nmap host-discovery command equivalent to:

~~~text
nmap -sn <authorized-local-subnet>/24
~~~

The local evidence package contains:
- results/zenmap-ping-scan.xml — Zenmap XML scan export
- results/network-topology.pdf — topology graphic exported from Zenmap
- results/windows-wifi-details.txt — Wi-Fi adapter details captured using Windows
- screenshots/01-zenmap-scan.png — scan output
- screenshots/02-zenmap-hosts.png — discovered-host view
- screenshots/03-zenmap-topology.png — topology view
- screenshots/04-windows-wifi-details.png — Windows Wi-Fi adapter details

## Interpretation and limitations

- A Ping Scan performs host discovery; it is not a port scan, vulnerability assessment or proof that a host is secure.
- Three hosts responded to the discovery probes during this scan. Other devices may be present but not respond to the selected probes.
- MAC vendor identification is a vendor-prefix lookup and does not establish an exact device model or owner.
- MAC addresses are normally visible only for hosts on the same local Layer-2 segment and may be unavailable for remote or isolated hosts.
- The topology graphic should be interpreted as a visualization of the discovery data, not a complete physical network diagram.

## Completion

The corrected Zenmap scan completed successfully after the Npcap update. The XML scan and topology PDF were saved locally, and the host details and screenshots were organized in the private PM5 evidence folder.
