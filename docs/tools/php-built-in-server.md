# 12.9 PHP Built-in Server  

**PHP Built-in Server** adalah fitur bawaan yang disediakan oleh PHP sejak versi 5.4, memungkinkan pengembang untuk menjalankan server web sederhana tanpa memerlukan instalasi perangkat lunak tambahan seperti Apache atau Nginx. Server ini dirancang khusus untuk keperluan pengembangan dan bukan untuk digunakan di lingkungan produksi.  

## 12.9.1 **Fitur Utama**  
1. **Ringan dan Tanpa Instalasi Tambahan**  
   - Server berjalan langsung dari binary PHP, mengurangi kebutuhan konfigurasi.  
2. **Dukungan Routing Sederhana**  
   - Mendukung file router PHP untuk menangani permintaan, seperti routing untuk framework kecil.  
3. **Dukungan HTTPS**  
   - Mulai PHP versi 5.4.13, mendukung HTTPS untuk pengujian menggunakan sertifikat lokal.  
4. **Log Real-time**  
   - Menampilkan log permintaan langsung di terminal.  
5. **Custom Port dan Host**  
   - Server dapat dikonfigurasi untuk mendengarkan di port atau host tertentu.  

## 12.9.2 **Keunggulan**  
1. **Sangat Ringan**  
   - Tidak memerlukan sumber daya tambahan atau perangkat lunak pihak ketiga.  
2. **Cepat dan Mudah Digunakan**  
   - Server dapat dijalankan dengan satu perintah:  
     ```bash
     php -S localhost:8000
     ```  
3. **Integrasi dengan Framework PHP**  
   - Cocok untuk framework seperti Laravel, Symfony, atau Slim dalam pengembangan lokal.  
4. **Portabel**  
   - Cukup menginstal PHP di sistem untuk menjalankannya.  

## 12.9.3 **Kekurangan**  
1. **Tidak Cocok untuk Produksi**  
   - Tidak dirancang untuk menangani beban tinggi atau koneksi simultan yang besar.  
2. **Fitur Terbatas**  
   - Tidak memiliki fitur kompleks seperti modul yang tersedia di Apache atau Nginx.  
3. **Konfigurasi HTTPS Manual**  
   - Membutuhkan pengaturan tambahan untuk pengujian HTTPS, termasuk membuat sertifikat lokal.  

## 12.9.4 **Lisensi dan Versi**  
- **Lisensi**: PHP adalah perangkat lunak sumber terbuka yang dilisensikan di bawah **PHP License**.  
- **Versi Minimum**: PHP Built-in Server tersedia sejak PHP versi 5.4.  

## 12.9.5 **Penggunaan PHP Built-in Server dalam Proyek**  
PHP Built-in Server sering digunakan untuk:  
1. **Pengembangan Cepat**  
   - Menjalankan aplikasi kecil atau API untuk pengujian lokal tanpa perlu konfigurasi.  
2. **Uji Fungsionalitas**  
   - Cocok untuk memastikan skrip berjalan sebelum diterapkan ke server yang lebih kompleks.  
3. **Pendidikan dan Prototipe**  
   - Membantu pemula memulai pengembangan PHP tanpa memerlukan pengetahuan server yang mendalam.  

### **Contoh Penggunaan**  
Jalankan server untuk melayani file di direktori saat ini:  
```bash
php -S localhost:8000
```
Menggunakan file router untuk aplikasi:
```bash
php -S localhost:8000 router.php
```
Di mana router.php mengatur logika routing:
```php
<?php
if (file_exists(__DIR__ . $_SERVER['REQUEST_URI'])) {
    return false; // Layani file langsung jika ada.
}
require 'index.php'; // Arahkan ke index.php untuk menangani permintaan lainnya.
```
PHP Built-in Server adalah solusi ringan dan cepat untuk pengembangan lokal, ideal untuk aplikasi sederhana atau API selama tahap pengembangan.