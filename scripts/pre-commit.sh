#!/usr/bin/env bash
#
# Pre-commit Hook
#
# Dependencies:
# - shellcheck
# - shellharden
# - jq
#
# Install:
#   At the root of the repository, run:
#     ln -s ../../scripts/pre-commit.sh .git/hooks/pre-commit
#

SCRIPTS=(
	dl-distro
	scripts/*.sh
)

ERROR=0

for SCRIPT in "${SCRIPTS[@]}"; do
	shellcheck "$SCRIPT" || {
		printf "ShellCheck failed: %s\n" "$SCRIPT" >&2
		ERROR=1
	}

	shellharden --check "$SCRIPT" || {
		printf "Shellharden failed: %s\n" "$SCRIPT" >&2
		ERROR=1
	}
done

jq empty data.json || {
	printf "JSON validation failed.\n" >&2
	ERROR=1
}

exit "$ERROR"
