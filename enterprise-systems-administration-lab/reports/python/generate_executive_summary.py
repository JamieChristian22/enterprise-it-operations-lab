from __future__ import annotations

import csv
from pathlib import Path


def read_rows(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as handle:
        return list(csv.DictReader(handle))


def main() -> None:
    patch_rows = read_rows(Path("datasets/patching-sample.csv"))
    compliant = sum(1 for row in patch_rows if row["ComplianceStatus"] == "Compliant")
    compliance = compliant / len(patch_rows) * 100 if patch_rows else 0

    output = Path("output/executive-summary.md")
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(
        "# Automated Executive Summary\n\n"
        f"- Patch compliance: **{compliance:.1f}%**\n"
        f"- Assets reviewed: **{len(patch_rows)}**\n"
        "- Review open exceptions and capacity risks.\n",
        encoding="utf-8",
    )
    print(f"Created {output}")


if __name__ == "__main__":
    main()
