from pathlib import Path
import py_compile

for script in Path("automation").glob("*.py"):
    py_compile.compile(str(script), doraise=True)
    print(f"PASS {script}")
