# Network verification

Run these checks in a terminal inside the Kali Linux guest after applying the network settings.

## 1. Check the IPv4 address

```bash
ip -4 -br addr
```

The active wired interface should have the required address:

```text
10.0.0.2/24
```

The interface name may be different between installations (for example, `eth0` or `enp0s3`).

## 2. Check the default route

```bash
ip route
```

Confirm that a default route exists and that it uses the NAT Network gateway. The module identifies `10.0.0.1` as a gateway value to try when internet access needs troubleshooting.

## 3. Check internet connectivity

```bash
ping -c 3 8.8.8.8
```

Replies indicate that packets can reach the external IP address. If this fails, check the VirtualBox NAT Network, adapter selection, gateway and address conflicts first.

Some networks block ICMP echo requests. A failed ping alone is not always proof that all internet traffic is unavailable.

## 4. Check DNS resolution

```bash
ping -c 3 google.com
```

This test checks name resolution as well as connectivity. If the IP ping succeeds but the hostname test fails, review the guest DNS configuration.

A second way to inspect name resolution is:

```bash
getent hosts google.com
```

## 5. Check the shared folder

```bash
ls -ld /media/sf_downloads
mount | grep sf_downloads
```

The typical auto-mount location for a VirtualBox shared folder named `downloads` is `/media/sf_downloads`. The actual mount can differ if the folder name or guest configuration differs.

## 6. Run the bundled check script

From the repository directory inside Kali:

```bash
chmod +x scripts/verify-lab.sh
./scripts/verify-lab.sh
```

The script checks the expected address, presence of a default route, ICMP connectivity, DNS resolution and shared-folder mount. Read each result; a script run should be performed on the configured guest to record the real status of that machine.

The expected address and shared-folder mount can be overridden when needed:

```bash
EXPECTED_IPV4_CIDR=10.0.0.2/24 \
SHARED_FOLDER_MOUNT=/media/sf_downloads \
./scripts/verify-lab.sh
```
