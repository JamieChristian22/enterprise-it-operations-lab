#!/usr/bin/env bash
set -Eeuo pipefail
sshd -T | grep -E 'permitrootlogin|passwordauthentication|pubkeyauthentication|maxauthtries|clientalive'
