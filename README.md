# dl-distro

Bash script for downloading and verifying OS images.

## Description

dl-distro aims to make downloading and verifying OS images quick and easy.

It uses `jq` for data retrieval, `wget` for downloading, `gpg` for signature
verification, and validates checksums with the relevant algorithm.

It currently supports **415** images from **20** [distributions](#supported-distributions).

## Dependencies

- `bash`
- `coreutils`
- `gnupg` (optional)
- `jq`
- `minisign` (optional: Void Linux verification)
- `signify`/`signify-openbsd (deb)` (optional: OpenBSD verification)
- `wget`

## Installation

### AUR

Use your preferred AUR helper to install `dl-distro` or `dl-distro-git`.

[![dl-distro](https://img.shields.io/aur/version/dl-distro?color=1793d1&label=dl-distro&logo=arch-linux&style=for-the-badge)](https://aur.archlinux.org/packages/dl-distro)
[![dl-distro-git](https://img.shields.io/aur/version/dl-distro-git?color=1793d1&label=dl-distro-git&logo=arch-linux&style=for-the-badge)](https://aur.archlinux.org/packages/dl-distro-git)

Or clone and build:

```
git clone https://aur.archlinux.org/dl-distro.git
cd dl-distro
makepkg -si
```

### Non-AUR

#### Install

`git clone` the repository and use the installer script inside the cloned
repository:

```
git clone https://codeberg.org/bashuser30/dl-distro.git
cd dl-distro
sudo ./installer.sh install
```

#### Update

```
git pull
sudo ./installer.sh install
```

#### Uninstall

```
sudo ./installer.sh uninstall
```

## Usage

It is recommended to generate a default config file using the `-c` option. This
config file has several values you can change, including a default download
directory:

```
dl-distro -c
```

See `man dl-distro` for more information about usage.

### Examples

Main menu with all distributions. Pick one and choose an image to download:

```
dl-distro
```

Provide a distribution name to skip the main menu. This will prompt you with
additional choice menus, if necessary:

```
dl-distro -d debian
```

You can skip the menus and start a download directly if you provide a JSON
query. The names used in the JSON query correspond directly to those in the
menus:

```
dl-distro -d debian.netinst.amd64
```

Download and verify the latest Debian network installer amd64 image, saving to
the ~/Downloads directory:

```
dl-distro -d debian.netinst.amd64 -p ~/Downloads
```

### Updating the JSON file

dl-distro relies on there being a locally stored JSON file. By default, this
file will be automatically updated upon runtime.

Use the `-a` option to toggle automatic updating of the file.

The `-u` option will force update the file.

## Supported Distributions

dl-distro aims to consistently support the latest versions officially
maintained, updating with new releases on their release day.

- [AlmaLinux OS](https://almalinux.org)
- [Alpine Linux](https://alpinelinux.org)
- [Arch Linux](https://archlinux.org)
- [Debian](https://debian.org)
- [Fedora Linux](https://fedoraproject.org)
- [GParted Live](https://gparted.org)
- [Kali Linux](https://kali.org)
- [Linux Mint](https://linuxmint.com)
- [NixOS](https://nixos.org)
- [OpenBSD](https://openbsd.org)
- [openSUSE](https://opensuse.org)
- [Parrot OS](https://parrotsec.org)
- [Qubes OS](https://qubes-os.org)
- [Rocky Linux](https://rockylinux.org)
- [Slackware Linux](http://slackware.com)
- [Solus](https://getsol.us)
- [Tails](https://tails.net)
- [Ubuntu](https://ubuntu.com)
- [Void Linux](https://voidlinux.org)
- [Whonix](https://whonix.org)

## Repository Links

- [Codeberg](https://codeberg.org/bashuser30/dl-distro)
- [GitLab (read-only)](https://gitlab.com/bashuser30/dl-distro)
- [GitHub (read-only)](https://github.com/bashuser30/dl-distro)

## License

All files in this repository are licensed under the GNU General Public License
v3.0 - see the [LICENSE](LICENSE) file for details.
