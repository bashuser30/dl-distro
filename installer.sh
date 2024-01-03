#!/bin/sh

set -e

if [ "$(id -u)" -ne 0 ]; then
	printf "ERROR: Must be run as root.\n"
	exit 1
fi

_PREFIX="/usr/local"
_LICENSEDIR="$_PREFIX/share/licenses/dl-distro"
_MANDIR="$_PREFIX/share/man/man1"
_BINDIR="$_PREFIX/bin"
_DATADIR="$_PREFIX/share/dl-distro"

_install()
{
	install -Dm644 LICENSE "$_LICENSEDIR/LICENSE"
	install -Dm644 man/dl-distro.1 "$_MANDIR/dl-distro.1"
	install -Dm755 dl-distro "$_BINDIR/dl-distro"
	install -Dm644 data.json "$_DATADIR/data.json"
}

_uninstall()
{
	rm -f "$_LICENSEDIR/LICENSE"
	rm -f "$_MANDIR/dl-distro.1"
	rm -f "$_BINDIR/dl-distro"
	rm -f "$_DATADIR/data.json"
}

case "$1" in
	install) _install ;;
	uninstall) _uninstall ;;
	*) printf "Usage: %s <install|uninstall>\n" "$0"; exit 1 ;;
esac
