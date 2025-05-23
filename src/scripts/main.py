from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import mysql.connector
from typing import List, Optional

app = FastAPI()

# Параметри підключення до бази
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="1234",
    database="opendata"
)

# ======== Pydantic моделі ========
class Category(BaseModel):
    name: str
    parent_category_id: Optional[int] = None

class CategoryOut(Category):
    category_id: int

# ======== CATEGORY endpoints ========

@app.get("/categories", response_model=List[CategoryOut])
def get_categories():
    cursor = db.cursor()
    cursor.execute("SELECT category_id, name, parent_category_id FROM category")
    cats = cursor.fetchall()
    return [{"category_id": c[0], "name": c[1], "parent_category_id": c[2]} for c in cats]

@app.post("/categories", response_model=CategoryOut, status_code=201)
def create_category(cat: Category):
    cursor = db.cursor()
    cursor.execute(
        "INSERT INTO category (name, parent_category_id) VALUES (%s, %s)",
        (cat.name, cat.parent_category_id)
    )
    db.commit()
    return {"category_id": cursor.lastrowid, "name": cat.name, "parent_category_id": cat.parent_category_id}

@app.put("/categories/{category_id}", response_model=CategoryOut)
def update_category(category_id: int, cat: Category):
    cursor = db.cursor()
    cursor.execute(
        "UPDATE category SET name = %s, parent_category_id = %s WHERE category_id = %s",
        (cat.name, cat.parent_category_id, category_id)
    )
    db.commit()
    if cursor.rowcount == 0:
        raise HTTPException(status_code=404, detail="Category not found")
    return {"category_id": category_id, "name": cat.name, "parent_category_id": cat.parent_category_id}

@app.delete("/categories/{category_id}")
def delete_category(category_id: int):
    cursor = db.cursor()
    cursor.execute("DELETE FROM category WHERE category_id = %s", (category_id,))
    db.commit()
    if cursor.rowcount == 0:
        raise HTTPException(status_code=404, detail="Category not found")
    return {"message": "Category deleted"}
