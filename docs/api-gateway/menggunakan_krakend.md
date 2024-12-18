## 8.3 Menggunakan Krakend

### 8.3.1 Membuat File Konfigurasi

Krakend menggunakan file konfigurasi JSON untuk mengatur semua fitur. Berikut adalah contoh struktur dasar file konfigurasi Krakend:

```json
{
  "version": 3,
  "name": "API Gateway",
  "port": 8080,
  "endpoints": [
    {
      "endpoint": "/api/v1/resource",
      "method": "GET",
      "backend": [
        {
          "url_pattern": "/resource",
          "host": [
            "http://backend-service"
          ]
        }
      ]
    }
  ]
}
```

- **`version`**: Versi konfigurasi.
- **`name`**: Nama gateway.
- **`port`**: Port yang digunakan oleh Krakend.
- **`endpoints`**: Daftar endpoint API yang dikelola oleh gateway.

### 8.3.2 Rate Limiting

Rate limiting membatasi jumlah permintaan yang dapat dilakukan oleh klien dalam periode waktu tertentu. Contoh konfigurasi rate limiting di Krakend:

```json
{
  "extra_config": {
    "github_com/devopsfaith/krakend-ratelimit/juju": {
      "maxRate": 5,
      "clientMaxRate": 2,
      "strategy": "ip"
    }
  }
}
```

- **`maxRate`**: Jumlah maksimum permintaan per detik untuk semua klien.
- **`clientMaxRate`**: Jumlah maksimum permintaan per detik per klien.
- **`strategy`**: Strategi identifikasi klien (misalnya berdasarkan IP).

### 8.3.3 Integrasi dengan Server OAuth 2.0

Krakend mendukung validasi token JWT (JSON Web Token) dari server OAuth 2.0. Dengan konfigurasi ini, Krakend dapat memastikan bahwa hanya permintaan dengan token yang valid yang diteruskan ke backend.

### Memvalidasi Token JWT

Krakend menggunakan plugin **krakend-jose** untuk memvalidasi token JWT. Berikut adalah langkah-langkah konfigurasinya:

```json
{
  "endpoints": [
    {
      "endpoint": "/api/v1/secure",
      "method": "GET",
      "backend": [
        {
          "host": ["http://backend-service"],
          "url_pattern": "/secure-data"
        }
      ],
      "extra_config": {
        "github.com/devopsfaith/krakend-jose/validator": {
          "alg": "RS256",
          "jwk-url": "https://auth-server.com/.well-known/jwks.json",
          "issuer": "https://auth-server.com/",
          "audience": ["api-client-id"],
          "disable_jwk_security": false
        }
      }
    }
  ]
}

```

- **`alg`**: Algoritma untuk memvalidasi token (misalnya RS256).
- **`jwk-url`**: URL ke JSON Web Key Set (JWKS) yang berisi kunci publik untuk memverifikasi token.
- **`issuer`**: Identitas server yang mengeluarkan token (harus sesuai dengan `iss` di token).
- **`audience`**: Daftar klien yang diizinkan menggunakan token (harus sesuai dengan `aud` di token).

### 8.3.4 Menentukan Scope di Endpoint

Scope digunakan untuk membatasi hak akses klien terhadap endpoint tertentu. Contoh implementasi:

Krakend dapat memastikan bahwa token memiliki scope tertentu sebelum mengizinkan akses ke endpoint. Scope memungkinkan pembatasan granular terhadap tindakan yang dapat dilakukan oleh klien.

Contoh konfigurasi:

```json
{
  "endpoints": [
    {
      "endpoint": "/api/v1/user-profile",
      "method": "GET",
      "backend": [
        {
          "host": ["http://user-service"],
          "url_pattern": "/profile"
        }
      ],
      "extra_config": {
        "github.com/devopsfaith/krakend-jose/validator": {
          "jwk-url": "https://auth-server.com/.well-known/jwks.json",
          "roles_key": "scope",
          "roles": ["profile.read"]
        }
      }
    },
    {
      "endpoint": "/api/v1/admin",
      "method": "GET",
      "backend": [
        {
          "host": ["http://admin-service"],
          "url_pattern": "/admin-data"
        }
      ],
      "extra_config": {
        "github.com/devopsfaith/krakend-jose/validator": {
          "jwk-url": "https://auth-server.com/.well-known/jwks.json",
          "roles_key": "scope",
          "roles": ["admin.read"]
        }
      }
    }
  ]
}

```

- **`roles_key`**: Field di dalam token yang menyimpan daftar scope.
- **`roles`**: Daftar scope yang diperlukan untuk mengakses endpoint.