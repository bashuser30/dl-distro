#!/usr/bin/env bash

set -euo pipefail

NEW_VERSION="$(<./VERSION)"
OLD_TAG="$(git tag --sort=-creatordate | head -n1)"
CURRENT_DATE="$(date "+%B %e, %Y")"
TEMP_MSG="$(mktemp)"

trap 'rm -f "$TEMP_MSG"' EXIT

sed -i -E 's/version="v[0-9]+\.[0-9]+\.[0-9]+"/version="'"$NEW_VERSION"'"/' ./dl-distro
sed -i -E 's/(^\.TH "DL-DISTRO" "1" ")[^"]+(")/\1'"$CURRENT_DATE"'\2/' ./man/dl-distro.1
sed -i -E 's/(dl-distro )v[0-9]+\.[0-9]+\.[0-9]+/\1'"$NEW_VERSION"'/' ./man/dl-distro.1

git diff ./dl-distro ./man/dl-distro.1 ./VERSION

printf "\n"

read -rp "Commit and push? (y/N): " CHOICE

[[ "$CHOICE" != "y" && "$CHOICE" != "Y" ]] && {
	printf "Canceled\n" >&2
	exit 1
}

git add ./dl-distro ./man/dl-distro.1 ./VERSION
git commit -m "$NEW_VERSION"

cat >"$TEMP_MSG" <<EOF
$NEW_VERSION

*

Full Changelog:

* https://codeberg.org/bashuser30/dl-distro/compare/$OLD_TAG...$NEW_VERSION
EOF

vim "$TEMP_MSG"

git tag "$NEW_VERSION" -F "$TEMP_MSG"
git push --follow-tags
