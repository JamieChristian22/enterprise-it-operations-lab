#!/usr/bin/env bash
set -Eeuo pipefail
[[ $EUID -eq 0 ]] || { echo "Run as root." >&2; exit 77; }

log_dir="/var/log/northstar-patching"
timestamp="$(date -u +%Y%m%dT%H%M%SZ)"
log_file="$log_dir/patch-${timestamp}.log"
install -d -m 0750 "$log_dir"

exec > >(tee -a "$log_file") 2>&1
echo "Patch started: $(date --iso-8601=seconds)"
echo "Host: $(hostname -f)"
echo "Kernel before: $(uname -r)"

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y upgrade
apt-get -y autoremove

echo "Kernel after: $(uname -r)"
echo "Failed units:"
systemctl --failed --no-pager || true

for service in ssh cron; do
  systemctl is-active "$service"
done

if [[ -f /var/run/reboot-required ]]; then
  echo "Reboot required:"
  cat /var/run/reboot-required.pkgs 2>/dev/null || true
else
  echo "No reboot required."
fi

echo "Patch completed: $(date --iso-8601=seconds)"
