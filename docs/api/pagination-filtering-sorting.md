# 7.7 Pagination, Filtering, dan Sorting

Saat API mengembalikan banyak data (misalnya daftar pengguna, produk, atau artikel), penting untuk mendukung fitur **Pagination**, **Filtering**, dan **Sorting**. Hal ini meningkatkan performa aplikasi, mengurangi konsumsi bandwidth, dan memberi pengguna fleksibilitas untuk mendapatkan data yang relevan.

## 7.7.1 Pagination

**Pagination** adalah proses membagi data dalam beberapa halaman untuk menghindari pengembalian data dalam jumlah besar sekaligus.

### **Langkah Implementasi Pagination**

1. **Gunakan Query Parameters**
- Gunakan `limit` untuk menentukan jumlah item per halaman.
- Gunakan `offset` atau `page` untuk menentukan posisi awal data atau halaman tertentu.
2. **Contoh Implementasi:**

```python
from fastapi import FastAPI, Query
from typing import List

app = FastAPI()

# Contoh data
data = [{"id": i, "name": f"Item {i}"} for i in range(1, 101)]  # 100 item

@app.get("/items/")
async def get_items(limit: int = Query(10, ge=1, le=50), offset: int = Query(0, ge=0)):
    """
    limit: Jumlah item per halaman (default 10, maksimum 50).
    offset: Posisi awal data (default 0).
    """
    paginated_data = data[offset: offset + limit]
    return {
        "total": len(data),
        "limit": limit,
        "offset": offset,
        "data": paginated_data,
    }
```

**Penjelasan:**

- `Query(10, ge=1, le=50)` memastikan nilai `limit` minimal 1 dan maksimal 50.
- `offset` digunakan untuk menghitung posisi awal data yang ingin dikembalikan.
- Respons menyertakan metadata (`total`, `limit`, `offset`) untuk membantu pengguna memahami jumlah data yang tersedia.

**Contoh Permintaan:**

- `/items/?limit=5&offset=10` → Mengambil 5 item, mulai dari item ke-11.

## 7.7.2 Filtering dan Sorting

**Filtering** memungkinkan pengguna memilih subset data berdasarkan kriteria tertentu, sementara **Sorting** memungkinkan pengguna mengurutkan data berdasarkan satu atau lebih kolom.

### **Langkah Implementasi Filtering**

1. Gunakan query parameters untuk menerima kriteria filter.
2. Terapkan filter di dalam kode sebelum mengembalikan data.

### **Contoh Implementasi Filtering:**

```python
@app.get("/items/filter")
async def filter_items(name: str = Query(None), min_id: int = Query(None), max_id: int = Query(None)):
    """
    Filter berdasarkan:
    - `name` yang mengandung string tertentu.
    - `min_id` untuk ID minimum.
    - `max_id` untuk ID maksimum.
    """
    filtered_data = data

    if name:
        filtered_data = [item for item in filtered_data if name.lower() in item["name"].lower()]
    if min_id is not None:
        filtered_data = [item for item in filtered_data if item["id"] >= min_id]
    if max_id is not None:
        filtered_data = [item for item in filtered_data if item["id"] <= max_id]

    return {"total": len(filtered_data), "data": filtered_data}

```

**Contoh Permintaan:**

- `/items/filter?name=item&min_id=10&max_id=20`
  → Menampilkan item yang mengandung "item" di nama, dengan ID antara 10 dan 20.

### **Pagination, Filtering, dan Sorting Secara Bersamaan**

Untuk mendukung ketiga fitur dalam satu endpoint, gabungkan logika di atas.

**Contoh Implementasi Kombinasi:**

```python
@app.get("/items/advanced")
async def advanced_query(
    limit: int = Query(10, ge=1, le=50),
    offset: int = Query(0, ge=0),
    name: str = Query(None),
    min_id: int = Query(None),
    max_id: int = Query(None),
    sort_by: str = Query("id"),
    order: str = Query("asc"),
):
    filtered_data = data

    # Filtering
    if name:
        filtered_data = [item for item in filtered_data if name.lower() in item["name"].lower()]
    if min_id is not None:
        filtered_data = [item for item in filtered_data if item["id"] >= min_id]
    if max_id is not None:
        filtered_data = [item for item in filtered_data if item["id"] <= max_id]

    # Sorting
    if sort_by not in ["id", "name"]:
        return {"error": f"Cannot sort by {sort_by}. Valid options: 'id', 'name'."}
    filtered_data = sorted(filtered_data, key=lambda x: x[sort_by], reverse=(order == "desc"))

    # Pagination
    paginated_data = filtered_data[offset: offset + limit]

    return {
        "total": len(filtered_data),
        "limit": limit,
        "offset": offset,
        "data": paginated_data,
    }
```

**Contoh Permintaan:**

- `/items/advanced?limit=5&offset=10&name=item&min_id=10&sort_by=name&order=asc`
    - Filter: Nama mengandung "item" dan ID minimal 10.
    - Sort: Berdasarkan nama secara ascending.
    - Pagination: 5 item dimulai dari offset 10.