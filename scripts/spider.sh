#!/usr/bin/env bash
# shellcheck disable=SC2015

set -euo pipefail

JSON_FILE='data.json'
ERRORS=0
ERRORS_FILE="$(mktemp)"
URLS_FILE="$(mktemp)"
USER_AGENT=""

trap 'rm -f "$ERRORS_FILE" "$URLS_FILE"; exit "$ERRORS"' EXIT

error()
{
	((++ERRORS))
	printf >&2 'ERROR: %s\n' "$*"
}

construct_urls()
{
	local data="$1"

	jq -r '
		..
		| objects
		| select(.url? and (.iso_file? or .sig_file? or .sum_file?))
		| (if .iso_file then "\(.url)/\(.iso_file)" else empty end),
		  (if .sig_file then "\(.url)/\(.sig_file)" else empty end),
		  (if .sum_file then "\(.url)/\(.sum_file)" else empty end)
	' <<<"$data" >>"$URLS_FILE"

	sort -u "$URLS_FILE" -o "$URLS_FILE"

	# Handle Kali Weekly
	if grep -q "{current_week_num}" "$URLS_FILE"; then
		local html_content current_week_num

		html_content="$(
			curl -sL -A "$USER_AGENT" "https://cdimage.kali.org/kali-weekly/"
		)"

		current_week_num="$(
			grep -o 'W[0-9]\+' <<<"$html_content" \
				| sort -r \
				| head -n 1 \
				| cut -c2-
		)"

		sed -i "s/{current_week_num}/$current_week_num/g" "$URLS_FILE"
	fi

	# Handle GParted
	if grep -q "https://downloads\.sourceforge\.net/gparted/CHECKSUMS\.TXT" "$URLS_FILE"; then
		sed -i "s|https://downloads\.sourceforge\.net/gparted/CHECKSUMS\.TXT|https://gparted.org/gparted-live/stable/CHECKSUMS.TXT|g" "$URLS_FILE"
	fi
}

check_urls()
{
	local first=1 url http_status

	while IFS= read -r url; do
		((first)) && first=0 || sleep 5

		http_status="$(
			curl -o /dev/null -w '%{http_code}' -sIL \
				--retry 4 \
				--retry-all-errors \
				--retry-max-time 20 \
				--max-time 20 \
				-A "$USER_AGENT" \
				"$url"
		)"

		if ((http_status == 200)); then
			printf >&2 'SUCCESS: %s\n' "$url"
		else
			error "$url"
			printf '%s\n' "$url" >>"$ERRORS_FILE"
		fi
	done <"$URLS_FILE"
}

main()
{
	local distro="$1"
	local distro_data

	[[ -z "$distro" ]] && {
		error 'Please provide a distro name or jq path'
		return 1
	}

	distro_data="$(jq -c ".$distro" "$JSON_FILE")"

	[[ "$distro_data" == 'null' ]] && {
		error 'Invalid distro or jq path'
		return 1
	}

	USER_AGENT="$(
		curl -s 'https://raw.githubusercontent.com/microlinkhq/top-user-agents/refs/heads/master/src/desktop.json' \
			| jq -r '.[] | select(test("Chrome/") and test("Windows NT"))' \
			| sed 's/.*Chrome\/\([0-9.]*\).*/\1 &/' \
			| sort -V \
			| tail -n1 \
			| cut -d' ' -f2-
	)"

	construct_urls "$distro_data"
	check_urls

	if ((ERRORS)); then
		printf '\nErrors [%s]:\n' "$distro"
		cat "$ERRORS_FILE"
	fi
}

main "${@:-}"
