# 13.1.3 Cross-site Request Forgery

1. **Penjelasan singkat**
    
    CSRF terjadi ketika penyerang menipu pengguna yang sudah login untuk melakukan permintaan yang tidak diinginkan ke server. Biasanya, ini dilakukan dengan menyematkan permintaan berbahaya (misalnya, dalam gambar atau tautan) di situs web yang dikendalikan penyerang.
    
2. **Dampak**
    - Perubahan data pengguna (misalnya, kata sandi, alamat email).
    - Pembelian yang tidak sah.
    - Tindakan lain yang tidak diinginkan atas nama pengguna.
3. **Pencegahan**
    - **CSRF Tokens:** Gunakan *CSRF token* yang unik untuk setiap sesi atau permintaan. *Token* ini harus disertakan dalam setiap permintaan POST dan divalidasi oleh server.
    - **SameSite Cookie Attribute:** Setel atribut `SameSite` pada *cookie* ke `Strict` atau `Lax` untuk mencegah browser mengirim *cookie* dengan permintaan lintas situs.
    - **Verifikasi Origin Header:** Verifikasi *header* `Origin` atau `Referer` untuk memastikan bahwa permintaan berasal dari domain yang diizinkan. Untuk API yang *stateless* dan menggunakan *token bearer* (JWT), biasanya tidak rentan terhadap CSRF. Untuk aplikasi berbasis browser, gunakan library seperti `fastapi-csrf-protect`.