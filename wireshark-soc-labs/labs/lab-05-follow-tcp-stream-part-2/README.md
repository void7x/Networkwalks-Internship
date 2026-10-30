# Lab 05 — Follow TCP Stream, Part 2

**Assessment result:** 100/100

## Objective

Inspect HTTP conversations and reconstruct page responses to understand how content carried by an HTTP stream can expose information that is not obvious from the rendered page.

## Investigation workflow

1. Use the \`http\` display filter to focus on HTTP packets.
2. Follow relevant HTTP GET requests with **Follow → TCP Stream**.
3. Inspect the server response and review the returned page content.
4. Look for HTML comments in the response body. Comments are part of the transferred source even though a browser does not display them as normal page text.
5. Use a URI filter to narrow the traffic to download requests:

   \`http.request.uri contains "download"\`

6. Follow the relevant stream and inspect the response content.

## Wireshark features practised

- HTTP display filtering.
- GET request and HTTP response inspection.
- Follow TCP Stream and stream selection.
- HTML source inspection, including comments.
- URI-based filtering and response analysis.

## Security takeaway

Information hidden in page source is still delivered to the client. HTML comments and other client-side content must never contain secrets, internal access details or sensitive operational information. Use server-side access controls and avoid embedding secrets in web content.

## Result

**100/100**

Scenario-specific codes, internal addresses and report contents are not reproduced in this portfolio.
