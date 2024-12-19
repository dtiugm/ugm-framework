# 7.2 Framework API

Framework adalah komponen penting dalam pengembangan aplikasi untuk memastikan efisiensi, konsistensi, dan skalabilitas. Pemilihan framework harus mempertimbangkan aspek teknis, performa, dan kemudahan pemeliharaan.

Kami memberikan rekomendasi framework yang sesuai dengan kebutuhan modern, tetapi tidak membatasi penggunaan framework tertentu selama memenuhi kriteria yang telah ditetapkan.

## 7.2.1 Ketentuan

### 7.2.1.1 Bahasa Pemrograman Versi Terbaru

  Aplikasi wajib menggunakan versi terbaru atau yang masih didukung aktif dari bahasa pemrograman untuk memastikan keamanan dan performa optimal.

  Contoh versi yang direkomendasikan:

1. **PHP**: Minimal versi 8 atau lebih baru.
2. **Node.js**: Minimal versi 20 atau lebih baru.
3. **TypeScript**: Minimal versi 5 atau lebih baru.
4. **Python**: Minimal versi 3.10 atau lebih baru.
5. **Go**: Minimal versi 1.23 atau lebih baru.

### 7.2.1.2 Dukungan untuk Autentikasi

  Framework yang digunakan wajib mendukung implementasi **JWT Token** dan **OAuth 2.0** untuk autentikasi dan otorisasi, yang berfungsi untuk menjaga keamanan akses API.

### 7.2.1.3 Dokumentasi Otomatis

  Framework harus mendukung **dokumentasi otomatis** berbasis **OpenAPI** (Swagger atau ReDoc), sehingga mempermudah pengembang dan pengguna API dalam memahami endpoint, parameter, dan respons.

### 7.2.1.4 Modularitas dan Ekstensibilitas

  Framework harus mendukung arsitektur **modular** agar setiap komponen aplikasi dapat dikembangkan, diuji, atau dimodifikasi secara independen. Ekstensibilitas memastikan framework dapat disesuaikan dengan kebutuhan spesifik proyek.

### 7.2.1.5 Dukungan Komunitas dan Pembaruan

  Framework yang digunakan harus memiliki komunitas yang aktif dan mendapat pembaruan berkelanjutan, sehingga aplikasi tetap aman dan kompatibel dengan teknologi terbaru.

### 7.2.1.6 Performansi Tinggi

  Framework harus memiliki performansi yang andal untuk menangani aplikasi dengan skala besar, terutama untuk skenario API dengan permintaan tinggi.

## 7.2.2 Rekomendasi

Kami merekomendasikan **FastAPI** sebagai framework utama untuk pengembangan aplikasi berbasis Python karena memperharikan hal-hal sebagai berikut:

### 7.2.2.1 Dokumentasi Otomatis

   FastAPI secara otomatis menghasilkan dokumentasi interaktif berbasis **OpenAPI** (Swagger/ReDoc) dari definisi endpoint, mempermudah kolaborasi antar tim pengembang dan pengguna API.

### 7.2.2.2 Mudah Dipelajari

   Sintaks FastAPI yang sederhana dan berbasis tipe (type hints) membuatnya mudah dipelajari, bahkan untuk pengembang yang baru mengenal Python.

### 7.2.2.3 Performa Tinggi

   Dibangun diatas **ASGI** (Asynchronous Server Gateway Interface) dan mendukung penggunaan **async/await**, FastAPI menawarkan performa tinggi setara dengan framework modern seperti **Node.js** atau **Go**.

### 7.2.2.4 Dukungan Komunitas

   FastAPI memiliki komunitas aktif dengan ekosistem pendukung yang kaya, termasuk pustaka populer Python seperti SQLAlchemy, Pydantic, dan lainnya.

### 7.2.2.5 Skalabilitas

   FastAPI dirancang untuk aplikasi modern yang membutuhkan skalabilitas tinggi dan arsitektur API yang robust.