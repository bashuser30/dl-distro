# dl-distro

`dl-distro` is a Bash script that was first designed to automatically download and verify Arch ISOs every month.

Currently, `dl-distro` supports downloading 57 different ISOs from 5 different distributions, see [Supported Distributions](#supported-distributions) and [Distribution ISO Breakdown](#distribution-iso-breakdown). I am adding support for more distributions when I get the chance. Contributions are welcome.

**This script will automatically import GPG signing keys to verify the signatures. DO NOT run this script if you DO NOT  want to import the GPG signing keys of the developers.**

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

If you can't access the AUR you can `git clone` the repo.

```
git clone https://codeberg.org/codeberge/dl-distro.git
```

Or you can [download the latest release](https://codeberg.org/codeberge/dl-distro/releases/latest).

Make sure the `distro_data.json` file is always in one of these locations:

- `$HOME/.config/dl-distro/distro_data.json`
- The directory `dl-distro` is located in
- `/usr/share/dl-distro/distro_data.json`

`dl-distro` will look for the file in those places, in the order they are listed.

## Usage

```
USAGE:
    dl-distro [distro] [path]

DISTROS:
    arch
    debian
    kali
    mint
    ubuntu

EXAMPLES:
    dl-distro arch
    dl-distro arch /run/media/$USER/Ventoy
```

## Supported Distributions

### [Arch](https://archlinux.org)
- 2023.09.01

### [Debian](https://debian.org)
- 12.1.0

### [Kali](https://kali.org)
- 2023.3
- Kali Weekly

### [Mint](https://linuxmint.com)
- 21.2
- Debian Edition 5

### [Ubuntu](https://ubuntu.com)
- 23.04
- 22.04.3 (LTS)

## Distribution ISO Breakdown

Here's a breakdown of the available ISOs per distribution:

- **Arch**: 1 ISO
- **Debian**: 17 ISOs
- **Kali**: 31 ISOs
- **Mint**: 4 ISOs
- **Ubuntu**: 4 ISOs

This breakdown illustrates how `dl-distro` can handle a multitude of distribution combinations.
