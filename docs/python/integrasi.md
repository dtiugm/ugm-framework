# 14.3 Integrasi Dokumentasi dan Uji Coba API

FastAPI secara otomatis menghasilkan dokumentasi interaktif untuk API yang dibangun. Dokumentasi ini dapat diakses melalui Swagger UI atau ReDoc. Hal ini memungkinkan pengembang untuk menguji endpoint API secara langsung tanpa menulis tes manual.

## 14.3.1 Dokumentasi API dengan Swagger

FastAPI menggunakan OpenAPI untuk menghasilkan dokumentasi otomatis. Dengan mendefinisikan endpoint API dengan benar, FastAPI akan membuat dokumentasi yang lengkap.

**Contoh:**

```python
@app.get("/items/{item_id}")
async def read_item(item_id: int, q: str | None = None):
    """
    Get an item by its ID.
    - **item_id**: The ID of the item
    - **q**: Optional query parameter for additional filtering
    """
    return {"item_id": item_id, "q": q}

```

Dokumentasi untuk endpoint ini akan muncul di Swagger UI dan dapat digunakan untuk menguji API langsung dari browser.

## 14.3.2 Pengujian Unit

Pengujian unit adalah bagian penting dari pengembangan API. FastAPI mendukung pengujian dengan menggunakan pustaka seperti `pytest`.

**Contoh pengujian dengan pytest:**

```python
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_read_item():
    response = client.get("/items/5")
    assert response.status_code == 200
    assert response.json() == {"item_id": 5}

```

Pengujian ini mengirimkan permintaan GET ke endpoint `/items/{item_id}` dan memverifikasi bahwa status dan data yang diterima sesuai.