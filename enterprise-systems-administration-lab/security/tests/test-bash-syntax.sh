#!/usr/bin/env bash
set -Eeuo pipefail
for script in bash/*.sh; do
 bash -n "$script"
 echo "PASS $script"
done
