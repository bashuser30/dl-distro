# dl-distro

`dl-distro` is a Bash script that simplifies the downloading and verification
of operating system images. It utilizes `jq` and a JSON file for data
retrieval, and `wget` for downloading image files, along with their signature
and checksum files.

The script uses `gpg` for signature verification and checks the integrity of
the downloaded image file with the relevant checksum algorithm. It alerts users
of any tampering or corruption, and removes files that fail these checks.

Currently, `dl-distro` supports **408** images from **20** [distributions.](
#supported-distributions).

## Dependencies

- `bash`
- `coreutils`
- `gnupg` (optional)
- `jq`
- `minisign` (optional: Void Linux verification)
- `signify` (optional: OpenBSD verification)
- `wget`

## Installation

### AUR

You can either use your preferred AUR helper or manually clone and build the
package:

```
git clone https://aur.archlinux.org/dl-distro.git
cd dl-distro
makepkg -si
```

### Non-AUR

If you can't access the AUR, you should download the `dl-distro` script and
place it in your `$PATH`.

#### Install

```
wget https://codeberg.org/bashuser30/dl-distro/raw/branch/master/dl-distro
chmod +x dl-distro
sudo mv dl-distro /usr/local/bin
```

To update the script, run the above commands again.

#### Uninstall

Run `dl-distro` with the `-p` option to purge all stored data, then remove the
script:

```
dl-distro -p
sudo rm /usr/local/bin/dl-distro
```

## Usage

`dl-distro` relies on there being a locally stored JSON file. Use the `-a`
option to toggle on and off automatic updating of the file. The `-u` option
will force update the JSON file:

```
dl-distro -a
dl-distro -u
```

To download an OS image, you need to provide a distribution name or a jq path:

```
dl-distro debian
dl-distro debian.netinst.amd64
dl-distro debian.netinst.amd64 ~/Downloads
```

Use `-h` or `--help` for the list of distribution names and options available.

If you wish to override any data found in the JSON file, you can edit it and
place the file in one of these locations:

- `$XDG_CONFIG_HOME/dl-distro/data.json`
- The directory `dl-distro` is located in

This is useful if you need to override the mirror to a faster one. Do note
however, most distributions use a redirecting system, so you should get the
closest mirror to your location.

Please open an issue on the [repository's issue tracker](
https://codeberg.org/bashuser30/dl-distro/issues) detailing any problems you
encounter, or suggestions you might have.

## Supported Distributions

`dl-distro` aims to consistently provide support for the latest versions
officially supported by distribution maintainers. It is continuously updated to
align with the latest releases on the same day they become available.

- [**AlmaLinux OS**](https://almalinux.org)
- [**Alpine Linux**](https://alpinelinux.org)
- [**Arch Linux**](https://archlinux.org)
- [**Debian**](https://debian.org)
- [**Fedora Linux**](https://fedoraproject.org)
- [**GParted Live**](https://gparted.org)
- [**Kali Linux**](https://kali.org)
- [**Linux Mint**](https://linuxmint.com)
- [**NixOS**](https://nixos.org)
- [**OpenBSD**](https://openbsd.org)
- [**openSUSE**](https://opensuse.org)
- [**Parrot OS**](https://parrotlinux.org)
- [**Qubes OS**](https://qubes-os.org)
- [**Rocky Linux**](https://rockylinux.org)
- [**Slackware Linux**](https://www.slackware.com)
- [**Solus**](https://getsol.us)
- [**Tails**](https://tails.net)
- [**Ubuntu**](https://ubuntu.com)
- [**Void Linux**](https://voidlinux.org)
- [**Whonix**](https://whonix.org)

## Mirrors

- [Codeberg (main)](https://codeberg.org/bashuser30/dl-distro)
- [GitLab](https://gitlab.com/bashuser30/dl-distro)
- [GitHub](https://github.com/bashuser30/dl-distro)

## License

All files in this repository are licensed under the GNU General Public License
v3.0 - see the [LICENSE](LICENSE) file for details.
