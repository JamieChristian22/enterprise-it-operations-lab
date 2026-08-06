from pathlib import Path

required = [
    "README.md",
    "diagrams/enterprise-hybrid-overview.md",
    "diagrams/network-segmentation.md",
    "network/ip-address-plan.md",
    "network/firewall-flow-matrix.csv",
    "cloud/aws-connectivity.md",
    "resilience/rto-rpo-map.md",
]

missing = [item for item in required if not Path(item).is_file()]
if missing:
    raise SystemExit(f"Missing required files: {missing}")

print("PASS required architecture files")
