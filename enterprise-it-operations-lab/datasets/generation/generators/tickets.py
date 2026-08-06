from pathlib import Path
def generate():
    Path("../output").mkdir(exist_ok=True)
    print("Generating service tickets...")
