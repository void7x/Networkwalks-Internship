# PM1 — Footprinting with Multiple Kali Linux Tools

## Objective

Practice basic, non-exploitative footprinting and reconnaissance against the assigned domain networkwalks.com, using the six tools specified in the module instructions.

## Environment

- Operating system: Kali Linux
- VM: Kali-WK1-PM1 (the existing Week 1 Kali VM was reused)
- Local evidence directory: Week2-PM1/
- Output files: outputs/
- Screenshots: screenshots/

All six required tools were present before the exercises began.

## Tools, commands and observed results

| Tool | Command used | Observed result |
|---|---|---|
| WHOIS | whois networkwalks.com | Registry response identified GoDaddy as registrar, registration date 6 Nov 2019, registry expiry date 6 Nov 2027, and HostGator nameservers. The response later included a WHOIS retirement notice and rate-limit message. |
| WhatWeb | whatweb networkwalks.com | HTTP endpoint redirected to HTTPS (301); HTTPS returned 200. Fingerprints included Apache, WordPress, Bootstrap, jQuery, Google Tag Manager and the page title “Networkwalks Academy”. |
| NSLookup | nslookup networkwalks.com | An initial timeout to the configured resolver (8.8.8.8) appeared, followed by a non-authoritative DNS answer resolving the domain to its observed public IPv4 address. |
| cURL | curl -I https://networkwalks.com | HTTP/2 200 response. Headers included Apache server identification, HTML content type, WordPress REST API links, Referrer-Policy and Permissions-Policy. A cookie was set with Secure and HttpOnly attributes. |
| WAFW00F | wafw00f https://networkwalks.com | WAFW00F v2.4.2 identified a ModSecurity (SpiderLabs) WAF signature after two requests. |
| DNSRecon | dnsrecon -d networkwalks.com | Printed SOA, MX, A, TXT and SRV information, including autodiscover service records. The tool's summary line reported “8 Records Found”. A DNSSEC query returned no answer. |

## Interpretation and limitations

- WHOIS data is registry/registrar information and may be redacted, cached or subject to registry rate limits. The returned fields should be interpreted as observations from the query, not independently verified ownership claims.
- WhatWeb results are fingerprint signatures. A detected product/version string is not proof that every component or version is installed in every part of the site.
- NSLookup ultimately resolved the domain despite the initial resolver timeout. The timeout was retained as part of the observation.
- cURL inspected response headers only; it did not test the application for vulnerabilities.
- WAFW00F's ModSecurity result is a fingerprinting detection, not proof that all malicious traffic is blocked or that the WAF is correctly configured.
- DNSRecon's DNSSEC query returned no answer. WHOIS separately reported DNSSEC as unsigned. This is documented as an observation, not asserted to be an exploitable vulnerability.
- DNS records and web fingerprints can change over time. Results are time-specific.

## Local evidence files

The original local evidence package contains the command outputs and six screenshots:

- outputs/01-whois.txt
- outputs/02-whatweb.txt
- outputs/03-nslookup.txt
- outputs/04-curl-headers.txt
- outputs/05-wafw00f.txt
- outputs/06-dnsrecon.txt
- screenshots/01-whois.png through screenshots/06-dnsrecon.png

Public-safe summaries are recorded in the outputs folder. The original files remain in the private assignment evidence package; screenshots and raw logs are not mirrored here because they can expose unnecessary identifiers or header values.

## Completion

All six PM1 tools were run and their text outputs and screenshots were saved in the local evidence folder. The results were reviewed for inclusion in the final report.
