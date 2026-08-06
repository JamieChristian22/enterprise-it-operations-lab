#!/usr/bin/env bash
set -Eeuo pipefail
for script in automation/*.sh; do
  bash -n "$script"
  echo "PASS $script"
done
