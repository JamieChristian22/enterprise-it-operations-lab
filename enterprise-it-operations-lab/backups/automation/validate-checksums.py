from __future__ import annotations

import hashlib
import sys
from pathlib import Path


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def main() -> None:
    if len(sys.argv) != 3:
        raise SystemExit("Usage: validate-checksums.py file expected_hash")

    path = Path(sys.argv[1])
    expected = sys.argv[2].lower()
    actual = sha256(path)

    if actual != expected:
        raise SystemExit(f"Checksum mismatch: expected={expected} actual={actual}")

    print(f"PASS {path} sha256={actual}")


if __name__ == "__main__":
    main()
