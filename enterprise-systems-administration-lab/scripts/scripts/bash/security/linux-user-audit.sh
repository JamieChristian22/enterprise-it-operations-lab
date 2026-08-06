#!/usr/bin/env bash
set -Eeuo pipefail
output="${1:-output/linux-user-audit.csv}"
mkdir -p "$(dirname "$output")"
echo "username,uid,shell,password_status" > "$output"
while IFS=: read -r username _ uid _ _ _ shell; do
 (( uid >= 1000 )) || continue
 status="$(passwd -S "$username" 2>/dev/null | awk '{print $2}')"
 printf '%s,%s,%s,%s\n' "$username" "$uid" "$shell" "$status" >> "$output"
done < /etc/passwd
cat "$output"
