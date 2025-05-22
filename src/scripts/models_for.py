from pydantic import BaseModel
from typing import Optional
from datetime import datetime

# ---------- Role ----------
class RoleBase(BaseModel):
    name: str

class RoleCreate(RoleBase):
    pass

class RoleUpdate(BaseModel):
    name: Optional[str] = None

class RoleInDB(RoleBase):
    role_id: int

    class Config:
        from_attributes = True


# ---------- Tag ----------
class TagBase(BaseModel):
    name: str

class TagCreate(TagBase):
    pass

class TagUpdate(BaseModel):
    name: Optional[str] = None

class TagInDB(TagBase):
    tag_id: int

    class Config:
        from_attributes = True

