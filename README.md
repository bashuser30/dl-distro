# dl-distro

`dl-distro` is a Bash script designed to download and verify a chosen ISO from a list of supported distributions. It fetches the necessary details for downloading and verification using the provided `distro_data.json` file. I am expanding the list of supported distributions when time permits. Your contributions are always appreciated, please see [Contributing](#contributing).

Currently, `dl-distro` supports downloading 57 different ISOs from 5 different distributions, with the majority being from Debian and Kali. For a detailed list, see [Supported Distributions](#supported-distributions).

> **NOTE**: This script will automatically import GPG signing keys to verify the signatures. **DO NOT** run this script if you don't want to import the GPG signing keys of the developers.

## Dependencies

- bash
- gnupg
- jq
- wget

## Install

### AUR Package

```
git clone https://aur.archlinux.org/dl-distro.git
cd dl-distro
makepkg -si
```

### Non AUR Install

If you can't access the AUR, you can directly `git clone` the repo.

```
git clone https://codeberg.org/codeberge/dl-distro.git
```

Or you can [download the latest release](https://codeberg.org/codeberge/dl-distro/releases/latest).

Make sure the `distro_data.json` file is always in one of these locations:

- `$HOME/.config/dl-distro/distro_data.json`
- The directory where `dl-distro` is located
- `/usr/share/dl-distro/distro_data.json`

`dl-distro` will look for the file in those places, in the order they are listed.

## Usage

```
USAGE:
    dl-distro [distro] [path | --spider]

OPTIONS:
    --spider    Use wget --spider to check if the file exists without actually downloading it.

DISTROS:
    arch
    debian
    kali
    mint
    ubuntu

EXAMPLES:
    dl-distro arch
    dl-distro arch /run/media/$USER/Ventoy
    dl-distro arch --spider
```

## Supported Distributions

### [Arch](https://archlinux.org)
- **2023.09.01**

### [Debian](https://debian.org)
- **12.1.0**
  - Net Installer: amd64, arm64, armel, armhf, i386, mips64el, mipsel, ppc64el, s390x
  - Live Installer: Cinnamon, GNOME, KDE, LXDE, LXQt, MATE, Standard, Xfce

### [Kali](https://kali.org)
- **2023.3 & Weekly**
  - Live, QEMU, VirtualBox, VMware, Hyper-V, Installer, Net Installer, Purple
  - Architectures: amd64, arm64, i386 (where supported)

### [Mint](https://linuxmint.com)
- **21.2**
  - Cinnamon
  - MATE
  - Xfce
- **Debian Edition 5**

### [Ubuntu](https://ubuntu.com)
- **23.04 & 22.04.3 (LTS)**
  - Desktop
  - Server

## Contributing

Thank you for considering contributing to `dl-distro`.

Here are a few guidelines to keep in mind:

1. **Code Style/Flow**: Please ensure your code adheres to the existing style and flow of the project.

2. **Simplicity**: When adding support for new distributions or features, try to keep it simple. Ideally, additions should mainly involve creating a new download function and updating the `distro_data.json` file.

3. **Open an Issue First**: Before you start writing code, it's a good idea to open an issue to discuss your intended changes. This way, we can avoid any unnecessary work or potential conflicts with planned features.

4. **Pull Requests**: Once you're ready to share your changes, please open a pull request. Ensure your PR has a descriptive title and explains the purpose and context of the change.

Our primary goal is to keep `dl-distro` efficient, simple, and easy to use.
