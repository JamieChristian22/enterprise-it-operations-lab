#!/usr/bin/env bash
set -Eeuo pipefail
output="${1:-output/linux-hardening.json}"
mkdir -p "$(dirname "$output")"
root_login="$(sshd -T 2>/dev/null | awk '/^permitrootlogin/{print $2}')"
password_auth="$(sshd -T 2>/dev/null | awk '/^passwordauthentication/{print $2}')"
auditd_state="$(systemctl is-active auditd 2>/dev/null || true)"
failed=0
[[ "$root_login" == "no" ]] || failed=1
[[ "$password_auth" == "no" ]] || failed=1
[[ "$auditd_state" == "active" ]] || failed=1
python3 - "$output" "$root_login" "$password_auth" "$auditd_state" "$failed" <<'PY'
import json,sys
path,root,password,auditd,failed=sys.argv[1:]
json.dump({"permit_root_login":root,"password_authentication":password,
"auditd":auditd,"passed":failed=="0"},open(path,"w"),indent=2)
PY
cat "$output"
exit "$failed"
