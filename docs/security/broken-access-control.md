# 13.1.6 Broken Access Control

*Broken Access Control* terjadi ketika mekanisme otorisasi dalam aplikasi tidak diimplementasikan dengan benar, memungkinkan pengguna untuk mengakses sumber daya atau fungsionalitas yang seharusnya tidak mereka miliki.

**Dampak dari Broken Access Control adalah:**

1. Akses ke data sensitif pengguna lain.
2. Modifikasi atau penghapusan data yang tidak sah.
3. Pengambilan kendali akun pengguna lain.
4. Eskalasi *privilege* (mendapatkan hak akses yang lebih tinggi dari yang seharusnya).

**Pencegahan terhadap Broken Access Control  yaitu dengan:**

1. **Least Privilege:** Terapkan prinsip *least privilege*, di mana pengguna hanya diberikan izin yang benar-benar dibutuhkan untuk melakukan tugasnya.
2. **Use Cases dan Role:** Identifikasi *use case* dan peran pengguna dengan jelas. Tentukan izin yang sesuai untuk setiap peran.
3. **Otentikasi dan Otorisasi yang Kuat:** Implementasikan sistem otentikasi dan otorisasi yang kuat. Gunakan *middleware* atau dependensi untuk mengelola otorisasi di FastAPI.
4. **Jangan Mengandalkan ID Objek Langsung (IDOR):** Hindari penggunaan *ID* objek secara langsung dalam URL. Gunakan mekanisme otorisasi untuk memverifikasi akses ke objek.
