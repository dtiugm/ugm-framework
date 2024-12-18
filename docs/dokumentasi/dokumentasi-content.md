# BAB 15 DOKUMENTASI

Dokumentasi sistem perangkat lunak adalah bagian yang sangat penting dalam pengembangan sistem karena dapat membantu pengembang, pengguna, dan tim pemeliharaan untuk memahami cara kerja, penggunaan, dan pengelolaan sistem. Dokumentasi yang baik memfasilitasi pemahaman yang jelas tentang bagaimana aplikasi, API, database, dan komponen lainnya bekerja, serta bagaimana cara mengelola dan mengembangkannya di masa depan.

Dalam bab ini, akan dibahas mengenai aspek-aspek yang perlu didokumentasikan untuk berbagai jenis sistem, seperti aplikasi, API, database, dan sistem lainnya, beserta alat yang dapat digunakan untuk membuat dokumentasi tersebut.

## 15.1 Dokumentasi Aplikasi (Mobile & Web)

Dokumentasi aplikasi penting untuk memandu pengguna dalam menggunakan aplikasi dan untuk pengembang dalam memelihara dan mengembangkan aplikasi tersebut. Berikut adalah elemen-elemen yang perlu didokumentasikan untuk aplikasi:

### 15.1.1 Panduan Pengguna

- **Deskripsi Aplikasi**: Penjelasan singkat tentang aplikasi, tujuan, dan pengguna yang disasar.
- **Instalasi**: Petunjuk tentang bagaimana menginstal aplikasi di perangkat pengguna, termasuk pengaturan yang dibutuhkan.
- **Petunjuk Penggunaan**: Langkah-langkah untuk menggunakan aplikasi, mulai dari cara login hingga cara memanfaatkan fitur utama aplikasi.
- **Pemecahan Masalah**: Solusi untuk masalah umum yang dapat ditemui oleh pengguna selama menggunakan aplikasi.

### 15.1.2 Dokumentasi Kode Aplikasi

- **Struktur Kode**: Penjelasan tentang struktur direktori dan file dalam kode aplikasi.
- **Fungsi dan Kelas Utama**: Deskripsi tentang fungsi atau kelas penting yang ada dalam aplikasi, beserta penjelasan parameter dan hasil yang diharapkan.
- **Dependensi**: Penjelasan mengenai library atau framework yang digunakan dalam pengembangan aplikasi.

### 15.1.3 Panduan Pengembangan dan Kontribusi

- **Lingkungan Pengembangan**: Instruksi untuk mempersiapkan lingkungan pengembangan lokal.
- **Panduan Kontribusi**: Petunjuk mengenai cara berkontribusi pada proyek aplikasi, seperti cara membuat pull request.
- **Proses Build dan Deployment**: Langkah-langkah untuk membangun aplikasi dan melakukan deployment ke server atau toko aplikasi.

### **15.1.4 Tools untuk Dokumentasi Aplikasi**:

- **Markdown**: Format ringan yang digunakan untuk membuat dokumentasi berbentuk teks.
- **Doxygen**: Alat untuk menghasilkan dokumentasi kode secara otomatis dari komentar dalam kode sumber.
- **Sphinx**: Alat untuk membuat dokumentasi, terutama untuk proyek Python.
- **Jekyll**: Framework untuk membuat situs dokumentasi berbasis Markdown.

## 15.2 Dokumentasi API

API adalah bagian inti dari aplikasi modern yang memungkinkan komunikasi antara berbagai sistem. Dokumentasi API sangat penting untuk memandu pengembang dalam menggunakan dan mengintegrasikan API dengan sistem lain. Berikut adalah elemen-elemen yang perlu didokumentasikan untuk API:

### 15.2.1 Deskripsi API

- **Pengenalan API**: Penjelasan mengenai tujuan dan fungsionalitas API, termasuk data apa yang dapat diakses dan bagaimana API digunakan.
- **Autentikasi**: Penjelasan tentang mekanisme autentikasi yang digunakan oleh API (misalnya, API key, token, OAuth).
- **Endpoint API**: Daftar lengkap dari endpoint yang tersedia, beserta deskripsi singkat tentang fungsinya.

### 15.2.2 Dokumentasi Parameter dan Respons

- **Parameter**: Penjelasan tentang parameter yang diterima oleh API, termasuk tipe data dan apakah parameter tersebut wajib atau opsional.
- **Format Respons**: Penjelasan mengenai format respons yang akan diterima oleh pengguna API, seperti struktur data JSON atau XML.

### 15.2.3 Contoh Penggunaan

- **Contoh Request dan Response**: Penyertaan contoh request dan response untuk setiap endpoint API yang didokumentasikan.

### 15.2.4 Dokumentasi API di FastAPI

FastAPI secara otomatis menghasilkan dokumentasi API yang sangat mudah diakses melalui antarmuka berbasis web. Dokumentasi ini dapat dilihat menggunakan dua format yang populer: **Swagger UI** dan **Redoc**. Setiap aplikasi FastAPI secara otomatis menghasilkan dua dokumentasi interaktif yang mencakup semua endpoint, parameter, dan respons API, yang sangat membantu pengembang dan pengguna API.

- **Swagger UI**: Menyediakan antarmuka interaktif untuk menjelajahi endpoint API, melihat parameter yang diperlukan, serta mencoba API langsung dari browser.
- **Redoc**: Alternatif dokumentasi yang lebih minimalis, tetapi tetap menyajikan informasi secara rinci mengenai API.

Kedua dokumentasi ini dihasilkan secara otomatis oleh FastAPI dengan hanya menyediakan deskripsi yang tepat dalam kode Python. Dokumentasi API dapat diakses melalui URL default seperti `/docs` untuk Swagger UI dan `/redoc` untuk Redoc.

**Contoh Implementasi di FastAPI**:

```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    """
    Endpoint untuk membaca item berdasarkan item_id.
    Parameter 'item_id' wajib, sementara 'q' opsional.
    """
    return {"item_id": item_id, "q": q}

```

Dengan kode di atas, FastAPI secara otomatis akan menghasilkan dokumentasi interaktif yang dapat diakses melalui URL `/docs` (Swagger UI) dan `/redoc` (Redoc). Dokumentasi ini akan menyertakan penjelasan tentang endpoint `/items/{item_id}`, parameter `item_id` dan `q`, serta contoh request dan response.

**Tools untuk Dokumentasi API**:

- **Swagger/OpenAPI**: Standar terbuka untuk mendokumentasikan API, yang juga memungkinkan pembuatan antarmuka pengguna untuk menguji API secara langsung.
- **Postman**: Alat untuk menguji API yang juga mendukung dokumentasi API interaktif.
- **Redoc**: Alat yang digunakan untuk menampilkan dokumentasi API yang dihasilkan dari file OpenAPI.
- **Apiary**: Platform untuk mendokumentasikan, menguji, dan berbagi API.

Dengan menggunakan FastAPI, dokumentasi API menjadi lebih cepat dan mudah dibuat karena dokumentasi akan dihasilkan secara otomatis berdasarkan definisi endpoint dan parameter yang sudah disediakan dalam kode aplikasi.

## 15.3 Dokumentasi Database

Dokumentasi database membantu pengembang dan administrator database untuk memahami struktur database, tabel, kolom, dan hubungan antar data. Berikut adalah elemen-elemen yang perlu didokumentasikan untuk database:

### 15.3.1 Struktur Database

- **Diagram Entity-Relationship (ERD)**: Diagram yang menggambarkan relasi antara entitas dalam database.
- **Deskripsi Tabel dan Kolom**: Penjelasan tentang setiap tabel dalam database, termasuk kolom-kolom yang ada, tipe data, dan apakah kolom tersebut wajib diisi atau tidak.

### 15.3.2 Panduan Pengelolaan Database

- **Migrasi Database**: Instruksi untuk memigrasi skema database apabila ada perubahan.
- **Backup dan Restore**: Penjelasan cara melakukan backup dan restore database.

### 15.3.3 Query yang Sering Digunakan

- **Query Dasar**: Penjelasan tentang query-query dasar yang sering digunakan, seperti SELECT, INSERT, UPDATE, dan DELETE.
- **Optimasi Query**: Penjelasan tentang cara mengoptimalkan query agar lebih efisien dalam pengolahan data.

**Tools untuk Dokumentasi Database**:

- **dbdocs**: Alat untuk menghasilkan dokumentasi database dari struktur skema yang ada.
- **SchemaSpy**: Alat untuk menghasilkan diagram ERD dan dokumentasi dari database relasional.
- **Doxygen**: Alat yang dapat digunakan untuk menghasilkan dokumentasi database jika digunakan bersamaan dengan komentar di dalam kode SQL.
- **MySQL Workbench**: Alat yang dapat digunakan untuk mendokumentasikan struktur database dan menghasilkan ERD.

## 15.4 Kesimpulan

Dokumentasi yang lengkap dan terstruktur dengan baik sangat penting untuk pengelolaan dan pengembangan perangkat lunak jangka panjang. Dengan dokumentasi yang jelas, pengembang dapat bekerja lebih efisien, pengguna dapat memanfaatkan sistem dengan lebih optimal, dan tim pemeliharaan dapat lebih mudah melakukan perbaikan atau pengembangan lanjutan. Dokumentasi harus mencakup aspek teknis sistem (seperti API, database, dan kode aplikasi) serta informasi praktis yang diperlukan oleh pengguna dan pengembang. Alat-alat yang disebutkan sebelumnya di atas dapat digunakan untuk mempermudah pembuatan dan pemeliharaan dokumentasi ini.
