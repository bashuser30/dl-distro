# dl-distro

`dl-distro` is a Bash script designed to download and verify a chosen ISO from a list of supported distributions. It fetches the necessary details for downloading and verification using `jq` and the provided `distro_data.json` file. I am expanding the list of supported distributions when time permits. Your contributions are always appreciated, please see the [contributing file](https://codeberg.org/bashuser30/dl-distro/src/branch/master/CONTRIBUTING.md).

Currently, `dl-distro` supports downloading **118** different ISOs from **9** different distributions. For more details see [Supported Distributions](#supported-distributions).

> **NOTE**: This script will automatically import GPG signing keys to verify the signatures. **DO NOT** run this script if you don't want to import the GPG signing keys of the developers.

## Dependencies

- bash
- gnupg
- jq
- wget

## Install

### AUR Package

You can either use your preferred AUR helper or manually clone and build the package. Both `dl-distro` and `dl-distro-git` are available.

Manual clone and build:

```
git clone https://aur.archlinux.org/dl-distro.git
cd dl-distro
makepkg -si
```

### Non AUR Install

If you can't access the AUR, you have two options:

1. [Download the latest release](https://codeberg.org/bashuser30/dl-distro/releases/latest).
2. Or you can `git clone` the repository:

```
git clone https://codeberg.org/bashuser30/dl-distro.git
```

## Usage

### JSON File

As previously mentioned, `jq` is required to read the provided JSON file. `dl-distro` will look for the file in the listed locations below, in the order they are listed.

- `$HOME/.config/dl-distro/distro_data.json`
- The directory where `dl-distro` is located
- `/usr/share/dl-distro/distro_data.json`

### Script Usage

```
USAGE:
    dl-distro [OPTIONS] [DISTRO] [PATH]

OPTIONS:
    -h, --help        Display this usage message.
    -n, --noverify    Skip GPG key fetching and verification.
    -s, --spider      Use wget --spider to check if ISO exists without downloading it.

DISTROS:
    arch      opensuse
    debian    tails
    fedora    ubuntu
    kali      whonix
    mint

EXAMPLES:
    dl-distro arch
    dl-distro arch /run/media/$USER/Ventoy
    dl-distro -s arch
```

### Error Importing Signing Key

As highlighted earlier, this script automatically imports GPG keys. If you encounter issues importing a distro's key, consider:

1. Manually sourcing and importing the key.
2. Using the `-n` option to bypass GPG key retrieval and verification.

For security, the first option is recommended. However, if GPG verification isn't a concern, you may skip it.

### Issues and Feedback

Encountered an issue or have feedback? Please open an issue on the [repository's issue tracker](https://codeberg.org/bashuser30/dl-distro/issues) detailing any problems you encounter, or suggestions you might have. This will help continue to improve `dl-distro`.

## Supported Distributions

| Distribution | Version   | Options |
|--------------|-----------|---------|
| [Arch](https://archlinux.org) | 2023.10.14 | |
| [Debian](https://debian.org)  | 12.2.0 | Netinst <br> Live |
| [Fedora](https://fedoraproject.org) | 38 | Everything <br> Server <br> Silverblue <br> Spins <br> Workstation |
| [Kali](https://kali.org) | 2023.3, Weekly | Live <br> QEMU <br> VirtualBox <br> VMware <br> Hyper-V <br> Installer <br> Netinst <br> Purple |
| [Mint](https://linuxmint.com) | 21.2, Debian Edition 6 | Cinnamon <br> MATE <br> Xfce <br> Edge |
| [openSUSE](https://opensuse.org) | Leap 15.5, Tumbleweed | DVD <br> Netinst <br> KVM <br> Hyper-V <br> VMware <br> Cloud |
| [Tails](https://tails.net) | 5.18 | USB <br> DVD/VM |
| [Ubuntu](https://ubuntu.com) | 23.10, 22.04.3 | Desktop <br> Server |
| [Whonix](https://whonix.org) | 17.0.3.0, 17.0.4.5 | QEMU <br> VirtualBox |

## License

All files in this repository are licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
