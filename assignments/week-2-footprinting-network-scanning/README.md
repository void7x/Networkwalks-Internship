# Week 2 — Footprinting and Network Scanning

This directory documents the Week 2 internship work completed for the selected practical modules:

- **PM1 — Footprinting with multiple Kali Linux tools**
- **PM5 — Network scanning with Zenmap**
- **PM-FINAL — Detailed internship report** (maintained as a separate submission document)

The supplied Week 2 overview required both essential projects (PM5 and the final report) plus at least one elective. PM1 was selected as the elective. PM2, PM3 and PM4 were not selected because they are optional alternatives under the supplied overview.

## Module folders

- [PM1 — Footprinting](PM1-Footprinting/README.md)
- [PM5 — Network scanning with Zenmap](PM5-Zenmap/README.md)

## Evidence and privacy

The original practical evidence was captured on the student's Kali Linux VM and Windows PC. Public documentation in this repository contains summaries and sanitized notes only.

The following remain in the private local assignment package and should be supplied through the internship's approved submission channel:

- Original PM1 command-output files and screenshots.
- Original Zenmap XML scan export.
- Zenmap topology PDF.
- Original PM5 screenshots.
- Final report containing complete assignment details.

Private LAN IP addresses, MAC addresses, workstation identifiers and session cookie values are intentionally omitted from this public repository. Do not publish unredacted home-network evidence.

## Completion summary

- [x] PM1: WHOIS lookup
- [x] PM1: WhatWeb technology fingerprinting
- [x] PM1: NSLookup DNS resolution
- [x] PM1: cURL HTTP response-header inspection
- [x] PM1: WAFW00F WAF detection
- [x] PM1: DNSRecon DNS enumeration
- [x] PM5: authorized local-subnet Ping Scan with Zenmap
- [x] PM5: scan results saved in Zenmap XML format
- [x] PM5: network topology exported to PDF
- [x] PM5: Windows Wi-Fi adapter details recorded separately
- [x] PM5: screenshots captured and organized locally
- [ ] Final report and original evidence submitted through the internship's confirmed submission process

## Scope

All reconnaissance and host-discovery activities were performed for the assigned domain and the authorized local network. The PM5 scan used Nmap host discovery (option -sn), not a port or vulnerability scan. Results describe what responded during the recorded scan and do not prove that every device on the network was discoverable.
