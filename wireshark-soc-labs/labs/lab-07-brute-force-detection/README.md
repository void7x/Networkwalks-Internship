# Lab 07 — FTP Brute-Force Detection

**Assessment result:** 100/100

## Objective

Investigate repeated FTP authentication attempts, distinguish failed and successful responses, and identify the pattern associated with a brute-force attempt.

## Investigation workflow

1. Use the \`ftp\` display filter to isolate FTP traffic.
2. Review username commands:

   \`ftp.request.command == "USER"\`

3. Review password-command packets without copying their values:

   \`ftp.request.command == "PASS"\`

4. Isolate failed authentication responses:

   \`ftp.response.code == 530\`

5. Review successful authentication responses:

   \`ftp.response.code == 230\`

6. Correlate repeated attempts and server responses to determine whether the traffic is consistent with brute-force behaviour.

## Wireshark features practised

- FTP protocol filtering.
- USER and PASS command identification.
- FTP response-code inspection.
- Counting repeated failed attempts.
- Correlating failure and success events.

## Security takeaway

Traditional FTP does not encrypt its authentication exchange. Repeated login failures followed by a success can indicate password guessing. Prefer secure file-transfer protocols such as SFTP or FTPS, enforce strong authentication and monitor repeated failures with appropriate alerting and rate controls.

## Result

**100/100**

The lab's usernames, passwords and specific host addresses are intentionally omitted.
