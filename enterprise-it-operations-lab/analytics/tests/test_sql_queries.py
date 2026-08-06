from pathlib import Path
import sqlite3

db = sqlite3.connect("data/processed/it_operations_analytics.db")
queries = Path("sql/data_quality_checks.sql").read_text(encoding="utf-8")
rows = db.execute(queries).fetchall()
db.close()
failures = [row for row in rows if row[1] != 0]
for row in rows:
    print(row)
assert not failures, failures
