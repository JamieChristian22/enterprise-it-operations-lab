from __future__ import annotations
import csv, html, sys
from pathlib import Path

def main() -> None:
    if len(sys.argv) != 4:
        raise SystemExit("Usage: generate_html_report.py input.csv title output.html")
    source, title, destination = Path(sys.argv[1]), sys.argv[2], Path(sys.argv[3])
    with source.open(newline="", encoding="utf-8") as handle:
        rows = list(csv.DictReader(handle))
    headers = list(rows[0]) if rows else []
    head = "".join("<th>" + html.escape(h) + "</th>" for h in headers)
    body = "".join("<tr>" + "".join("<td>" + html.escape(str(row.get(h, ""))) + "</td>" for h in headers) + "</tr>" for row in rows)
    document = (
        "<!doctype html><html><head><meta charset='utf-8'><title>" + html.escape(title) + "</title>"
        "<style>body{font-family:Arial,sans-serif;margin:32px}table{border-collapse:collapse;width:100%}"
        "th,td{border:1px solid #ccc;padding:8px}th{background:#eee}</style></head><body>"
        "<h1>" + html.escape(title) + "</h1><table><thead><tr>" + head +
        "</tr></thead><tbody>" + body + "</tbody></table></body></html>"
    )
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text(document, encoding="utf-8")
    print(f"Created {destination}")

if __name__ == "__main__":
    main()
