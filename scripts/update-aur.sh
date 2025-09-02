#!/usr/bin/env bash

set -euo pipefail

REPO_URL="https://codeberg.org/bashuser30/dl-distro"
PKGBUILD_DIR="$HOME/git/pkgbuilds/dl-distro"
VERSION="$(<./VERSION)"
VERSION="${VERSION#v}"

cd "$PKGBUILD_DIR" || exit 1

trap 'rm -f *.tar.gz *.tar.lz4' EXIT

sed -i "s/^pkgver=.*/pkgver=$VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

if ! updpkgsums; then
	printf "ERROR: updpkgsums failed\n" >&2
	exit 1
fi

rm -f ./*.tar.gz

if ! makepkg --clean; then
	printf "ERROR: makepkg --clean failed\n" >&2
	exit 1
fi

printf "\n"

git diff PKGBUILD

printf "\n"

read -rp "Commit and push? (y/N): " CHOICE

if [[ "$CHOICE" != "y" && "$CHOICE" != "Y" ]]; then
	printf "Canceled\n" >&2
	exit 1
fi

makepkg --printsrcinfo >.SRCINFO

git add PKGBUILD .SRCINFO
git commit -m "v$VERSION" -m "$REPO_URL/releases/tag/v$VERSION"
git push
