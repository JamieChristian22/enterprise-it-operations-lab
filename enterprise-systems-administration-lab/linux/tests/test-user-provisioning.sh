#!/usr/bin/env bash
set -Eeuo pipefail
[[ $EUID -eq 0 ]] || { echo "Run as root." >&2; exit 77; }

test_user="labtestuser"
test_group="labtestgroup"
tmp_key="$(mktemp)"
trap 'userdel -r "$test_user" 2>/dev/null || true; groupdel "$test_group" 2>/dev/null || true; rm -f "$tmp_key"' EXIT

printf '%s\n' 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBogusLabOnlyKeyMaterialForValidation lab@test' > "$tmp_key"

bash "$(dirname "$0")/../scripts/create-linux-user.sh" \
  "$test_user" "Lab Test User" "$test_group" "$tmp_key"

id "$test_user" | grep -q "$test_group"
home_dir="$(getent passwd "$test_user" | cut -d: -f6)"
[[ "$(stat -c %a "$home_dir/.ssh")" == "700" ]]
[[ "$(stat -c %a "$home_dir/.ssh/authorized_keys")" == "600" ]]
[[ "$(stat -c %U "$home_dir/.ssh/authorized_keys")" == "$test_user" ]]

echo "PASS user provisioning controls"
