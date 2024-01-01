# dl-distro

Bash script for downloading and verifying OS images

## Description

dl-distro aims to make downloading and verifying OS images quick and easy.

It uses `jq` for data retrieval, `wget` for downloading, `gpg` for signature
verification, and validates checksums with the relevant algorithm.

It currently supports **408** images from **20** [distributions](#supported-distributions).

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

Use your preferred AUR helper to install `dl-distro` or `dl-distro-git`.

[![dl-distro](https://img.shields.io/aur/version/dl-distro?color=1793d1&label=dl-distro&logo=arch-linux&style=for-the-badge)](https://aur.archlinux.org/packages/dl-distro)
[![dl-distro-git](https://img.shields.io/aur/version/dl-distro-git?color=1793d1&label=dl-distro-git&logo=arch-linux&style=for-the-badge)](https://aur.archlinux.org/packages/dl-distro-git)

```
git clone https://aur.archlinux.org/dl-distro.git
cd dl-distro
makepkg -si
```

### Non-AUR

`git clone` the repository and run the `installer.sh` script inside the cloned
repository:

#### Install

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

See `man dl-distro` and `dl-distro --help` for more information about usage.

### Downloading an OS Image

Provide a distribution name to download an OS image. This will prompt you with
additional choice menus, if necessary.

```
dl-distro arch
```

You can skip the menus and start a download directly if you provide a jq path.
The names used in the jq path correspond directly to those in the menus:

```
dl-distro arch.latest
```

### Updating the JSON file

`dl-distro` relies on there being a locally stored JSON file.

Use the `-a` option to toggle on and off automatic updating of the file:

```
dl-distro -a
```

The `-u` option will force update the file:

```
dl-distro -u
```

Please open an issue on the [repository's issue tracker](https://codeberg.org/bashuser30/dl-distro/issues)
detailing any problems you encounter, or suggestions you might have.

## Supported Distributions

`dl-distro` aims to consistently support the latest versions officially
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
- [ParrotOS](https://parrotsec.org)
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
