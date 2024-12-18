# BAB 8 API Gateway
API Gateway adalah komponen penting dalam arsitektur sistem modern yang bertindak sebagai pintu masuk utama untuk semua permintaan ke layanan backend. API Gateway mengelola routing, autentikasi, otorisasi, transformasi data, serta fitur tambahan seperti caching dan rate limiting. Dalam skenario microservices, API Gateway membantu menyederhanakan komunikasi antara klien dan layanan backend yang terdistribusi.

## 8.1 Mengapa Menggunakan API Gateway?

- **Sentralisasi Pengelolaan API**: API Gateway menyediakan satu titik masuk untuk semua permintaan, sehingga memudahkan pengelolaan API.
- **Keamanan**: API Gateway mendukung autentikasi, otorisasi, dan pengaturan tingkat akses.
- **Optimasi Kinerja**: Dengan caching, rate limiting, dan transformasi data, API Gateway dapat meningkatkan performa API.
- **Abstraksi Layanan Backend**: Klien tidak perlu mengetahui detail layanan backend. API Gateway menyembunyikan kompleksitas ini.
- **Pengaturan Trafik**: API Gateway mendukung fitur seperti rate limiting untuk membatasi jumlah permintaan dari klien tertentu.