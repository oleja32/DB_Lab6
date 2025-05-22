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


# ---------- Access ----------
class AccessBase(BaseModel):
    user_id: int
    role_id: int
    data_id: int

class AccessCreate(AccessBase):
    pass

class AccessUpdate(BaseModel):
    user_id: Optional[int] = None
    role_id: Optional[int] = None
    data_id: Optional[int] = None

class AccessInDB(AccessBase):
    access_id: int

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

