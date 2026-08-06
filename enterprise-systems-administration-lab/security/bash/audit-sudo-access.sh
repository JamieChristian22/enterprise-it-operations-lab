#!/usr/bin/env bash
set -Eeuo pipefail
echo "sudo_groups:"
getent group sudo || true
getent group wheel || true
getent group linux-admins || true
echo
echo "sudoers_entries:"
grep -R "^[^#].*ALL" /etc/sudoers /etc/sudoers.d 2>/dev/null || true
