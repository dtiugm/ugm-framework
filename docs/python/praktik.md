## 14.2 Praktik Terbaik dalam Membangun API dengan FastAPI

FastAPI adalah framework Python untuk membangun API yang cepat, mudah digunakan, dan mendukung penulisan kode yang sesuai dengan standar PEP 8. Berikut adalah beberapa praktik terbaik saat membangun API dengan FastAPI.

### 14.2.1 Penataan Struktur Proyek API

Struktur proyek yang baik memudahkan pengembangan dan pemeliharaan API. Umumnya, struktur proyek FastAPI dapat diatur sebagai berikut:

```markdown
project/
├── app/
│   ├── __init__.py
│   ├── main.py
│   ├── models/
│   │   ├── __init__.py
│   │   └── user.py
│   ├── schemas/
│   │   ├── __init__.py
│   │   └── user_schema.py
│   ├── services/
│   │   ├── __init__.py
│   │   └── user_service.py
│   └── api/
│       ├── __init__.py
│       └── user_api.py
├── requirements.txt
└── README.md

```

Struktur ini memisahkan komponen utama seperti model, schema, layanan, dan API ke dalam folder yang terpisah untuk menjaga keteraturan dan memudahkan pemeliharaan.

### 14.2.2 Penggunaan Pydantic untuk Validasi Data

FastAPI menggunakan **Pydantic** untuk validasi data input dan output. Pydantic memungkinkan pembuatan model data yang kuat dengan penanganan otomatis untuk validasi.

**Contoh:**

```python
from pydantic import BaseModel

class User(BaseModel):
    username: str
    full_name: str | None = None
    email: str

class UserInResponse(User):
    id: int

```

Di atas, `User` adalah model input, dan `UserInResponse` adalah model yang digunakan untuk respons API. FastAPI akan secara otomatis memvalidasi data berdasarkan tipe yang ditentukan dalam model Pydantic.

### 14.2.3 Menangani Error dengan Exception Handling

Menangani error adalah aspek penting dalam API. FastAPI memungkinkan untuk menangani error dengan jelas menggunakan exception handler.

Contoh:

```python
from fastapi import FastAPI, HTTPException

app = FastAPI()

@app.get("/items/{item_id}")
async def read_item(item_id: int):
    if item_id == 3:
        raise HTTPException(status_code=404, detail="Item not found")
    return {"item_id": item_id}

```

Pada contoh di atas, jika `item_id` adalah 3, maka API akan mengembalikan error 404 dengan pesan "Item not found".