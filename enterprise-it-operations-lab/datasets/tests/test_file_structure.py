from pathlib import Path
required=["raw","processed","curated","schemas","dictionaries","generation","validation"]
missing=[d for d in required if not Path("..",d).exists()]
assert not missing, f"Missing: {missing}"
print("PASS file structure")
