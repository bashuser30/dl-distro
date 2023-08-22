# dl-distro

dl-distro is a script that was first designed to automatically download and verify Arch ISOs every month.
I am currently adding support for various distributions when I get the chance. [Supported Distributions](#supported-distributions)

This script will automatically import GPG signing keys to verify the signatures.
Please manually verify them yourself via the provided links in the script's comments.

**Do not run this script if you do not want to import the developers GPG signing keys.**

## Dependencies

This script only needs these three dependencies:

- bash
- gnupg
- wget

## AUR Package

There is an AUR package available:

```
git clone https://aur.archlinux.org/dl-distro.git
cd dl-distro
makepkg -si
```

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
- 2023.2
- Kali Weekly

### Mint
- 21.2
- Debian Edition 5

### Ubuntu
- 23.04
- 22.04.3 LTS
