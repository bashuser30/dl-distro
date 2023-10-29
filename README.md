# dl-distro

`dl-distro` is a Bash script that simplifies the process of downloading and verifying Linux ISOs. Using `jq` and a JSON file, the script fetches the necessary data. It downloads the selected ISO file, along with its accompanying signature and checksum files, using `wget`. Finally, it employs `gpg` with the retrieved GPG key to verify the signature, and the appropriate `shasum` algorithm to confirm the checksums, issuing error notifications if there are instances of tampering or corruption.

Currently, `dl-distro` supports downloading **275** different ISOs from **14** distinct distributions.

The list of [Supported Distributions](#supported-distributions) continues to expand as time permits. Your contributions are always appreciated. Please see the [contributing file](CONTRIBUTING.md) for more information.

> **Note**<br>
> By default, dl-distro imports GPG keys into a new keyring, leaving your user's keyring untouched. If you prefer to skip GPG key retrieval and verification, you have the option to disable this feature. See [Usage](#usage) for details.

## Dependencies

- bash
- coreutils
- gnupg (optional)
- jq
- minisign (optional: Void Linux verification)
- signify (optional: OpenBSD verification)
- wget

## Installation

### AUR

You can either use your preferred AUR helper or manually clone and build the package. Both `dl-distro` and `dl-distro-git` are available.

```
git clone https://aur.archlinux.org/dl-distro.git
cd dl-distro
makepkg -si
```

### Non AUR

If you can't access the AUR, you should `git clone` the repository:

```
git clone https://codeberg.org/bashuser30/dl-distro.git
cd dl-distro
```

#### Install

```
sudo cp dl-distro /usr/bin/dl-distro
sudo chmod +x /usr/bin/dl-distro
```

#### Update

```
git pull
sudo cp dl-distro /usr/bin/dl-distro
sudo chmod +x /usr/bin/dl-distro
```

You will only need to update `dl-distro` upon new additions being added to it. Changes to the [JSON file](#json-file), like a version bump, do not require an update.

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

`dl-distro` will look for the JSON file in these locations before fetching the latest file from the master branch:

- `$HOME/.config/dl-distro/data.json`
- The directory `dl-distro` is ran from

This is for testing and if you wish to change some of the data, such as a URL to a faster mirror. Do note however, most distributions use a redirecting system, so you should get the closest mirror to your location.

If the JSON file isn't found in these locations, it fetches the latest file from the master branch. This is so users won't have to update every version change, filename change, etc. Only additions to `dl-distro` itself will require an update.

## Usage

```
USAGE: dl-distro [OPTIONS] [DISTRO] [PATH]

    -h, --help     Display this usage message
    -l, --listkeys List the saved GPG keys
    -n, --noverify Skip key fetching and verification
    -s, --spider   Check ISO availability without downloading

DISTROS
    alpine    mint        tails
    arch      openbsd     ubuntu
    debian    opensuse    void
    fedora    parrotos    whonix
    kali      solus

EXAMPLES
    dl-distro arch
    dl-distro arch /run/media/$USER/Ventoy
    dl-distro -s arch
```

## Error Importing Signing Key

This script automatically imports GPG keys. If you encounter issues importing a distro's key, you will need to manually source it and import it, or skip fetching and verification.

If you decide to find and import the key, you will need to import it to one of the expected keyring locations:

- `$XDG_DATA_HOME/dl-distro`
- `$HOME/.local/share/dl-distro`

```
gpg --homedir /path/to/directory --import /path/to/key.asc
```

## Issues and Feedback

Encountered an issue or have feedback? Please open an issue on the [repository's issue tracker](https://codeberg.org/bashuser30/dl-distro/issues) detailing any problems you encounter, or suggestions you might have. This will help continue to improve `dl-distro`.

## Supported Distributions

| Distribution | Version   | Options |
|--------------|-----------|---------|
| [Alpine](https://alpinelinux.org) | 3.18.4 | Standard <br> Extended <br> Netboot <br> Raspberry Pi <br> Generic ARM <br> Mini Root Filesystems <br> Virtual <br> Xen |
| [Arch](https://archlinux.org) | 2023.10.14 | - |
| [Debian](https://debian.org)  | 12.2.0 | Netinst <br> Live |
| [Fedora](https://fedoraproject.org) | 38 | Workstation <br> Server <br> IoT <br> Cloud <br> Silverblue <br> Kinoite <br> Sericea <br> Spins <br> Labs <br> Everything |
| [Kali](https://kali.org) | 2023.3, Weekly | Live <br> QEMU <br> VirtualBox <br> VMware <br> Hyper-V <br> Installer <br> Netinst <br> Purple |
| [Mint](https://linuxmint.com) | 21.2, Debian Edition 6 | Cinnamon <br> MATE <br> Xfce <br> Edge |
| [OpenBSD](https://openbsd.org) | 7.4 | IMG with file sets <br> IMG without file sets <br> ISO with file sets <br> ISO without file sets <br> Floppy
| [openSUSE](https://opensuse.org) | Leap 15.5, Tumbleweed | DVD <br> Netinst <br> KVM <br> Hyper-V <br> VMware <br> Cloud |
| [Parrot OS](https://parrotlinux.org) | 5.3 | Security Edition <br> Home Edition <br> Hack The Box Edition <br> Architect Edition <br> Raspberry Pi Editions |
| [Solus](https://getsol.us) | 4.4 | Budgie <br> GNOME <br> MATE <br> Plasma
| [Tails](https://tails.net) | 5.18 | USB <br> DVD/VM |
| [Ubuntu](https://ubuntu.com) | 23.10, 22.04.3 | Desktop <br> Server |
| [Void](https://voidlinux.org) | 20230628 | x86\_64 <br> i686 <br> ARM <br> ARM platforms (RPi) |
| [Whonix](https://whonix.org) | 17.0.3.0, 17.0.4.5 | QEMU <br> VirtualBox |

## Mirrors

- [Codeberg (main)](https://codeberg.org/bashuser30/dl-distro)
- [GitLab](https://gitlab.com/bashuser30/dl-distro)
- [GitHub](https://github.com/bashuser30/dl-distro)

## License

All files in this repository are licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.