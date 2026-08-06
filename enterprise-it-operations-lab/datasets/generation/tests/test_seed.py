import json
from pathlib import Path
cfg=json.loads(Path("../seed.json").read_text())
assert "seed" in cfg
print("PASS")
