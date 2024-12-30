# 13.2.2 Dynamic Application Security Testing (DAST)

DAST menganalisis aplikasi yang sedang berjalan (*runtime*) dari perspektif eksternal. Tools DAST mensimulasikan serangan untuk mengidentifikasi kerentanan yang dapat dieksploitasi oleh penyerang. DAST sering disebut sebagai *black-box testing* karena tidak memerlukan akses ke kode sumber.

**Kelebihan DAST adalah sebagai berikut:**

1. **Deteksi Kerentanan *Runtime*:** Efektif dalam mendeteksi kerentanan yang muncul selama aplikasi berjalan, seperti masalah autentikasi, otorisasi, dan konfigurasi server.
2. **Tidak Memerlukan Kode Sumber:** Dapat menguji aplikasi tanpa akses ke kode sumber, berguna untuk menguji aplikasi pihak ketiga.
3. **Simulasi Serangan Nyata:** Mensimulasikan serangan yang mungkin dilakukan oleh penyerang, memberikan gambaran yang lebih realistis tentang potensi risiko.

**Kekurangan DAST diantaranya adalah:**

1. **Cakupan Kode Terbatas:** Hanya dapat menguji bagian aplikasi yang dapat diakses melalui antarmuka pengguna.
2. **Lambat:** Proses pengujian bisa memakan waktu, terutama untuk aplikasi yang kompleks.
3. **Kesulitan Identifikasi Lokasi:** Sulit mengidentifikasi lokasi kerentanan secara spesifik dalam kode sumber.
4. **Membutuhkan Lingkungan yang Berfungsi:** Membutuhkan aplikasi yang berfungsi dan dapat diakses untuk diuji.

Contoh tools: OWASP ZAP, Burp Suite, Netsparker