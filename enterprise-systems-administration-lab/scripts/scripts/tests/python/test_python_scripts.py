from pathlib import Path
import py_compile
scripts = sorted(Path("python").rglob("*.py"))
assert scripts, "No Python scripts found"
for script in scripts:
    py_compile.compile(str(script), doraise=True)
    print(f"PASS {script}")
