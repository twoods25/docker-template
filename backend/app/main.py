import os
import psycopg
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()
DSN = os.environ["DATABASE_URL"]


class Note(BaseModel):
    text: str


@app.post("/notes")
def add_note(note: Note):
    with psycopg.connect(DSN) as conn:
        row = conn.execute(
            "INSERT INTO notes (text) VALUES (%s) RETURNING id, created_at",
            (note.text,),
        ).fetchone()
    return {"id": row[0], "created_at": row[1]}


@app.get("/notes")
def list_notes():
    with psycopg.connect(DSN) as conn:
        rows = conn.execute(
            "SELECT id, text, created_at FROM notes ORDER BY id DESC LIMIT 50"
        ).fetchall()
    return [{"id": r[0], "text": r[1], "created_at": r[2]} for r in rows]
