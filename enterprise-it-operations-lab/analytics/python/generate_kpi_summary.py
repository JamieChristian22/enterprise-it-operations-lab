from __future__ import annotations
import sqlite3
from pathlib import Path

def main() -> None:
    db = sqlite3.connect("data/processed/it_operations_analytics.db")
    row = db.execute(
        "SELECT COUNT(*), AVG(resolution_minutes), 100.0*AVG(first_contact_resolved), AVG(csat_score), 100.0*AVG(sla_met) FROM service_tickets"
    ).fetchone()
    db.close()
    output = Path("evidence/generated-kpi-summary.md")
    output.write_text(
        "# Generated KPI Summary\n\n"
        f"- Tickets: **{row[0]}**\n"
        f"- Average resolution: **{row[1]:.1f} minutes**\n"
        f"- First-contact resolution: **{row[2]:.1f}%**\n"
        f"- CSAT: **{row[3]:.2f} / 5**\n"
        f"- SLA attainment: **{row[4]:.1f}%**\n",
        encoding="utf-8",
    )
    print(f"Created {output}")

if __name__ == "__main__":
    main()
