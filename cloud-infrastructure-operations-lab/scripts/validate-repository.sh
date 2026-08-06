#!/usr/bin/env bash
set -euo pipefail
terraform fmt -check -recursive terraform
terraform -chdir=terraform/aws init -backend=false >/dev/null
terraform -chdir=terraform/aws validate
terraform -chdir=terraform/azure init -backend=false >/dev/null
terraform -chdir=terraform/azure validate
python3 -m compileall scripts
find scripts -name '*.sh' -print0 | xargs -0 -n1 bash -n
echo "Repository validation completed successfully."
