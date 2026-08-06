#!/usr/bin/env bash
set -Eeuo pipefail
while IFS= read -r script; do
 bash -n "$script"
 echo "PASS $script"
done < <(find bash -type f -name '*.sh' | sort)
