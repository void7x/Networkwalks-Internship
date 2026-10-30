#!/usr/bin/env bash
#
# Verify the Week 1 VirtualBox/Kali lab from inside the Kali guest.
#
# Usage:
#   chmod +x scripts/verify-lab.sh
#   ./scripts/verify-lab.sh
#
# Optional overrides:
#   EXPECTED_IPV4_CIDR=10.0.0.2/24
#   SHARED_FOLDER_MOUNT=/media/sf_downloads

set -u

EXPECTED_IPV4_CIDR="${EXPECTED_IPV4_CIDR:-10.0.0.2/24}"
SHARED_FOLDER_MOUNT="${SHARED_FOLDER_MOUNT:-/media/sf_downloads}"

PASS_COUNT=0
FAIL_COUNT=0
WARN_COUNT=0

pass() {
    printf '[PASS] %s\n' "$1"
    PASS_COUNT=$((PASS_COUNT + 1))
}

fail() {
    printf '[FAIL] %s\n' "$1"
    FAIL_COUNT=$((FAIL_COUNT + 1))
}

warn() {
    printf '[WARN] %s\n' "$1"
    WARN_COUNT=$((WARN_COUNT + 1))
}

printf 'Week 1 Kali lab verification\n'
printf '%s\n' '-----------------------------'
printf 'Expected address: %s\n' "$EXPECTED_IPV4_CIDR"
printf 'Shared folder:    %s\n\n' "$SHARED_FOLDER_MOUNT"

if ! command -v ip >/dev/null 2>&1; then
    fail "'ip' command is not available; install or repair iproute2."
else
    if ip -o -4 addr show scope global 2>/dev/null |
        awk -v expected="$EXPECTED_IPV4_CIDR" '$4 == expected { found = 1 } END { exit(found ? 0 : 1) }'
    then
        pass "Found expected IPv4 address $EXPECTED_IPV4_CIDR."
    else
        fail "Expected IPv4 address $EXPECTED_IPV4_CIDR was not found."
        ip -4 -br addr 2>/dev/null || true
    fi

    if ip -4 route show default 2>/dev/null | grep -q '^default'; then
        pass "A default route is configured."
        ip -4 route show default
    else
        fail "No IPv4 default route was found."
    fi
fi

if command -v ping >/dev/null 2>&1; then
    if ping -c 2 -W 3 8.8.8.8 >/dev/null 2>&1; then
        pass "Received replies from 8.8.8.8."
    else
        fail "Could not ping 8.8.8.8. ICMP may be filtered; check internet access separately."
    fi
else
    warn "'ping' is not installed; skipped the external IP connectivity check."
fi

if command -v getent >/dev/null 2>&1; then
    if getent hosts google.com >/dev/null 2>&1; then
        pass "DNS lookup for google.com succeeded."
    else
        fail "DNS lookup for google.com failed."
    fi
else
    warn "'getent' is not available; skipped the DNS lookup check."
fi

if command -v mountpoint >/dev/null 2>&1; then
    if mountpoint -q "$SHARED_FOLDER_MOUNT"; then
        pass "Shared folder is mounted at $SHARED_FOLDER_MOUNT."
    else
        fail "No mounted shared folder was found at $SHARED_FOLDER_MOUNT."
    fi
else
    warn "'mountpoint' is not installed; skipped the shared-folder mount check."
fi

printf '\nSummary: %d passed, %d failed, %d warning(s).\n'     "$PASS_COUNT" "$FAIL_COUNT" "$WARN_COUNT"

if [ "$FAIL_COUNT" -gt 0 ]; then
    exit 1
fi

exit 0
