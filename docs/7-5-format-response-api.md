# 7.5 Format Respons

## 7.5.1 Respons JSON

- Semua respons dari API harus berformat JSON. Struktur respons harus konsisten dan jelas. Misalnya:

    ```json
    { "status": "success", "data": {...}, "message": "Operation completed successfully" }
    ```
    
    ```json 
    {"data1": {...}, "data2": "value2", "data3": "value3"}
    ```


## 7.5.2 Kode Status HTTP

- Wajib menggunakan kode status HTTP yang tepat. Kode status HTTP harus sesuai ketentuan.
- Kode status HTTP sangat penting untuk memberi tahu klien tentang status permintaan mereka. Beberapa kode status umum yang harus digunakan adalah:
    - `200 OK` untuk permintaan yang berhasil.
    - `201 Created` ketika data baru berhasil dibuat.
    - `400 Bad Request` jika permintaan tidak valid.
    - `404 Not Found` jika resource tidak ditemukan.
    - `401 Unauthorized` jika permintaan membutuhakn autentikasi tetapi klient tidak mengirimkan kredensial yang sah.
    - `409 Confict` jika permintaan tidak bisa di proses karena adanya konflik dengan status sumber daya.
    - `422 Unprocessable Entity` jika data yang dikirim klient gagal divalidasi oleh server.
    - `500 Internal Server Error` untuk kesalahan di server.

## 7.6 Data Validation dan Sanitization

**Data Validation dan Sanitization** merupakan dua langkah penting dalam pengolahan data yang diterima oleh API untuk menjaga integritas, keamanan, dan memastikan bahwa hanya data yang valid yang diterima oleh sistem. Keduanya sangat penting untuk melindungi sistem dari serangan dan kesalahan yang dapat terjadi akibat data yang tidak valid atau berbahaya.

### 7.6.1 Validasi Input

Validasi input adalah proses untuk memeriksa data yang diterima dari klien (seperti melalui parameter URL, body request, atau header) untuk memastikan bahwa data tersebut memenuhi kriteria yang diharapkan. Hal ini berfungsi untuk:

- **Menjamin integritas data**: Memastikan bahwa data yang diterima sesuai dengan format dan tipe yang diharapkan.
- **Mencegah eksploitasi**: Menghindari serangan seperti **SQL Injection**, **Cross-Site Scripting (XSS)**, dan **Buffer Overflow** yang bisa terjadi akibat data yang tidak tervalidasi dengan benar.

### Teknik Validasi Umum:

1. **Format Data**: Memeriksa apakah data yang diterima sesuai dengan format yang benar. Misalnya, memastikan bahwa email adalah email yang valid, atau tanggal berada dalam format yang benar.
- **Contoh**: Memastikan bahwa field email hanya berisi alamat email yang valid (`user@example.com`).
- **Tools**: Bisa menggunakan library seperti `email-validator` di Python atau `validator` di JavaScript.
2. **Tipe Data**: Memastikan bahwa tipe data yang diterima sesuai dengan yang diinginkan. Misalnya, jika aplikasi mengharapkan sebuah angka (integer), pastikan data tersebut adalah angka, bukan string atau karakter lain.
- **Contoh**: Memastikan bahwa nilai pada field "age" adalah tipe data integer.
- **Tools**: Misalnya, menggunakan `Pydantic` (di FastAPI) atau `Joi` (di Node.js).
3. **Nilai yang Diharapkan (Range)**: Memeriksa apakah nilai yang diterima berada dalam rentang yang dapat diterima. Contoh, umur pengguna tidak boleh kurang dari 0 atau lebih dari 120.
- **Contoh**: Memeriksa apakah nilai harga produk berada dalam rentang yang diizinkan (misalnya, 0 hingga 10,000).
4. **Kewajiban**: Memastikan bahwa data yang penting atau wajib ada (misalnya, nama atau email) benar-benar ada dalam permintaan dan tidak kosong.
- **Contoh**: Memastikan bahwa field `username` dan `password` tidak kosong pada saat melakukan registrasi.

### **Library dan Tools untuk Validasi:**

- **FastAPI** (Python): `Pydantic` menyediakan validasi otomatis untuk model data yang dikirimkan oleh klien.
- **Express Validator** (Node.js): Middleware untuk memvalidasi data input di aplikasi Express.
- **Joi** (Node.js): Validasi data berbasis skema yang kuat untuk menangani data yang diterima dari klien.

Contoh penggunaan validasi input di FastAPI dengan Pydantic

```python
from pydantic import BaseModel, EmailStr, condecimal
from datetime import date

class UserRequest(BaseModel):
    username: str
    email: EmailStr
    date_of_birth: date
    salary: condecimal(gt=0)  # Memastikan salary lebih dari 0

# Contoh endpoint FastAPI yang menggunakan validasi input
@app.post("/register")
async def register(user: UserRequest):
    return {"message": "User created successfully", "user": user}
```

### 7.6.2 Sanitization atau Pembersihan Data

Sanitization adalah proses untuk membersihkan data yang diterima agar tidak mengandung karakter atau konten yang berbahaya yang bisa digunakan untuk melakukan eksploitasi atau serangan. Sanitization bertujuan untuk melindungi aplikasi dari ancaman yang dapat merusak integritas sistem atau data, seperti **Cross-Site Scripting (XSS)** atau **SQL Injection**.

### Tujuan Sanitization:

- **Menghapus karakter berbahaya**: Menghindari karakter atau script yang dapat dieksekusi oleh browser atau server yang dapat dimanfaatkan oleh penyerang.
- **Menjaga keamanan sistem**: Mencegah eksploitasi celah keamanan seperti **SQL Injection** dan **Cross-Site Scripting (XSS)**.

### Teknik Sanitization:

1. **Escaping Input**: Menambahkan karakter escape pada data input, seperti menambahkan backslash pada tanda kutip (`'`) atau tanda petik ganda (`"`), agar data tersebut tidak bisa dieksekusi.
- **Contoh**: Pada input HTML, tanda `<` dan `>` perlu diubah menjadi `&lt;` dan `&gt;` untuk mencegah eksekusi script HTML.
2. **HTML Sanitization**: Menghapus atau mengganti elemen HTML yang tidak diinginkan, seperti script atau event handler.
- **Contoh**: Menghapus tag `<script>` atau atribut `onload` yang dapat digunakan untuk XSS.
3. **SQL Sanitization**: Menghindari penggunaan data input langsung dalam query SQL yang dapat digunakan untuk SQL Injection. Salah satu teknik untuk ini adalah dengan menggunakan parameterized queries atau ORM (Object-Relational Mapping) yang aman.
- **Contoh**: Menggunakan query parameterized atau ORM untuk mencegah eksekusi SQL yang berbahaya.

### **Library dan Tools untuk Sanitization:**

- **HTMLPurifier** (PHP): Menghapus atau memodifikasi elemen-elemen HTML yang tidak aman.
- **Sanitizer** (JavaScript): Library untuk membersihkan HTML dan mencegah XSS.
- **OWASP Java HTML Sanitizer**: Library Java untuk sanitasi HTML.
- **FastAPI + Pydantic**: Walaupun FastAPI sendiri tidak melakukan sanitasi secara otomatis, Sanitasi bisa memanfaatkan library lain untuk sanitasi input (misalnya, menggunakan `bleach` untuk sanitasi HTML).

Contoh sanitasi input dengan `bleach`

```python
from fastapi import FastAPI, Form
import bleach

app = FastAPI()

@app.post("/sanitize")
async def sanitize_input(data: str = Form(...)):
    sanitized_data = bleach.clean(data)
    return {"sanitized_data": sanitized_data}
```

Di framework FastAPI dengan Pydantic memastikan bahwa data yang diterima memiliki tipe yang benar. Ini membantu mencegah beberapa jenis eksploitasi.

```python
from pydantic import BaseModel, EmailStr

class UserRequest(BaseModel):
    username: str
    email: EmailStr  # Validasi email
    age: int  # Memastikan ini integer

@app.post("/user")
async def create_user(user: UserRequest):
    return {"username": user.username, "email": user.email, "age": user.age}

```

Untuk sanitasi data yang akan dimasukan ke query database, dapat menggunakan query parameter untuk mencegah sql injection.

```python
from fastapi import FastAPI
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import text

app = FastAPI()

@app.post("/safe_query")
async def safe_query(username: str, db: AsyncSession):
    # Query dengan parameterized untuk mencegah SQL Injection
    result = await db.execute(
        text("SELECT * FROM users WHERE username = :username"),
        {"username": username}
    )
    user = result.fetchone()
    return {"user": user}

```

## 7.7 Pagination, Filtering, dan Sorting

Saat API mengembalikan banyak data (misalnya daftar pengguna, produk, atau artikel), penting untuk mendukung fitur **Pagination**, **Filtering**, dan **Sorting**. Hal ini meningkatkan performa aplikasi, mengurangi konsumsi bandwidth, dan memberi pengguna fleksibilitas untuk mendapatkan data yang relevan.

### 7.7.1 Pagination

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

### 7.7.2 Filtering dan Sorting

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

## 7.8 Keamanan

Keamanan adalah aspek kritis dalam pengembangan API. Memastikan keamanan API melibatkan perlindungan terhadap data pengguna dan mencegah akses tidak sah. Berikut adalah poin-poin penting yang mencakup autentikasi, otorisasi, enkripsi, dan kontrol akses.

### 7.8.1 Autentikasi

Autentikasi adalah proses untuk memverifikasi identitas pengguna atau klien yang mencoba mengakses API. Metode autentikasi yang direkomendasikan:

1. **JWT (JSON Web Token):**
- Token berbasis JSON yang aman, ringan, dan mendukung autentikasi stateless.
- Token harus di-validasi di setiap permintaan untuk memastikan keaslian dan masa berlaku.
2. **OAuth 2.0:**
- Sistem autentikasi yang lebih kompleks, mendukung third-party access dengan token akses (access token).
- Cocok untuk aplikasi yang membutuhkan kontrol akses granular melalui scopes.

Contoh penerapan di FastAPI menggunakan OAuth 2.0:

```python
from fastapi import Depends, FastAPI
from fastapi.security import OAuth2PasswordBearer

app = FastAPI()
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

@app.get("/protected")
def protected_endpoint(token: str = Depends(oauth2_scheme)):
    return {"message": "Access granted", "token": token}
```

### 7.8.2 Otorisasi

Otorisasi berbeda dari autentikasi. Otorisasi memverifikasi apakah pengguna yang sudah terautentikasi memiliki hak akses untuk melakukan aksi tertentu pada resource.

- **Hubungan Autentikasi dan Otorisasi:**Autentikasi dilakukan terlebih dahulu, diikuti dengan otorisasi untuk menentukan tingkat akses.
- **Kaitannya dengan Scope (lihat Sub Bab 7.9):**Otorisasi diatur melalui scopes di OAuth 2.0, memastikan klien hanya dapat mengakses data atau fitur yang diizinkan.

Jika otorisasi digunakan, maka harus ada kebijakan yang jelas tentang tingkat akses. Misalnya:

- Administrator dapat mengakses seluruh resource.
- Pengguna umum hanya dapat membaca data miliknya sendiri.

### 7.8.3 HTTPS

HTTPS adalah protokol wajib untuk mengamankan komunikasi antara klien dan server.

- Data yang dikirimkan akan dienkripsi, sehingga tidak dapat dibaca pihak ketiga selama transmisi.
- Gunakan sertifikat SSL/TLS yang valid untuk mencegah serangan man-in-the-middle (MITM).

### 7.8.4 CORS (Cross-Origin Resource Sharing)

CORS digunakan untuk membatasi asal (origin) yang diizinkan mengakses API.

- Konfigurasi CORS yang tepat mencegah serangan seperti **Cross-Site Request Forgery (CSRF)**.
- Contoh konfigurasi di FastAPI:

```python
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["https://trusted-domain.com"],
    allow_credentials=True,
    allow_methods=["GET", "POST"],
    allow_headers=["*"],
)
```

## 7.9 SCOPES

Scopes adalah bagian integral dari pengaturan otorisasi di OAuth 2.0, yang digunakan untuk membatasi hak akses klien terhadap resource API tertentu. Scopes memberikan kontrol granular terhadap apa yang dapat diakses atau dilakukan oleh klien.

### 7.9.1 Kosen Scopes dalam OAuth 2.0

Scopes didefinisikan untuk menentukan jenis akses yang diizinkan terhadap resource tertentu.

Misalnya:

- `user.read`: Mengizinkan akses baca terhadap data pengguna.
- `user.write`: Mengizinkan akses tulis terhadap data pengguna.

### 7.9.2 Langkah Membuat Scopes yang Efektif

- **Identifikasi Resource yang Akan Diakses:**

  Tentukan resource dan operasi yang mungkin dilakukan. Misalnya, API untuk manajemen data pengguna dapat memiliki resource seperti:

    - **Profil:** Scopes `profile.read`, `profile.update`.
    - **Postingan:** Scopes `post.read`, `post.create`, `post.delete`.
- **Granularitas Akses:**
    - Buat scopes yang spesifik untuk meningkatkan keamanan.
    - Misalnya, gunakan `post.create` alih-alih scope yang lebih umum seperti `write`.
- **Penerapan Scopes di API:**

  API harus memvalidasi scope yang dimiliki klien sebelum memberikan akses.

  Contoh validasi scopes di FastAPI:


```python
from fastapi import Depends, HTTPException
from fastapi.security import OAuth2PasswordBearer
from typing import List

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

def check_scopes(token: str, required_scopes: List[str]):
    # Simulasi validasi token dan scopes
    token_scopes = ["user.read", "post.create"]
    for scope in required_scopes:
        if scope not in token_scopes:
            raise HTTPException(status_code=403, detail="Insufficient scope")
    return True

@app.get("/profile")
def get_profile(token: str = Depends(oauth2_scheme)):
    check_scopes(token, ["user.read"])
    return {"message": "Profile data"}

```

### 7.9.3 Dokumentasi Scope

Scopes harus terdokumentasi dengan baik, termasuk:

- Penjelasan singkat tentang fungsinya.
- Contoh penggunaannya di API.

Dokumentasi yang terintegrasi dengan Swagger atau Redoc dapat membantu pengembang memahami scopes yang tersedia.

---

## 7.10 Versioning Database

Mengelola versi skema database (schema versioning) adalah praktik penting untuk menjaga keselarasan antara database dan API, terutama dalam lingkungan yang terus berkembang. Selain itu, **kompatibilitas mundur (backward compatibility)** adalah keharusan untuk memastikan bahwa API versi lama tetap berfungsi meskipun ada perubahan pada skema database.

### 7.10.1 Schema Versioning

Schema versioning memastikan bahwa perubahan pada database (misalnya, menambah kolom, membuat tabel baru, atau menghapus kolom) dapat dikelola secara sistematis. Hal ini penting untuk:

- Mempermudah rollback jika terjadi kesalahan.
- Mendokumentasikan perubahan skema untuk koordinasi antar tim.
- Menjamin bahwa perubahan tidak merusak API atau sistem lain yang bergantung pada skema database.

**Tools yang direkomendasikan:**

- **Alembic** (untuk SQLAlchemy): Mendukung migrasi skema database berbasis Python, dan sangat cocok digunakan dengan FastAPI.
- **Flyway** atau **Liquibase**: Alat alternatif untuk database versioning yang mendukung berbagai platform dan bahasa.

**Contoh Implementasi dengan Alembic:**

1. **Konfigurasi Alembic:**

   Pastikan proyek API menggunakan SQLAlchemy, kemudian instal Alembic:


```bash
pip install alembic
```

Inisialisasi Alembic di proyek API:

```bash
alembic init migrations
```

Periksa file `alembic.ini` untuk mengatur koneksi API ke database.

1. **Membuat dan Menerapkan Migrasi:**
- **Contoh Tambah Kolom Baru:**Tambahkan kolom `birth_date` ke tabel `users`.
    - Buat model SQLAlchemy yang diperbarui:

      ```python
      from sqlalchemy import Column, Integer, String, Date
      from sqlalchemy.ext.declarative import declarative_base
      
      Base = declarative_base()
      
      class User(Base):
          __tablename__ = "users"
          id = Column(Integer, primary_key=True)
          name = Column(String(50))
          email = Column(String(50))
          birth_date = Column(Date)  # Kolom baru
      ```

- Buat file migrasi menggunakan Alembic:

```bash
alembic revision --autogenerate -m "Add birth_date to users table"
```

- Terapkan migrasi:

```bash
alembic upgrade head
```

1. **Rollback Jika Terjadi Masalah:**

Jika terjadi kesalahan, Anda dapat kembali ke versi sebelumnya:

```bash
alembic downgrade -1
```

1. **Penyesuaian Otomatis:**

Gunakan fitur autogenerate Alembic untuk mendeteksi perubahan pada model SQLAlchemy Anda dan menghasilkan migrasi secara otomatis.

### 7.10.2 Backward Compability

Kompatibilitas mundur adalah kemampuan sistem untuk mendukung versi API lama meskipun ada perubahan pada database. Praktik ini penting untuk memastikan klien yang menggunakan versi API lama tetap dapat berfungsi dengan baik.

**Prinsip Utama:**

1. **Non-destruktif Changes:**
- Tambahkan kolom baru daripada mengganti atau menghapus kolom lama.
- Jika kolom perlu dihapus, pastikan API lama tetap dapat bekerja dengan fallback atau nilai default.
2. **Data Migration:**
- Saat membuat perubahan besar pada skema, migrasikan data yang diperlukan agar API lama tetap dapat mengakses data yang sesuai.
3. **Versi API dan Database:**
- Gunakan penanda versi pada tabel atau skema database jika memungkinkan. Misalnya, tabel `users_v1` untuk API lama, dan `users_v2` untuk API baru.

**Contoh Backward Compatibility di FastAPI:**

Misalkan API diperbaruhi untuk mendukung kolom baru `birth_date`, tetapi versi API lama hanya menggunakan `name` dan `email`.

- **Model Baru:**

```bash
from sqlalchemy import Column, Integer, String, Date
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True)
    name = Column(String(50))
    email = Column(String(50))
    birth_date = Column(Date)  # Kolom baru
```

- Endpoint FastAPI untuk API Lama dan Baru:

```bash
from fastapi import FastAPI, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select

app = FastAPI()

@app.get("/v1/users")
async def get_users_v1(db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(User.id, User.name, User.email))
    users = result.fetchall()
    return {"users": [dict(user) for user in users]}

@app.get("/v2/users")
async def get_users_v2(db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(User))
    users = result.scalars().all()
    return {"users": [user.to_dict() for user in users]}
```

- API v1 hanya mengembalikan `name` dan `email`.
- API v2 mendukung kolom baru `birth_date`.

## 7.11 Caching

Caching adalah mekanisme penyimpanan sementara data untuk mengurangi beban sistem, mempercepat waktu respons, dan meningkatkan performa aplikasi. Dalam konteks API, caching dapat dilakukan pada berbagai tingkat, termasuk respons API dan query database.

### 7.11.1 Response Caching

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

1. **Gunakan Middleware untuk Response Caching**
   API dapat menggunakan middleware seperti **Starlette's BaseHTTPMiddleware** untuk mengimplementasikan caching lebih lanjut.

### 7.11.2 Database Query Caching

**Database query caching** menyimpan hasil query database sehingga query yang sama di masa depan dapat dijawab lebih cepat tanpa mengeksekusi ulang query.

### **Menggunakan Redis untuk Query Caching di FastAPI**

Redis adalah database in-memory yang cepat dan populer untuk caching.

### **Langkah Implementasi di FastAPI**

1. **Instalasi Redis dan Library Redis untuk Python**
   Install Redis dan library `redis-py`:

```bash
pip install redis
```

1. **Konfigurasi Redis Connection**
   Buat koneksi ke Redis:

```bash
import redis

redis_client = redis.Redis(host="localhost", port=6379, db=0)
```

1. **Caching Query Database**
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

1. **Menghapus Cache Saat Data Diupdate**
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

- Mengurangi beban database.
- Meningkatkan kecepatan respons API.
- Menyediakan fallback data jika sistem backend tidak tersedia sementara.

Caching adalah alat yang kuat untuk meningkatkan performa sistem, tetapi harus digunakan dengan hati-hati untuk memastikan konsistensi data.