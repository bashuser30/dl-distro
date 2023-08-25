# dl-distro

dl-distro is a script that was first designed to automatically download and verify Arch ISOs every month.
I am currently adding support for various distributions when I get the chance. [Supported Distributions](#supported-distributions)

**This script will automatically import GPG signing keys to verify the signatures. Do not run this script if you do not want to import the developers GPG signing keys.**

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

Make sure the `distro_data.json` file is always in one of these locations:

- `$HOME/.config/dl-distro/distro_data.json`
- `/usr/share/dl-distro/distro_data.json`
- The directory `dl-distro` is ran from

`dl-distro` will look for the file in those places, in the order they are listed.

## Usage

```
USAGE:
    dl-distro <distro> [path]

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

### Arch
- 2023.08.01

### Debian
- 12.1.0

### Kali
- 2023.3
- Kali Weekly

### Mint
- 21.2
- Debian Edition 5

### Ubuntu
- 23.04
- 22.04.3 LTS
