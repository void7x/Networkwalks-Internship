# Lab 04 — Follow TCP Stream

**Assessment result:** 80/100

## Objective

Use Wireshark to identify a TCP conversation and reconstruct the application data exchanged between its endpoints.

## Investigation workflow

1. Review **Statistics → Conversations → TCP** to compare TCP conversations.
2. Narrow the packet list to the lab's chat service with the display filter:

   `tcp.port == 5000`

3. Inspect the initial SYN packet to determine which endpoint initiated the connection.
4. Select a packet carrying application data and choose **Follow → TCP Stream**.
5. Review the reconstructed conversation, stream metadata and the direction of the data.

## Wireshark features practised

- TCP Conversations statistics.
- TCP port-based display filtering.
- SYN packet and source/destination inspection.
- Follow TCP Stream.
- Client/server direction and stream-size interpretation.

## Security takeaway

When an application sends readable data over an unencrypted TCP connection, anyone with access to the traffic may be able to inspect the conversation. Sensitive information should not be sent through plaintext services; use properly configured encrypted protocols and avoid reusing temporary credentials.

## Result

**80/100**

The score reflects the completed lab assessment. The scenario's chat contents and example passwords are intentionally not reproduced.
