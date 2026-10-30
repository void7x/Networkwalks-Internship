# Lab 08 — VoIP Call Replay and Analysis

**Assessment result:** 90/100

## Objective

Identify a VoIP call in captured traffic, distinguish call signalling from the media stream, inspect codec information and understand the exposure created by unencrypted voice traffic.

## Investigation workflow

1. Use the `sip` display filter to locate call-signalling packets.
2. Inspect SIP call setup messages, including INVITE and response messages.
3. Use the `rtp` display filter to identify Real-time Transport Protocol media packets.
4. Inspect an RTP packet's payload type to review codec information.
5. Open **Telephony → VoIP Calls**, select the call and use the stream playback controls in the lab to inspect the media.

## Wireshark features and protocols practised

- SIP signalling inspection.
- RTP media-stream identification.
- Call setup and endpoint metadata review.
- Codec and payload-type inspection.
- Wireshark VoIP Calls and stream playback.

## Security takeaway

SIP signalling and RTP media serve different purposes. If voice media is not encrypted, captured packets may expose call content. Secure deployments should protect signalling with TLS where appropriate and media with Secure RTP (SRTP), alongside suitable network and access controls.

## Result

**90/100**

No call recording, spoken personal information or payment-card details from the training scenario are reproduced.
