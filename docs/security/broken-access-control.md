# 13.1.6 Broken Access Control

1. **Penjelasan singkat**
    
    *Broken Access Control* terjadi ketika mekanisme otorisasi dalam aplikasi tidak diimplementasikan dengan benar, memungkinkan pengguna untuk mengakses sumber daya atau fungsionalitas yang seharusnya tidak mereka miliki.
    
2. **Dampak**
    - Akses ke data sensitif pengguna lain.
    - Modifikasi atau penghapusan data yang tidak sah.
    - Pengambilan kendali akun pengguna lain.
    - Eskalasi *privilege* (mendapatkan hak akses yang lebih tinggi dari yang seharusnya).
3. **Pencegahan**
    - **Least Privilege:** Terapkan prinsip *least privilege*, di mana pengguna hanya diberikan izin yang benar-benar dibutuhkan untuk melakukan tugasnya.
    - **Use Cases dan Role:** Identifikasi *use case* dan peran pengguna dengan jelas. Tentukan izin yang sesuai untuk setiap peran.
    - **Otentikasi dan Otorisasi yang Kuat:** Implementasikan sistem otentikasi dan otorisasi yang kuat. Gunakan *middleware* atau dependensi untuk mengelola otorisasi di FastAPI.
    - **Jangan Mengandalkan ID Objek Langsung (IDOR):** Hindari penggunaan *ID* objek secara langsung dalam URL. Gunakan mekanisme otorisasi untuk memverifikasi akses ke objek.