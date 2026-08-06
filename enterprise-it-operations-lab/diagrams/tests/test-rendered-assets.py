from pathlib import Path

dot_files = list(Path("source/graphviz").glob("*.dot"))
png_files = list(Path("rendered/png").glob("*.png"))
svg_files = list(Path("rendered/svg").glob("*.svg"))

assert len(dot_files) == len(png_files) == len(svg_files), (
    len(dot_files), len(png_files), len(svg_files)
)
for path in png_files + svg_files:
    assert path.stat().st_size > 1000, f"Rendered file too small: {path}"
print(f"PASS rendered assets: {len(dot_files)} diagrams")
