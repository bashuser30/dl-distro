#!/bin/sh

set -e

if [ "$(id -u)" -ne 0 ]; then
	printf "ERROR: Must be run as root.\n"
	exit 1
fi

license_dir="/usr/local/share/licenses/dl-distro"
man_dir="/usr/local/share/man/man1"
bin_dir="/usr/local/bin"
bash_completions_dir="/usr/local/share/bash-completion/completions"

install_files()
{
	install -Dm644 LICENSE "$license_dir/LICENSE"
	install -Dm644 man/dl-distro.1 "$man_dir/dl-distro.1"
	install -Dm755 dl-distro "$bin_dir/dl-distro"
	install -Dm644 completions/bash "$bash_completions_dir/dl-distro"
}

uninstall_files()
{
	rm -f "$license_dir/LICENSE"
	rm -f "$man_dir/dl-distro.1"
	rm -f "$bin_dir/dl-distro"
	rm -f "$bash_completions_dir/dl-distro"
}

case "$1" in
	install) install_files ;;
	uninstall) uninstall_files ;;
	*) printf "Usage: %s <install|uninstall>\n" "$0"; exit 1 ;;
esac
