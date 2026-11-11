# Week 2 evidence upload and review checklist

Target branch: `evidence/week-2-submission`

## Uploaded

### PM1 — Footprinting
- [x] Six command-output text files.
- [x] Six image files.
- [x] Public cURL cookie value redacted in `outputs/04-curl-headers.txt`.
- [x] Public Google site-verification token redacted in `outputs/06-dnsrecon.txt`.

### PM5 — Zenmap
- [x] Sanitized Nmap XML copy: `results/zenmap-ping-scan.xml`.
- [x] Zenmap topology PDF: `results/zenmap-ping-scan.pdf`.
- [x] Redacted Windows Wi-Fi details text: `results/windows-wifi-details.txt`.
- [x] Four original screenshots.

### Final report
- [ ] Verify the contents of `Final-Report/Untitled document.pdf`; the file is present but not yet confirmed as the completed report.
- [ ] Upload the expected DOCX if the coordinator requires Word format.

## Still required before treating the public branch as complete

### PM1 screenshots
- [x] WHOIS screenshot.
- [ ] Genuine WhatWeb screenshot — missing.
- [x] NSLookup screenshot.
- [ ] Redacted cURL screenshot — current capture displays the cookie value.
- [ ] Redacted DNSRecon screenshot — current capture displays the Google verification token.
- [x] WAFW00F screenshot — one of the two uploaded captures is a duplicate; retain one distinct capture.

### PM5 screenshots
- [ ] Replace the four uploaded original captures with privacy-redacted copies. They currently expose local IP/MAC identifiers and workstation details.

### Final report
- [ ] Confirm that the uploaded PDF is the completed Week 2 report and contains the correct student name, batch and practical findings.
- [ ] Upload `Week2-Final-Internship-Report-Sahil-Ahire.docx` if required by the submission instructions.

## Privacy and evidence handling

The XML now in this public branch is a clearly labelled sanitized copy with documentation IP/MAC placeholders. Keep the original Nmap XML, original PM1 command logs, original screenshots and unredacted report in the private assignment archive. Never fabricate evidence or replace an original result with a generated screenshot.
