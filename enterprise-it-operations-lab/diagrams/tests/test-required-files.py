from pathlib import Path

required = [
    "README.md",
    "source/graphviz/enterprise-hybrid-overview.dot",
    "rendered/png/enterprise-hybrid-overview.png",
    "rendered/svg/enterprise-hybrid-overview.svg",
    "documentation/diagram-catalog.md",
    "standards/diagram-style-guide.md",
]
missing = [p for p in required if not Path(p).is_file()]
if missing:
    raise SystemExit(f"Missing required files: {missing}")
print("PASS required files")
