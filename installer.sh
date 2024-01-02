#!/bin/sh

set -e

if [ "$(id -u)" -ne 0 ]; then
	printf "\033[1;31mERROR: Must be run as root.\033[0m\n"
	exit 1
fi

_PREFIX="/usr/local"
_LICENSEDIR="$_PREFIX/share/licenses/dl-distro"
_MANDIR="$_PREFIX/share/man/man1"
_BINDIR="$_PREFIX/bin"
_DATADIR="$_PREFIX/share/dl-distro"
_BASHCOMPLETIONSDIR="$_PREFIX/share/bash-completion/completions"
_FISHCOMPLETIONSDIR="$_PREFIX/share/fish/completions"
_ZSHCOMPLETIONSDIR="$_PREFIX/share/zsh/site-functions"

_install() {
	install -Dm644 LICENSE "$_LICENSEDIR/LICENSE"
	install -Dm644 man/dl-distro.1 "$_MANDIR/dl-distro.1"
	install -Dm755 dl-distro "$_BINDIR/dl-distro"
	install -Dm644 data.json "$_DATADIR/data.json"
	install -Dm644 completions/bash "$_BASHCOMPLETIONSDIR/dl-distro"
	install -Dm644 completions/fish "$_FISHCOMPLETIONSDIR/dl-distro.fish"
	install -Dm644 completions/zsh "$_ZSHCOMPLETIONSDIR/_dl-distro"
}

_uninstall() {
	rm -f "$_LICENSEDIR/LICENSE"
	rm -f "$_MANDIR/dl-distro.1"
	rm -f "$_BINDIR/dl-distro"
	rm -f "$_DATADIR/data.json"
	rm -f "$_BASHCOMPLETIONSDIR/dl-distro"
	rm -f "$_FISHCOMPLETIONSDIR/dl-distro.fish"
	rm -f "$_ZSHCOMPLETIONSDIR/_dl-distro"
}

case "$1" in
	install) _install ;;
	uninstall) _uninstall ;;
	*) printf "Usage: %s <install|uninstall>\n" "$0"; exit 1 ;;
esac
