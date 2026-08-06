# S3 Object and Terraform State Recovery

1. Suspend infrastructure changes and identify the exact object key and last known-good version.
2. List versions:
   ```bash
   aws s3api list-object-versions --bucket enterprise-prod-terraform-state --prefix prod/terraform.tfstate
   ```
3. Download the selected version to an isolated workstation and calculate SHA-256.
4. Inspect the JSON structure with `terraform state list` against a temporary backend copy; never expose secrets from state in tickets or screenshots.
5. Copy the approved version back as a new current version:
   ```bash
   aws s3api copy-object      --bucket enterprise-prod-terraform-state      --copy-source enterprise-prod-terraform-state/prod/terraform.tfstate?versionId=APPROVED_VERSION      --key prod/terraform.tfstate
   ```
6. Run `terraform plan -refresh-only` and verify that the plan contains no unintended destructive action.
7. Record version IDs, hashes, approval, plan output, and final state lock status.

Object Lock or replication failures are escalated immediately because Terraform state is Tier 0.
