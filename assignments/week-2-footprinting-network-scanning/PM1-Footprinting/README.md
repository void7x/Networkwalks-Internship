# PM1 — Footprinting with Multiple Kali Linux Tools

## Objective

Practice basic, non-exploitative footprinting and reconnaissance against the assigned domain `networkwalks.com`, using the six tools specified in the module instructions.

## Environment

- Operating system: Kali Linux
- VM: `Kali-WK1-PM1` (the existing Week 1 Kali VM was reused)
- Local evidence directory: `Week2-PM1/`
- Output files: `outputs/`
- Screenshots: `screenshots/`

All six required tools were present before the exercises began.

## Tools and actual results

| Tool | Command | Observed result |
|---|---|---|
| WHOIS | `whois networkwalks.com` | GoDaddy.com, LLC registrar; creation date 6 Nov 2019; registry expiry date 6 Nov 2027; HostGator nameservers. The response later showed a WHOIS retirement notice and rate-limit message. |
| WhatWeb | `whatweb networkwalks.com` | HTTP redirected to HTTPS (301); HTTPS returned 200. Fingerprints included Apache, WordPress 7.1.4, WordPress Download Manager 3.3.76, Bootstrap 7.1.4, jQuery 3.7.1 and Google Tag Manager. |
| NSLookup | `nslookup networkwalks.com` | Initial timeout to 8.8.8.8, followed by a non-authoritative answer resolving the domain to 192.232.216.135. |
| cURL | `curl -I https://networkwalks.com` | HTTP/2 200. Apache server header, HTML content type, WordPress REST API links, Referrer-Policy and Permissions-Policy headers. Cookie attributes included Secure and HttpOnly. |
| WAFW00F | `wafw00f https://networkwalks.com` | WAFW00F v2.4.2 identified a ModSecurity (SpiderLabs) WAF signature after two requests. |
| DNSRecon | `dnsrecon -d networkwalks.com` | SOA, MX, A, TXT and SRV records; tool summary reported 8 records found. A DNSSEC query returned no answer. |

## Interpretation and limitations

- WHOIS fields are observations returned during this run; the response also showed a retirement notice and rate limiting.
- WhatWeb uses fingerprints; detected product/version strings do not prove that every component is installed across the entire website.
- NSLookup resolved the domain after an initial resolver timeout.
- cURL inspected response headers only; it did not test the application for vulnerabilities.
- WAFW00F's ModSecurity result is a fingerprinting detection, not proof that all attacks are blocked.
- DNSRecon's DNSSEC query returned no answer; WHOIS separately reported DNSSEC as unsigned. This is an observation, not a confirmed exploitable vulnerability.

## Text evidence

The six command-output files are committed in [outputs/](outputs/README.md). The public copies redact the cURL cookie value and Google site-verification token; the original unmodified logs remain in the local evidence package.

## Screenshot evidence

The supplied ZIP contained five distinct PM1 screenshots. The duplicate WAFW00F screenshot was omitted. The WhatWeb screenshot (`02-whatweb.png`) was not present in that ZIP, so it has not been fabricated. Add the genuine screenshot captured separately to complete the six-image set.

## Scope

The work was limited to the assigned domain and the approved assignment scope. No exploitation, credential attacks, denial-of-service activity or vulnerability validation was performed.
