# 7.8 Keamanan

Keamanan adalah aspek kritis dalam pengembangan API. Memastikan keamanan API melibatkan perlindungan terhadap data pengguna dan mencegah akses tidak sah. Berikut adalah poin-poin penting yang mencakup autentikasi, otorisasi, enkripsi, dan kontrol akses.

## 7.8.1 Autentikasi

Autentikasi adalah proses untuk memverifikasi identitas pengguna atau klien yang mencoba mengakses API. Metode autentikasi yang direkomendasikan:

1. **JWT (JSON Web Token)**
    
    Token berbasis JSON yang aman, ringan, dan mendukung autentikasi stateless. Token harus di-validasi pada setiap permintaan untuk memastikan keaslian dan masa berlaku.
    
2. **OAuth 2.0**
    
    Sistem autentikasi yang lebih kompleks, mendukung third-party access dengan token akses (access token). Hal ini cocok untuk aplikasi yang membutuhkan kontrol akses granular melalui scopes.
    

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

## 7.8.2 Otorisasi

Otorisasi berbeda dari autentikasi. Otorisasi memverifikasi apakah pengguna yang sudah terautentikasi memiliki hak akses untuk melakukan aksi tertentu pada resource.

**Hubungan Autentikasi dan Otorisasi** adalah autentikasi dilakukan terlebih dahulu, kemudian diikuti dengan otorisasi untuk menentukan tingkat akses. **Kaitannya dengan Scope (lihat Sub Bab 7.9), o**torisasi diatur melalui scopes pada OAuth 2.0 yang memastikan klien hanya dapat mengakses data atau fitur yang diizinkan.

Apabila otorisasi digunakan, maka harus ada kebijakan yang jelas tentang tingkat akses. Misalnya:

1. Administrator dapat mengakses seluruh resource.
2. Pengguna umum hanya dapat membaca data miliknya sendiri.

## 7.8.3 HTTPS

HTTPS adalah protokol wajib yang digunakan untuk mengamankan komunikasi antara klien dan server. Data yang dikirimkan akan dienkripsi, sehingga tidak dapat dibaca pihak ketiga selama transmisi. Penggunaan sertifikat SSL/TLS yang valid dapat mencegah serangan man-in-the-middle (MITM).

## 7.8.4 CORS (Cross-Origin Resource Sharing)

CORS digunakan untuk membatasi asal (origin) yang diizinkan mengakses API. Konfigurasi CORS yang tepat mencegah serangan seperti **Cross-Site Request Forgery (CSRF)**.

Contoh konfigurasi di FastAPI:

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