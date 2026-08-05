# Artifact Provenance

## Classification

| Artifact Type | Classification | Verification Method |
|---|---|---|
| Runbooks and reports | Authored portfolio documentation | Review content and cross-reference mappings |
| Inventory CSV files in package | Fictional lab dataset | Confirm consistency against repository design |
| Transcript examples | Representative lab records | Compare format with live collector output |
| PowerShell collectors | Executable verification tooling | Run in the lab and inspect generated artifacts |
| Live evidence bundle | Environment-generated evidence | Validate SHA-256 manifest and timestamps |

## Integrity

The package-level `SHA256SUMS.txt` verifies that included artifacts have not changed after packaging. Live collectors generate a separate `SHA256SUMS-live.csv` for captured environment evidence.

## Reviewer Guidance

A reviewer can assess the project in two stages:

1. Review the included documentation for design, controls, operational process, and consistency.
2. Run or inspect outputs from the evidence collectors to validate the environment directly.
