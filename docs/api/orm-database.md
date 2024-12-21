# 7.10 Versioning Database

Mengelola versi skema database (schema versioning) adalah praktik penting untuk menjaga keselarasan antara database dan API, terutama dalam lingkungan yang terus berkembang. Selain itu, **kompatibilitas mundur (backward compatibility)** adalah keharusan untuk memastikan bahwa API versi lama tetap berfungsi meskipun ada perubahan pada skema database.

## 7.10.1 Schema Versioning

Schema versioning memastikan bahwa perubahan pada database (misalnya: menambah kolom, membuat tabel baru, atau menghapus kolom) dapat dikelola secara sistematis. Hal ini penting untuk:

1. Mempermudah rollback jika terjadi kesalahan.
2. Mendokumentasikan perubahan skema untuk koordinasi antar tim.
3. Menjamin bahwa perubahan tidak merusak API atau sistem lain yang bergantung pada skema database.

**Tools yang direkomendasikan:**

1. **Alembic** (untuk SQLAlchemy): Mendukung migrasi skema database berbasis Python, dan sangat cocok digunakan dengan FastAPI.
2. **Flyway** atau **Liquibase**: Alat alternatif untuk database versioning yang mendukung berbagai platform dan bahasa.

### Implementasi dengan Alembic

#### Konfigurasi Alembic

Adapun untuk langkah-langkah konfigurasinya adalah sebagai berikut:

1. Pastikan proyek API menggunakan SQLAlchemy, kemudian instal Alembic: `pip install alembic`
2. Inisialisasi Alembic di proyek API: `alembic init migrations`
3. Periksa file `alembic.ini` untuk mengatur koneksi API ke database.

#### Membuat dan Menerapkan Migrasi

Dengan tahapan sebagai berikut:

- Contoh tambah kolom baru: tambahkan kolom `birth_date` ke tabel `users`. 
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

- Buat file migrasi menggunakan Alembic: `alembic revision --autogenerate -m "Add birth_date to users table"`
- Terapkan migrasi: `alembic upgrade head`

#### Rollback jika terjadi masalah

Apabila terjadi kesalahan, maka dapat kembali ke versi sebelumnya: `alembic downgrade -1`

#### Penyesuaian otomatis

Penggunaan fitur autogenerate Alembic untuk mendeteksi perubahan pada model SQLAlchemy dan dapat menghasilkan migrasi secara otomatis.

## 7.10.2 Backward Compability

Kompatibilitas mundur adalah kemampuan sistem untuk mendukung versi API lama meskipun ada perubahan pada database. Praktik ini penting untuk memastikan klien yang menggunakan versi API lama tetap dapat berfungsi dengan baik.

**Prinsip Utama:**

1. **Non-destruktif Changes**
    
    Tambahkan kolom baru daripada mengganti atau menghapus kolom lama. Apabila kolom perlu dihapus, pastikan API lama tetap dapat bekerja dengan fallback atau nilai default.
    
2. **Data Migration:**
    
    Saat membuat perubahan besar pada skema, migrasikan data yang diperlukan agar API lama tetap dapat mengakses data yang sesuai.
    
3. **Versi API dan Database:**
    
    Gunakan penanda versi pada tabel atau skema database jika memungkinkan. Misalnya, tabel `users_v1` untuk API lama, dan `users_v2` untuk API baru.
    

**Contoh Backward Compatibility di FastAPI:**

Misalkan API diperbaruhi untuk mendukung kolom baru `birth_date`, tetapi versi API lama hanya menggunakan `name` dan `email`.

**Model Baru:**

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

**Endpoint FastAPI untuk API Lama (API v1) dan Baru (API v2):**

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

Penjelasan:

1. API v1 hanya mengembalikan `name` dan `email`.
2. API v2 mendukung kolom baru `birth_date`.