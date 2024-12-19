# 7.11 Caching

Caching adalah mekanisme penyimpanan sementara data untuk mengurangi beban sistem, mempercepat waktu respons, dan meningkatkan performa aplikasi. Dalam konteks API, caching dapat dilakukan pada berbagai tingkat, termasuk respons API dan query database.

## 7.11.1 Response Caching

**Response caching** menyimpan hasil respons API sehingga permintaan berikutnya untuk data yang sama tidak perlu diproses ulang. Ini sangat berguna untuk data yang jarang berubah.

### **Cara Implementasi di FastAPI**

1. **Gunakan Header `Cache-Control`**
Tambahkan header `Cache-Control` untuk mengatur durasi penyimpanan cache di klien atau CDN.

```bash
from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI()

@app.get("/cached-response")
def get_cached_response():
    data = {"message": "Data ini akan di-cache"}
    response = JSONResponse(content=data)
    response.headers["Cache-Control"] = "public, max-age=3600"  # Cache selama 1 jam
    return response
```

2. **Gunakan Middleware untuk Response Caching**
API dapat menggunakan middleware seperti **Starlette's BaseHTTPMiddleware** untuk mengimplementasikan caching lebih lanjut.

## 7.11.2 Database Query Caching

**Database query caching** menyimpan hasil query database sehingga query yang sama di masa depan dapat dijawab lebih cepat tanpa mengeksekusi ulang query.

### **Menggunakan Redis untuk Query Caching di FastAPI**

Redis adalah database in-memory yang cepat dan populer untuk caching.

### **Langkah Implementasi di FastAPI**

1. **Instalasi Redis dan Library Redis untuk Python**
   
   Install Redis dan library `redis-py`:

```bash
pip install redis
```

2. **Konfigurasi Redis Connection**
   
   Buat koneksi ke Redis:

```bash
import redis

redis_client = redis.Redis(host="localhost", port=6379, db=0)
```

3. **Caching Query Database**
   
   Gunakan Redis untuk menyimpan hasil query:

```bash
from fastapi import FastAPI, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select
from redis import Redis
from app.models import User  # Ganti dengan model Anda

app = FastAPI()

# Redis connection
redis_client = Redis(host="localhost", port=6379, db=0)

@app.get("/users/{user_id}")
async def get_user(user_id: int, db: AsyncSession):
    cache_key = f"user:{user_id}"

    # Cek data di cache Redis
    cached_data = redis_client.get(cache_key)
    if cached_data:
        return {"source": "cache", "data": cached_data.decode("utf-8")}

    # Jika tidak ada di cache, query database
    query = select(User).where(User.id == user_id)
    result = await db.execute(query)
    user = result.scalar()

    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    # Simpan data ke Redis dengan waktu kadaluarsa 1 jam
    redis_client.setex(cache_key, 3600, str(user.dict()))

    return {"source": "database", "data": user.dict()}
```

4. **Menghapus Cache Saat Data Diupdate**
   
   Ketika data berubah, pastikan cache dihapus atau diperbarui untuk menjaga konsistensi:

```bash
@app.put("/users/{user_id}")
async def update_user(user_id: int, user_data: dict, db: AsyncSession):
    query = select(User).where(User.id == user_id)
    result = await db.execute(query)
    user = result.scalar()

    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    # Update data di database
    for key, value in user_data.items():
        setattr(user, key, value)
    db.add(user)
    await db.commit()

    # Hapus cache yang terkait
    cache_key = f"user:{user_id}"
    redis_client.delete(cache_key)

    return {"message": "User updated", "data": user_data}
```

### **Best Practices untuk Caching**

1. **Tetapkan Expiration Time**
   
   Semua cache harus memiliki waktu kedaluwarsa (`TTL`) untuk menghindari penyimpanan data lama yang tidak relevan.
2. **Cache Hanya Data yang Sering Diakses** 

   Tidak semua data perlu dicache. Prioritaskan data yang mahal untuk dihasilkan atau sering diminta.
3. **Gunakan Cache Invalidation** 

   Pastikan cache diperbarui atau dihapus saat data dasar berubah.
4. **Monitoring dan Debugging** 

   Gunakan alat seperti Redis Insight untuk memantau performa dan penggunaan Redis.


### **Keuntungan Caching**

1. Mengurangi beban database.
2. Meningkatkan kecepatan respons API.
3. Menyediakan fallback data jika sistem backend tidak tersedia sementara.

Caching adalah alat yang kuat untuk meningkatkan performa sistem, tetapi harus digunakan dengan hati-hati untuk memastikan konsistensi data.