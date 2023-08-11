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
git clone https://aur.archlinux.org/dl-distro-git.git
cd dl-distro-git
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

## Future of dl-distro

This is a list of new features/changes and distributions I would like to add in the future.

### TO-DO

- Add support for importing GPG key from a file.
- Add support for distributions with non GPG verification (OpenBSD, Void).

### New Distributions

- AlmaLinux: [key](https://repo.almalinux.org/almalinux/RPM-GPG-KEY-AlmaLinux-9)
- Alpine: [key](https://alpinelinux.org/downloads)
- Artix: [key](https://artixlinux.org/download.php)
- Deepin: No key found
- Devuan: [key](https://www.devuan.org/os/keyring)
- Fedora: [key](https://fedoraproject.org/security)
- FreeBSD: [key](https://docs.freebsd.org/en/books/handbook/pgpkeys)
- Gentoo: [key](https://www.gentoo.org/downloads/signatures)
- NixOS: No key found
- OpenBSD: Requires signify
- openSUSE: [key](https://en.opensuse.org/SDB:Download_help#Checksums)
- Qubes OS: [key](https://www.qubes-os.org/security/verifying-signatures)
- Rocky: [key](https://rockylinux.org/keys)
- Slackware: [key](https://docs.slackware.com/slackware:faq#how_can_i_verify_my_copy_of_slackware_linux)
- Solus: [key](https://downloads.getsol.us/gpg/solus-releng-pub.gpg)
- Tails: [key](https://tails.net/doc/about/openpgp_keys/index.en.html)
- Void: Requires minisign
- Whonix: [key](https://www.whonix.org/wiki/KVM/Project_Signing_Key)
