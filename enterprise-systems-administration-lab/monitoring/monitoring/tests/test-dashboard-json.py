from pathlib import Path
import json

dashboards = list(Path("grafana/dashboards").glob("*.json"))
assert dashboards, "No dashboards found"

for path in dashboards:
    data = json.loads(path.read_text())
    assert data.get("title"), f"{path} missing title"
    assert data.get("uid"), f"{path} missing uid"
    assert data.get("panels"), f"{path} missing panels"
    print(f"PASS {path}")
