# 7.9 SCOPES

Scopes adalah bagian integral dari pengaturan otorisasi di OAuth 2.0, yang digunakan untuk membatasi hak akses klien terhadap resource API tertentu. Scopes memberikan kontrol granular terhadap apa yang dapat diakses atau dilakukan oleh klien.

## 7.9.1 Kosen Scopes dalam OAuth 2.0

Scopes didefinisikan untuk menentukan jenis akses yang diizinkan terhadap resource tertentu.

Misalnya:

- `user.read`: Mengizinkan akses baca terhadap data pengguna.
- `user.write`: Mengizinkan akses tulis terhadap data pengguna.

## 7.9.2 Langkah Membuat Scopes yang Efektif

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

## 7.9.3 Dokumentasi Scope

Scopes harus terdokumentasi dengan baik, termasuk:

- Penjelasan singkat tentang fungsinya.
- Contoh penggunaannya di API.

Dokumentasi yang terintegrasi dengan Swagger atau Redoc dapat membantu pengembang memahami scopes yang tersedia.

---