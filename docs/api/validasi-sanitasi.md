# 7.6 Data Validation dan Sanitization

**Data Validation dan Sanitization** merupakan dua langkah penting dalam pengolahan data yang diterima oleh API untuk menjaga integritas, keamanan, dan memastikan bahwa data yang diterima oleh sistem adalah hanya data yang valid. Keduanya sangat penting untuk melindungi sistem dari serangan dan kesalahan yang dapat terjadi akibat data yang tidak valid atau berbahaya.

## 7.6.1 Validasi Input

Validasi input adalah proses pemeriksaan data yang diterima dari klien (seperti melalui parameter URL, body request, atau header) untuk memastikan bahwa data tersebut memenuhi kriteria yang diharapkan. Hal tersebut berfungsi untuk:

1. **Menjamin integritas data**: Memastikan bahwa data yang diterima sesuai dengan format dan tipe yang diharapkan.
2. **Mencegah eksploitasi**: Menghindari serangan seperti **SQL Injection**, **Cross-Site Scripting (XSS)**, dan **Buffer Overflow** yang bisa terjadi akibat data yang tidak tervalidasi dengan benar.

### Teknik Validasi Umum:

1. **Format Data**
    
    Memeriksa apakah data yang diterima sesuai dengan format yang benar. Misalnya, memastikan bahwa email adalah email yang valid, atau tanggal berada dalam format yang benar.
    
    **Contoh**: Memastikan bahwa field email hanya berisi alamat email yang valid (`user@example.com`).
   
    **Tools**: Bisa menggunakan library seperti `email-validator` di Python atau `validator` di JavaScript.

2. **Tipe Data**
    
    Memastikan bahwa tipe data yang diterima sesuai dengan yang diinginkan. Misalnya, apabila aplikasi mengharapkan sebuah angka (integer), maka harus dipastikan data tersebut adalah angka, bukan string atau karakter lain.
    
    **Contoh**: Memastikan bahwa nilai pada field "age" adalah tipe data integer.
   
    **Tools**: Misalnya, menggunakan `Pydantic` (di FastAPI) atau `Joi` (di Node.js).

3. **Nilai yang Diharapkan (Range)**
    
    Memeriksa apakah nilai yang diterima berada dalam rentang yang dapat diterima. Contoh, umur pengguna tidak boleh kurang dari 0 atau lebih dari 120. **Contoh**: Memeriksa apakah nilai harga produk berada dalam rentang yang diizinkan (misalnya, 0 hingga 10,000).

4. **Kewajiban**
    
    Memastikan bahwa data yang penting atau wajib ada (misalnya, nama atau email) benar-benar ada dalam permintaan dan tidak kosong. **Contoh**: Memastikan bahwa field `username` dan `password` tidak kosong pada saat melakukan registrasi.

### **Library dan Tools untuk Validasi:**

1. **FastAPI** (Python): `Pydantic` menyediakan validasi otomatis untuk model data yang dikirimkan oleh klien.
2. **Express Validator** (Node.js): Middleware untuk memvalidasi data input di aplikasi Express.
3. **Joi** (Node.js): Validasi data berbasis skema yang kuat untuk menangani data yang diterima dari klien.

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

## 7.6.2 Sanitization atau Pembersihan Data

Sanitization adalah proses untuk membersihkan data yang diterima agar tidak mengandung karakter atau konten yang berbahaya yang bisa digunakan untuk melakukan eksploitasi atau serangan. Sanitization bertujuan untuk melindungi aplikasi dari ancaman yang dapat merusak integritas sistem atau data, seperti **Cross-Site Scripting (XSS)** atau **SQL Injection**.

### Tujuan Sanitization:

1. **Menghapus karakter berbahaya**
    
    Menghindari karakter atau script yang dapat dieksekusi oleh browser atau server yang dapat dimanfaatkan oleh penyerang.
    
2. **Menjaga keamanan sistem**
    
    Mencegah eksploitasi celah keamanan seperti **SQL Injection** dan **Cross-Site Scripting (XSS)**.

### Teknik Sanitization:

1. **Escaping Input**
    
    Menambahkan karakter escape pada data input, seperti menambahkan backslash pada tanda kutip (`'`) atau tanda petik ganda (`"`), agar data tersebut tidak bisa dieksekusi.
    
    **Contoh**: Pada input HTML, tanda `<` dan `>` perlu diubah menjadi `&lt;` dan `&gt;` untuk mencegah eksekusi script HTML.
    
2. **HTML Sanitization**
    
    Menghapus atau mengganti elemen HTML yang tidak diinginkan, seperti script atau event handler.
    
    **Contoh**: Menghapus tag `<script>` atau atribut `onload` yang dapat digunakan untuk XSS.
    
3. **SQL Sanitization**
    
    Menghindari penggunaan data input langsung dalam query SQL yang dapat digunakan untuk SQL Injection. Salah satu teknik untuk ini adalah dengan menggunakan parameterized queries atau ORM (Object-Relational Mapping) yang aman.
    
    **Contoh**: Menggunakan query parameterized atau ORM untuk mencegah eksekusi SQL yang berbahaya.

### **Library dan Tools untuk Sanitization:**

1. **HTMLPurifier** (PHP)
   
   Menghapus atau memodifikasi elemen-elemen HTML yang tidak aman.

2. **Sanitizer** (JavaScript)

   Library untuk membersihkan HTML dan mencegah XSS.

3. **OWASP Java HTML Sanitizer**: Library Java untuk sanitasi HTML.

4. **FastAPI + Pydantic**

   Walaupun FastAPI sendiri tidak melakukan sanitasi secara otomatis, Sanitasi bisa memanfaatkan library lain untuk sanitasi input (misalnya, menggunakan `bleach` untuk sanitasi HTML).

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

Pada framework FastAPI dengan Pydantic memastikan bahwa data yang diterima memiliki tipe yang benar. Ini membantu mencegah beberapa jenis eksploitasi.

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