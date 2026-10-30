# Setup guide

This guide follows the Week 1 lab requirements. Menu names may differ slightly depending on the installed VirtualBox release.

## 1. Prepare the host

1. Install 7-Zip.
2. Install Oracle VirtualBox using the installer for the host operating system.
3. Download the Kali Linux VirtualBox image from the official Kali download page.
4. Keep the downloaded VM files and the host Downloads folder in a location with enough free disk space.

Official downloads:

- [7-Zip](https://www.7-zip.org/)
- [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Kali Linux](https://www.kali.org/get-kali/)

## 2. Create the NAT Network

1. Open VirtualBox.
2. Open **Tools → Network → NAT Networks** (the location can vary by VirtualBox version).
3. Create a NAT Network.
4. Set its IPv4 network to `10.0.0.0` with prefix length `24`, equivalent to `10.0.0.0/24`.
5. Save the network settings.
6. If DHCP is enabled, check its pool and make sure it cannot assign `10.0.0.2` to another VM.

## 3. Import and configure Kali Linux

1. Import the downloaded Kali VirtualBox appliance, or open the supplied VM in VirtualBox.
2. Select the Kali VM and open **Settings → Network**.
3. Enable the network adapter.
4. Set **Attached to** as **NAT Network**.
5. Select the NAT Network created in the previous step.
6. Start Kali Linux.

## 4. Set the Kali IPv4 address

Configure the active wired connection in Kali with the static address:

- Address: `10.0.0.2`
- Prefix: `24` (subnet mask `255.255.255.0`)
- Gateway: the NAT Network gateway; the module notes `10.0.0.1` as the value to try when internet access has issues.
- DNS: use a resolver reachable from the guest network.

After applying the settings, reconnect the network connection and verify the result with:

```bash
ip -4 -br addr
ip route
```

The active interface should show `10.0.0.2/24`, and `ip route` should show a default route.

## 5. Enable clipboard and drag and drop

With the Kali VM powered off:

1. Select the VM and open **Settings → General → Advanced**.
2. Set **Shared Clipboard** to **Bidirectional**.
3. Set **Drag and Drop** to **Bidirectional**.
4. Save the settings.

## 6. Add the shared Downloads folder

With the VM powered off:

1. Open **Settings → Shared Folders**.
2. Add the host machine's Downloads directory.
3. Set the folder name to `downloads`.
4. Enable **Auto-mount** and **Make Permanent**.
5. Start Kali and check for the typical mount path:

```bash
ls -ld /media/sf_downloads
```

If the folder is mounted but the current user cannot access it, add the user to the VirtualBox shared-folder group and sign out and back in:

```bash
sudo usermod -aG vboxsf "$USER"
```

Shared-folder mounting also depends on the appropriate VirtualBox guest integration components being available in Kali.

## 7. Check internet and create a snapshot

Run the commands below inside Kali:

```bash
ping -c 3 8.8.8.8
ping -c 3 google.com
```

The first command checks IP connectivity. The second also depends on DNS resolution.

Once the base configuration is working, shut down or pause the VM as appropriate and take a VirtualBox snapshot. Give it a clear name such as `week-1-base-lab`.

## 8. Final checklist

- [ ] VirtualBox installed on the host.
- [ ] NAT Network created with `10.0.0.0/24`.
- [ ] Kali VM imported and starts correctly.
- [ ] Kali is attached to the intended NAT Network.
- [ ] Kali uses `10.0.0.2/24`.
- [ ] Default route and internet access checked.
- [ ] DNS resolution checked.
- [ ] Shared Clipboard set to Bidirectional.
- [ ] Drag and Drop set to Bidirectional.
- [ ] Host Downloads directory shared as `downloads`.
- [ ] Shared folder mount checked inside Kali.
- [ ] Base VM snapshot created.
