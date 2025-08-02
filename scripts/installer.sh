#!/usr/bin/env bash

set -euo pipefail

((EUID == 0)) || {
	printf "ERROR: Must be run as root.\n" >&2
	exit 1
}

LICENSE_DIR="/usr/local/share/licenses/dl-distro"
MAN_DIR="/usr/local/share/man/man1"
BIN_DIR="/usr/local/bin"
BASH_COMPLETIONS_DIR="/usr/local/share/bash-completion/completions"

install_files()
{
	install -Dvm644 LICENSE "$LICENSE_DIR/LICENSE"
	install -Dvm644 man/dl-distro.1 "$MAN_DIR/dl-distro.1"
	install -Dvm755 dl-distro "$BIN_DIR/dl-distro"
	install -Dvm644 completions/bash "$BASH_COMPLETIONS_DIR/dl-distro"
}

uninstall_files()
{
	rm -vf "$LICENSE_DIR/LICENSE"
	rm -vf "$MAN_DIR/dl-distro.1"
	rm -vf "$BIN_DIR/dl-distro"
	rm -vf "$BASH_COMPLETIONS_DIR/dl-distro"
}

case "${1:-}" in
	install)
		install_files
		;;
	uninstall)
		uninstall_files
		;;
	*)
		printf "Usage: %s <install|uninstall>\n" "$0" >&2
		exit 1
		;;
esac
