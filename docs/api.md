# Panduan Implementasi API

## 1. Struktur Dasar API

### Prefix Produk
- Jika dalam 1 domain terdapat lebih dari satu produk API, maka wajib menyertakan prefix nama produk sebelum versi API
  - Contoh: `/vnext/v1/staff`, `/vnext/v1/student`, `/datamart/v1/pegawai/`, `/aksi/v1/kkn/`
- Jika produk hanya 1, prefix bisa menggunakan `/api/v1/`

### Versioning
- Wajib menggunakan versioning pada endpoint (misalnya `/api/v1/`). Hal ini memudahkan upgrade di masa mendatang tanpa mengganggu klien yang menggunakan versi lama.
- **Contoh:** `/api/v1/users`.

### Endpoint Naming
- Gunakan kata benda (noun) pada endpoint.
- Gunakan format plural untuk mengindikasikan koleksi data.
- Hindari penggunaan kata kerja dalam endpoint.
- **Contoh:** `/api/v1/products`, `/api/v1/orders`.

## 2. Metode HTTP

### GET
- Digunakan untuk mengambil data.
- **Contoh:** `GET /api/v1/products` untuk mendapatkan daftar produk.

### POST
- Digunakan untuk membuat data baru.
- **Contoh:** `POST /api/v1/products` untuk membuat produk baru.

### PUT/PATCH
- Digunakan untuk mengupdate data yang ada.
- `PUT` untuk update seluruh resource, `PATCH` untuk update sebagian.
- **Contoh:** `PUT /api/v1/products/{id}` untuk mengupdate seluruh data produk.

### DELETE
- Digunakan untuk menghapus data.
- **Contoh:** `DELETE /api/v1/products/{id}` untuk menghapus produk.

## 3. Format Respons

### Respons JSON
- Standarkan semua respons API dalam format JSON.
- Struktur respons harus konsisten, contoh `{ "status": "success", "data": {...}, "message": "" }`.
- Contoh response lain `{"data1": {...}, "data2": "value2", "data3": "value3"}`

### Kode Status HTTP
- Gunakan kode status HTTP yang tepat (misalnya 200 untuk sukses, 404 untuk tidak ditemukan, 500 untuk kesalahan server).
- **Contoh:** `200 OK`, `201 Created`, `400 Bad Request`, `401 Unauthorized`.

## 4. Keamanan

### Autentikasi
- Gunakan mekanisme autentikasi yang aman, token JWT (JSON Web Token) dan OAuth2.
- Pastikan endpoint yang memerlukan autentikasi hanya bisa diakses oleh pengguna yang telah terotentikasi.

### HTTPS
- Wajib menggunakan HTTPS untuk mengenkripsi data yang dikirimkan antara klien dan server.

### CORS
- Konfigurasi CORS (Cross-Origin Resource Sharing) dengan tepat untuk mencegah akses dari sumber yang tidak terpercaya.

## 5. Dokumentasi

### Dokumentasi Interaktif dan Otomatis
- Sediakan dokumentasi interaktif yang memungkinkan pengembang mencoba API langsung dari dokumentasi.
- Gunakan alat seperti Swagger atau ReDoc untuk mendokumentasikan API secara otomatis.
- Dokumentasi harus memuat informasi endpoint, parameter, respons, dan contoh penggunaan.

## 6. Error Logging dan Monitoring

### Error Logging
- Pastikan semua kesalahan yang terjadi di server tercatat dalam log yang dapat dipantau. Gunakan alat logging seperti Logstash atau ELK Stack untuk memudahkan analisis (Optional).
- Minimal sediakan log error dalam file log yang mudah diakses.

### Monitoring (Optional)
- Implementasikan monitoring untuk API Anda menggunakan alat seperti Prometheus atau Grafana agar dapat memantau performa, uptime, dan respons time API.
- Dengan monitoring yang baik, Anda bisa dengan cepat mendeteksi dan memperbaiki masalah sebelum mempengaruhi pengguna.

## 7. Data Validation dan Sanitization

### Input Validation
- Selalu validasi data yang diterima dari klien untuk memastikan integritas data dan mencegah serangan seperti SQL Injection atau XSS.
- Gunakan library atau middleware yang mendukung validasi input secara otomatis.
- Misal data tanggal format harus date bukan string. Integer harus integer bukan string. Email harus valid email bukan string.

### Sanitization
- Bersihkan data yang diterima untuk menghilangkan karakter-karakter berbahaya yang bisa digunakan untuk eksploitasi.

## 8. Rate Limiting dan Throttling (Dapat dilakukan di api gateway)

### Rate Limiting
- Batasi jumlah permintaan yang dapat dilakukan oleh klien dalam jangka waktu tertentu untuk mencegah abuse.
- **Contoh:** 1000 requests per jam per IP.

### Throttling
- Implementasikan throttling untuk mengurangi laju permintaan jika pengguna mencapai batas rate limit.

## 9. Testing

### Unit Testing
- Buat unit tests untuk memverifikasi bahwa setiap komponen API berfungsi dengan baik dan benar.

### Integration Testing
- Tes integrasi memastikan bahwa berbagai komponen API berfungsi bersama-sama dengan baik.

### End-to-End Testing (Opsional)
- Lakukan end-to-end testing untuk mensimulasikan seluruh alur penggunaan API dari perspektif pengguna.

## 10. Caching (Opsional)

### Response Caching
- Gunakan caching pada respons yang tidak sering berubah untuk mengurangi beban server dan mempercepat respons API.
- **Contoh:** Gunakan header `Cache-Control` untuk mengatur caching di klien.

### Database Query Caching
- Implementasikan caching pada level database atau ORM (Object-Relational Mapping) untuk mengurangi waktu pengambilan data yang sering diakses.

## 11. Pagination, Filtering, dan Sorting

### Pagination
- Implementasikan pagination pada endpoint yang mengembalikan banyak data.
- **Contoh:** `GET /api/v1/products?page=1&limit=10`.
- **Contoh:** `GET /api/v1/products?skip=10&limit=10`.

### Filtering dan Sorting
- Sediakan fitur untuk filter dan sort data pada endpoint koleksi.
- **Contoh:** `GET /api/v1/products?category=electronics&sort=price_desc`.

## 12. Versioning Database (Opsional)

### Schema Versioning
- Pastikan API dan database selalu sinkron.

### Backward Compatibility (Mandatory)
- Pastikan perubahan pada skema database tidak merusak versi API yang lama. Pertahankan kompatibilitas mundur jika memungkinkan.

## 13. Asynchronous Processing (Opsional)

### Queue System
- Untuk tugas-tugas yang memakan waktu lama (seperti pengolahan data besar atau pengiriman email), gunakan sistem antrian seperti RabbitMQ, Kafka, atau Redis untuk memprosesnya secara asynchronous.
- Ini memastikan bahwa API tetap responsif dan pengguna tidak perlu menunggu lama untuk mendapatkan respons.

## 14. Scalability (Opsional)

### Horizontal Scaling
- Desain API dengan mempertimbangkan kebutuhan untuk scaling, seperti menggunakan load balancer atau database clustering.

### Statelessness
- Buat API yang stateless agar mudah di-scale secara horizontal. Setiap permintaan dari klien harus independen dan tidak bergantung pada status server sebelumnya.

## 15. API Gateway

### API Gateway
- Menggunakan API Gateway Krakend atau Kong untuk mengelola routing, rate limit, logging.
- API Gateway membantu mengelola banyak microservices dan memberikan satu titik akses ke semua endpoint API.

## 16. Framework

### Ketentuan
- **Bahasa Pemrograman Versi Terbaru:** Wajib menggunakan versi terbaru dari bahasa pemrograman yang digunakan. Misalnya:
    - PHP 8 atau lebih baru.
    - Node.js 20 atau lebih baru.
    - TypeScript 5 atau lebih baru.
    - Python 3 atau lebih baru.
    - Go 1.23 atau lebih baru.
- **Dukungan untuk Autentikasi:** Wajib mendukung JWT Token dan OAuth 2.0 untuk autentikasi dan otorisasi.
- **Dokumentasi Otomatis:** Wajib mendukung dokumentasi otomatis menggunakan OpenAPI, seperti Swagger atau ReDoc.
- **Modularitas dan Ekstensibilitas:** Framework harus mendukung arsitektur modular dan dapat diperluas sesuai kebutuhan proyek.
- **Dukungan Komunitas dan Pembaruan:** Framework yang digunakan harus memiliki komunitas yang aktif dan dukungan pembaruan yang berkelanjutan untuk keamanan dan fitur baru.
- **Performansi Tinggi:** Framework harus memiliki performansi yang baik dan dapat diandalkan untuk aplikasi dengan skala besar.

### Rekomendasi

#### FastAPI (Python)
- **Dokumentasi Otomatis:** FastAPI mendukung dokumentasi otomatis (Swagger/OpenAPI/Redocs) yang di-generate dari definisi endpoint, sehingga sangat memudahkan pengembang untuk memahami dan menggunakan API.
- **Mudah Dipelajari:** Sintaks yang sederhana dan jelas membuat FastAPI mudah dipelajari dan digunakan, bahkan bagi pengembang yang baru mengenal Python.
- **Performa Tinggi:** FastAPI menawarkan performa yang sangat tinggi, setara dengan Node.js dan Go, karena dibangun di atas ASGI (Asynchronous Server Gateway Interface) dan menggunakan async/await secara native.
- **Dukungan Komunitas:** FastAPI memiliki komunitas yang berkembang pesat dan dukungan ekosistem yang luas.
- **Website Resmi:** Untuk informasi lebih lanjut, dokumentasi, dan tutorial, kunjungi [FastAPI](https://fastapi.tiangolo.com/).

## 17. Scopes

Membuat scope pada OAuth 2.0 adalah langkah penting untuk mengatur akses aplikasi klien terhadap sumber daya tertentu dalam API. Scopes membatasi hak akses dan memberikan kontrol yang lebih granular terhadap apa yang dapat dilakukan oleh klien yang sudah terotorisasi.

### Berikut adalah langkah terbaik untuk membuat scope pada OAuth 2.0:
- Tentukan Resource dan Akses yang Diperlukan

Menentukan resource yang akan diakses dan jenis akses apa yang diperlukan oleh klien. Misalnya, jika API mengelola data pengguna, mungkin akan memerlukan beberapa scopes seperti:

    read:user: Mengizinkan akses baca terhadap data pengguna.
    write:user: Mengizinkan akses tulis terhadap data pengguna.
    delete:user: Mengizinkan penghapusan data pengguna.

Tips: Buat scope yang jelas dan deskriptif. Usahakan menggunakan standar REST (seperti read, write, delete) untuk memudahkan integrasi dengan klien. 
- Desain Scope Berdasarkan Granularitas Akses

Scope bisa sangat spesifik atau lebih umum tergantung pada kebutuhan aplikasi. Ada dua pendekatan:

    Scopes yang lebih umum: Misalnya read:data, yang mengizinkan akses ke semua data pengguna.
    Scopes yang lebih spesifik: Misalnya read:user atau read:profile, yang hanya mengizinkan akses ke profil pengguna.

Rekomendasi: Untuk keamanan, lebih baik membuat scope yang lebih spesifik. Ini akan mengurangi risiko memberikan akses yang tidak diperlukan kepada aplikasi klien.
- Penggunaan Scope di API

Di sisi API, gunakan scope untuk memeriksa hak akses klien terhadap resource tertentu. Contohnya, jika klien ingin mengambil data pengguna, API harus memastikan bahwa token yang dikirim memiliki scope read:user.
- Dokumentasikan Scope

Penting untuk mendokumentasikan scope dengan baik sehingga pengembang yang menggunakan API memahami fungsi dan penggunaannya. Gunakan dokumentasi seperti Swagger atau Redoc untuk menjelaskan scope yang tersedia dan kegunaannya.
Contoh Scope yang Baik:

Misalkan API mengelola aplikasi sosial media, berikut adalah contoh scope yang mungkin dibuat:

    read:profile : Akses untuk membaca profil pengguna.
    write:post : Mengizinkan membuat postingan.
    delete:comment : Mengizinkan penghapusan komentar.