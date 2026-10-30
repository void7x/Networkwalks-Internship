# Lab 06 — HTTP Plain-Text Credential Exposure

**Assessment result:** 100/100

## Objective

Investigate how login form submissions travel over HTTP and understand why credentials sent without transport encryption can be exposed to packet inspection.

## Investigation workflow

1. Filter for HTTP POST requests:

   \`http.request.method == "POST"\`

2. Inspect the request path and source/destination fields.
3. Open the packet details and review the **HTML Form URL Encoded** section.
4. Compare the form submissions and the corresponding server responses.
5. Identify the security weakness and the appropriate mitigation.

## Wireshark features practised

- HTTP request-method filtering.
- POST request and response correlation.
- Packet-detail inspection.
- HTML Form URL Encoded field inspection.
- Identifying plaintext application data.

## Security takeaway

HTTP does not provide transport encryption. Form values sent through an unprotected HTTP connection can be readable in captured traffic. Login pages and authentication flows should use correctly configured HTTPS/TLS, with secure session handling and other standard authentication protections.

## Result

**100/100**

Usernames, passwords and other scenario-specific form values are deliberately excluded.
