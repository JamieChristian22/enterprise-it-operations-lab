#!/usr/bin/env bash
set -Eeuo pipefail
failed=0

check() {
  local description="$1"
  shift
  if "$@"; then
    echo "PASS $description"
  else
    echo "FAIL $description"
    failed=1
  fi
}

sshd_effective="$(sshd -T 2>/dev/null || true)"
check "SSH root login disabled" grep -q '^permitrootlogin no$' <<<"$sshd_effective"
check "SSH password authentication disabled" grep -q '^passwordauthentication no$' <<<"$sshd_effective"
check "SSH public key authentication enabled" grep -q '^pubkeyauthentication yes$' <<<"$sshd_effective"
check "UFW active" bash -c "ufw status 2>/dev/null | grep -q '^Status: active'"
check "auditd active" systemctl is-active --quiet auditd
check "No failed services" bash -c '[[ -z "$(systemctl --failed --no-legend --plain)" ]]'

empty_passwords="$(sudo awk -F: '($2 == "") {print $1}' /etc/shadow 2>/dev/null || true)"
if [[ -z "$empty_passwords" ]]; then
  echo "PASS no empty password hashes"
else
  echo "FAIL empty password accounts: $empty_passwords"
  failed=1
fi

exit "$failed"
