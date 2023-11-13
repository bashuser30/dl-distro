# dl-distro

`dl-distro` is a Bash script that simplifies the downloading and verification
of operating system images. It uses `jq` and a JSON file to retrieve data, and
`wget` to download image files, their signatures, and checksums.

The script will use `gpg` for signature verification and will check the
integrity of the images with relevant checksum algorithms. It alerts users to
any tampering or corruption and removes files that fail these checks.

Currently, `dl-distro` supports **347** images from **18** distributions.

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
package. Both `dl-distro` and `dl-distro-git` are available.

```
git clone https://aur.archlinux.org/dl-distro.git
cd dl-distro
makepkg -si
```

### Non AUR

If you can't access the AUR, you should `git clone` the repository.

#### Install

```
git clone https://codeberg.org/bashuser30/dl-distro.git
cd dl-distro
sudo cp dl-distro /usr/bin/dl-distro
```

#### Update

```
git pull
sudo cp dl-distro /usr/bin/dl-distro
```

#### Uninstall

```
sudo rm /usr/bin/dl-distro
```

If you imported any GPG keys, they are located in two possible directories:

```
rm -rf $XDG_DATA_HOME/dl-distro
rm -rf $HOME/.local/share/dl-distro
```

## JSON File

`dl-distro` will look for the JSON file in these locations before fetching the
latest file from the master branch:

- `$XDG_CONFIG_HOME/dl-distro/data.json`
- `$HOME/.config/dl-distro/data.json`
- The directory `dl-distro` is located in

This will allow you to override any data if you wish, such as a URL to a faster
mirror. Do note however, most distributions use a redirecting system, so you
should get the closest mirror to your location.

If the JSON file isn't found in these locations, it fetches the latest file
from the master branch. This is so users won't have to update every time a
distribution has a version change. Only additions to `dl-distro` itself or
incompatibilities introduced into the JSON file will require an update.

## Usage

```
USAGE: dl-distro [OPTIONS] [DISTRO] [PATH]

  -h, --help       Display this usage message
  -i, --import     Import a GPG key: dl-distro -i /path/to/key.asc
  -l, --list-keys  List the saved GPG keys
  -n, --no-verify  Skip key fetching and verification
  -s, --spider     Check image availability without downloading

DISTROS
  alma    gparted   parrot     ubuntu
  alpine  kali      qubes      void
  arch    mint      slackware  whonix
  debian  openbsd   solus
  fedora  opensuse  tails

EXAMPLES
  dl-distro arch
  dl-distro arch /run/media/$USER/Ventoy
  dl-distro -n arch
```

## Error Importing Signing Key

`dl-distro` automatically imports GPG keys from the Ubuntu keyserver,
`hkps://keyserver.ubuntu.com`. If you encounter issues importing a distro's
key, usually related to keyserver connections, you will need to manually source
it and import it, or skip fetching and verification with the `-n` option.

If you decide to find and import the key, simply run:

```
dl-distro -i /path/to/key.asc
```

## Issues and Feedback

Encountered an issue or have feedback? Please open an issue on the
[repository's issue tracker](https://codeberg.org/bashuser30/dl-distro/issues)
detailing any problems you encounter, or suggestions you might have. This will
help continue to improve `dl-distro`.

## Supported Distributions

`dl-distro` aims to support all images provided by the respective distribution
maintainers.

If an image from these distributions is not supported, submitting an issue
under the `distro addition` label is encouraged.

| Distribution | Version(s) |
|--------------|-----------|
| [AlmaLinux OS](https://almalinux.org)| 9.3 <br> 8.8 |
| [Alpine Linux](https://alpinelinux.org) | 3.18.4 |
| [Arch Linux](https://archlinux.org) | 2023.11.01 |
| [Debian](https://debian.org)  | 12.2.0 |
| [Fedora Linux](https://fedoraproject.org) | 39 |
| [GParted Live](https://gparted.org) | 1.5.0-6 |
| [Kali Linux](https://kali.org) | 2023.3 <br> Weekly |
| [Linux Mint](https://linuxmint.com) | 21.2 <br> Debian Edition 6 |
| [OpenBSD](https://openbsd.org) | 7.4 |
| [openSUSE](https://opensuse.org) | Leap 15.5 <br> Tumbleweed |
| [Parrot OS](https://parrotlinux.org) | 5.3 |
| [Qubes OS](https://qubes-os.org) | 4.1.2 |
| [Slackware Linux](https://www.slackware.com) | 15.0 |
| [Solus](https://getsol.us) | 4.4 |
| [Tails](https://tails.net) | 5.19 |
| [Ubuntu](https://ubuntu.com) | 23.10.1 (mantic) <br> 23.04 (lunar) <br> 22.04.3 LTS (jammy) <br> 20.04.6 LTS (focal) <br> 18.04.6 LTS (bionic) <br> 16.04.7 LTS (xenial) <br> 14.04.6 LTS (trusty) |
| [Void Linux](https://voidlinux.org) | 20230628 |
| [Whonix](https://whonix.org) | 17.0.3.0 (qemu) <br> 17.0.4.5 (virtualbox) |

## Mirrors

- [Codeberg (main)](https://codeberg.org/bashuser30/dl-distro)
- [GitLab](https://gitlab.com/bashuser30/dl-distro)
- [GitHub](https://github.com/bashuser30/dl-distro)

## License

All files in this repository are licensed under the GNU General Public License
v3.0 - see the [LICENSE](LICENSE) file for details.
