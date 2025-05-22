from fastapi import FastAPI, HTTPException, status
from typing import List
from config import get_connection
from models_for import RoleInDB, RoleCreate, RoleUpdate, TagInDB, TagCreate, TagUpdate

app = FastAPI(title="OpenData RESTful API")

# ======== HELPER FUNCTIONS ==========
def fetch_all(table: str):
    with get_connection() as conn:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(f"SELECT * FROM {table}")
        return cursor.fetchall()

def fetch_by_id(table: str, key: str, value: int):
    with get_connection() as conn:
        cursor = conn.cursor(dictionary=True)
        cursor.execute(f"SELECT * FROM {table} WHERE {key} = %s", (value,))
        result = cursor.fetchone()
        if not result:
            raise HTTPException(status_code=404, detail=f"{table.capitalize()} not found")
        return result

def insert_data(query: str, values: tuple):
    with get_connection() as conn:
        cursor = conn.cursor()
        try:
            cursor.execute(query, values)
            conn.commit()
        except Exception as e:
            conn.rollback()
            raise HTTPException(status_code=500, detail=str(e))

def update_data(table: str, key: str, value: int, update_data: dict):
    if not update_data:
        raise HTTPException(status_code=400, detail="No data to update")
    fields = ', '.join(f"{k} = %s" for k in update_data)
    query = f"UPDATE {table} SET {fields} WHERE {key} = %s"
    with get_connection() as conn:
        cursor = conn.cursor()
        try:
            cursor.execute(query, list(update_data.values()) + [value])
            conn.commit()
        except Exception as e:
            conn.rollback()
            raise HTTPException(status_code=500, detail=str(e))

def delete_by_id(table: str, key: str, value: int):
    with get_connection() as conn:
        cursor = conn.cursor()
        try:
            cursor.execute(f"DELETE FROM {table} WHERE {key} = %s", (value,))
            conn.commit()
            if cursor.rowcount == 0:
                raise HTTPException(status_code=404, detail=f"{table.capitalize()} not found")
        except Exception as e:
            conn.rollback()
            raise HTTPException(status_code=500, detail=str(e))

# ========== ROLE ENDPOINTS ==========
@app.get("/role", response_model=List[RoleInDB], tags=["Role"])
async def get_all_roles():
    return fetch_all("role")

@app.get("/role/{role_id}", response_model=RoleInDB, tags=["Role"])
async def get_role(role_id: int):
    return fetch_by_id("role", "role_id", role_id)

@app.post("/role", response_model=dict, status_code=201, tags=["Role"])
async def create_role(role: RoleCreate):
    insert_data("INSERT INTO role (name) VALUES (%s)", (role.name,))
    return {"message": "Role added"}

@app.put("/role/{role_id}", response_model=RoleInDB, tags=["Role"])
async def update_role(role_id: int, role_update: RoleUpdate):
    update_data("role", "role_id", role_id, role_update.model_dump(exclude_unset=True))
    return await get_role(role_id)

@app.delete("/role/{role_id}", response_model=dict, tags=["Role"])
async def delete_role(role_id: int):
    delete_by_id("role", "role_id", role_id)
    return {"message": f"Role with id {role_id} deleted"}

@app.get("/tag", response_model=List[TagInDB], tags=["Tag"])
async def get_all_tags():
    return fetch_all("tag")

@app.get("/tag/{tag_id}", response_model=TagInDB, tags=["Tag"])
async def get_tag(tag_id: int):
    return fetch_by_id("tag", "tag_id", tag_id)

@app.post("/tag", response_model=dict, status_code=201, tags=["Tag"])
async def create_tag(tag: TagCreate):
    insert_data("INSERT INTO tag (name) VALUES (%s)", (tag.name,))
    return {"message": "Tag added"}

@app.put("/tag/{tag_id}", response_model=TagInDB, tags=["Tag"])
async def update_tag(tag_id: int, tag_update: TagUpdate):
    update_data("tag", "tag_id", tag_id, tag_update.model_dump(exclude_unset=True))
    return await get_tag(tag_id)

@app.delete("/tag/{tag_id}", response_model=dict, tags=["Tag"])
async def delete_tag(tag_id: int):
    delete_by_id("tag", "tag_id", tag_id)
    return {"message": f"Tag with id {tag_id} deleted"}