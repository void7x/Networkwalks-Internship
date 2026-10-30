# Troubleshooting notes

These checks cover common issues listed in the Week 1 module and the related VirtualBox/Kali configuration.

## Kali has no internet access

1. Confirm that the NAT Network was created and uses `10.0.0.0/24`.
2. Confirm that the Kali adapter is attached to that NAT Network.
3. Check that no other VM on the same NAT Network is using `10.0.0.2`.
4. Check the Kali address and route:

   ```bash
   ip -4 -br addr
   ip route
   ```

5. The module notes `10.0.0.1` as the gateway value to try if internet access is not working.
6. Restart the Kali network connection or the VM after correcting the settings.

## IP address conflict

The Kali VM is expected to use `10.0.0.2/24`. Make sure another VM does not use the same address. If DHCP is enabled, ensure its allocation range does not hand out the statically assigned address to another guest.

## Internet by IP works, but domains do not

If `ping 8.8.8.8` works but `ping google.com` does not, check DNS configuration:

```bash
getent hosts google.com
cat /etc/resolv.conf
```

## Kali has no connectivity after a VirtualBox 7 / newer Kali update

The supplied module calls out a known connectivity issue for VirtualBox 7 with Kali Linux 2026.1 or newer. It gives the following commands as a possible fix for a connection named `Wired connection 1`:

```bash
sudo nmcli connection modify "Wired connection 1" ipv4.dad-timeout 0
sudo nmcli connection down "Wired connection 1"
sudo nmcli connection up "Wired connection 1"
```

First check the actual connection name:

```bash
nmcli connection show
```

If the connection has a different name, substitute that name in the commands. These commands are a version-specific troubleshooting step, not a required part of every installation.

## Shared folder is missing or permission is denied

1. Confirm the host Downloads directory is added under the Kali VM's **Shared Folders** settings.
2. Confirm the share name is `downloads` and Auto-mount is enabled.
3. Check whether it is mounted:

   ```bash
   ls -ld /media/sf_downloads
   mount | grep sf_downloads
   ```

4. If the mount exists but access is denied, add the Kali user to `vboxsf` and sign out and back in:

   ```bash
   sudo usermod -aG vboxsf "$USER"
   ```

5. Check that the VirtualBox guest integration components are installed and working.

## Clipboard or drag and drop does not work

Power off the VM and recheck **Settings → General → Advanced**. Both Shared Clipboard and Drag and Drop should be set to **Bidirectional**. Guest integration support may also be required for these features.

## Useful checks to collect when asking for help

```bash
ip -4 -br addr
ip route
nmcli connection show
ping -c 3 8.8.8.8
ping -c 3 google.com
```

Remove any personal information from terminal output before sharing it publicly.
