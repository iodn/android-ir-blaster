#!/usr/bin/env python3
from __future__ import annotations

import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SQL_DUMP = ROOT / "assets" / "db_src" / "irblaster.sql"
OUT_DB = ROOT / "assets" / "db" / "irblaster.sqlite"

def main() -> None:
    if not SQL_DUMP.exists():
        raise SystemExit(f"Missing SQL dump: {SQL_DUMP}")

    OUT_DB.parent.mkdir(parents=True, exist_ok=True)
    if OUT_DB.exists():
        OUT_DB.unlink()

    sql = SQL_DUMP.read_text(encoding="utf-8")

    con = sqlite3.connect(str(OUT_DB))
    try:
        con.execute("PRAGMA journal_mode=OFF;")
        con.execute("PRAGMA synchronous=OFF;")
        con.execute("PRAGMA temp_store=MEMORY;")

        con.executescript(sql)
        con.commit()
    finally:
        con.close()

    if not OUT_DB.exists() or OUT_DB.stat().st_size < 1024:
        raise SystemExit(f"DB generation failed or produced tiny output: {OUT_DB}")

    print(f"[OK] Generated {OUT_DB} ({OUT_DB.stat().st_size} bytes)")

if __name__ == "__main__":
    main()
