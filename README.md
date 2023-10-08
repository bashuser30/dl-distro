# dl-distro

`dl-distro` is a Bash script designed to download and verify a chosen ISO from a list of supported distributions. It fetches the necessary details for downloading and verification using `jq` and the provided `distro_data.json` file. I am expanding the list of supported distributions when time permits. Your contributions are always appreciated, please see [Contributing](#contributing).

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
    -s, --spider    Use wget --spider to check if ISO exists without downloading it.
    -h, --help      Display this usage prompt.

DISTROS:
    arch
    debian
    fedora
    kali
    mint
    opensuse
    tails
    ubuntu
    whonix

EXAMPLES:
    dl-distro arch
    dl-distro arch /run/media/$USER/Ventoy
    dl-distro -s arch
```

### Error Importing Signing Key

In the event you are unable to import the desired distro's signing key from the keyserver, fallback keys are provided in the `fallback_keys` directory of the repository. You can manually import the required key using:

```
gpg --import fallback_keys/distro.asc
```

If you prefer not to use the provided fallback keys, you can manually find and import the required key yourself. Once done, `dl-distro` will be able to complete the verification process.

### Issues and Feedback

Encountered an issue or have feedback? Please open an issue on the [repository's issue tracker](https://codeberg.org/bashuser30/dl-distro/issues) detailing any problems you encounter, or suggestions you might have. This will help continue to improve `dl-distro`.

## Contributing

Thank you for considering contributing to `dl-distro`.

Here are a few guidelines to keep in mind:

- **Code Style/Flow**: Please ensure your code adheres to the existing style and flow of the project.
- **Simplicity**: When adding support for new distributions or features, try to keep it simple. Ideally, additions should mainly involve creating a new download function and adding data to `distro_data.json`.
- **Open an Issue First**: Before you start writing code, it's a good idea to open an issue to discuss your intended changes. This way, we can avoid any unnecessary work or potential conflicts with planned features.
- **Pull Requests**: Once you're ready to share your changes, please open a pull request. Ensure your PR has a descriptive title and explains the purpose and context of the change.

## Supported Distributions

| Distribution | Version   | Options |
|--------------|-----------|---------|
| [Arch](https://archlinux.org) | 2023.09.01 | |
| [Debian](https://debian.org)  | 12.2.0 | Netinst <br> Live |
| [Fedora](https://fedoraproject.org) | 38 | Everything <br> Server <br> Silverblue <br> Spins <br> Workstation |
| [Kali](https://kali.org) | 2023.3, Weekly | Live <br> QEMU <br> VirtualBox <br> VMware <br> Hyper-V <br> Installer <br> Netinst <br> Purple |
| [Mint](https://linuxmint.com) | 21.2, Debian Edition 6 | Cinnamon <br> MATE <br> Xfce <br> Edge |
| [openSUSE](https://opensuse.org) | Leap 15.5, Tumbleweed | DVD <br> Netinst <br> KVM <br> Hyper-V <br> VMware <br> Cloud |
| [Tails](https://tails.net) | 5.18 | USB <br> DVD/VM |
| [Ubuntu](https://ubuntu.com) | 23.04, 22.04.3 | Desktop <br> Server |
| [Whonix](https://whonix.org) | 17.0.3.0, 17.0.4.5 | QEMU <br> VirtualBox |

## License

All files in this repository are licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
